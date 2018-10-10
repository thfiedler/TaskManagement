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
     value(r_result) type ref to zif_task
   raising
     zcx_task_creation_error.
protected section.
private section.
  data uuid type ztasks-uuid.
  data description type char100.
  methods dummy.
endclass.



class zcl_task implementation.
  method zif_task~get_description.
    data desc type char100.
    if sy-mandt = 001.

    endif.
  endmethod.

  method zif_task~get_id.
    data(uuid) = me->uuid.
  endmethod.

  method zif_task~get_responsible.
     data resp type syst-uname.
     resp = sy-uname.
     move resp to me->description.
  endmethod.


  method create_new_task.
    data task type ztasks.
    data(uuid_generator)  = cl_uuid_factory=>create_system_uuid( ).
    try.
        task-uuid = uuid_generator->create_uuid_c32( ).
      catch cx_uuid_error.
        raise exception type zcx_task_creation_error.
    endtry.
    task-description = description.
    task-creation_date = sy-datum.
    task-creation_time = sy-uzeit.
    task-responsible = sy-uname.

    insert ztasks from @task.
  endmethod.

  METHOD dummy.
    data a type int4.
    data b type int4.
    macro1.
  ENDMETHOD.

endclass.
