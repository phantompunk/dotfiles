function compress_jpeg --wraps='jpegoptim -m80' --description 'compress JPEGs to 80% quality'
  jpegoptim -m80 $argv
end
