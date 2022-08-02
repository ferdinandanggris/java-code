<?php

namespace App\Models\Reports;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class DashboardModel extends Model
{
    use HasFactory;

    public function getAll()
    {
    }

    public function getByMonth($bulan, $tahun = 0)
    {
        if ($tahun == 0) {
            $query_tahun = "";
        } else {
            $query_tahun = "AND YEAR(tanggal)=" . $tahun . " ";
        }

        $query = "select MONTHNAME('2022-" . $bulan . "-01') as nama,
        SUM(CASE WHEN MONTH(tanggal)= " . $bulan . " " . $query_tahun . " THEN t_order.total_order ELSE 0 END) as total 
          FROM t_order;
       ";
        return DB::selectOne($query);
    }

    public function getByDay($tanggal)
    {
        $query = " select '" . $tanggal . "' as nama,
        SUM(CASE WHEN tanggal= $tanggal THEN t_order.total_order ELSE 0 END) as total
          FROM t_order;";
        return DB::selectOne($query);
    }
}
