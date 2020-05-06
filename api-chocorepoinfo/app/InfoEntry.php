<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class InfoEntry extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'infoentry';

    protected $fillable = array(
        'id',
        'Name',
        'Version'
    );
}