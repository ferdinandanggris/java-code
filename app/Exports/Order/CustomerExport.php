<?php

namespace App\Exports\Order;

use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Blade;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromView;

class CustomerExport implements FromView
{
    protected $customer;

    public function __construct($newCustomer = [])
    {
        $this->customer = $newCustomer ?: [];
    }

    public function view(): View
    {
        Blade::directive('currency', function ($expression) {
            return "Rp. <?php echo number_format($expression,0,',','.'); ?>";
        });
        return view('generate.excel.customer', ['data' => $this->customer]);
    }
}
