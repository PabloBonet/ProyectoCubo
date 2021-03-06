LPARAMETERS tcReport, tcAlias
LOCAL lcAlias, lcFile, lcSelect, lcReport

MESSAGEBOX(tcReport)

*** Parameter Checking
IF VARTYPE(tcReport) != 'C' OR EMPTY(tcReport)
   MESSAGEBOX("ERROR: Invalid Report File", 16, "Error")
   RETURN .F.
ENDIF

lcReport = tcReport
IF UPPER(RIGHT(lcReport, 4)) != ".RPT"
   lcReport = lcReport + ".RPT"
ENDIF

IF !FILE(lcReport)
   MESSAGEBOX("ERROR: Cannot Find Report File", 16, "Error")
   RETURN .F.
ENDIF

IF VARTYPE(tcAlias) == 'C' AND SELECT(tcAlias) != 0
   lcAlias = tcAlias
ELSE
   IF EMPTY(ALIAS())
      MESSAGEBOX("ERROR: No Table Selected", 16, "Error")
      RETURN .F.
   ENDIF
   lcAlias = ALIAS()
ENDIF

MESSAGEBOX(lcReport)
*** Create a file name for the tempoary table
lcFile = ""
DO WHILE EMPTY(lcFile) OR FILE(lcFile)
   lcFile = SYS(2023) + "\" + SYS(3) + ".DBF"
ENDDO

*** Switch to the alias for the export
lcSelect = SELECT()
SELECT(lcAlias)

*** Export the data to the fox2 table
COPY TO (lcFile) FOX2X
MESSAGEBOX(lcFile)
*** Load the prievew class
loPreview = NEWOBJECT("olecrviewer", "crystalreports")
MESSAGEBOX(lcFile)
IF loPreview.LoadReport(lcReport, lcFile)
MESSAGEBOX('HOLA')
   loPreview.Show()
ENDIF

*** Delete the tempoary file
DELETE FILE (lcFile)

*** Switch back to the origional work area
SELECT(lcSelect)

* END PROGRAM CrystalReports.prg