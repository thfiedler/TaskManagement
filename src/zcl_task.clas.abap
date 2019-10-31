class ZCL_TASK definition
  public

  create public .

  public section.
    interfaces zif_task.
    class-methods create_new_task
      importing
        description type ztask_description
      returning
        value(task) type ref to zif_task
      raising
        zcx_task_creation_error.
    methods constructor
      importing
        description type any optional
      raising
        zcx_task_creation_error.
    methods save.
  protected section.
  private section.
    data task_data type ztask_struc.
    data is_persistent type boole_d.
    data task_data_persist type ztasks.

endclass.



class ZCL_TASK implementation.

  method constructor.

    task_data-uuid = cl_system_uuid=>create_uuid_x16_static( ).

    task_data-description = description.
    task_data-creation_date = sy-datum.
    task_data-creation_time = sy-uzeit.
    task_data-responsible = sy-uname.
  endmethod.

  method zif_task~get_description.
    move me->task_data-description to description.
  endmethod.

  method zif_task~get_id.
    id = me->task_data-uuid.
  endmethod.

  method zif_task~get_responsible.
    move me->task_data-responsible to responsible.
  endmethod.


  method create_new_task.
    task = new ZCL_TASK( description = description ).
  endmethod.

  method zif_task~is_persistent.
    is_persistent = me->is_persistent.
  endmethod.

  method save.
    move-corresponding me->task_data to task_data_persist.
    insert ztasks from @task_data_persist.
    me->is_persistent = 'X'.
    free task_data_persist.
  endmethod.

endclass.
