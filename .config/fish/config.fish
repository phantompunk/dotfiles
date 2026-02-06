if status is-interactive
    # Commands to run in interactive sessions can go here

    # Added for `pyenv`
    if command -q pyenv
        pyenv init - | source
    end

    # Added for 'zoxide'
    if command -q pyenv
        zoxide init fish | source
    end
end


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
