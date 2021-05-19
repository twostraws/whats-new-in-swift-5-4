/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Creating variables that call a function of the same name

From Swift 5.4 onwards it’s possible to create a local variable by calling a function of the same name. That might sound obscure, but it’s actually a problem we hit all the time.

For example, this creates a struct with a `color(forRow:)` method, which gets called and assigned to a local variable called `color`:
*/
struct Table {
    let count = 10
    
    func color(forRow row: Int) -> String {
        if row.isMultiple(of: 2) {
            return "red"
        } else {
            return "black"
        }
    }
    
    func printRows() {
        for i in 0..<count {
            let color = color(forRow: i)
            print("Row \(i): \(color)")
        }
    }
}
    
let table = Table()
table.printRows()
/*:
That kind of usage is only allowed from Swift 5.4 and later. In earlier versions of Swift, it would create a circular reference because Swift couldn’t distinguish between the local `color` constant and the `color(forRow:)` method it was calling – you would have seen the error “Variable used within its own initial value”.

This usually resulted in us either using `self.color(forRow: 1989)` to make it clear we mean the method call, or just naming the local value something else such as `colorForRow`.

Fortunately Swift 5.4 [resolves this](https://github.com/apple/swift/blob/main/test/Sema/diag_variable_used_in_initial.swift) and allows us to use the more natural naming.

This change also allows us to make local copies of properties and global variables. For example, we can take a copy of a `username` property that is also called `username`, like this:
*/
struct User {
    let username = "Taylor"
    
    func suggestAlternativeUsername() -> String {
        var username = username
        username += String(Int.random(in: 1000...9999))
        return username
    }
}
    
let user = User()
user.suggestAlternativeUsername()
/*:
Because this also applies to global variables, that same code works just fine even without the struct in place:
*/
let username = "Taytay"

func suggestAlternativeUsername() -> String {
    var username = username
    username += String(Int.random(in: 1000...9999))
    return username
}

suggestAlternativeUsername()
/*:

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/