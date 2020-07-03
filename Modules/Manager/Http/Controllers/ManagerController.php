<?php

namespace Modules\Manager\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Excel;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Modules\Manager\Entities\Batch;
use Auth;
use Modules\Manager\Entities\Contacts;
use Session;

class ManagerController extends Controller
{
    use ValidatesRequests;
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        $contacts = Contacts::with('batch')->get();
        return view('manager::index',['data'=>$contacts]);
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create()
    {
        return view('manager::create');
    }

    
     public function uploadcontact(Request $request)
    {
        $this->validate($request,[
            'select_file' => 'required|mimes:xls,xlsx'
        ]);

        $path = $request->file('select_file')->getRealPath();
        $data = Excel::load($path)->get();
        $bathnum = 'Batch'.time();

        if($data->count() > 0){
           
         
            $batch = new Batch();
            $batch->batchnumber = $bathnum;
            $batch->users_id =  Auth::id();
            $batch->save();
            
            foreach ($data as $key => $value) {
                if(!empty($value['id']) or !empty($value['name']) or !empty($value['number']) or !empty($value['email']) ){
                    
                    $contact = new Contacts();
                    $contact ->contactid = (!empty($value['id'])) ? ((int)$value['id']) : (0); 
                    $contact ->name =  (!empty($value['name'])) ? ($value['name']) : (''); 
                    $contact ->contactnuumber = (!empty($value['number'])) ? ($value['number']) : (''); 
                    $contact ->email = (!empty($value['email'])) ? ($value['email']) : ('');  
                    $contact ->batches_id = (int)$batch->id;
                    $contact ->save();   
                }
            }
            $msg = "Successfully Uploaded";
            Session::flash('sm', $msg);
        }else{
            $msg = "No Data to upload";
            Session::flash('em', $msg);
        }
         
         return redirect()->back();
    }


    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    public function show($id)
    {
        return view('manager::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        return view('manager::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }
}
