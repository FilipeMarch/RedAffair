[app]
title = Red Affair
package.name = ws.tilda.sentryprotocol.redaffair
package.domain = ws.tilda.sentryprotocol
source.dir = .
source.include_exts = py,png,jpg,ttf,ogg,wav
version = 1.114
version.code = 1114
requirements = python3,kivy
orientation = fullSensor
icon.filename = %(source.dir)s/RAlogos.png

[buildozer]
log_level = 2
build_dir = .buildozer
bin_dir = bin
android.accept_sdk_license = True
android.ndk = 29
android.sdk = 36
android.minapi = 21
android.arch = arm64-v8a,armeabi-v7a

p4a.ignore_setup_py = 1
p4a.install_pip = 0
p4a.python_version = 3.10

# Use a python‑for‑android commit that contains the fix
p4a.branch = 90c1e3b2f9c5d8a6e4b7c1f9a2d3e4f5a6b7c8d9
