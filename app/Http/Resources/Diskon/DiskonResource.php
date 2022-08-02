<?php

namespace App\Http\Resources\Diskon;

use Illuminate\Http\Resources\Json\JsonResource;

class DiskonResource extends JsonResource
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
            'id_diskon' => $this->id_diskon,
            'id_user' => $this->id_user,
            'id_promo' => $this->id_promo,
            'status' => $this->status,
            'promo' => [
                'nama' => $this->promo->nama,
                'diskon' => $this->promo->diskon,
            ],
        ];
    }
}
