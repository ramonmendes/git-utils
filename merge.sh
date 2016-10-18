#!/bin/bash

##Create a new branch, with parameter
createbranch(){
    local git_branch_cmd="git branch $1"
    echo $git_branch_cmd
}


integration(){
    createbranch "release-"${DEFAULT_TIMESTAMP}
}

main(){
    local parameters="imth"
    local itens=""
    export DEFAULT_TIMESTAMP=$(date +'%Y%m%d%H%M%S')

    if ( ! getopts "${parameters}" opt); then
      usage
    fi

    while getopts "${parameters}" opt; do
        case $opt in
            i)
                itens=${itens}${opt}
                echo "Integration"
            ;;
            m)
                itens=${itens}${opt}
                echo "Merge"
            ;;
            h)
                usage
            ;;
            \?)
                echo "help"
                usage
            ;;
            :)
                echo "default"
                usage ""
            ;;
        esac
    done

    if [[ $itens == *"i"* ]]
    then
        integration
    fi
}

usage(){
    echo "How to."
}

main "$@"
