<?php

namespace App\Http\Controllers\Api\Report;

use App\Helpers\Report\DashboardHelper;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    protected $dashboardHelper;
    public function __construct()
    {
        $this->dashboardHelper =  new DashboardHelper();
    }
    public function index(Request $request)
    {
        if (isset($request->filter)) {
            $filter = json_decode($request->filter, true);
        } else {
            $filter = [];
        }
        $data = $this->dashboardHelper->getData($filter);
        return response()->success($data);
    }
}
