[app]
title = Red Affair
package.name = ws.tilda.sentryprotocol.redaffair
package.domain = ws.tilda.sentryprotocol
source.dir = .
source.include_exts = py,png,jpg,ttf,ogg,wav
version = 1.114
version.code = 1114
requirements = python3,kivy
orientation = sensor
icon.filename = %(source.dir)s/RAlogos.png

[buildozer]
log_level = 2
build_dir = .buildozer
bin_dir = bin
android.accept_sdk_license = True

android.ndk = 27c
android.sdk = 35
android.minapi = 21
android.arch = arm64-v8a,armeabi-v7a

p4a.ignore_setup_py = 1
p4a.install_pip = 0
p4a.bootstrap = sdl2
p4a.python_version = 3.11
