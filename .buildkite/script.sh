#!/bin/bash
set -uo pipefail

# Start emulator
$ANDROID_HOME/emulator/emulator @flutter-emulator -no-audio -no-window  -no-snapshot & p1=$!

# Wait emulator boot
while [ "`adb shell getprop sys.boot_completed | tr -d '\r' `" != "1" ] ; do sleep 1; done

# Run tests
flutter drive --target=test_driver/list_content.dart

# Kill emulator
sleep 5
kill "$p1"
