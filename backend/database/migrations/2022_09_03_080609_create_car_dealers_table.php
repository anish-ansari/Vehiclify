<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCarDealersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('car_dealers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('cardelname');
            $table->string('cardeladdress');
            $table->string('cardellocation');
            $table->string('cardelphoneno');
            $table->integer('cardelcategory_id');
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
        Schema::dropIfExists('car_dealers');
    }
}
