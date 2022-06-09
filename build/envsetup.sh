function __print_atomx_functions_help() {
cat <<EOF
Additional AtomX functions:
- clomerge:        Utility to merge CLO tags.
- repopick:        Utility to fetch changes from Gerrit.
- sort-blobs-list: Sort proprietary-files.txt sections with LC_ALL=C.
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

function sort-blobs-list() {
    T=$(gettop)
    $T/tools/extract-utils/sort-blobs-list.py $@
}

export SKIP_ABI_CHECKS="true"
