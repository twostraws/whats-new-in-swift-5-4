/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Improved implicit member syntax

[SE-0287](https://github.com/apple/swift-evolution/blob/main/proposals/0287-implicit-member-chains.md) improves Swift’s ability to use implicit member expressions, so rather than just having support for exactly one single static member you can make chains of them.

Swift has always had the ability to use implicit member syntax for simple expressions, for example if you wanted to color some text in SwiftUI you could use `.red` rather than `Color.red`:
*/
import SwiftUI

struct ContentView1: View {
    var body: some View {
        Text("Hello, World!")
            .foregroundColor(.red)
    }
}
/*:
Prior to Swift 5.4 this did not work with more complex expressions. For example, if you wanted your red color to be slightly transparent you would need to write this:
*/
struct ContentView2: View {
    var body: some View {
        Text("Hello, World!")
            .foregroundColor(Color.red.opacity(0.5))
    }
}
/*:
From Swift 5.4 onwards the compiler is able to understand multiple chained members, meaning that the `Color` type can be inferred:
*/
struct ContentView3: View {
    var body: some View {
        Text("Hello, World!")
            .foregroundColor(.red.opacity(0.5))
    }
}
/*:

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/