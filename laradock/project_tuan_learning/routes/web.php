<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/wc2', function () {
    return view('wc2');
});
Route::get('ID/{id}',function($id) {
    echo 'ID: '.$id;
 });
Route::get('user/{name?}', function ($name = 'TutorialsPoint') { return $name;});
Route::get('user/profile', 'UserController@showProfile')->name('profile');

# use App\Http\Controllers\UserController;
Route::get('role',[
    'middleware' => 'Role:editor',
    'uses' => 'App\Http\Controllers\TestController@index',
]);

use App\Http\Controllers\ABCController;
Route::get('terminate',[
    'middleware' => 'terminate',
    'uses' => 'App\Http\Controllers\ABCController@index',
]);