function brief --description 'Uses Gupi to render the weekly template'
  set -l next 
  set -l add 

  switch "$argv[1]"
  case -n --next --next-week
    set next "-n"
    set add "-v+1w"
  case -h --help
    printf 'Generate weekly template using Gupi 🐟.\n\n'
    printf 'Usage: brief [options]\n' 
    printf 'Flags:\n  -n, --next-week  Change date ahead 1 week\n'
    return 1
  end

  # Print the date with appropriate week information
  gupi new $next -t weekly -o ~/Notespace/ (date $add +"%Y-Week-%V.md")
end
