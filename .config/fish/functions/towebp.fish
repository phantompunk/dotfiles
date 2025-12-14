function towebp --wraps='cwebp -q 80' --description 'convert images to WebP with 80% quality'
  set rootname (echo $argv | sed 's/\.[^.]*$//')
  cwebp $argv -q 80 -o $rootname.webp
end
