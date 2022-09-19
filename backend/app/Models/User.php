<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
// use Laravel\Sanctum\HasApiTokens;
use Laravel\Passport\HasApiTokens;  
// check this error due to version error app token not working due to this


class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'phone',
        'dateofbirth',
        'address',
        'fathername',
        'citizenshipno',
        'password',
        'licenseno',
        'licenseoffice',
        'dateofissue',
        'dateofexpiry',
        'category',
        'companyname',
        'model',
        'manufacturedyear',
        'cylinder',
        'cc',
        'chasisno',
        'engineno',
        'color',
        'seatcapacity',
        'fueltype',
        'boughtfrom',
        'use',
        'drivingarea',
        // 'image',
        'renewdate',


    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
