#!/usr/bin/env bash

set -e
set -x

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd "$SCRIPT_DIR"

# build token metadata
cd ../../token-metadata/program
cargo build-bpf

# build private metadata
cd ../../private-metadata/program
cargo build-bpf

FIXTURES_DIR="tests/fixtures"

rm -r "$FIXTURES_DIR"
mkdir "$FIXTURES_DIR"

cp ../../target/deploy/mpl_token_metadata.so "$FIXTURES_DIR"
cp ../../target/deploy/private_metadata.so "$FIXTURES_DIR"
