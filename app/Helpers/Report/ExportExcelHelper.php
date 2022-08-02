<?php
namespace App\Helpers\Report;

use App\Exports\Order\CustomerExport;
use App\Exports\Order\MenuExport;
use App\Exports\Order\PenjualanExport;
use Maatwebsite\Excel\Facades\Excel;

class ExportExcelHelper
{
    public function downloadExcel($path, $data)
    {
        switch ($path) {
            case 'menu':
                return Excel::download(new MenuExport($data), 'menu.xlsx');
                break;
            case 'penjualan':
                return Excel::download(
                    new PenjualanExport($data),
                    'penjualan.xlsx'
                );
                break;
            case 'customer':
                return Excel::download(
                    new CustomerExport($data),
                    'customer.xlsx'
                );
                break;
            default:
                # code...
                break;
        }
    }
}
