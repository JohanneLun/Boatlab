# Boatlab
Båtlab i TTK4115 Linsys

Crop Simulink models (.sh file):
  #!/bin/bash
  for FILE in ./*.pdf; do
    pdfcrop "${FILE}" "${FILE}"
  done
