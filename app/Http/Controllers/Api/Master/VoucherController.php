<?php

namespace App\Http\Controllers\Api\Master;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Helpers\Master\VoucherHelper;
use App\Http\Requests\Voucher\CreateRequest;
use App\Http\Requests\Voucher\UpdateRequest;
use App\Http\Resources\Voucher\VoucherResource;
use App\Http\Resources\Voucher\VoucherCollection;

class VoucherController extends Controller
{
    protected $voucher;
    public function __construct()
    {
        $this->voucher = new VoucherHelper();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if (isset($request->filter)) {
            $filter = json_decode($request->filter, true);
        } else {
            $filter = [];
        }
        $vouchers = $this->voucher->getAll(
            $filter,
            $request->itemPerPage = 0,
            $request->sort ?? ''
        );
        return response()->success(new VoucherCollection($vouchers));
    }

    public function show($id)
    {
        $dataVoucher = $this->voucher->getById($id);

        if (empty($dataVoucher)) {
            return response()->failed(['Data item tidak ditemukan']);
        }

        return response()->success(new VoucherResource($dataVoucher));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateRequest $request)
    {
        if (isset($request->validator) && $request->validator->fails()) {
            return response()->failed($request->validator->errors(), 422);
        }

        $dataInput = $request->only([
            'id_promo',
            'id_user',
            'nominal',
            'info_voucher',
            'periode_mulai',
            'periode_selesai',
            'type',
            'status',
            'catatan',
        ]);

        $dataVoucher = $this->voucher->create($dataInput);
        if (!$dataVoucher['status']) {
            return response()->failed($dataVoucher['error'], 422);
        }

        return response()->success([], 'Data Voucher Berhasil Disimpan');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateRequest $request)
    {
        if (isset($request->validator) && $request->validator->fails()) {
            return response()->failed($request->validator->errors(), 422);
        }

        $dataInput = $request->only([
            'id_voucher',
            'id_promo',
            'id_user',
            'nominal',
            'info_voucher',
            'periode_mulai',
            'periode_selesai',
            'type',
            'status',
            'catatan',
        ]);

        $dataVoucher = $this->voucher->update(
            $dataInput,
            $dataInput['id_voucher']
        );
        if (!$dataVoucher['status']) {
            return response()->failed($dataVoucher['error'], 422);
        }

        return response()->success('Data Voucher Berhasil Disimpan!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $dataVoucher = $this->voucher->delete($id);
        if (!$dataVoucher) {
            return response()->failed('
            Mohon Maaf Data Voucher tidak Ditemukan');
        }
        return response()->success($dataVoucher);
    }
}
