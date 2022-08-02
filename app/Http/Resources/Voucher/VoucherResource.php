<?php

namespace App\Http\Resources\Voucher;

use Illuminate\Http\Resources\Json\JsonResource;

class VoucherResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id_voucher' => $this->id_voucher,
            'id_promo' => $this->id_promo,
            'id_user' => $this->id_user,
            'nominal' => $this->nominal,
            'info_voucher' => $this->info_voucher,
            'periode_mulai' => $this->periode_mulai,
            'periode_selesai' => $this->periode_selesai,
            'status' => $this->status,
            'catatan' => $this->catatan,
            'user' => [
                'nama' => $this->user->nama,
            ],
            'promo' => [
                'id_promo' => $this->promo->id_promo,
                'nama' => $this->promo->nama,
                'kadaluarsa' => $this->promo->kadaluarsa,
                'nominal' => $this->promo->nominal,
                'fotoUrl' => $this->promo->foto,
            ],
        ];
    }
}
