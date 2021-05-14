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

export SKIP_ABI_CHECKS="true"
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

# Enable ThinLTO Source wide.
echo "Building with ThinLTO."
export GLOBAL_THINLTO=true
export USE_THINLTO_CACHE=true
