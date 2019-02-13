*&---------------------------------------------------------------------*
*& Report  ztask_cleanup_helper
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
report ztask_create_new_task.

parameters descr type ztask_description.

zcl_task=>create_new_task( description = descr  ).

call transaction 'ZTASK_DISPLAY'.
