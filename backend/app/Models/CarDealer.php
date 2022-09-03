<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CarDealer extends Model
{
    use HasFactory;
    public function cardelcategory(){
        return $this->hasOne('App\Models\CarCategory','id','cardelcategory_id');
    }

}
