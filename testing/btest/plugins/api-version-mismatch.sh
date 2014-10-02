# @TEST-EXEC: ${DIST}/aux/bro-aux/plugin-support/init-plugin Demo Foo
# @TEST-EXEC: bash %INPUT
# @TEST-EXEC: ./configure --bro-dist=${DIST} && make
# @TEST-EXEC-FAIL: BRO_PLUGIN_PATH=`pwd` bro -NN Demo::Foo >>output 2>&1
# @TEST-EXEC: cat output | sed 's/\/[^ ]*/XXX/g' > output.2 && mv -f output.2 output
# @TEST-EXEC: btest-diff output

( echo '#define BRO_PLUGIN_API_VERSION 42'; cat src/Plugin.cc; ) >src/Plugin.cc.tmp && mv src/Plugin.cc.tmp src/Plugin.cc