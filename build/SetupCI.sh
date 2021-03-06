BUILD_DIR=$TRAVIS_BUILD_DIR/build

cd $BUILD_DIR/../objcgen
./system-dependencies.sh --provision

OS=$(uname -s)
if [ "$OS" == "Darwin" ]; then
	export PATH=$PATH:/Library/Frameworks/Mono.framework/Versions/Current/bin
fi

cd $BUILD_DIR
if [ ! -f $BUILD_DIR/nuget.exe ]; then
	wget https://nuget.org/nuget.exe -O$BUILD_DIR/nuget.exe
fi

mono $BUILD_DIR/nuget.exe install Mono.TextTransform -OutputDirectory $BUILD_DIR/../deps

cd $BUILD_DIR/..
