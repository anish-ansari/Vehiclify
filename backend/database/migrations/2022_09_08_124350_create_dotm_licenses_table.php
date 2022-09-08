<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDotmLicensesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dotm_licenses', function (Blueprint $table) {
            $table->increments('id');
            $table->string('dname');
            $table->string('dphone')->unique();
            $table->string('ddateofbirth');
            $table->string('daddress');
            $table->string('dfathername');
            $table->string('dcitizenshipno')->unique();
            $table->string('dlicenseno')->unique();
            $table->string('dlicenseoffice');
            $table->string('ddateofissue');
            $table->string('ddateofexpiry');
            $table->string('dcategory');
            $table->string('dimg');
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
        Schema::dropIfExists('dotm_licenses');
    }
}
