<?php

namespace App\Http\Controllers\Api\Report;

use Illuminate\Http\Request;
use App\Helpers\Report\OrderHelper;
use App\Helpers\Report\PenjualanMenuHelper;
use App\Http\Controllers\Controller;
use App\Http\Resources\Order\OrderCollection;

class OrderController extends Controller
{
    protected $orders;
    protected $penjualanMenu;
    public function __construct()
    {
        $this->orders = new OrderHelper();
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

        $filter['report'] = 'menu';
        if (isset($filter['report']) && $filter['report'] == 'menu') {
            $orders = $this->orders->getPenjualanCustomer(
                $filter,
                $request->itemPerPage = 0,
                $request->sort ?? ''
            );
            return response()->success($orders);
        }
    }

    public function penjualanCustomer(Request $request)
    {
        if (isset($request->filter)) {
            $filter = json_decode($request->filter, true);
        } else {
            $filter = [];
        }
        // dd($request->filter);
        $orders = $this->orders->getPenjualanCustomer(
            $filter,
            $request->itemPerPage = 0,
            $request->sort ?? ''
        );
        return response()->success($orders);
    }

    public function penjualanMenu(Request $request)
    {
        if (isset($request->filter)) {
            $filter = json_decode($request->filter, true);
        } else {
            $filter = [];
        }

        $orders = $this->orders->getPenjualanMenu(
            $filter,
            $request->itemPerPage = 0,
            $request->sort ?? ''
        );
        return response()->success($orders);
    }

    public function rekapPenjualan(Request $request)
    {
        if (isset($request->filter)) {
            $filter = json_decode($request->filter, true);
        } else {
            $filter = [];
        }

        $orders = $this->orders->getRekapPenjualan(
            $filter,
            $request->itemPerPage = 0,
            $request->sort ?? ''
        );
        return response()->success($orders);
    }
}
