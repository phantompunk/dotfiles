function compress_jpeg --wraps='jpegoptim -m80' --description 'alias compress_jpeg=jpegoptim -m80'
  jpegoptim -m80 $argv
end
