/*:
 ## Exercise - Type Casting and Inspection
 
 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var stuff: [Any] = [true, 88, 5.3223, "duh", 687.1, "potato", false, 42]
print(stuff)
/*:
 Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
 */
for thing in stuff {
    if thing is Int {
        print(thing)
    } else if thing is String {
        print(thing)
    } else if thing is Bool {
        print(thing)
    } else if thing is Double {
        print(thing)
    }
}

/*:
 Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
 */
var moreStuff: [String : Any] = ["Has a beard" : false, "Amount of marbles" : 123, "Cost" : 88.99, "I'm hungry" : "Hi Hungry, I'm dad"]

print(moreStuff)
/*:
 Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
 */
var total: Double = 0

for junk in moreStuff.values {
    if let unwrappedJunk = junk as? Int {
        total += Double(unwrappedJunk)
    } else if let unwrappedJunk = junk as? Double {
        total += unwrappedJunk
    } else if junk is String {
        total += 1
    } else if let unwrappedJunk = junk as? Bool {
        total += unwrappedJunk ? 2 : -3
    }
}

print(total)
/*:
 Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
 */
var total2: Double = 0

for junk in moreStuff.values {
    if let unwrappedJunk = junk as? Int {
        total2 += Double(unwrappedJunk)
    } else if let unwrappedJunk = junk as? Double {
        total2 += unwrappedJunk
    } else if let unwrappedJunk = junk as? String {
        //check if string can be converted to double
        if let junkAsDouble = Double(unwrappedJunk) {
            total2 += junkAsDouble
        }
    }
}

print(total2)
//: page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
