@extends('manager::layouts.master')

@section('content')
    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Email Manager
        <small>Download Sample Excel and Upload to contacts</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Email manager</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">
    	<div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">
              	<a href="{{ asset('public/uploads/cybersample.xlsx') }}" class="btn btn-info"><span class="glyphicon glyphicon-download"></span>&nbsp;Download Sample Excel </a>
              	<button class="btn btn-success" data-toggle="modal" data-target="#fileupload"><span class="glyphicon glyphicon-upload"></span>&nbsp;Upload Excel </button>
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
			        <h4 class="modal-title" id="myModalLabel">Upload Contacts Excel</h4>
			      </div>
			      <div class="modal-body">
			      	<span style="color:red;">Make sure the excel is in the following format </span><br/>
			      	<h5 style="color:red;">
			      		ID | NAME | NUMBER | EMAIL
			      	</h5>

			        <br/>
			        <form method="post" action="{{ url('manager/uploadcontact') }}" enctype="multipart/form-data">
			        	{{ csrf_field() }}
			        	<input type="file" name="select_file"/> <br/>
			        	<input type="submit" name="" class="btn btn-primary" value="Upload">
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
            <div class="box-body">
              <table id="example2" class="table  table-striped">
                <thead>
                <tr>
                  <th>Name</th>
                  <th>Contact Id</th>
                  <th>Contact Number</th>
                  <th>Email</th>
                  <th>Batch Number</th>

                  
                </tr>
                </thead>
                <tbody>
                 	@foreach($data as $contact)

                        <tr>
                  			<td>{{ $contact->name }}</td>
                  			<td>{{ $contact->contactid }}</td>
                  			<td>{{ $contact->contactnuumber }}</td>
                  			<td>{{ $contact->email }}</td>
                  			<td>{{ $contact->batch->batchnumber }}</td>
                 		</tr>
                    @endforeach
                
               </tbody>
              </table>
             </div>
            </div>
           </div>
          </div>
    
    </section>
    <!-- /.content -->
  </div>
@endsection
