function pyv --description 'Enable Python Venv or create a new one'
  # if an argument is provided then create a new venv
  set -l name $argv
  if test -z "$name"
    set name "dev"
  end

  if test -d ".venv"
    info "Python Virtual Env already exists"
    einfo "Enabling Python Virtual Env at .venv/"
    # echo "enabling python virtual env at .venv/"
    source .venv/bin/activate.fish
  else
    info "Python Virtual Env does not exist"
    echo "Creating Python Virtual Env for $name"
    python3 -m venv .venv --prompt $name
    echo "Enabling Python Virtual Env"
    source .venv/bin/activate.fish
  end
end
# function pyv --wraps='python3 -m venv .venv --prompt dev' --description 'alias pyv=python3 -m venv .venv --prompt dev'
#   # If .venv exists then source it
#   set name $argv
#   if test -z "$name"
#     set name "dev"
#   end
#
#   echo "Creating Python Virtual Env for $name"
#   python3 -m venv .venv --prompt $name
#   
#   set venv_path .venv/bin/activate.fish
#   echo "Enabling Virtual Env at $venv_path"
#   source $venv_path 
# end
