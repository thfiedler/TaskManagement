

FUNCTION ZCREATE_TASK_API.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"----------------------------------------------------------------------
  data task type ref to zif_task.
  data clsname type seoclsname.


  perform create_task using task.


endfunction.
