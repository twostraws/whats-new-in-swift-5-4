/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Multiple variadic parameters in functions

[SE-0284](https://github.com/apple/swift-evolution/blob/main/proposals/0284-multiple-variadic-parameters.md) introduced the ability to have functions, subscripts, and initializers use multiple variadic parameters as long as all parameters that follow a variadic parameter have labels. Before Swift 5.4, you could only have one variadic parameter in this situation.

So, with this improvement in place we could write a function that accepts a variadic parameter storing the times goals were scored during a football match, plus a second variadic parameter scoring the names of players who scored:
*/
import Foundation

func summarizeGoals(times: Int..., players: String...) {
    let joinedNames = ListFormatter.localizedString(byJoining: players)
    let joinedTimes = ListFormatter.localizedString(byJoining: times.map(String.init))
    
    print("\(times.count) goals where scored by \(joinedNames) at the follow minutes: \(joinedTimes)")
}
/*:
To call that function, provide both sets of values as variadic parameters, making sure that all parameters after the first variadic are labeled:
*/
summarizeGoals(times: 18, 33, 55, 90, players: "Dani", "Jamie", "Roy")
/*:

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/