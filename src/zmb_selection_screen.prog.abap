*&---------------------------------------------------------------------*
*& Report ZMB_SELECTION_SCREEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_selection_screen.


TABLES: mara  .

DATA: wa_mara TYPE mara .



SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-t01.
  PARAMETERS:  p_matnr TYPE matnr OBLIGATORY.
  SELECTION-SCREEN BEGIN OF LINE .
    PARAMETERS: r1 RADIOBUTTON GROUP rg1 .
    SELECTION-SCREEN COMMENT 3(12) TEXT-r01 .
    PARAMETERS: r2 RADIOBUTTON GROUP rg1 .
    SELECTION-SCREEN COMMENT 18(12) TEXT-r02 .
  SELECTION-SCREEN END OF LINE .

  SELECT-OPTIONS: s_matnr FOR mara-matnr OBLIGATORY.



SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-t02.
  PARAMETERS : c11 AS CHECKBOX,
               c12 AS CHECKBOX.
SELECTION-SCREEN END OF BLOCK b2.

*DYNAMIC SCREEN

SELECTION-SCREEN BEGIN OF SCREEN 123.
  SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-t03.
    PARAMETERS : c1 AS CHECKBOX, c2 AS CHECKBOX.

  SELECTION-SCREEN END OF BLOCK b3.
SELECTION-SCREEN END OF SCREEN 123 .
*call the dynamic screen

IF r1 = 'X' .
  CALL SELECTION-SCREEN 123 STARTING AT 5 10 ENDING AT 20 30 . "use the screen as pop up
ENDIF .



*PBO => PROCESS BEFOR OUTPUT  - AT SELECTION-SCREEN OUTPUT .
*PAI => PROCESS AFTER INPUT  - AT SELECTION-SCREEN .



  WRITE: 'select base on parameter option '.
  SELECT * FROM mara INTO wa_mara WHERE matnr = p_matnr .
    WRITE:/ wa_mara-matnr , wa_mara-mtart .
  ENDSELECT .
  SKIP 5 .
  WRITE: 'select base on select  option '.
  SELECT * FROM mara INTO wa_mara WHERE matnr IN  s_matnr .
    WRITE:/ wa_mara-matnr , wa_mara-mtart .
  ENDSELECT .
AT SELECTION-SCREEN OUTPUT .
  c11 = 'X' . c12 = 'X' .
