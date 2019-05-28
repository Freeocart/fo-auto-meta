#!/bin/bash
out=foc_auto_meta30.ocmod.zip
out2=foc_auto_meta23.ocmod.zip
if [[ -f "$out" ]]; then
  rm $out
fi
if [[ -f "$out2" ]]; then
  rm $out2
fi

zip -r9 --exclude=*.git* --exclude=*.DS_Store* --exclude=*.tpl $out ./upload ./install.xml
zip -r9 --exclude=*.git* --exclude=*.DS_Store* --exclude=*.twig $out2 ./upload ./install.xml
