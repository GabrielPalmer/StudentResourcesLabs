/*:
 ## Exercise - Computed Properties and Property Observers
 
 The `Rectangle` struct below has two properties, one for width and one for height. Add a computed property that computes the area of the rectangle (i.e. width * height). Create an instance of `Rectangle` and print the `area` property.
 */
struct Rectangle {
    var width: Int
    var height: Int
    
    var area: Int {
        return width * height
    }
}

var pic = Rectangle(width: 13, height: 7)

print(pic.area)

//the next instructions got deleted here somehow

struct Height {
    
    var heightInInches: Double {
        didSet{
            if heightInInches * 2.54 != heightInCentimeters {
                heightInCentimeters = heightInInches * 2.54
            }
        }
    }
    
    var heightInCentimeters: Double {
        didSet {
            if heightInCentimeters / 2.54 != heightInInches {
                heightInInches = heightInCentimeters / 2.54
            }
        }
    }
    
    init(heightInInches: Double) {
        self.heightInInches = heightInInches
        self.heightInCentimeters = heightInInches*2.54
    }
    
    init(heightInCentimeters: Double) {
        self.heightInCentimeters = heightInCentimeters
        self.heightInInches = heightInCentimeters/2.54
    }
}
//: [Previous](@previous)  |  page 7 of 10  |  [Next: App Exercise - Mile Times and Congratulations](@next)
