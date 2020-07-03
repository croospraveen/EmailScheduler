<?php

namespace Modules\Escheduler\Entities;

use Illuminate\Database\Eloquent\Model;

class bulkemail extends Model
{
    protected $fillable = ['alias','subject','senddate','body'];
}
