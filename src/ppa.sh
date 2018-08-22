ppa:assume() {
    if [[ "$PAF_assume" = yes ]]; then
        echo "-y"
    fi
}

ppa:add() {
    bincheck:has add-apt-repository ||
        out:fail "PPAs are not supported on this system. Install 'add-apt-repository'"

    paf:sudo add-apt-repository $(ppa:assume) "$1"
}
