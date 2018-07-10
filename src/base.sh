### %PM%-specific options Usage:help-%PM%
#
# Document special options for %PM%
#
###/doc

%PM%:assume() {
    if [[ "$PAF_assume" = yes ]]; then
        echo "-y"
    fi
}

%PM%:update() {
    paf:sudo %PM% update
}

%PM%:clean() {
    paf:sudo %PM% $(%PM%:assume) clean
}

%PM%:install() {
    paf:sudo %PM% install $(%PM%:assume) "${PAF_packages[@]:-}"
}

%PM%:remove() {
    paf:sudo %PM% remove $(%PM%:assume) "${PAF_packages[@]:-}"
}

%PM%:list() {
    %PM% list | less || return 0
}

%PM%:show() {
    local package

    for package in "${PAF_packages[@]:-}"; do
        %PM% show "$package" | less
    done
}

%PM%:upgrade() {
    paf:sudo %PM% $(%PM%:assume) upgrade
}

%PM%:search() {
    %PM% search "${PAF_packages[@]:-}" | less
}
