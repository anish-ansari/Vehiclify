<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CarService extends Model
{
    use HasFactory;
    public function carcategory(){
        return $this->hasOne('App\Models\CarCategory','id','carcategory_id');
    }

}
