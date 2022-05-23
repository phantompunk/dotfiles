function fish_prompt --description 'Write out the prompt'

	if not set -q __fish_prompt_cwd
        set -g __fish_prompt_cwd (set_color blue)
    end

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color magenta)
    end

	if not set -q __fish_cursor_cwd
        set -g __fish_cursor_cwd (set_color green)
    end

    echo -n -s "$__fish_prompt_cwd" (prompt_pwd)

    echo -s "$__fish_prompt_normal" (__fish_git_prompt)

    echo -n -s "$__fish_cursor_cwd" '❯ '
end