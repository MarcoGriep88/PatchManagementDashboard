<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WSUSEntry extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wsusentries';

    protected $fillable = array(
        'id',
        'UpdateTitle',
        'LegacyName',
        'SecurityBulletins',
        'Computername',
        'OS',
        'IpAddress',
        'UpdateInstallationStatus',
        'UpdateApprovalAction',
        'CreationDate'
    );
}