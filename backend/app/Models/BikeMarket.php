<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BikeMarket extends Model
{
    use HasFactory;
    public function bikemarcategory(){
        return $this->hasOne('App\Models\BikeCategory','id','bikemarcategory_id');
    }
}
