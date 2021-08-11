rem This is a batch file that will build Conways-Game-Of-Life on Windows

set SDKROOT=%SystemDrive%/Library/Developer/Platforms/windows.platform/Developer/SDKs/Windows.sdk
set SWIFTFLAGS=-sdk %SDKROOT% -I %SDKROOT%/usr/lib/swift -L %SDKROOT%/usr/lib/swift/windows

swiftc -o main.exe ConwayVC.swift Colony.swift main.swift Array2DS.swift %SWIFTFLAGS%

main.exe