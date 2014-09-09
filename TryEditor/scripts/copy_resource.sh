#!/bin/sh
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

FRAMEWORK_DIR="${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
PLUGINS_DIR="${TARGET_BUILD_DIR}/${PLUGINS_FOLDER_PATH}"
XPCS_DIR="${TARGET_BUILD_DIR}/${CONTENTS_FOLDER_PATH}/XPCServices"


REF_FRAMEWORKS_DIR="${SRCROOT}/ref_loading_depend_for_copy/frameworks/"
REF_DYLIBS_DIR="${SRCROOT}/ref_loading_depend_for_copy/dylibs/"
REF_PLUGIN_DIR="${SRCROOT}/ref_loading_depend_for_copy/plugins/"
REF_XPC_DIR="${SRCROOT}/ref_loading_depend_for_copy/xpcs/"


##Step1
###############################################################################################
if [ -d "${REF_FRAMEWORKS_DIR}" ]; then
## check have framework?
FRAMEWORKS=`find "${REF_FRAMEWORKS_DIR}" -type d -name "*.framework" | sed -e "s/\(.*\)/\1\/Versions\/A\//"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

## check have dylibs
FRAMEWORK_DYLIBS=`find "${REF_FRAMEWORKS_DIR}" -type f -name "*.dylib"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

## have frameworks or dylbs
COUNT_FRAMEWORKS=0;
COUNT_FRAMEWORK_DYLIBS=0;

for i in $FRAMEWORKS;
do
COUNT_FRAMEWORKS=$(($COUNT_FRAMEWORKS+1));
done

for i in $FRAMEWORK_DYLIBS;
do
COUNT_FRAMEWORK_DYLIBS=$(($COUNT_FRAMEWORK_DYLIBS+1));
done

if [ "${COUNT_FRAMEWORKS}" -gt 0 -o "${COUNT_FRAMEWORK_DYLIBS}" -gt 0 ] ; then
echo "Step1: copy frameworks"
`cp -R -fi  "${REF_FRAMEWORKS_DIR}" "${FRAMEWORK_DIR}"`
`find "${FRAMEWORK_DIR}" -name "README.txt" -type f | xargs -n 1 rm -f`
echo "Step1 over"
fi
fi

##Step2
###############################################################################################
if [ -d "${REF_DYLIBS_DIR}" ]; then
## check have dylibs?
RESOURCE_DYLIBS=`find "${REF_DYLIBS_DIR}" -type f \\( -name "*.dylib" \\)`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

## have dylibs

COUNT_RESOURCE_DYLIBS=0;
for i in $RESOURCE_DYLIBS;
do
COUNT_RESOURCE_DYLIBS=$(($COUNT_RESOURCE_DYLIBS+1));
done

echo "resource dylibs count = ${COUNT_RESOURCE_DYLIBS}"
if [ "${COUNT_RESOURCE_DYLIBS}" -gt 0 ]; then
echo "Step2:Copy dylibs"
`cp -R -fi "${REF_DYLIBS_DIR}" "${FRAMEWORK_DIR}" `
`find "${FRAMEWORK_DIR}" -name "README.txt" -type f | xargs -n 1 rm -f`
echo "Step2 Over"
fi

fi


##Step3
###############################################################################################
if [ -d "${REF_PLUGIN_DIR}" ]; then
## check have bundle?
PLUGINS=`find "${REF_PLUGIN_DIR}" -type d -name "*.bundle"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

## check have dylibs
PLUGINS_DYLIBS=`find "${REF_PLUGIN_DIR}" -type f -name "*.dylib"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

## have bundle or dylbs
COUNT_PLUGINS=0;
COUNT_PLUGINS_DYLIBS=0;
for i in $PLUGINS;
do
COUNT_PLUGINS=$(($COUNT_PLUGINS+1));
done
for i in $PLUGINS_DYLIBS;
do
COUNT_PLUGINS_DYLIBS=$(($COUNT_PLUGINS_DYLIBS+1));
done

echo "plugin count = ${COUNT_PLUGINS}, plugin_dylibs count = ${COUNT_PLUGINS_DYLIBS}"
if [ "${COUNT_PLUGINS}" -gt 0 -o "${COUNT_PLUGINS_DYLIBS}" -gt 0 ]; then
if [ ! -d "${PLUGINS_DIR}" ]; then
echo "create dir ${PLUGINS_DIR}"
`mkdir "${PLUGINS_DIR}"`
fi

echo "Step3. copy plugins"
`cp -R -fi "${REF_PLUGIN_DIR}" "${PLUGINS_DIR}"`
`find "${PLUGINS_DIR}" -name "README.txt" -type f | xargs -n 1 rm -f`
echo "Step3 over"
fi
fi

##Step4
###############################################################################################
if [ -d "${REF_XPC_DIR}" ]; then
## check have xpc?
XPCS=`find "${REF_XPC_DIR}" -type d -name "*.xpc"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

## check have dylibs
XPCS_DYLIBS=`find "${REF_XPC_DIR}" -type f \\( -name "*.dylib" \\)`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi


## have xpc or dylbs
COUNT_XPCS=0;
COUNT_XPCS_DYLIBS=0;
for i in $XPCS;
do
COUNT_XPCS=$(($COUNT_XPCS+1));
done
for i in $XPCS_DYLIBS;
do
COUNT_XPCS_DYLIBS=$(($COUNT_XPCS_DYLIBS+1));
done

echo "xpc count = ${COUNT_XPCS}, xpc_dylibs count = ${COUNT_XPCS_DYLIBS}"
if [ "${COUNT_XPCS}" -gt 0 -o "${COUNT_XPCS_DYLIBS}" -gt 0 ] ; then
if [ ! -d "${XPCS_DIR}" ]; then
echo "create dir ${XPCS_DIR}"
`mkdir "${XPCS_DIR}"`
fi

echo "Step4. copy xpc"
`cp -R -fi "${REF_XPC_DIR}" "${XPCS_DIR}"`
`find "${XPCS_DIR}" -name "README.txt" -type f | xargs -n 1 rm -f`
echo "Step4 over"
fi

fi




# restore $IFS
IFS=$SAVEIFS


