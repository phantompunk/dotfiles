function toyaml --wraps='yq eval -P' --description 'alias toyaml=yq eval -P'
  yq eval -P $argv
        
end
