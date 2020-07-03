<?php

namespace Modules\Manager\Entities;

use Illuminate\Database\Eloquent\Model;
use Modules\Manager\Entities\Contacts;

class Batch extends Model
{
    protected $fillable = ['batchnumber'];

    public function contacts(){
    	return $this->hasMany(Contacts::class);
    }
}
