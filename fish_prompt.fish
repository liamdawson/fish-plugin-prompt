function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    echo

    # User
    set_color $fish_color_user
    echo -n (whoami)
    set_color normal

    echo -n '@'

    # Host
    set_color $fish_color_host
    echo -n (prompt_hostname)
    set_color normal

    echo -n ':'

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    if not test $last_status -eq 0
        set_color $fish_color_error
        echo -n " [$last_status]"
        set_color normal
    end

    echo

    if [ (id -u) -eq 0 ]
        echo -n '%> '
    else
        echo -n '$> '
    end
end
