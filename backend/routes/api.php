<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DatabaseController;
use App\Http\Controllers\FileUploadController;

Route::post('/upload', [FileUploadController::class, 'upload']);
Route::post('/select', [DatabaseController::class, 'select']);
Route::post('/insert', [DatabaseController::class, 'insert']);
Route::post('/update', [DatabaseController::class, 'update']);
Route::post('/delete', [DatabaseController::class, 'delete']);
Route::post('/custom', [DatabaseController::class, 'custom']);
