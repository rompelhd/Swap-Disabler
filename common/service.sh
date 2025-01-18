#!/sbin/sh

boot() {
  while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 5
  done
}

boot

swaps=$(cat /proc/swaps | tail -n +2 | awk '{print $1}')

if [ -z "$swaps" ]; then
  exit 0
fi

for swap in $swaps; do
    swapoff $swap
    if [ $? -eq 0 ]; then
        echo "Swap disabled: $swap"
    else
        echo "Error: $swap"
    fi
done
