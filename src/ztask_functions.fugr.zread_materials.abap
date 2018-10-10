FUNCTION ZREAD_MATERIALS.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(P_MATNR) TYPE  MATNR
*"----------------------------------------------------------------------
data matnr type char18.
data it_mara type standard table of mara with default key.
select * from mara into table it_mara where matnr = p_matnr.





ENDFUNCTION.
