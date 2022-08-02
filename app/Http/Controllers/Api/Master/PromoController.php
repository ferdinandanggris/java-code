<?php

namespace App\Http\Controllers\Api\Master;

use App\Helpers\Master\PromoHelper;
use App\Http\Controllers\Controller;
use App\Http\Requests\Promo\PromoRequest;
use App\Http\Resources\Promo\PromoCollection;
use App\Http\Resources\Promo\PromoResource;
use App\Models\Master\PromoModel;
use Illuminate\Http\Request;

class PromoController extends Controller
{
    protected $promo;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        $this->promo = new PromoHelper();
    }

    public function index(Request $request)
    {
        if (isset($request->filter)) {
            $filter = json_decode($request->filter, true);
        } else {
            $filter = [];
        }
        $promos = $this->promo->getAll(
            $filter,
            $request->itemPerPage ?: false,
            $request->sort ?? ''
        );
        return response()->success(new PromoCollection($promos));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(PromoRequest $request)
    {
        if (isset($request->validator) && $request->validator->fails()) {
            return response()->failed($request->validator->errors(), 422);
        }
        $dataInput = $request->only([
            'nama',
            'type',
            'diskon',
            'nominal',
            'kadaluarsa',
            'syarat_ketentuan',
            'foto',
        ]);
        $dataPromo = $this->promo->create($dataInput);
        if (!$dataPromo['status']) {
            return response()->failed($dataPromo['error'], 422);
        }
        return response()->success([], 'Data Promo berhasil disimpan');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $dataPromo = $this->promo->getById($id);

        if (empty($dataPromo)) {
            return response()->failed(['Data item tidak ditemukan']);
        }

        return response()->success(new PromoResource($dataPromo));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(PromoRequest $request)
    {
        /**
         * Menampilkan pesan error ketika validasi gagal
         * pengaturan validasi bisa dilihat pada class app/Http/request/PromoRequest
         */
        if (isset($request->validator) && $request->validator->fails()) {
            return response()->failed($request->validator->errors());
        }

        $dataInput = $request->only([
            'nama',
            'type',
            'diskon',
            'nominal',
            'kadaluarsa',
            'syarat_ketentuan',
            'foto',
            'id_promo',
        ]);
        $dataPromo = $this->promo->update($dataInput, $dataInput['id_promo']);

        if (!$dataPromo['status']) {
            return response()->failed($dataPromo['error']);
        }

        return response()->success(
            new PromoResource($dataPromo['data']),
            'Data item berhasil disimpan'
        );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $dataPromo = $this->promo->delete($id);

        if (!$dataPromo) {
            return response()->failed([
                'Mohon maaf data promo tidak ditemukan',
            ]);
        }

        return response()->success($dataPromo);
    }
}
