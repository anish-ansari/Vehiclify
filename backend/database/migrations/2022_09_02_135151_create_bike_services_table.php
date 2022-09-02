<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBikeServicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bike_services', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('bikesername');
            $table->string('bikeseraddress');
            $table->string('bikeserlocation');
            $table->string('bikeserphoneno');
            $table->integer('bikecategory_id');
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
        Schema::dropIfExists('bike_services');
    }
}
