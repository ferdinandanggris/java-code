<?php

namespace App\Helpers\Master;

use App\Repository\CrudInterface;
use App\Models\Master\VoucherModel;

class VoucherHelper implements CrudInterface
{
    protected $voucherModel;
    public function __construct()
    {
        $this->voucherModel = new VoucherModel();
    }

    public function getAll(
        array $filter,
        int $itemPerPage = 0,
        string $sort
    ): object {
        return $this->voucherModel->getAll($filter, $itemPerPage, $sort);
    }

    public function getById(int $id): object
    {
        return $this->voucherModel->getById($id);
    }

    public function create(array $payload): array
    {
        try {
            $voucher = $this->voucherModel->store($payload);
            return [
                'status' => true,
                'data' => $voucher,
            ];
        } catch (\Throwable $th) {
            return [
                'status' => false,
                'error' => $th->getMessage(),
            ];
        }
    }

    public function update(array $payload, int $id): array
    {
        try {
            $voucher = $this->voucherModel->edit($payload, $id);
            return [
                'status' => true,
                'data' => $voucher,
            ];
        } catch (\Throwable $th) {
            return [
                'status' => false,
                'error' => $th->getMessage(),
            ];
        }
    }

    public function delete(int $id): bool
    {
        try {
            $this->voucherModel->drop($id);
            return true;
        } catch (\Throwable $th) {
            return false;
        }
    }
}
