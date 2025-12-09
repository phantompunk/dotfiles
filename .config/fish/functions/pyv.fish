function pyv --description 'Enable Python Venv or create a new one'
  # if an argument is provided then create a new venv
  set -l name $argv
  if test -z "$name"
    set name "dev"
  end

  if test -d ".venv"
    echo "Python Virtual Env already exists"
    echo "Enabling Python Virtual Env at .venv/"
    source .venv/bin/activate.fish
  else
    echo "Python Virtual Env does not exist"
    echo "Creating Python Virtual Env for $name"
    python3 -m venv .venv --prompt $name
    echo "Enabling Python Virtual Env"
    source .venv/bin/activate.fish
  end
end
