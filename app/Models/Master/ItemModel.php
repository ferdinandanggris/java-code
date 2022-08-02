<?php

namespace App\Models\Master;

use App\Http\Traits\RecordSignature;
use App\Models\Report\OrderDetModel;
use App\Repository\ModelInterface;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Concerns\HasRelationships;

class ItemModel extends Model implements ModelInterface
{
    use SoftDeletes, RecordSignature, HasRelationships, HasFactory;

    /**
     * Menentukan nama tabel yang terhubung dengan Class ini
     *
     * @var string
     */
    protected $table = 'm_item';

    /**
     * Menentukan primary key, jika nama kolom primary key adalah "id",
     * langkah deklarasi ini bisa dilewati
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * Akan mengisi kolom "created_at" dan "updated_at" secara otomatis,
     *
     * @var bool
     */
    public $timestamps = true;

    protected $attributes = [];

    protected $fillable = [
        'nama',
        'kategori',
        'harga',
        'deskripsi',
        'foto',
        'is_available',
    ];

    /**
     * Relasi ke ItemModelDet / tabel m_item_det
     *
     * @return void
     */
    public function itemDet()
    {
        return $this->hasMany(ItemDetModel::class, 'm_item_id', 'id');
    }

    public function getAll(
        array $filter,
        int $itemPerPage = 0,
        string $sort = ''
    ): object {
        $dataItem = $this->query();
        if (!empty($filter['nama'])) {
            $dataItem->where('nama', 'LIKE', '%' . $filter['nama'] . '%');
        }

        if (!empty($filter['kategori'])) {
            $dataItem->where(
                'kategori',
                'LIKE',
                '%' . $filter['kategori'] . '%'
            );
        }
        if (!empty($filter['is_available']) && $filter['is_available'] > -1) {
            $dataItem->where('is_available', '=', $filter['is_available']);
        }

        if (!empty($filter['min_harga'])) {
            // This will only executed if you received any harga
            // Make you you validated the min and max harga properly
            $dataItem->where('harga', '>=', $filter['min_harga']);
        }

        if (!empty($filter['max_harga'])) {
            // This will only executed if you received any harga
            // Make you you validated the min and max harga properly
            $dataItem->where('harga', '<=', $filter['max_harga']);
        }

        $sort = $sort ?: 'id DESC';
        $dataItem->orderByRaw($sort);
        $itemPerPage = $itemPerPage > 0 ? $itemPerPage : false;
        return $dataItem->paginate($itemPerPage)->appends('sort', $sort);
    }

    public function getById(int $id): object
    {
        return $this->query()
            ->with('itemDet')
            ->find($id);
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
