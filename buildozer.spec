[app]

title = Red Affair
 package.name = ws.tilda.sentryprotocol.redaffair
 package.domain = ws.tilda.sentryprotocol
 source.dir = .
 source.include_exts = py,png,jpg,ttf,ogg,wav
 version = 1.114
 version.code = 1114
 requirements = python3,kivy,charset_normalizer==3.2.0
 orientation = all
 icon.filename = %(source.dir)s/RAlogos.png

[buildozer]

 log_level = 2
 build_dir = .buildozer
 bin_dir = bin
 android.accept_sdk_license = True
 android.api = 33
 android.minapi = 24
 android.ndk = 27.0.11902837
 android.build_tools_version = 35.0.0
 android.arch = arm64-v8a armeabi-v7a
 android.sdk_path = /home/runner/work/_temp/android-sdk
 android.ndk_path = /home/runner/work/_temp/android-sdk/ndk/27.0.11902837
 p4a.ignore_setup_py = 1
 p4a.install_pip = 1
 p4a.python_version = 3.10
 p4a.branch = master