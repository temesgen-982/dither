if [ -z "$1" ]; then
    echo "usage: $0 input.png [output.png]" >&2
    exit 1
fi

convert "$1" -resize 800 -set option:distort:viewport '%wx%h+0+0' \
    -colorspace CMYK -separate null: \
    \( -size 2x2 xc: \( +clone -negate \) +append \( +clone -negate \) -append \) \
    -virtual-pixel tile -filter gaussian \
    \( +clone -distort SRT 1,0 \) +swap \
    \( +clone -distort SRT 1,15 \) +swap \
    \( +clone -distort SRT 1,45 \) +swap \
    \( +clone -distort SRT 1,75 \) +swap +delete \
    -compose Overlay -layers composite -colors 2 -set colorspace CMYK -combine \
    -colors 64 "${2:-${1%.*}-halftone.png}" >/dev/null
