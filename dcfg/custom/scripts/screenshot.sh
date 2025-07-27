#TODO: ADD A NFS HVM MOUNTED IN EVERY TEMPLATE FOR SCREENSHOT SHARING AND QVM-MOVE TO IT
FILE=~/Pictures/Screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png; maim --select "$FILE" && xclip -selection clipboard -t image/png -i "$FILE"
