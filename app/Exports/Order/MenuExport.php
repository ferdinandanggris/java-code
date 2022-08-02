<?php

namespace App\Exports\Order;

use App\Helpers\User\UserHelper;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Blade;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithTitle; // Class untuk memberi judul pada sheet
use Maatwebsite\Excel\Concerns\WithHeadings; // Class untuk membuat header pada konten Excel

class MenuExport implements FromView
{
    protected $menu;

    public function __construct($newMenu = [])
    {
        $this->menu = $newMenu ?: [];
    }

    /**
     * Ambil daftar User
     *
     * Data yang akan dieksport bisa dimasukkan ke dalam parameter "_construct" agar lebih fleksibel
     *
     * @return void
     */
    private function getAll()
    {
        $arrUser = [];
        $userModel = new UserHelper();
        $user = $userModel->getAll([], 0);
        foreach ($user as $key => $val) {
            $arrUser[$key]['nama'] = 'tes';
            $arrUser[$key]['email'] = 'tes';
            $arrUser[$key]['password'] = '';
            $arrUser[$key]['m_roles_id'] = 'tes';
        }

        return $arrUser;
    }

    public function view(): View
    {
        Blade::directive('currency', function ($expression) {
            return "Rp. <?php echo number_format($expression,0,',','.'); ?>";
        });
        return view('generate.excel.menu', ['data' => $this->menu]);
    }

    /**
     * Membuat header pada konten excel
     *
     * @return array
     */
    public function headings(): array
    {
        return ['Menu', 'Periode', 'Total'];
    }

    /**
     * Taruh array user pada konten excel
     *
     * @return array
     */
    public function array(): array
    {
        return $this->menu;
    }

    /**
     * Beri nama pada sheet
     *
     * @return string
     */
    public function title(): string
    {
        return 'Daftar User';
    }
}
