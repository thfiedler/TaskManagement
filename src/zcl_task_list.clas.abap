class zcl_task_list definition
  public
  final
  create public .

  public section.
    methods insert_task
      importing
        task type ref to zif_task
      exceptions
        overflow.

  protected section.
  private section.
    data _task_list type standard table of ref to zif_task.
    methods clear_task_list.
endclass.



class zcl_task_list implementation.

  method insert_task.
    append task to _task_list.
  endmethod.

  method clear_task_list.
    refresh _task_list.
  endmethod.

endclass.
