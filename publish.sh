godot --headless --export "Web"
godot --headless --export "Linux"
godot --headless --export "Windows"

butler push ./dist/html vistomia/balloongame:html
butler push ./dist/linux/balloongame_linux-x64.x86_64 vistomia/balloongame:linux
butler push ./dist/windows/balloongame_windows-x64.exe vistomia/balloongame:windows
