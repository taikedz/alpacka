function docpan {
    echo "m $1" | cpan
}

function register_exclusions {
    local exclusion
    for exclusion in $(echo "$1"|sed 's/,/ /g'); do
        EXCLUDED_MANAGERS="$EXCLUDED_MANAGERS $exclusion"
    done
}

function searchit {
    local SOURCE="$1" ; shift

    out:info "Searching $SOURCE"
    debug:print "$*"

    echo -e "\n${CBBLU}\t$SOURCE\n=============${CDEF}" >> "$SFILE"

    "$@" | grep -P "$FILTER" >> "$SFILE"

}

function doupdate {
    if [[ "$DOUPDATE" = yes ]]; then
        sudo $@
    fi
}

function findpkg {
    EXT="$1" ; shift
    locate "$ARG1" | egrep "^${HOME}/.+$EXT\$"
}

function findfile {
    SIGFILE="$1" ; shift
    locate "$ARG1" | egrep "^${HOME}/.+/$SIGFILE\$"
}

function is_not_excluded() {
    local exclusion
    # Deliberately not quoting, because variable cannot be an array
    for exclusion in $EXCLUDED_MANAGERS; do
        [[ "$1" != "$exclusion" ]] || return 1
    done
    return 0
}

function trypkg {
    local pkg
    bincheck:has "$@" || return 1

    for pkg in "$@"; do
        is_not_excluded "$pkg" || return 1
    done

    return 0
}

function searchweb {
    local site="$1"; shift
    local query="$1" ; shift
    local pattern="$1" ; shift
    elinks -dump 1 "https://encrypted.google.com/search?hl=en&q=site:$site+$query" | grep -P "https://$site/$pattern" -o|sort|uniq
}
