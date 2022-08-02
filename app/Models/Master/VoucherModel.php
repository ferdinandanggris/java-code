<?php

namespace App\Models\Master;

use App\Models\User\UserModel;
use App\Repository\ModelInterface;
use App\Http\Traits\RecordSignature;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Concerns\HasRelationships;

class VoucherModel extends Model implements ModelInterface
{
    use RecordSignature, HasRelationships, HasFactory;

    protected $table = 'm_voucher';

    protected $primaryKey = 'id_voucher';
    protected $fillable = [
        'id_promo',
        'id_user',
        'nominal',
        'info_voucher',
        'periode_mulai',
        'periode_selesai',
        'type',
        'status',
        'catatan',
    ];

    public function getAll(
        array $filter,
        int $itemPerPage,
        string $sort
    ): object {
        $dataVoucher = $this->query()->with(['user', 'promo']);
        if (!empty($filter['id_user'])) {
            $dataVoucher->where('id_user', $filter['id_user']);
        }

        if (!empty($filter['id_promo'])) {
            $dataVoucher->where('id_promo', $filter['id_promo']);
        }

        if (
            !empty($filter['periode_mulai']) &&
            !empty($filter['periode_selesai'])
        ) {
            // This will only executed if you received any harga
            // Make you you validated the min and max harga properly
            $dataVoucher->whereBetween('periode_mulai', [
                $filter['periode_mulai'],
                $filter['periode_selesai'],
            ]);
        }

        $sort = $sort ?: 'id_promo DESC';
        $dataVoucher->orderByRaw($sort);
        $itemPerPage = $itemPerPage > 0 ? $itemPerPage : false;
        return $dataVoucher->paginate($itemPerPage)->appends('sort', $sort);
    }

    public function getById(int $id): object
    {
        return $this->find($id);
    }

    public function store(array $payload)
    {
        $payload['info_voucher'] = '';
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

    public function fotoUrl()
    {
        if (empty($this->foto)) {
            return asset('assets/img/no-image.jpg');
        }

        return asset($this->foto);
    }

    public function user()
    {
        return $this->hasOne(UserModel::class, 'id', 'id_user');
    }

    public function promo()
    {
        return $this->hasOne(PromoModel::class, 'id_promo', 'id_promo');
    }
}
