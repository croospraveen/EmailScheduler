<?php

namespace Modules\Manager\Entities;

use Illuminate\Database\Eloquent\Model;
use Modules\Manager\Entities\Batch;

class Contacts extends Model
{
    protected $fillable = ['contactid','name','contactnuumber','email','batch_id'];

    public function batch(){
    	return $this->belongsTo(Batch::class,'batches_id');
    }
}
