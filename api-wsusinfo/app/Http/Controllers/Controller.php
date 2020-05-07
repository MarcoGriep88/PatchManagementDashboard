<?php
namespace App\Http\Controllers;

use Laravel\Lumen\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\WSUSEntry;
use Response;

class Controller extends BaseController
{
    function __construct() {   }

    public function index() {
        $result = WSUSEntry::all();
        return response()->json($result);
    }

    public function show_by_id($id) {
        $result = WSUSEntry::where("id", $id)->first();
        return response()->json($result);
    }

    public function create(Request $request) {        
        $checkElems = WSUSEntry::where('UpdateTitle', $request->UpdateTitle)
                ->where('Computername', $request->Computername)
                ->where('UpdateInstallationStatus', $request->UpdateInstallationStatus)
                ->first();

        if ($checkElems!=null) { return "Already exists"; }

        $obj = new WSUSEntry;

        $obj->UpdateTitle = $request->UpdateTitle;
        $obj->LegacyName = $request->LegacyName;
        $obj->SecurityBulletins = $request->SecurityBulletins;
        $obj->Computername = $request->Computername;
        $obj->OS = $request->OS;
        $obj->IpAddress = $request->IpAddress;
        $obj->UpdateInstallationStatus = $request->UpdateInstallationStatus;
        $obj->UpdateApprovalAction = $request->UpdateApprovalAction;
        $obj->CreationDate = $request->CreationDate;
        
        $obj->save();
        
        return $obj;
    }

    public function truncate() {
        try {
            $tables = DB::select('SHOW TABLES');
               foreach($tables as $table){
                  if ($table->Tables_in_db_choco_appinfo == 'wsusentries') {
                    DB::table($table->Tables_in_db_choco_appinfo)->truncate();
                  }        
            }
            return "Ok";
        }
        catch(Exception $e) {
            return "Failed";
        }
    }
}
