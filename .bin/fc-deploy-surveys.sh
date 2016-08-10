#!/bin/bash

EID=$1

cd ~/Documents/surveys2

echo "DEPLOYING bstg-tools"
cd pkg-bstg-tools/
fp deploy $EID

echo "DEPLOYING filteringlib"
cd ../pkg-filteringlib
fp deploy $EID

echo "DEPLOYING lib-frontstage"
cd ../pkg-lib-frontstage
fp deploy $EID

echo "DEPLOYING native-frontloader"
cd ../pkg-native-frontloader
fp deploy $EID

echo "DEPLOYING webapp-skeleton"
cd ../pkg-webapp-skeleton
fp deploy $EID

echo "DEPLOYING fstg-forms"
cd ../pkg-fstg-forms
fp deploy $EID

echo "DEPLOYING frontstage-architect"
cd ../pkg-frontstage-architect
fp deploy $EID

echo "DEPLOYING feedback"
cd ../pkg-feedback
fp deploy $EID

echo "DEPLOYING questionnaire"
cd ../pkg-questionnaire
fp deploy $EID
