<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BikeDealer extends Model
{
    use HasFactory;
    public function bikedelcategory(){
        return $this->hasOne('App\Models\BikeCategory','id','bikedelcategory_id');
    }
}
