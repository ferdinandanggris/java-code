<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

/**
 * Membuat database default untuk tabel m_user dan m_roles
 * Jalankan perintah "php artisan db:seed --class=UserSeeder" pada terminal
 */
class UserSeeder extends Seeder
{
    public function run()
    {
        // Input data default untuk tabel m_roles
        // DB::table('user_roles')->insert([
        //     'id' => 1,
        //     'nama' => 'Super Admin',
        //     'akses' => '{
        //         "user": {"create": true, "update": true, "delete": true, "view": true},
        //         "roles": {"create": true, "update": true, "delete": true, "view": true}
        //     }',
        // ]);

        // Input data default untuk tabel m_user
        // DB::table('user_auth')->insert([
        //     'user_roles_id' => 1,
        //     'nama' => 'Wahyu Agung',
        //     'email' => 'agung10@landa.co.id',
        //     'password' => Hash::make('devGanteng'),
        //     'updated_security' => date('Y-m-d H:i:s'),
        // ]);

        DB::table('user_auth')->insert([
            'user_roles_id' => 1,
            'nama' => 'Wahyu Agung1',
            'email' => 'agung2@landa.co.id',
            'password' => Hash::make('devGanteng'),
            'updated_security' => date('Y-m-d H:i:s'),
        ]);
        DB::table('user_auth')->insert([
            'user_roles_id' => 1,
            'nama' => 'Wahyu Agung2',
            'email' => 'agung3@landa.co.id',
            'password' => Hash::make('devGanteng'),
            'updated_security' => date('Y-m-d H:i:s'),
        ]);
        DB::table('user_auth')->insert([
            'user_roles_id' => 1,
            'nama' => 'Wahyu Agung3',
            'email' => 'agung4@landa.co.id',
            'password' => Hash::make('devGanteng'),
            'updated_security' => date('Y-m-d H:i:s'),
        ]);
        DB::table('user_auth')->insert([
            'user_roles_id' => 1,
            'nama' => 'Wahyu Agung4',
            'email' => 'agung5@landa.co.id',
            'password' => Hash::make('devGanteng'),
            'updated_security' => date('Y-m-d H:i:s'),
        ]);
        DB::table('user_auth')->insert([
            'user_roles_id' => 1,
            'nama' => 'Wahyu Agung5',
            'email' => 'agung6@landa.co.id',
            'password' => Hash::make('devGanteng'),
            'updated_security' => date('Y-m-d H:i:s'),
        ]);
        DB::table('user_auth')->insert([
            'user_roles_id' => 1,
            'nama' => 'Wahyu Agung',
            'email' => 'agung7@landa.co.id',
            'password' => Hash::make('devGanteng'),
            'updated_security' => date('Y-m-d H:i:s'),
        ]);
        DB::table('user_auth')->insert([
            'user_roles_id' => 1,
            'nama' => 'Wahyu Agung6',
            'email' => 'agung8@landa.co.id',
            'password' => Hash::make('devGanteng'),
            'updated_security' => date('Y-m-d H:i:s'),
        ]);
        DB::table('user_auth')->insert([
            'user_roles_id' => 1,
            'nama' => 'Wahyu Agung7',
            'email' => 'agung9@landa.co.id',
            'password' => Hash::make('devGanteng'),
            'updated_security' => date('Y-m-d H:i:s'),
        ]);
        DB::table('user_auth')->insert([
            'user_roles_id' => 1,
            'nama' => 'Wahyu Agung8',
            'email' => 'agung10@landa.co.id',
            'password' => Hash::make('devGanteng'),
            'updated_security' => date('Y-m-d H:i:s'),
        ]);
        DB::table('user_auth')->insert([
            'user_roles_id' => 1,
            'nama' => 'Wahyu Agung9',
            'email' => 'agung11@landa.co.id',
            'password' => Hash::make('devGanteng'),
            'updated_security' => date('Y-m-d H:i:s'),
        ]);
    }
}
