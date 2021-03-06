source $COMMON_HELPERS
source $_DNVM_PATH

$_DNVM_COMMAND_NAME use none

pushd "$TEST_APPS_DIR/TestApp"
$_DNVM_COMMAND_NAME exec $_TEST_VERSION $_DNVM_PACKAGE_MANAGER_NAME restore || die "failed to restore packages"
OUTPUT=$($_DNVM_COMMAND_NAME run $_TEST_VERSION . run || die "failed to run hello application")
echo $OUTPUT | grep 'Runtime is sane!' || die "unexpected output from sample app: $OUTPUT"
popd
