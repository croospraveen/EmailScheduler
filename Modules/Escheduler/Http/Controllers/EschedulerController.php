<?php

namespace Modules\Escheduler\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Manager\Entities\Batch;
use Modules\Escheduler\Entities\Bulkemail;
use Modules\Escheduler\Entities\Bulkemailbatch;
use Modules\Escheduler\Entities\Bulkemailattachment;
use Auth;
use File;

class EschedulerController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        $batches = Batch::where('users_id','=',Auth::user()->id)->get();
        return view('escheduler::index',['data' => $batches]);
    }

    
     public function sendmail(Request $request)
    {
        $email = new Bulkemail();
        $email->alias = $request->emailalias;
        $email->subject = $request->emailsubject;
        $email->body = $request->emailbody;
        $email->senddate = date("y-m-d", strtotime($request->sendmaildate));
        $email->users_id = Auth::user()->id;
        $email->save();

       
        
        foreach($request->emailbatch as $batchvalue){
            $bulkemailbatch = new Bulkemailbatch();
            $bulkemailbatch->bulkemails_id = $email->id;
            $bulkemailbatch->batches_id = $batchvalue;
            $bulkemailbatch->save();
        }

        
      

        $myfile = $request->file('attachfile');
        $newname = rand().'.'.$myfile->getClientOriginalExtension();
        $myfile->move(public_path('uploads'),$newname);

        $bulkemailattach = new Bulkemailattachment();
        $bulkemailattach->bulkemails_id = $email->id;
        $bulkemailattach->filename = $newname;
        $bulkemailattach->save(); 
         


        $data['message'] = "Successfully Inserted";
        return response()->json($data);
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create()
    {
        return view('escheduler::create');
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
        return view('escheduler::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        return view('escheduler::edit');
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
