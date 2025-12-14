function compress_png --wraps='optipng -o7' --description 'compresses PNGs with max optimization'
  optipng -o7 $argv
end
