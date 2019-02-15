class zcl_task definition
  public
  final
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

endclass.



class zcl_task implementation.

  method constructor.
*    data(uuid_generator)  = cl_uuid_factory=>create_system_uuid( ).
*    try.
*        task_data-uuid = uuid_generator->create_uuid_c32( ).
*        task_data-description = description.
*        task_data-creation_date = cl_abap_context_info=>get_system_date( ).
*        task_data-creation_time = cl_abap_context_info=>get_system_time( ).
*        task_data-responsible = cl_abap_context_info=>get_user_formatted_name( ).
*      catch cx_uuid_error cx_abap_context_info_error.
*        raise exception type zcx_task_creation_error.
*    endtry.
*    task_data-uuid = uuid_generator->create_uuid_c32( ).

    call function 'SYSTEM_GET_UNIQUE_ID'
      importing
        unique_id = task_data-uuid.
    task_data-description = description.
    task_data-creation_date = sy-datum.
    task_data-creation_time = sy-uzeit.
    task_data-responsible = sy-uname.
  endmethod.

  method zif_task~get_description.

  endmethod.

  method zif_task~get_id.
    id = me->task_data-uuid.
  endmethod.

  method zif_task~get_responsible.
    responsible = me->task_data-responsible.
  endmethod.


  method create_new_task.
    task = new zcl_task( description = description ).
  endmethod.

  method zif_task~is_persistent.
    is_persistent = me->is_persistent.
  endmethod.

  method save.
    data task_data_persist type ztasks.
    move-corresponding me->task_data to task_data_persist.
    insert ztasks from @task_data_persist.
    me->is_persistent = 'X'.
  endmethod.

endclass.
