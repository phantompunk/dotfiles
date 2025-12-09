function fish_prompt --description 'Write out the prompt'
    # Set color for path prompt 
    if not set -q __fish_prompt_cwd
        set -g __fish_prompt_cwd (set_color blue)
    end

    # Set color for git info
    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color white)
    end

    # Set color for cursor
    if not set -q __fish_cursor_cwd
        set -g __fish_cursor_cwd (set_color green)
    end

    # Print current working directory
    echo -n -s "$__fish_prompt_cwd" (prompt_pwd)

    # Print git info
    echo -s "$__fish_prompt_normal" (__fish_git_prompt)

    # Print cursor
    echo -n -s "$__fish_cursor_cwd" '❯ '
end
