<?php

namespace App\Helpers\Report;

use App\Models\Master\ItemModel;
use App\Models\Report\OrderDetModel;
use App\Models\Report\OrderModel;
use App\Repository\CrudInterface;
use Illuminate\Database\Eloquent\Collection;

class OrderHelper
{
    protected $orderModel;
    protected $itemModel;
    protected $orderDetail;

    public function __construct()
    {
        $this->orderModel = new OrderModel();
        $this->itemModel = new ItemModel();
        $this->orderDetailModel = new OrderDetModel();
    }
    public function getAll(
        array $filter,
        int $itemPerPage = 0,
        string $sort
    ): object {
        return $this->orderModel->getAll($filter, $itemPerPage, $sort);
    }

    public function getPenjualanCustomer(
        array $filter,
        int $itemPerPage = 0,
        string $sort
    ) {
        return $this->orderModel->getLaporanCustomer(
            $filter,
            $itemPerPage,
            $sort
        );
    }

    public function getPenjualanMenu(
        array $filter,
        int $itemPerPage = 0,
        string $sort
    ) {
        return $this->orderModel->getPenjualanMenu(
            $filter,
            $itemPerPage,
            $sort
        );
    }

    public function getRekapPenjualan(
        array $filter,
        int $itemPerPage = 0,
        string $sort
    ) {
        $temp = [];
        $dataDetOrder = $this->orderDetailModel->getAll(
            $filter,
            $itemPerPage,
            $sort
        );
        return $this->orderModel->queryRekapLaporan(
            $filter,
            $itemPerPage,
            $sort
        );
    }
}
