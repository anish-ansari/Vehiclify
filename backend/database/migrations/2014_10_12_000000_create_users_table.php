<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->string('phone')->unique();
            $table->string('dateofbirth');
            $table->string('address');
            $table->string('fathername');
            $table->string('citizenshipno')->unique();
            // $table->string('usertype');
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            //License
            $table->string('licenseno')->unique();
            $table->string('licenseoffice');
            $table->string('dateofissue');
            $table->string('dateofexpiry');
            $table->string('category');
            //BlueBook
            $table->string('companyname');
            $table->string('model');
            $table->string('manufacturedyear');
            $table->string('cylinder');
            $table->string('cc');
            $table->string('chasisno')->unique();
            $table->string('engineno')->unique();
            $table->string('color');
            $table->string('seatcapacity');
            $table->string('fueltype');
            $table->string('boughtfrom');
            $table->string('use');
            $table->string('drivingarea');
            $table->string('image')->nullable();
            $table->string('renewdate');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
