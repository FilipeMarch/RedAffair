[app]
title = Red Affair
package.name = ws.tilda.sentryprotocol.redaffair
package.domain = ws.tilda.sentryprotocol
source.dir = .
source.include_exts = py,png,jpg,ttf,ogg,wav
version = 1.222.2
version.code = 12222
requirements = python3,kivy,charset_normalizer==2.1.1
orientation = portrait,landscape
icon.filename = %(source.dir)s/RAlogos.png

android.accept_sdk_license = True
android.ndk = 28.0.12433566
android.sdk = 36
android.minapi = 24
android.arch = arm64-v8a

[buildozer]
log_level = 2
build_dir = .buildozer
bin_dir = bin