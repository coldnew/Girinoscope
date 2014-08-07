#!/bin/sh
 
APPDIR="$(dirname -- "$(readlink -f -- "${0}")" )"

cd "$APPDIR"
 
for LIB in \
    java/lib/rt.jar \
    java/lib/tools.jar \
    lib/*.jar \
    ;
do
    CLASSPATH="${CLASSPATH}:${LIB}"
done
export CLASSPATH

LD_LIBRARY_PATH=`pwd`/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export LD_LIBRARY_PATH

export PATH="${APPDIR}/java/bin:${PATH}"

java -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel org.hihan.girinoscope.ui.UI "$@"
