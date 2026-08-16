[app]
title = Red Affair
package.name = ws.tilda.sentryprotocol.redaffair
package.domain = ws.tilda.sentryprotocol
source.dir = .
source.include_exts = py,png,jpg,ttf,ogg,wav
version = 1.114
version.code = 1114
requirements = python3,kivy,charset_normalizer==2.1.1
orientation = all
icon.filename = %(source.dir)s/RAlogos.png

android.accept_sdk_license = True
android.api = 33
android.minapi = 24
android.ndk = 28.0.12433566
android.archs = arm64-v8a,armeabi-v7a
p4a.ignore_setup_py = 1
p4a.install_pip = 1
p4a.python_version = 3.10
p4a.hostpython = /usr/bin/python3.10

[buildozer]
log_level = 2
build_dir = .buildozer
bin_dir = bin