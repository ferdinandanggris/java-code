<?php

namespace App\Helpers\Report;

use App\Models\Master\ItemModel;
use App\Models\Report\OrderModel;
use App\Repository\CrudInterface;

class PenjualanMenuHelper
{
    protected $itemModel;

    public function __construct()
    {
        $this->itemModel = new ItemModel();
    }
    public function getAll(
        array $filter,
        int $itemPerPage = 0,
        string $sort
    ): object {
        return $this->itemModel->getAll($filter, $itemPerPage, $sort);
    }
}
