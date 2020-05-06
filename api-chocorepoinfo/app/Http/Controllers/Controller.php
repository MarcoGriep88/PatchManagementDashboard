<?php

namespace App\Http\Controllers;

use Laravel\Lumen\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\InfoEntry;
use App\Upgradable;
use Response;

class Controller extends BaseController
{
    function __construct() {   }

    public function index() {
        $result = InfoEntry::all();
        return response()->json($result);
    }

    public function get_upgradables() {
        $result = Upgradable::all();
        return response()->json($result);
    }

    public function show_by_id($id) {
        $result = InfoEntry::where("id", $id)->first();
        return response()->json($result);
    }

    public function create(Request $request) {        
        $checkElems = InfoEntry::where('Name', $request->Name)
                ->where('Version', $request->Version)
                ->first();

        if ($checkElems!=null)
        {

        }

        $obj = new InfoEntry;

        $obj->Name = $request->Name;
        $obj->Version = $request->Version;
        
        $obj->save();
        
        return $obj;
    }

    public function upgrade(Request $request) {        
        $checkElems = Upgradable::where('Hostname', $request->Hostname)
                ->where('Software', $request->Software)
                ->where('LocalVersion', $request->LocalVersion)
                ->where('UpgradeVersion', $request->UpgradeVersion)
                ->first();

        if ($checkElems!=null)
        {

        }

        $obj = new Upgradable;

        $obj->Hostname = $request->Hostname;
        $obj->LocalVersion = $request->LocalVersion;
        $obj->Software = $request->Software;
        $obj->UpgradeVersion = $request->UpgradeVersion;
        $obj->Weight = $request->Weight;
        $obj->save();
        
        return $obj;
    }

    public function truncate() {
        try {
            $tables = DB::select('SHOW TABLES');
               foreach($tables as $table){
                  if ($table->Tables_in_db_choco_appinfo == 'infoentry') {
                    DB::table($table->Tables_in_db_choco_appinfo)->truncate();
                  }        
            }
            return "Ok";
        }
        catch(Exception $e) {
            return "Failed";
        }
    }

    public function refreshupgrade() {
        try {
            $tables = DB::select('SHOW TABLES');
               foreach($tables as $table){
                  if ($table->Tables_in_db_choco_appinfo == 'upgradables') {
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
