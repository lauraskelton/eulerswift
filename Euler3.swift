//
//  Euler3.swift
//  
//
//  Created by Laura Skelton on 7/29/14.
//
//

// For larger calculations, Swift playgrounds are too slow. Run in terminal instead.

// To run in the terminal:
//  /Applications/Xcode6-Beta4.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift -i Euler3.swift

//The prime factors of 13195 are 5, 7, 13 and 29.
//
//What is the largest prime factor of the number 600851475143 ?

import Foundation


// need a function to recursively find factors of a number, then refactor those into primes?
class factor {
    var arrayFactors: [Int]
    
    init () {
        self.arrayFactors = []
    }

    func findFactors(number:Int) -> Int {
        
        // start with 2, smallest prime factor
        
        var i = 2
        var nextNumber: Int = number
        
        while nextNumber > 1 {
            if nextNumber % i == 0 {
                // then i is a factor of nextNumber, so save it
                arrayFactors.append(i)
                nextNumber = Int(nextNumber / i)
                while nextNumber % i == 0 {
                    // does it divide the number multiple times?
                    nextNumber = Int(nextNumber / i)
                }
                // nextNumber now has i factored out of it completely, so we can move on
                // and won't run into problems of non-prime multiples of i coming up as factors of nextNumber
                println("factor \(i) leaves number \(nextNumber)")

            }
            
            // look for a larger prime
            i += 1
        }
        
        // we should have all of the prime factors stored in arrayFactors now, so find the max
        
        return arrayFactors.removeLast()
    }
}

let myFactor = factor()
let number = 600851475143
println("largest prime factor of \(number) is \(myFactor.findFactors(number))")

