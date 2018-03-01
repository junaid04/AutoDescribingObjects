//: Playground - noun: a place where people can play

import UIKit

//https://medium.com/@YogevSitton/use-auto-describing-objects-with-customstringconvertible-49528b55f446

class Printable: NSObject {
   override var description : String {
        var desc: String = ""
//        if self is NSObject {
//           desc = "***** \(type(of: self)) - <\(Unmanaged.passUnretained(self as AnyObject).toOpaque())>***** \n"
//        } else {
//            desc = "***** \(type(of: self as AnyObject)) *****\n"
//        }
        let selfMirror = Mirror(reflecting: self)
        for child in selfMirror.children {
            if let propertyName = child.label {
                desc += "\(propertyName): \(child.value)\n"
            }
        }
        return desc
    }
}

class Dog: Printable  {
    let name: String
    let age: Int
    let color: String
    
    init (name: String, age: Int, color: String) {
        self.name = name
        self.age = age
        self.color = color
    }
    
}

let bronoTheDog = Dog(name: "Brono", age: 4, color: "Brown")
let wendyTheDog = Dog(name: "Wendy", age: 2, color: "White")
print(bronoTheDog)
print(wendyTheDog)


