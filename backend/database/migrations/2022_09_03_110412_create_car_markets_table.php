<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCarMarketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('car_markets', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('vcname');
            $table->string('vcimage');
            $table->string('vccolor');
            $table->string('vcdisplacement');
            $table->string('vcpower');
            $table->string('vctorque');
            $table->string('vctyre');
            $table->string('vcprice');
            $table->string('vcvarient');
            $table->string('vctransmission');
            $table->string('vcdimension');
            $table->string('vcbooknow');
            $table->integer('carmarcategory_id');
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
        Schema::dropIfExists('car_markets');
    }
}
