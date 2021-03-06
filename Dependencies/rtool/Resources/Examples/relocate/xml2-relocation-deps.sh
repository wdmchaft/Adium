#!/bin/sh

script_path=`dirname "${0}"`
cd "${script_path}"

mkdir -p build
ln -sf ../../../rtool rtool_sub

echo "#include <stdio.h>" > link.c
echo "int main (void) { return 0; }" >> link.c

gcc link.c -o libxml_link -lxml2
gcc link.c -o libiconv_link -liconv
gcc link.c -o libz_link -lz
gcc link.c -o liball_link -lz -liconv -lxml2
gcc link.c -o libextra_link -lz -liconv -lxml2 -lcurl

FRAMEWORK_ROOT=/Library/Frameworks
FRAMEWORK_NAME=xmlLib
FRAMEWORK_VERSION=2.2

BUILDDIR=build

LIBRARY="/usr/lib/libxml2.2.dylib"
BINARIES="/usr/bin/xmlcatalog libxml_link libiconv_link libz_link liball_link libextra_link"
HEADERS="/usr/include/libxml2/libxml"
MANUALS="/usr/share/man/man1/xmlcatalog.1"

ARRAY_SEARCH_DEPS_ID="  /usr/lib/libz.1.dylib   /usr/lib/libiconv.2.dylib /usr/lib/libcurl.3.dylib"
ARRAY_REPLACE_DEPS_ID="/Library/Frameworks/zLib.framework/Versions/1/zLib /Library/Frameworks/iconvLib.framework/Versions/2/iconvLib /usr/lib/libcurl.dylib"

sh ./rtool_sub \
--framework_root=${FRAMEWORK_ROOT} \
--framework_name=${FRAMEWORK_NAME} \
--framework_version=${FRAMEWORK_VERSION} \
--library=${LIBRARY} \
--builddir=${BUILDDIR} \
--rlinks_binaries="[$ARRAY_SEARCH_DEPS_ID      ]:[$ARRAY_REPLACE_DEPS_ID]" \
--rlinks_framework="[$ARRAY_SEARCH_DEPS_ID      ]:[$ARRAY_REPLACE_DEPS_ID]" \
--binaries="${BINARIES}" \
--headers="${HEADERS}" \
--manuals="${MANUALS}"

rm -f libxml_link libiconv_link libz_link liball_link libextra_link

echo "-- testing binaries --"
echo ""

bins=`find build/xmlLib.frwkproj/xmlLib.framework/Versions/2.2/Resources/Utilities/*`

for bin in $bins; do
	
	echo "--" $(dirname $bin) "--"
	echo "-->" $(basename $bin) 
	otool -LX $bin | awk '{print $1}'
	echo "-- done --"
	echo ""
	
done

echo ""
echo "-- done --"

rm -f link.c
rm -f rtool_sub