#!/bin/bash
out=foc_auto_meta.ocmod.zip
if [[ -f "$out" ]]; then
  rm $out
fi
zip -r9 --exclude=*.git* --exclude=*.DS_Store* $out ./upload ./install.xml
