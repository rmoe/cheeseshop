#!/bin/bash

set -eux
set -o pipefail

dockerfile=$1
image_name=$2

images_dir=$(realpath $(dirname $0))
src_dir=$(realpath $images_dir/../..)

build_dir=$(mktemp -d)
trap "rm -rf $build_dir" EXIT

cp -rp $src_dir $build_dir/cheeseshop
cp $dockerfile $build_dir/cheeseshop/Dockerfile

sudo docker build $build_dir/cheeseshop -t $image_name
