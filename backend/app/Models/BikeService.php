<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BikeService extends Model
{
    use HasFactory;

    public function bikecategory(){
        return $this->hasOne('App\Models\BikeCategory','id','bikecategory_id');
    }
}
