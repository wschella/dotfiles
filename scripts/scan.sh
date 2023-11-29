set -e
set -u
set -o pipefail
set -x

INPUT="$1"
OUTPUT="$2"
convert -density 150 $INPUT -rotate "$([ $((RANDOM % 2)) -eq 1 ] && echo -)0.$(($RANDOM % 4 + 5))" -attenuate 0.4 +noise Multiplicative -attenuate 0.03 +noise Multiplicative -sharpen 0x1.0 -colorspace Gray $OUTPUT