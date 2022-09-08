<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDotmBluebooksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dotm_bluebooks', function (Blueprint $table) {
            $table->increments('id');
            $table->string('dcompanyname');
            $table->string('dmodel');
            $table->string('dmanufacturedyear');
            $table->string('dcylinder');
            $table->string('dcc');
            $table->string('dchasisno')->unique();
            $table->string('dengineno')->unique();
            $table->string('dcolor');
            $table->string('dseatcapacity');
            $table->string('dfueltype');
            $table->string('dboughtfrom');
            $table->string('duse');
            $table->string('ddrivingarea');
            $table->string('drenewdate');
            $table->string('dpimage');
            $table->string('ddimage');
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
        Schema::dropIfExists('dotm_bluebooks');
    }
}
