#!/bin/bash

#%include argstore bashout

allargs="$(args_store "$@")"

function get_main_action {
	ALPACTION="$(args_get "$allargs" "(-l|--list|-s|--show|-i|--install|-g|--upgrade)"|echo search)"
	ALPACTION="$(args_getlast "$ALPACTION")"

	if [[ "$ALPACTION" != "search" ]]; then
		debuge "Determine action from $ALPACTION"
		case "$action" in
			-l|--list)
				ALPACTION=list
				;;
			-s|--show)
				ALPACTION=show
				;;
			-i|--install)
				ALPACTION=install
				;;
			-g|--upgrade)
				ALPACTION=upgrade
				;;
		esac
	fi

	debuge "Action is $ALPACTION"
}

function get_options_list {
	ALPOPTIONS=":"

	for option in "$@"
	do
		if [[ "$option" =~ $(echo "^-u|--update|-c|--clean|-O|--stdout$") ]]; then
			debuge "Processing option candidate $option"
			case "$option" in
				-u|--update)
					ALPOPTIONS="${ALPOPTIONS}update:"
					;;
				-c|--clean)
					ALPOPTIONS="${ALPOPTIONS}clean:"
					;;
				-O|--stdout)
					ALPOPTIONS="${ALPOPTIONS}stdout:"
					;;
			esac
		fi
	done

	#echo "$ALPOPTIONS"
}

function has_option {
	if [[ ":$ALPOPTIONS:" =~ "$1" ]]; then
		debuge "$1 in $ALPOPTIONS"
		return 0
	fi
	debuge "$1 not in $ALPOPTIONS"
	return 1
}

function get_all_terms { # FIXME defining all terms as an array might be hard - damn bash
	declare -a ALPTERMS
	debuge processing "$*" into "$ALPTERMS"

	for term in "$@"
	do
		if [[ "$term" =~ $(echo "^-") ]]; then
			debuge "Discard $term"
			continue
		fi

		ALPTERMS="$ALPTERMS $term"
	done

	echo "$ALPTERMS"
}
