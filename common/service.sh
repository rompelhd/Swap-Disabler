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
    swapoff "$swap" && echo "Swap disabled: $swap" || echo "Error: $swap"
done
