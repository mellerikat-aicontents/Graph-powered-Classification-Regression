#!/bin/bash

## download alo 
echo "***** Download ALO !! *****"
git clone http://mod.lge.com/hub/dxadvtech/aicontents-framework/alo.git -b release-1.1

echo ""
echo "***** Copy experimental_plan.yaml to ALO !! *****"
mv ./experimental_plan.yaml ./alo/config -f


