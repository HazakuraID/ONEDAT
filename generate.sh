#!/usr/bin/env bash
set -euo pipefail

echo "::group::Init"

log () {
    echo `date +"%m/%d/%Y %H:%M:%S"` "$@"
}

cleanup() {
    rm -f filtrite >> /dev/null 2>&1
}

cleanup

sudo apt-get install -y unzip wget || true

echo "::endgroup::"

echo "::group::Build executable"
log "Building"
go build -v -o filtrite
echo "::endgroup::"

echo "::group::Downloading latest ruleset_converter build"

install_bromite_ruleset_converter() {
    log "Downloading from latest Bromite release"
    rm -rf deps || true
    mkdir -p deps
    wget -O "deps/ruleset_converter" "https://github.com/bromite/bromite/releases/latest/download/ruleset_converter"
}

install_selfbuilt_ruleset_converter() {
    log "Downloading from latest self-built release"
    rm -rf deps || true
    mkdir -p deps

    wget -O "subresource_filter_tools_linux.zip" "https://github.com/xarantolus/subresource_filter_tools/releases/latest/download/subresource_filter_tools_linux-x64.zip"

    unzip -ou "subresource_filter_tools_linux.zip" -d deps

    rm "subresource_filter_tools_linux.zip"
}

install_bromite_ruleset_converter || install_selfbuilt_ruleset_converter

echo "::endgroup::"


echo "::group::Other setup steps"
chmod +x filtrite
chmod +x deps/ruleset_converter
mkdir -p dist
mkdir -p logs
echo "::endgroup::"

if [[ -f "lists/bromite-default.txt" ]]; then
    echo "::group::Downloading official list"
    wget -O "lists/bromite-default.txt" "https://raw.githubusercontent.com/HazakuraID/filters/main/uBoPlusCustom.txt"
    echo "::endgroup::"
fi

./filtrite

echo "::group::Cleanup"
cleanup

if [[ -f "lists/bromite-default.txt" ]]; then
    git restore lists/bromite-default.txt
fi

echo "::endgroup::"
