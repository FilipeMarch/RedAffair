[app]
title = Red Affair
package.name = ws.tilda.sentryprotocol.redaffair
package.domain = ws.tilda.sentryprotocol
source.dir = .
source.include_exts = py,png,jpg,ttf,ogg,wav
version = 1.114
version.code = 1114
requirements = python3,kivy
orientation = portrait,landscape
icon.filename = %(source.dir)s/RAlogos.png
fullscreen = 0

[buildozer]
log_level = 2
warn_on_root = 0
build_dir = .buildozer
bin_dir = bin

[app:android]
android.permissions = INTERNET
android.api = 36
android.minapi = 21
android.sdk = 36
android.ndk = 29
android.bootstrap = sdl2
android.arch = arm64-v8a,armeabi-v7a
android.accept_sdk_license = True
android.accept_root_user = True
p4a.python_version = 3.14
p4a.bootstrap = sdl2
p4a.arch = arm64-v8a,armeabi-v7a
p4a.ignore_setup_py = 1
p4a.install_pip = 0
