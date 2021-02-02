/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Local functions now support overloading

[SR-10069](https://bugs.swift.org/browse/SR-10069) requested the ability to overload functions in local contexts, which in practice means nested functions can now be overloaded so that Swift chooses which one to run based on the types that are used.

For example, if we wanted to make some simple cookies we might write code like this:
*/
struct Butter { }
struct Flour { }
struct Sugar { }
    
func makeCookies() {
    func add(item: Butter) {
        print("Adding butter…")
    }
    
    func add(item: Flour) {
        print("Adding flour…")
    }
    
    func add(item: Sugar) {
        print("Adding sugar…")
    }
    
    add(item: Butter())
    add(item: Flour())
    add(item: Sugar())
    print("Come and get some cookies!")
}
    
makeCookies()
/*:
Prior to Swift 5.4, the three `add()` methods could be overloaded only if they were not nested inside `makeCookies()`, but from Swift 5.4 onwards function overloading is supported in this case as well.

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/