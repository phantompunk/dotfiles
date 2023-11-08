function pyv --wraps='python3 -m venv .venv --prompt dev' --description 'alias pyv=python3 -m venv .venv --prompt dev'
  set name $argv
  if test -z "$name"
    set name "dev"
  end

  echo "Creating Python Virtual Env for $name"
  python3 -m venv .venv --prompt $name
  
  set venv_path .venv/bin/activate.fish
  echo "Enabling Virtual Env at $venv_path"
  source $venv_path 
end
