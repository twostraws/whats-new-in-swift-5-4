/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Property wrappers are now supported for local variables

Property wrappers were first introduced in Swift 5.1 as a way of attaching extra functionality to properties in an easy, reusable way, but in Swift 5.4 their behavior got extended to support using them as local variables in functions.

For example, we could create a property wrapper that ensures its value never goes below zero:
*/
@propertyWrapper struct NonNegative<T: Numeric & Comparable> {
    var value: T
    
    var wrappedValue: T {
        get { value }
    
        set {
            if newValue < 0 {
                value = 0
            } else {
                value = newValue
            }
        }
    }
    
    init(wrappedValue: T) {
        if wrappedValue < 0 {
            self.value = 0
        } else {
            self.value = wrappedValue
        }
    }
}
/*:
And from Swift 5.4 onwards we can use that property wrapper inside a regular function, rather than just attaching to a property. For example, we might write a game where our player can gain or lose points, but their score should never go below 0:
*/
func playGame() {
    @NonNegative var score = 0
    
    // player was correct
    score += 10
    
    // player was correct again
    score += 10
    
    // player got one wrong
    score -= 50
    
    print(score)
}
    
playGame()
/*:

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/