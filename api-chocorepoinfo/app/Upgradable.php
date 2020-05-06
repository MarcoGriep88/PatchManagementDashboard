<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Upgradable extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'upgradables';

    protected $fillable = array(
        'id',
        'Hostname',
        'Software',
        'LocalVersion',
        'UpgradeVersion',
        'Weight'
    );
}