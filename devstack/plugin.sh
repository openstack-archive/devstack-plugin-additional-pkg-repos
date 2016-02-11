_LATEST_BASE=$(dirname "${BASH_SOURCE[0]}")



# Uses (apr) globals ``_LATEST_BASE``
function pre_install_apr {
    local codebases="${LATEST_CODEBASES}"
    local codebase

    # short circuit if nothing to do
    if [[ -z $codebases ]]; then
        return
    fi

    echo "Begin installing codebases"
    for codebase in ${codebases//,/ }; do
        echo "Installing $codebase"
        . $_LATEST_BASE/lib/$codebase
        pre_install_$codebase
    done
    echo "Done installing codebases"
}

function install_apr {
    # Install the service.
    :
}

function configure_apr {
    # Configure the service.
    :
}

function init_apr {
    # Initialize and start the service.
    :
}

# FIXME: Need to work on the cleanup side
function shutdown_apr {
    # Shut the service down.
    local codebases="${LATEST_CODEBASES}"
    local codebase

    # short circuit if nothing to do
    if [[ -z $codebases ]]; then
        return
    fi

    echo "Begin shutdown codebases"
    for codebase in ${codebases//,/ }; do
        echo "unstack $codebase"
        . $_LATEST_BASE/lib/$codebase
        shutdown_$codebase
    done
    echo "Done shutdown codebases"
}

function cleanup_apr {
    # Cleanup the service.
    :
}


if [[ "$1" == "stack" && "$2" == "pre-install" ]]; then
    # Set up system services
    echo_summary "Configuring system services apr"
    pre_install_apr

elif [[ "$1" == "stack" && "$2" == "install" ]]; then
    # Perform installation of service source
    echo_summary "Installing apr"

elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
    # Configure after the other layer 1 and 2 services have been configured
    echo_summary "Configuring apr"

elif [[ "$1" == "stack" && "$2" == "extra" ]]; then
    # Initialize and start the apr service
    echo_summary "Initializing apr"
fi

if [[ "$1" == "unstack" ]]; then
    # Shut down apr services
    echo_summary "Shutting down apr"
    shutdown_apr
fi

if [[ "$1" == "clean" ]]; then
    # Remove state and transient data
    # Remember clean.sh first calls unstack.sh
    # no-op
    :
fi
