class zcx_task_creation_error definition
  public
  inheriting from cx_static_check
  final
  create public .

  public section.

    interfaces if_t100_message .

    methods constructor
      importing
        !textid   like if_t100_message=>t100key optional
        !previous like previous optional .
  protected section.
  private section.
endclass.



class zcx_task_creation_error implementation.


  method constructor ##ADT_SUPPRESS_GENERATION.
    call method super->constructor
      exporting
        previous = previous.
    clear me->textid.
    if textid is initial.
      if_t100_message~t100key = if_t100_message=>default_textid.
    else.
      if_t100_message~t100key = textid.
    endif.
  endmethod.
endclass.
