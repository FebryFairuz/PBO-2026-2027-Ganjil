#!/bin/bash
# Compile semua .java di sebuah folder sample ke class/<folder>, lalu jalankan Main.
# Pemakaian: ./run.sh sample-2   atau   ./run.sh sample-2/Main.java
set -e
cd "$(dirname "$0")"

target="${1%/}"
[ -f "$target" ] && target="$(dirname "$target")"
if [ -z "$target" ] || [ ! -d "$target" ]; then
    echo "Pemakaian: ./run.sh <folder-sample>"
    exit 1
fi

out="class/$target"
rm -rf "$out"
mkdir -p "$out"
javac -d "$out" "$target"/*.java
java -cp "$out" Main
