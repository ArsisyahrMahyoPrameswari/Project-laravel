<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Trans extends Model
{
    use HasFactory;
    protected  $table = "pembayaran";
    protected $fillable = [      
        'user_id' ,
        'image',     
        'tglPembayaran' ,
        'nota' ,
        'metode' ,
        'an_nama' ,
        'alamat' ,
        'nominal' ,
        'status' ,
    ];
}
