<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class WsusEntries extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('wsusentries', function (Blueprint $table) {
            $table->increments('id');
            $table->text('UpdateTitle');
            $table->text('LegacyName');

            $table->text('SecurityBulletins');
            $table->text('Computername');
            $table->text('OS');
            $table->text('IpAddress');
            $table->text('UpdateInstallationStatus');
            $table->text('UpdateApprovalAction');
            $table->text('CreationDate');
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
        Schema::dropIfExists('wsusentries');
    }
}
