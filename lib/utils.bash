#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/diamond-language/diamond"

fail() {
    echo "asdf-diamond: $*" >&2
    exit 1
}

# Release tags are vX.Y.Z; versions are listed without the v, oldest first.
list_versions() {
    git ls-remote --tags --refs "$REPO_URL" 'v*' |
        sed -E 's#.*refs/tags/v##' |
        grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' |
        sort -t. -k1,1n -k2,2n -k3,3n
}

jobs() {
    getconf _NPROCESSORS_ONLN 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 2
}

# GNU make is `gmake` on FreeBSD and macOS with Homebrew's make.
make_cmd() {
    if command -v gmake >/dev/null 2>&1; then echo gmake; else echo make; fi
}
