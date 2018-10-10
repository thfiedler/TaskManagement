define mac1.
end-of-definition.

FUNCTION ZCREATE_TASK_API.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"----------------------------------------------------------------------
data clsname type seoclsname.
data task type ref to zif_task.

clsname = 'ZCL_TASK'.

create object task type (clsname).

perform calculate_task_duration.

call function 'DDIF_FIELDINFO_GET'.

mac1.

data ref type ref to cl_abap_typedescr.
data: abc type abap_bool.

ref = cl_abap_typedescr=>describe_by_data( p_data = abc ).

ENDFUNCTION.
