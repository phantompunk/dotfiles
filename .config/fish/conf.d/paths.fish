# Prepend to PATH (higher priority)
fish_add_path --prepend /Users/rigo/go/bin 
fish_add_path --prepend /Users/rigo/.cargo/bin
fish_add_path --prepend /opt/homebrew/bin
fish_add_path --prepend /opt/homebrew/sbin

# Append to PATH (lower priority)
fish_add_path --append /Users/rigo/.local/bin
fish_add_path --append /opt/homebrew/opt/postgresql@15/bin
fish_add_path --append /Users/rigo/.pyenv/bin
