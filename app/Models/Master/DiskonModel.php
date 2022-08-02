<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User;
use App\Models\User\UserModel;
use App\Repository\ModelInterface;

class DiskonModel extends Model implements ModelInterface
{
    use HasFactory;

    /**
     * Menentukan tabel yang berhubungan dengan model ini
     * @var string
     */
    protected $table = 'm_diskon';

    /**
     * Menentukan primary key dari tabel
     * @var string
     */
    protected $primaryKey = 'id_diskon';

    /**
     * Menentukan data yang boleh diisi
     * @var string
     */
    protected $fillable = ['id_user', 'id_promo', 'status', 'id_diskon'];

    /**
     * Menambah data diskon ke table m_diskon
     * @param array $payload
     */
    public function store(array $payload)
    {
        return $this->create($payload);
    }

    /**
     * Mengambil data diskon dari table m_diskon
     * @param array $filter
     * @param integer $itemPerPage
     * @param string $sort
     *
     * @return array
     */
    public function getAll(
        array $filter,
        int $itemPerPage = 0,
        string $sort = ''
    ): object {
        $diskon = $this->query();

        $sort = $sort ?: 'id_diskon DESC';
        // $diskon->orderByRaw($sort);
        $itemPerPage = $itemPerPage > 0 ? $itemPerPage : false;
        return $diskon->get();
    }

    /**
     * Mengambil satu data dari table diskon
     * @param integer $id
     *
     */
    public function getById(int $id): object
    {
        return $this->find($id);
    }

    /**
     * Mengupdate satu data diskon di tabel m_diskon
     * @param array $payload
     * @param integer $id
     *
     */
    public function edit(array $payload, int $id)
    {
        return $this->find($id)->update($payload);
    }

    public function drop(int $id)
    {
        return $this->find($id)->delete();
    }
}
