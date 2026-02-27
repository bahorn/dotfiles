function fish_prompt
    if not set -q ZSH_THEME_CLOUD_PREFIX
        set -g ZSH_THEME_CLOUD_PREFIX (hostname | cut -c1)
    end

    set -l git_info ""
    if set -l branch (git symbolic-ref --short HEAD 2>/dev/null)
        if test (git status --porcelain 2>/dev/null | count) -gt 0
            set git_info " "(set_color green)"["(set_color cyan)"$branch"(set_color green)"] "(set_color yellow)"δ"
        else
            set git_info " "(set_color green)"["(set_color cyan)"$branch"(set_color green)"]"
        end
    end

    set_color --bold cyan
    echo -n "$ZSH_THEME_CLOUD_PREFIX "
    set_color --bold green
    set -l dir (string replace $HOME "~" (pwd))
    set -l parts (string split "/" $dir)
    if test (count $parts) -gt 2
        set dir (string join "/" $parts[-2] $parts[-1])
    end
    echo -n $dir
    echo -n $git_info
    set_color --bold blue
    echo -n " "
    set_color normal
    echo -n "» "
end
