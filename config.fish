nvm use v8.12.0

set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $PATH $ANDROID_HOME/emulator
set -x PATH $PATH $ANDROID_HOME/tools
set -x PATH $PATH $ANDROID_HOME/tools/bin
set -x PATH $PATH $ANDROID_HOME/platform-tools

set -x PKG_CONFIG_ALLOW_CROSS 1
set -x CARGO_INCREMENTAL 1
set -x RUST_LOG indy=trace
set -x RUST_TEST_THREADS 1

set -x OPENSSL_DIR 1 /usr/local/Cellar/openssl/1.0.2o_1