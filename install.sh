#!/bin/bash

## download alo 
echo "***** Download ALO !! *****"
git clone -b release-2.1 http://mod.lge.com/hub/dxadvtech/aicontents-framework/alo.git

echo ""
echo "***** Copy experimental_plan.yaml to ALO !! *****"
mv ./experimental_plan.yaml ./alo/config -f

