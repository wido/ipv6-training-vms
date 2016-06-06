#!/bin/bash
set -e

cd `dirname $0`

mv */packer_output/*.ovf .
mv */packer_output/*.vmdk .

tar vcf ipv6-training-vms.tar *.ovf *.vmdk
