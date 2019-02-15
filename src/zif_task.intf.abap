interface zif_task
  public .
  methods get_id
    returning
      value(id) type ztask_struc-uuid.
  methods get_description.
  methods get_responsible
    returning
      value(responsible) type ztask_struc-responsible.
  methods is_persistent returning value(is_persistent) type boole_d.


endinterface.
