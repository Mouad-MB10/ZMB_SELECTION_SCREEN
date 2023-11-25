*&---------------------------------------------------------------------*
*& Report ZMB_SELECTION_SCREEN_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMB_SELECTION_SCREEN_2.

DATA: wa_mara type mara .
PARAMETERS: p_mtart type mtart .
PARAMETERS: r1 RADIOBUTTON GROUP rr1 , r2 RADIOBUTTON GROUP rr1 .
PARAMETERS: c1 as CHECKBOX , c2 as CHECKBOX.



AT SELECTION-SCREEN OUTPUT .
LOOP AT SCREEN .
IF screen-name = 'R1' or screen-name = 'C2'.
  screen-input = 0 .
ENDIF .
MODIFY SCREEN .
ENDLOOP .
IF p_mtart IS INITIAL .
    p_mtart = 'FERT'.
ENDIF .

* select * from mara into wa_mara where mtart = p_mtart.
*
*  write:/ wa_mara-mtart , wa_mara-matnr .
*ENDSELECT .
