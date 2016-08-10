#!/bin/bash

FILE="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

DIR=$1
if [ -z $DIR ]; then
    echo "Usage: EID=eid-of-your-event DS=https://ds.4pax.com/  $FILE directory-name"
    exit 1
fi

echo "Installing New Surveys in directory $DIR and pushing to event: $EID on ds: $DS"

mkdir $DIR
cd $DIR

PKG="pkg-lib-frontstage"
VERSION="beta"
echo "################## INSTALLING $PKG@$VERSION"
git clone https://github.com/Spotme/$PKG.git
cd $PKG
git checkout $VERSION
git pull
npm install
npm run build
fp deploy $EID --ds $DS
cd ..
echo "$PKG@$VERSION installation COMPLETED"

PKG="pkg-local-notifications"
VERSION="feature/questionnaire"
git clone https://github.com/Spotme/$PKG.git
cd $PKG
git checkout $VERSION
git pull
fp deploy $EID --ds $DS
cd ..
echo "$PKG@$VERSION installation COMPLETED"

PKG="pkg-bstg-tools"
VERSION="beta"
echo "################## INSTALLING $PKG@$VERSION..."
git clone git@github.com:Spotme/$PKG.git
cd $PKG
git checkout $VERSION
git pull
fp deploy $EID --ds $DS
cd ..
echo "$PKG@$VERSION installation COMPLETED"

PKG="pkg-fstg-forms"
VERSION="beta"
echo "################## INSTALLING $PKG@$VERSION..."
git clone https://github.com/Spotme/$PKG.git
cd $PKG
git checkout $VERSION
git pull
fp deploy $EID --ds $DS
cd ..
echo "$PKG@$VERSION installation COMPLETED"

PKG="pkg-modal-help"
VERSION="beta"
echo "################## INSTALLING $PKG@$VERSION..."
git clone https://github.com/Spotme/$PKG.git
cd $PKG
git checkout $VERSION
git pull
fp deploy $EID --ds $DS
cd ..
echo "$PKG@$VERSION installation COMPLETED"

PKG="pkg-frontstage-architect"
VERSION="beta"
echo "################## INSTALLING $PKG@$VERSION..."
git clone https://github.com/Spotme/$PKG.git
cd $PKG
git checkout $VERSION
git pull
fp deploy $EID --ds $DS
cd ..
echo "$PKG@$VERSION installation COMPLETED"

PKG="pkg-frontstage-architect-pages"
VERSION="beta"
echo "################## INSTALLING $PKG@$VERSION..."
git clone https://github.com/Spotme/$PKG.git
cd $PKG
git checkout $VERSION
git pull
fp deploy $EID --ds $DS
cd ..
echo "$PKG@$VERSION installation COMPLETED"

PKG="pkg-feedback"
VERSION="beta"
echo "################## INSTALLING $PKG@$VERSION..."
git clone git@github.com:Spotme/$PKG.git
cd $PKG
git checkout $VERSION
git pull
fp deploy $EID --ds $DS
cd ..
echo "$PKG@$VERSION installation COMPLETED"

PKG="pkg-questionnaire"
VERSION="beta"
echo "################## INSTALLING $PKG@$VERSION..."
git clone https://github.com/Spotme/$PKG.git
cd $PKG
git checkout $VERSION
git pull
fp deploy $EID --ds $DS
cd ..
echo "$PKG@$VERSION installation COMPLETED"
