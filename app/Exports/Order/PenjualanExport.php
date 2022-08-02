<?php

namespace App\Exports\Order;

use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Blade;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\FromCollection;

class PenjualanExport implements FromView
{
    protected $penjualan;

    public function __construct($newPenjualan = [])
    {
        $this->penjualan = $newPenjualan ?: [];
    }
    public function view(): View
    {
        Blade::directive('currency', function ($expression) {
            return "Rp. <?php echo number_format($expression,0,',','.'); ?>";
        });
        return view('generate.excel.penjualan', ['data' => $this->penjualan]);
    }
}
