#!/bin/bash
set -e

cd `dirname $0`

PACKER_CACHE_DIR="../../packer/.packer_cache" packer build template.json
