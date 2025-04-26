#!/sbin/sh

boot() {
  while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 5
  done
}

boot

swaps=$(cat /proc/swaps | tail -n +2 | awk '{print $1}')

[ -z "$swaps" ] && exit 0

for swap in $swaps; do
    swapoff $swap
    if [ $? -eq 0 ]; then
        echo "Swap disabled: $swap"
    else
        echo "Error: $swap"
    fi
done
