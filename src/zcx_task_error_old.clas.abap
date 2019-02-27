class ZCX_TASK_ERROR_OLD definition
  public
  inheriting from CX_STATIC_CHECK
  final
  create public .

public section.

  constants ZCX_TASK_ERROR_OLD type SOTR_CONC value 'FA163EEEDC501EE98EBFFD57F307CCD9' ##NO_TEXT.

  methods CONSTRUCTOR
    importing
      !TEXTID like TEXTID optional
      !PREVIOUS like PREVIOUS optional .
protected section.
private section.
ENDCLASS.



CLASS ZCX_TASK_ERROR_OLD IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
TEXTID = TEXTID
PREVIOUS = PREVIOUS
.
 IF textid IS INITIAL.
   me->textid = ZCX_TASK_ERROR_OLD .
 ENDIF.
  endmethod.
ENDCLASS.
