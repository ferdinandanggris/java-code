<?php

namespace App\Helpers\Report;

use App\Models\Reports\DashboardModel;

class DashboardHelper
{
    protected $dashboardModel;

    public function __construct()
    {
        $this->dashboardModel = new DashboardModel();
    }

    public function getData($filter)
    {
        $tahun = 0;
        if (!empty($filter['id_tahun'])) {
            $tahun = $filter['id_tahun'];
        }

        $dateNow = date('Y-m-d');
        $dateBulanIni = date('Y-m-d');
        $dateKemarin = date_create(date('D-m-y'))->modify('-1 days')->format('Y-m-d');
        $dateBulanLalu = date_create(date('D-m-y'))->modify('-1 months')->format('Y-m-d');

        $data = [
            'bulan_ini' => $this->dashboardModel->getByMonth(date('m', strtotime($dateBulanIni)), date('Y', strtotime($dateBulanIni))),
            'bulan_lalu' => $this->dashboardModel->getByMonth(date('m', strtotime($dateBulanLalu)), date('Y', strtotime($dateBulanLalu))),
            'hari_ini' => $this->dashboardModel->getByDay($dateNow),
            'kemarin' => $this->dashboardModel->getByDay($dateKemarin),
            'total_bulan' => [],
            'nama_bulan' => [],
        ];
        // dd($data);
        for ($i = 0; $i < 12; $i++) {
            $data['total_bulan'][$i] = $this->dashboardModel->getByMonth($i + 1, $tahun)->total;
            $data['id_bulan'][$i] = $this->dashboardModel->getByMonth($i + 1, $tahun)->nama;
        }
        return $data;
    }
}
