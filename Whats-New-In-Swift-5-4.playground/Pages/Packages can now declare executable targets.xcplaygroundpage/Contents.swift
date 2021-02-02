/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)
# Packages can now declare executable targets

[SE-0294](https://github.com/apple/swift-evolution/blob/main/proposals/0294-package-executable-targets.md) adds a new target option for apps using Swift Package manager, allowing us to explicitly declare an executable target.

This is particularly important for folks who want to use [SE-0281](https://github.com/apple/swift-evolution/blob/main/proposals/0281-main-attribute.md) (using `@main` to mark your program’s entry point), because it didn’t play nicely with Swift Package Manager – it would always look for a main.swift file. 

With this change, we can now remove main.swift and use `@main` instead. - important:  You must specify `// swift-tools-version:5.4` in your Package.swift file in order to get this new functionality.

&nbsp;

[< Previous](@previous)           [Home](Introduction)
*/