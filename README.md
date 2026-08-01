# dither

Halftone dithering for images, using ImageMagick.

Requires ImageMagick (`convert`).

```sh
sudo apt install imagemagick
```

## Usage

```sh
./convert.sh input.png [output.png]
```

Output is optional and defaults to `input-halftone.png`.

## Tuning

- `-resize 800` — output size (and indirectly dot density)
- `SRT 2,0` etc. — `2` scales the dot grid up (bigger dots); use `SRT 1,...` for finer dots
- `-colors 2` (per-channel) and `-colors 64` (final) — control how posterized/blocky the result looks
- Drop the `-colorspace CMYK` steps to swap CMYK for RGB for a less "print-accurate" but still gridded look
