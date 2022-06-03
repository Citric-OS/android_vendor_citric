function __print_atomx_functions_help() {
cat <<EOF
Additional AtomX functions:
- clomerge:        Utility to merge CLO tags.
- repopick:        Utility to fetch changes from Gerrit.
EOF
}

function clomerge()
{
    target_branch=$1
    set_stuff_for_environment
    T=$(gettop)
    python3 $T/vendor/atomx/build/tools/merge-clo.py $target_branch
}

function repopick()
{
    T=$(gettop)
    $T/vendor/atomx/build/tools/repopick.py $@
}

export SKIP_ABI_CHECKS="true"
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true
