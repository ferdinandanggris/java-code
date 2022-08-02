<?php

namespace App\Helpers\Master;

use App\Models\Master\PromoModel;
use App\Repository\CrudInterface;

class PromoHelper implements CrudInterface
{
    public function __construct()
    {
        $this->promoModel = new PromoModel();
    }

    public function getAll(
        array $filter,
        int $itemPerPage,
        string $sort
    ): object {
        return $this->promoModel->getAll($filter, $itemPerPage, $sort);
    }

    public function getById(int $id): object
    {
        return $this->promoModel->getById($id);
    }

    public function create(array $payload): array
    {
        try {
            if (!empty($payload['foto'])) {
                /**
                 * Parameter kedua ("gcs") digunakan untuk upload ke Google Cloud Service
                 * jika mau upload di server local, maka tidak usah pakai parameter kedua
                 */
                $folderPath = 'storage/upload/fotoPromo/';

                $image_parts = explode(';base64,', $payload['foto']);
                $image_type_aux = explode('image/', $image_parts[0]);
                $image_type = $image_type_aux[1];
                $image_base64 = base64_decode($image_parts[1]);
                $file = $folderPath . uniqid() . '.' . $image_type;
                file_put_contents($file, $image_base64);
                $payload['foto'] = $file;
            }

            $promo = $this->promoModel->store($payload);
            return [
                'status' => true,
                'data' => $promo,
            ];
        } catch (\Throwable $th) {
            return [
                'status' => false,
                'error' => $th->getMessage(),
            ];
        }
    }

    public function update(array $payload, int $id): array
    {
        try {
            if (!empty($payload['foto'])) {
                /**
                 * Parameter kedua ("gcs") digunakan untuk upload ke Google Cloud Service
                 * jika mau upload di server local, maka tidak usah pakai parameter kedua
                 */
                $folderPath = 'storage/upload/fotoPromo/';

                $image_parts = explode(';base64,', $payload['foto']);
                $image_type_aux = explode('image/', $image_parts[0]);
                $image_type = $image_type_aux[1];
                $image_base64 = base64_decode($image_parts[1]);
                $file = $folderPath . uniqid() . '.' . $image_type;

                file_put_contents($file, $image_base64);
                $payload['foto'] = $file;
            } else {
                $dataOldPromo = $this->getById($id);
                $payload['foto'] = $dataOldPromo->foto;
            }

            $updatePromo = $this->promoModel->edit($payload, $id);
            $dataPromo = $this->getById($id);

            return [
                'status' => true,
                'data' => $dataPromo,
            ];
        } catch (\Throwable $th) {
            return [
                'status' => false,
                'error' => $th->getMessage(),
            ];
        }
    }

    public function delete(int $id): bool
    {
        try {
            $this->promoModel->drop($id);
            return true;
        } catch (\Throwable $th) {
            return false;
        }
    }
}
