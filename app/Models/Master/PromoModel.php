<?php

namespace App\Models\Master;

use App\Http\Traits\RecordSignature;
use App\Repository\ModelInterface;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Concerns\HasRelationships;

class PromoModel extends Model implements ModelInterface
{
    use RecordSignature, HasRelationships, HasFactory;

    /**
     * Menentukan nama tabel yang terhubung dengan Class ini
     *
     * @var string
     */
    protected $table = 'm_promo';

    /**
     * Menentukan primary key, jika nama kolom primary key adalah "id",
     * langkah deklarasi ini bisa dilewati
     *
     * @var string
     */
    protected $primaryKey = 'id_promo';
    protected $fillable = [
        'nama',
        'diskon',
        'kadaluarsa',
        'syarat_ketentuan',
        'type',
        'nominal',
        'foto',
    ];
    /**
     * Akan mengisi kolom "created_at" dan "updated_at" secara otomatis,
     *
     * @var bool
     */
    public $timestamps = true;

    public function getAll(
        array $filter,
        int $itemPerPage = 0,
        string $sort = ''
    ): object {
        $dataItem = $this->query();

        if (!empty($filter['nama'])) {
            $dataItem->where('nama', 'LIKE', '%' . $filter['nama'] . '%');
        }

        if (!empty($filter['type'])) {
            $dataItem->where('type', 'LIKE', '%' . $filter['type'] . '%');
        }

        $sort = $sort ?: 'id_promo DESC';
        $dataItem->orderByRaw($sort);
        $itemPerPage = $itemPerPage > 0 ? $itemPerPage : false;

        return $dataItem->paginate($itemPerPage)->appends('sort', $sort);
    }

    public function getById(int $id): object
    {
        return $this->find($id);
    }

    public function store(array $payload)
    {
        return $this->create($payload);
    }

    public function edit(array $payload, int $id)
    {
        return $this->find($id)->update($payload);
    }

    public function drop(int $id)
    {
        return $this->find($id)->delete();
    }

    /**
     * Menampilkan foto promo dalam bentuk URL
     *
     * @return string
     */
    public function fotoUrl()
    {
        if (empty($this->foto)) {
            return asset('assets/img/no-image.png');
        }

        return asset($this->foto);
    }
}
