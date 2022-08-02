<?php
namespace App\Helpers\Master;

use App\Repository\DetailInterface;
use App\Models\Master\DiskonModel;
use App\Models\Master\PromoModel;
use App\Models\User\UserModel;
use App\Repository\CrudInterface;

/*
 *Helper untuk manajemen diskon
 ** Mengambil data, menambah, mengubah, & menghapus ke tabel diskon
 */
class DiskonHelper implements CrudInterface
{
    private $promoModel;
    private $diskonModel;
    private $userModel;
    public function __construct()
    {
        $this->diskonModel = new DiskonModel();
        $this->userModel = new UserModel();
        $this->promoModel = new PromoModel();
    }

    /**
     * Mengambil data Diskon dari tabel m_diskon
     *  @param array $filter
     *  @param integer $itemPerPage,
     *  @param string $sort
     *
     *  @return object
     **/
    public function getAll(
        array $filter,
        int $itemPerPage,
        string $sort
    ): object {
        /**
         * Penyimpanan data yang berhasil diolah
         */
        $temp = [];

        /**
         * Mengambil semua data diskon dari model diskon
         */
        $dataDiskon = $this->diskonModel->getAll($filter, $itemPerPage, $sort);

        /**
         * Mengambil semua data user dari model user
         */
        $dataUser = $this->userModel->getAll([], 0, 'id DESC');

        /**
         * Mengambil semua data promo dari model promo yang bertipe diskon dan urutkan mulai id_promo Descending
         */
        $dataPromo = $this->promoModel->getAll(
            ['type' => 'diskon'],
            0,
            'id_promo DESC'
        );

        /**
         * Looping semua data dari variabel dataUser
         */
        for ($i = 0; $i < count($dataUser); $i++) {
            /**
             * Memasukkan data yang dibutuhkan ke variable temp
             * @var array
             */
            $temp[$i] = [
                'id' => $dataUser[$i]->id,
                'nama' => $dataUser[$i]->nama,
                'diskon' => [],
            ];
            /**
             * Looping data dari variable dataPromo
             */
            for ($j = 0; $j < count($dataPromo); $j++) {
                /**
                 * Memasukkan data yang dibutuhkan ke variable $temp[$i]['diskon'][$j]
                 * @var array
                 */
                $temp[$i]['diskon'][$j] = [
                    'id_promo' => $dataPromo[$j]->id_promo,
                    'nama' => $dataPromo[$j]->nama,
                    'status' => 0,
                    'id_diskon' => 0,
                ];

                /**
                 * Looping data dari variable dataDiskon
                 */
                for ($k = 0; $k < count($dataDiskon); $k++) {
                    if (
                        $dataDiskon[$k]->id_promo == $dataPromo[$j]->id_promo &&
                        $dataDiskon[$k]->id_user == $dataUser[$i]->id
                    ) {
                        $temp[$i]['diskon'][$j]['status'] =
                            $dataDiskon[$k]->status;
                        $temp[$i]['diskon'][$j]['id_diskon'] =
                            $dataDiskon[$k]->id_diskon;
                    }
                }
            }
        }

        return (object) ['list' => $temp];
    }

    /**
     * Mengambil satu data dari tabel m_diskon
     * @param integer $id
     *
     * @return object
     */
    public function getById(int $id): object
    {
        return $this->diskonModel->getById($id);
    }

    /**
     * method menginput data baru ke tabel m_diskon
     * @param array $payload
     * @return array
     */
    public function create(array $payload): array
    {
        try {
            $diskon = $this->diskonModel->store($payload);
            return [
                'status' => true,
                'data' => $diskon,
            ];
        } catch (\Throwable $th) {
            return [
                'status' => false,
                'error' => $th->getMessage(),
            ];
        }
    }

    /**
     * Method mengubah diskon pada table m_diskon
     * @param array $payload
     * @param integer $id
     * @return array
     */
    public function update(array $payload, int $id): array
    {
        try {
            $this->diskonModel->edit($payload, $id);
            $dataDiskon = $this->diskonModel->getById($id);
            return [
                'status' => true,
                'data' => $dataDiskon,
            ];
        } catch (\Throwable $th) {
            return [
                'status' => false,
                'error' => $th->getMessage(),
            ];
        }
    }

    /**
     * Menghapus data diskon dari tabel m_diskon
     * @param integer $id
     * @return boolean
     */
    public function delete(int $id): bool
    {
        try {
            $this->diskonModel->drop($id);
            return true;
        } catch (\Throwable $th) {
            return false;
        }
    }
}
