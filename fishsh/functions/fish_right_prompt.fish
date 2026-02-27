function fish_right_prompt
    set -l last_status $status
    set_color --bold brblack
    echo -n "[ "
    if test $last_status -ne 0
        echo -n "$last_status | "
    end
    echo -n (date +%H:%M)
    echo -n " ]"
    set_color normal
end
