<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDrivingSchoolsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('driving_schools', function (Blueprint $table) {
            $table->increments('id');
            $table->string('drivingschoolname');
            $table->string('drivingschooladdress');
            $table->string('drivingschoollocation');
            $table->string('drivingschoolphoneno');
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
        Schema::dropIfExists('driving_schools');
    }
}
