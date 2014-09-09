#!/bin/sh

# WARNING: You may have to run Clean in Xcode after changing CODE_SIGN_IDENTITY!

ENT="${SRCROOT}/PlugIns.entitlements"

#参照SpriteBuilder的处理方法！！非常棒

# Verify that $CODE_SIGN_IDENTITY is set
if [ -z "$CODE_SIGN_IDENTITY" ] ; then
echo "CODE_SIGN_IDENTITY needs to be non-empty for codesigning frameworks!"

if [ "$CONFIGURATION" = "Release" ] ; then
exit 1
else
# Codesigning is optional for non-release builds.
exit 0
fi
fi

if [ -z "${CODE_SIGN_ENTITLEMENTS}" ] ; then
echo "CODE_SIGN_ENTITLEMENTS needs to be set for framework code-signing!"

if [ "${CONFIGURATION}" = "Release" ] ; then
exit 1
else
# Code-signing is optional for non-release builds.
exit 0
fi
fi

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

#############################################################################################################
FRAMEWORK_DIR="${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
if [ -d "${FRAMEWORK_DIR}" ]; then
# Loop through all frameworks and dylib
FRAMEWORKS=`find "${FRAMEWORK_DIR}" -type d -name "*.framework" | sed -e "s/\(.*\)/\1\/Versions\/A\//"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

echo "Found:"
echo "${FRAMEWORKS}"

for FRAMEWORK in $FRAMEWORKS;
do
echo "Signing '${FRAMEWORK}'"
`codesign -f -v -s "${CODE_SIGN_IDENTITY}" --entitlements "${ENT}" "${FRAMEWORK}"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi
done

### dylib
FRAMEWORK_DYLIBS=`find "${FRAMEWORK_DIR}" -type f -name "*.dylib"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

echo "Find dylibs"
echo "${FRAMEWORK_DYLIBS}"

for FRAMEWORK_DYLIB in $FRAMEWORK_DYLIBS;
do
echo "Signing '${FRAMEWORK_DYLIB}'"
`codesign -f -v -s "${CODE_SIGN_IDENTITY}" --entitlements "${ENT}" "${FRAMEWORK_DYLIB}"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi
done
fi
#############################################################################################################



###Resource dylib
RESOURCE_DIR="${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [ -d "${RESOURCE_DIR}" ]; then
### Resource dylib
# Loop through all plugins
RESOURCE_DYLIBS=`find "${RESOURCE_DIR}" -type f \\( -name "*.dylib" \\)`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

echo "Find RESOURCE_DYLIBS:"
echo "${RESOURCE_DYLIBS}"

for RESOURCE_DYLIB in $RESOURCE_DYLIBS;
do
echo "Signing '${RESOURCE_DYLIB}'"
`codesign -f -v -s "${CODE_SIGN_IDENTITY}" --entitlements "${ENT}" "${RESOURCE_DYLIB}"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi
done
fi


##############################################################################################################

###Plugins
PLUGINS_DIR="${TARGET_BUILD_DIR}/${PLUGINS_FOLDER_PATH}"
if [ -d "${PLUGINS_DIR}" ]; then
### Plugins dylib
# Loop through all plugins
PLUGIN_DYLIBS=`find "${PLUGINS_DIR}" -type f \\( -name "*.dylib" \\)`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

echo "Find PLUGINS:"
echo "${PLUGIN_DYLIBS}"

for PLUGIN_DYLIB in $PLUGIN_DYLIBS;
do
echo "Signing '${PLUGIN_DYLIB}'"
`codesign -f -v -s "${CODE_SIGN_IDENTITY}" --entitlements "${ENT}" "${PLUGIN_DYLIB}"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi
done


# Loop through all plugins
PLUGINS=`find "${PLUGINS_DIR}" -type d -name "*.bundle"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

echo "Find PLUGINS:"
echo "${PLUGINS}"

for PLUGIN in $PLUGINS;
do
echo "Signing '${PLUGIN}'"
`codesign -f -v -s "${CODE_SIGN_IDENTITY}" --entitlements "${ENT}" "${PLUGIN}"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi
done


# Loop throung all PlugIns perm +111 file. only 只在当前目录查找，子目录不查找
PLUGINS_PERM_FILES=`find "${PLUGINS_DIR}" -maxdepth 1 -type f -perm +111`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

echo "Find PLUGINS_PERM_FILES:"
echo "${PLUGINS_PERM_FILES}"

for PLUGINS_PERM_FILE in $PLUGINS_PERM_FILES;
do
echo "Signing '${PLUGINS_PERM_FILE}'"
`codesign -f -v -s "${CODE_SIGN_IDENTITY}" --entitlements "${ENT}" "${PLUGINS_PERM_FILE}"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi
done

fi



####XPCs
XPCS_DIR="${TARGET_BUILD_DIR}/${CONTENTS_FOLDER_PATH}/XPCServices"
if [ -d "${XPCS_DIR}" ]; then
#### XPC dylibs
# Loop through all xpcs
XPC_DYLIBS=`find "${XPCS_DIR}" -type f \\( -name "*.dylib" \\)`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

echo "Find XPC dylibs:"
echo "${XPC_DYLIBS}"

for XPC_DYLIB in $XPC_DYLIBS;
do
echo "Signing '${XPC_DYLIB}'"
`codesign -f -v -s "${CODE_SIGN_IDENTITY}" --entitlements "${ENT}" "${XPC_DYLIB}"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi
done


# Loop through all XPC
XPCS=`find "${XPCS_DIR}" -type d -name "*.xpc"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi

echo "Find XPC:"
echo "${XPCS}"

for XPC in $XPCS;
do
echo "Signing '${XPC}'"
`codesign -f -v -s "${CODE_SIGN_IDENTITY}" --entitlements "${ENT}" "${XPC}"`
RESULT=$?
if [[ $RESULT != 0 ]] ; then
exit 1
fi
done
fi


###### All pem +111 file





#SPEC_CONTENT_DIR="${TARGET_BUILD_DIR}/${CONTENTS_FOLDER_PATH}/"
#ALLPermFiles=`find "${SPEC_CONTENT_DIR}" -type f -perm +111 `
#RESULT=$?
##f [[ $RESULT != 0 ]] ; then
#exit 1
#fi

#echo "Find Perm +111 files:"
#echo "${ALLPermFiles}"

#for permFile in $ALLPermFiles;
#do
#echo "Signing '${permFile}'"
#`codesign -f -v -s "${CODE_SIGN_IDENTITY}" --entitlements "${CODE_SIGN_ENTITLEMENTS}" "${permFile}"`
#RESULT=$?
#if [[ $RESULT != 0 ]] ; then
#exit 1
#fi
#done
#fi
#########################


# restore $IFS
IFS=$SAVEIFS