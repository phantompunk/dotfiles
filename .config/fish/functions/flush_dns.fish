function flush_dns --wraps='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder' --description 'alias flush_dns sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
  sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder $argv
        
end
