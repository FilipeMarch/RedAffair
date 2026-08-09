[app]
title = Red Affair
package.name = ws.tilda.sentryprotocol.redaffair
package.domain = ws.tilda.sentryprotocol
source.dir = .
source.include_exts = py,png,jpg,ttf,ogg,wav
version = 1.82
version.code = 182
requirements = python3,kivy
orientation = all
icon.filename = %(source.dir)s/RAlogos.png

[buildozer]
log_level = 2
build_dir = .buildozer
bin_dir = bin
android.accept_sdk_license = True
android.ndk = 27c
android.sdk = 30
android.minapi = 21
android.arch = arm64-v8a