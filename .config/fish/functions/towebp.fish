function towebp --wraps='cwebp -q 80' --description 'alias towebp=cwebp -q 80'
  set rootname (echo $argv | sed 's/\.[^.]*$//')
  cwebp $argv -q 80 -o $rootname.webp
        
end
