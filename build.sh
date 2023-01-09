#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./script.sh arg-one arg-two

This is an awesome bash script to make your life better.

'
    exit
fi

cd "$(dirname "$0")"

main() {
    wget https://riscv.mirror.pkgbuild.com/images/archriscv-20220727.tar.zst
    unzstd archriscv-20220727.tar.zst
    gzip -c archriscv-20220727.tar > rootfs.tar.gz
    docker build -t lightning1141/archriscv .
}

main "$@"
