<?php

namespace App\Http\Controllers\Api\Master;

use Illuminate\Http\Request;
use App\Helpers\Master\DiskonHelper;
use App\Http\Controllers\Controller;
use App\Http\Requests\Diskon\DiskonRequest;
use App\Http\Resources\Diskon\DiskonResource;
use App\Http\Resources\Diskon\DiskonCollection;

class DiskonController extends Controller
{
    protected $diskon;

    public function __construct()
    {
        $this->diskon = new DiskonHelper();
    }

    public function index(Request $request)
    {
        if (isset($request->filter)) {
            $filter = json_decode($request->filter, true);
        } else {
            $filter = [];
        }
        $diskon = $this->diskon->getAll($filter, 20, $request->sort ?? '');
        return response()->success($diskon);
    }

    public function show($id)
    {
        $dataDison = $this->diskon->getById($id);

        if (empty($dataDison)) {
            return response()->failed(['Data item tidak ditemukan']);
        }

        return response()->success($dataDison);
    }

    public function create()
    {
    }

    public function store(Request $request)
    {
        if (isset($request->validator) && $request->validator->fails()) {
            return response()->failed($request->validator->errors(), 422);
        }
        $dataInput = $request->only(['id_user', 'id_promo', 'status']);
        $dataDiskon = $this->diskon->create($dataInput);
        if (!$dataDiskon['status']) {
            return response()->failed($dataDiskon['error'], 422);
        }
        return response()->success([], 'Data Diskon berhasil disimpan');
    }

    public function update(Request $request)
    {
        /**
         * Menampilkan pesan error ketika validasi gagal
         * pengaturan validasi bisa dilihat pada class app/Http/request/PromoRequest
         */
        if (isset($request->validator) && $request->validator->fails()) {
            return response()->failed($request->validator->errors());
        }

        $dataInput = $request->only(['id_diskon', 'status']);

        $dataDiskon = $this->diskon->update(
            $dataInput,
            $dataInput['id_diskon']
        );

        if (!$dataDiskon['status']) {
            return response()->failed($dataDiskon['error']);
        }

        return response()->success(
            $dataDiskon['data'],
            'Data item berhasil disimpan'
        );
    }
}
