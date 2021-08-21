function __print_atomx_functions_help() {
cat <<EOF
Additional AtomX functions:
- clomerge:        Utility to merge CLO tags.
EOF
}

function clomerge()
{
    target_branch=$1
    set_stuff_for_environment
    T=$(gettop)
    python3 $T/vendor/atomx/build/tools/merge-clo.py $target_branch
}
