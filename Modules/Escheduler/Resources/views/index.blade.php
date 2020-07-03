@extends('escheduler::layouts.master')

@section('content')
    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Email Scheduler
        <small>Send Email To Multiple Contacts</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Email Scheduler</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">
    	<div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">
              	
              	<button class="btn btn-success" data-toggle="modal" data-target="#fileupload"><span class="glyphicon glyphicon-upload"></span>&nbsp;Generate Email</button>
              </h3>
               @if (Session::has('sm'))
	                <div class="alert alert-success">{{ Session::get('sm') }}</div>
	            @endif
	            @if (Session::has('em'))
	                <div class="alert alert-warning">{{ Session::get('em') }}</div>
	            @endif
            </div>

            <!-- Modal -->
			<div class="modal fade" id="fileupload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			        <h5 class="modal-title" id="myModalLabel">Send Email in Bulk</h5>
			      </div>
			      <div class="modal-body">
			      	
			        <form method="post" action="{{ url('manager/uploadcontact') }}" enctype="multipart/form-data" name="ssmail" id="ssmail">
			        	{{ csrf_field() }}
			        	<div class="form-group">
                  <label for="emailalias">Alias</label>
                  <input type="text" class="form-control" id="emailalias" name="emailalias">
                </div>
                <div class="form-group">
                  <label for="emailsubject">Subject</label>
                  <input type="text" class="form-control" id="emailsubject" name="emailsubject">
                </div>
                <div class="form-group">
                  <label for="emailbatch">Select Batches</label> <br/>
                    @foreach($data as $batch)
                      <label class="checkbox-inline">
                        <input type="checkbox" value="{{ $batch->id}}" name="emailbatch[]">{{ $batch->batchnumber}}
                      </label> 
                    @endforeach
                </div>
                <div class="form-group">
                  <label for="emailbody">Body</label>
                  <textarea cols="5" rows="3" class="form-control" id="emailbody" name="emailbody">
                  </textarea>
                </div>
                <div class="form-group">
                   <label for="attachfile">Attachments</label>
                  <input type="file" name="attachfile" id="attachfile" >
                </div>
                <div class="form-group">
                   <label for="sendmaildate">Send Date</label>
                  <input type="text" name="sendmaildate" id="sendmaildate" class="form-control">
                </div>
                <button type="button" class="btn btn-success" id="emailsend" name="emailsend">Send</button>
			        </form>

			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			       
			      </div>
			    </div>
			    <!-- /.modal-content -->
			  </div>
			  <!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

            <!-- /.box-header -->

            
            </div>
           </div>
          </div>
    
    </section>
    <!-- /.content -->
  </div>
@endsection
 