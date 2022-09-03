<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBikeMarketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bike_markets', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('vbname');
            $table->string('vbimage');
            $table->string('vbcolor');
            $table->string('vbdisplacement');
            $table->string('vbpower');
            $table->string('vbtorque');
            $table->string('vbtyre');
            $table->string('vbprice');
            $table->string('vbvarient');
            $table->string('vbtransmission');
            $table->string('vbbooknow');
            $table->integer('bikemarcategory_id');
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
        Schema::dropIfExists('bike_markets');
    }
}
