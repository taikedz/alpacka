### Warning messages Usage:help
#
# You can set a warning message with the -w flag to display a warning before carrying out any one action.
#
# This allows you to set a warning, with an opportunity to abort, before any defined action.
#
#   paf -w ACTION
#   sudo paf -w ACTION MESSAGE
# 
# The available actions are:
#
# install, clean, upgrade, update, list, show, search
#
# If MESSAGE is '.', then the message is cleared and will no longer show on actions.
#
# If no MESSAGE is provided, or it is an empty string, the current message is displayed.
#
# By default, warning waits 5 seconds before proceeding. Set "PAF_warning_sleep" to an int via environment variable, or "warning_sleep" in /etc/alpacka/config.ini
#
###/doc

#%include std/isroot.sh

PAF_warningdir="$PAF_configdir/warnings"

paf:warn() {
    local err=0
    [[ "$sleepsec" =~ ^[0-9]+$ ]] || out:fail "Warning sleep duration is not an int: $sleepsec"

    if paf:warn:display "${1:-}"; then
        paf:warn:grace-wait || out:fail "Error while waiting to continue ..."
    fi
}

paf:warn:grace-wait() {
    local sleepsec="${PAF_warning_sleep:-5}"

    out:info "Press Ctrl+C within $sleepsec seconds to abort, or Enter to continue ..."

    read -t $sleepsec || err="$?"
    if [[ -z "${err:-}" ]] || [[ "$err" -ge 128 ]]; then
        return 0
    fi
}

paf:warn:check-name() {
    [[ -n "${1:-}" ]] || {
        out:warn "(No warning section specified ... sleeping 5sec, press Ctrl+C to abort)"
        sleep 5
    }

    [[ "$1" =~ ^[a-z]+$ ]] || out:fail "invalid warning type '$1'"
}

paf:warn:is-set() {
    [[ -f "$1" ]] &&
        [[ $(grep -Ec ^ "$1") -gt 0 ]]
}

paf:warn:display() {
    paf:warn:check-name "${1:-}"

    local warnfile
    warnfile="$PAF_warningdir/${1}.txt"

    paf:warn:is-set "$warnfile" || return 0 # not an error - if not set, ignore step

    echo -n "$CBYEL" >&2
    cat "$warnfile"
    echo
    echo -n "$CDEF" >&2

    PAF_warned=true

    return 0
}

paf:warn:get-warning-args() {
    args:after -w "$@"

    [[ -n "${RETARR_ARGSAFTER[*]:-}" ]] || out:fail "No warning parameters ..."

    PAF_warntype=("${RETARR_ARGSAFTER[0]}")

    PAF_warnmessage=("${RETARR_ARGSAFTER[@]:1}")
    PAF_warnmessage="${PAF_warnmessage[*]:-}"
}

paf:warn:write() {
    isroot:require "You must be root to set warnings."

    mkdir -p "$PAF_warningdir"


    if [[ "$PAF_warnmessage" = "." ]]; then
        echo -n > "$PAF_warnpath"
    else
        echo -n "<$PAF_warntype>: ${PAF_warnmessage}" > "$PAF_warnpath"
    fi

    out:info "Warning written to $PAF_warnpath"
}

paf:warn:warn-set() {
    paf:warn:get-warning-args "$@"

    paf:warn:check-name "$PAF_warntype"

    PAF_warnpath="$PAF_warningdir/${PAF_warntype}.txt"

    if [[ -n "$PAF_warnmessage" ]]; then
        paf:warn:write
    
    else
        paf:warn:is-set "$PAF_warnpath" || out:fail "No warning set for '$PAF_warntype'"

        out:info "Contents of '$PAF_warnpath'"
        paf:warn:display "$PAF_warntype"
    fi
    exit
}
