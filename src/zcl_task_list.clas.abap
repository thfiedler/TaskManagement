class zcl_task_list definition
  public
  final
  create public .

  public section.
    methods insert_task
      importing
        task type ref to zif_task.

  protected section.
  private section.
    data _task_list type standard table of ref to zif_task.
endclass.



class zcl_task_list implementation.

  method insert_task.
    append task to _task_list.
  endmethod.

endclass.
