<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBikeDealersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bike_dealers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('bikedelname');
            $table->string('bikedeladdress');
            $table->string('bikedellocation');
            $table->string('bikedelphoneno');
            $table->integer('bikedelcategory_id');
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
        Schema::dropIfExists('bike_dealers');
    }
}
