# Alias for converting JSON to YAML using yq
function toyaml --wraps='yq eval -P' --description 'convert JSON to YAML using yq'
  yq eval -P $argv
end
