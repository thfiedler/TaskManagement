*&---------------------------------------------------------------------*
*& Report  ztask_cleanup_helper
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
report ztask_display.

parameters name type ztask_responsible.

types: begin of ty_task_4_display,
          creation_date type datum,
          creation_time type uzeit,
          description type ztask_description,
       end of ty_task_4_display.

data it_tasks type standard table of ty_task_4_display.
data alv type ref to cl_salv_table.

select description creation_date creation_time from ztasks into corresponding fields of table it_tasks where responsible = name.

cl_salv_table=>factory(
  importing
    r_salv_table   = alv     " Basis Class Simple ALV Tables
  changing
    t_table        = it_tasks
).
*  catch cx_salv_msg.    "

alv->display( ).
