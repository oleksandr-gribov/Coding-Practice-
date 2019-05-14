//: Playground - noun: a place where people can play

import UIKit

class Ghost {
    var isAlive: Bool // boolean declaration
    var strength: Int
    init (strength: Int, life: Bool ) {
        self.isAlive = life
        self.strength = strength
    }
    func kill () {
        self.isAlive = false
    }
    func isStrong () -> Bool {
        if self.strength > 10 {
            return true
        } else {
            return false
        }
    }
}

var ghost = Ghost(strength: 9, life: true)

print (ghost.strength, ghost.isAlive)
ghost.kill()

print (ghost.strength, ghost.isAlive)
ghost.strength = 25
print (ghost.isStrong())

// number may have a value or it might not


let userEnteredText = "3"

let userEnteredInteger = Int(userEnteredText)

// checking if something has a value before using it
if let catAge = userEnteredInteger {
    
    print (catAge * 7)
    
} else {
    // show an error message to the user
}


let number = 5
var isPrime = true
if number == 1 {
    isPrime = false
}
var i = 2

while i < number {
    if number % i == 0 {
        isPrime = false
    }
    
    i += 1
}
print (isPrime)

