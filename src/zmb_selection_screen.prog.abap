*&---------------------------------------------------------------------*
*& Report ZMB_SELECTION_SCREEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_selection_screen.


TABLES: mara  .

DATA: wa_mara TYPE mara .

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-t01.
  PARAMETERS:  p_matnr TYPE matnr OBLIGATORY.
   SELECTION-SCREEN BEGIN OF LINE .
        PARAMETERS: r1 RADIOBUTTON GROUP rg1 .
        SELECTION-SCREEN comment 3(12) text-r01 .
        PARAMETERS: r2 RADIOBUTTON GROUP rg1 .
        SELECTION-SCREEN comment 18(12) text-r02 .
    SELECTION-SCREEN END OF LINE .

  SELECT-OPTIONS: s_matnr FOR mara-matnr OBLIGATORY.



SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-t02.
  PARAMETERS : c11 AS CHECKBOX,
               c12 AS CHECKBOX.
SELECTION-SCREEN END OF BLOCK b2.

WRITE: 'select base on parameter option '.
SELECT * FROM mara INTO wa_mara WHERE matnr = p_matnr .
  WRITE:/ wa_mara-matnr , wa_mara-mtart .
ENDSELECT .
SKIP 5 .
WRITE: 'select base on select  option '.
SELECT * FROM mara INTO wa_mara WHERE matnr IN  s_matnr .
  WRITE:/ wa_mara-matnr , wa_mara-mtart .
ENDSELECT .
