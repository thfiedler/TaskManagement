

form create_task using task.
  task = zcl_task=>create_new_task( description = '' ).
endform.
