<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Web\TestsController;
use App\Http\Controllers\Api\User\AuthController;
use App\Http\Controllers\Api\User\RoleController;
use App\Http\Controllers\Api\User\UserController;
use App\Http\Controllers\Api\Master\ItemController;
use App\Http\Controllers\Api\Master\PromoController;
use App\Http\Controllers\Api\Report\OrderController;
use App\Http\Controllers\Api\Master\DiskonController;
use App\Http\Controllers\Api\Master\VoucherController;
use App\Http\Controllers\Api\Master\CustomerController;
use App\Http\Controllers\Api\Report\GenerateController;
use App\Http\Controllers\Api\Report\DashboardController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('v1')->group(function () {
    /**
     * CRUD user
     */
    Route::get('/users', [UserController::class, 'index'])->middleware([
        'web',
        'auth.api:user_view',
    ]);
    Route::get('/users/{id}', [UserController::class, 'show'])->middleware([
        'web',
        'auth.api:user_view',
    ]);
    Route::post('/users', [UserController::class, 'store'])->middleware([
        'web',
        'auth.api:user_create',
    ]);
    Route::put('/users', [UserController::class, 'update'])->middleware([
        'web',
        'auth.api:user_update',
    ]);
    Route::delete('/users/{id}', [
        UserController::class,
        'destroy',
    ])->middleware(['web', 'auth.api:user_delete']);

    /**
     * CRUD role / hak akses
     */
    Route::get('/roles', [RoleController::class, 'index'])->middleware([
        'web',
        'auth.api:roles_view',
    ]);
    Route::get('/roles/{id}', [RoleController::class, 'show'])->middleware([
        'web',
        'auth.api:roles_view',
    ]);
    Route::post('/roles', [RoleController::class, 'store'])->middleware([
        'web',
        'auth.api:roles_create',
    ]);
    Route::put('/roles', [RoleController::class, 'update'])->middleware([
        'web',
        'auth.api:roles_update',
    ]);
    Route::delete('/roles/{id}', [
        RoleController::class,
        'destroy',
    ])->middleware(['web', 'auth.api:roles_delete']);

    /**
     * CRUD customer
     */
    Route::get('/customers', [CustomerController::class, 'index'])->middleware([
        'web',
        'auth.api:customer_view',
    ]);
    Route::get('/customers/{id}', [
        CustomerController::class,
        'show',
    ])->middleware(['web', 'auth.api:customer_view']);
    Route::post('/customers', [
        CustomerController::class,
        'store',
    ])->middleware(['web', 'auth.api:customer_create']);
    Route::put('/customers', [
        CustomerController::class,
        'update',
    ])->middleware(['web', 'auth.api:customer_update']);
    Route::delete('/customers/{id}', [
        CustomerController::class,
        'destroy',
    ])->middleware(['web', 'auth.api:customer_delete']);

    /**
     * CRUD items / produk
     */
    Route::get('/items', [ItemController::class, 'index'])->middleware([
        'web',
        'auth.api:item_view',
    ]);
    Route::get('/items/{id}', [ItemController::class, 'show'])->middleware([
        'web',
        'auth.api:item_view',
    ]);
    Route::post('/items', [ItemController::class, 'store'])->middleware([
        'web',
        'auth.api:item_create',
    ]);
    Route::put('/items', [ItemController::class, 'update'])->middleware([
        'web',
        'auth.api:item_update',
    ]);
    Route::delete('/items/{id}', [
        ItemController::class,
        'destroy',
    ])->middleware(['web', 'auth.api:item_delete']);

    /**
     * Promo
     */
    Route::get('/promos', [PromoController::class, 'index'])->middleware([
        'web',
        'auth.api:promo_view',
    ]);
    Route::get('/promos/{id}', [PromoController::class, 'show'])->middleware([
        'web',
        'auth.api:promo_view',
    ]);
    Route::post('/promos', [PromoController::class, 'store'])->middleware([
        'web',
        'auth.api:promo_create',
    ]);
    Route::put('/promos', [PromoController::class, 'update'])->middleware([
        'web',
        'auth.api:promo_update',
    ]);
    Route::delete('/promos/{id}', [
        PromoController::class,
        'destroy',
    ])->middleware(['web', 'auth.api:promo_delete']);

    /**
     * Diskon
     */
    Route::get('/diskons', [DiskonController::class, 'index'])->middleware([
        'web',
        'auth.api:diskon_view',
    ]);
    Route::get('/diskons/{id}', [DiskonController::class, 'show'])->middleware([
        'web',
        'auth.api:diskon_view',
    ]);
    Route::post('/diskon', [DiskonController::class, 'store'])->middleware([
        'web',
        'auth.api:diskon_create',
    ]);
    Route::put('/diskons', [DiskonController::class, 'update'])->middleware([
        'web',
        'auth.api:diskon_update',
    ]);
    Route::delete('/diskons/{id}', [
        DiskonController::class,
        'destroy',
    ])->middleware(['web', 'auth.api:diskon_delete']);

    /**
     * Voucher
     */
    Route::get('/vouchers', [VoucherController::class, 'index'])->middleware([
        'web',
        'auth.api:voucher_view',
    ]);
    Route::get('/vouchers/{id}', [
        VoucherController::class,
        'show',
    ])->middleware(['web', 'auth.api:voucher_view']);
    Route::post('/vouchers', [VoucherController::class, 'store'])->middleware([
        'web',
        'auth.api:voucher_create',
    ]);
    Route::put('/vouchers', [VoucherController::class, 'update'])->middleware([
        'web',
        'auth.api:voucher_update',
    ]);
    Route::delete('/vouchers/{id}', [
        VoucherController::class,
        'destroy',
    ])->middleware(['web', 'auth.api:voucher_delete']);

    /**
     * Report laporan Customer
     */
    Route::get('/report-penjualan-customer', [
        OrderController::class,
        'penjualanCustomer',
    ]);
    // ->middleware(['web', 'auth.api:report_customer_view'])
    /**
     * Report laporan Menu
     */
    Route::get('/report-penjualan-menu', [
        OrderController::class,
        'penjualanMenu',
    ])->middleware(['web', 'auth.api:report_menu_view']);

    /**
     * Report rekap penjualan
     */
    Route::get('/report-rekap-penjualan', [
        OrderController::class,
        'rekapPenjualan',
    ])->middleware(['web', 'auth.api:report_penjualan_view']);;

    /**
     * Report Dashboard
     */
    Route::get('/dashboard', [
        DashboardController::class,
        'index',
    ])->middleware([
        'web',
        'auth.api:dashboard_view',
    ]);

    /**
     * Print to pdf
     */
    Route::get('/generatePdf', [GenerateController::class, 'generatePdf']);
    Route::get('/generatePdftest', [TestsController::class, 'generatePdf']);

    /**
     * Excel
     */
    Route::get('/exportExcel', [GenerateController::class, 'exportExcel']);
    Route::get('/importExcel', [TestsController::class, 'importExcel']);

    /**
     * Route khusus authentifikasi
     */
    Route::prefix('auth')->group(function () {
        Route::post('/login', [AuthController::class, 'login']);
        Route::post('/logout', [AuthController::class, 'logout']);
        Route::get('/profile', [AuthController::class, 'profile'])->middleware([
            'auth.api',
        ]);
        Route::get('/csrf', [AuthController::class, 'csrf'])->middleware([
            'web',
        ]);
    });
});

Route::get('/', function () {
    return response()->failed(['Endpoint yang anda minta tidak tersedia']);
});

/**
 * Jika Frontend meminta request endpoint API yang tidak terdaftar
 * maka akan menampilkan HTTP 404
 */
Route::fallback(function () {
    return response()->failed(['Endpoint yang anda minta tidak tersedia']);
});
