#!/sbin/sh

ui_print "Installing module Swap-Disabler..."

cp -f $MODPATH/common/service.sh $MODPATH/service.sh

set_perm 0 0 0755 $MODPATH/service.sh

ui_print "Installation completed."
