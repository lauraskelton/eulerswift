//
//  Euler3.swift
//  
//
//  Created by Laura Skelton on 7/29/14.
//
//

// For larger calculations, Swift playgrounds are too slow. Run in terminal instead.

// To run in the terminal:
//  /Applications/Xcode6-Beta4.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift -i Euler5.swift

// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//    
//    What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

import Foundation

class factor_primes_and_powers {
    var arrayFactors: [Int]
    var arrayLargestPrimePowers: [Int]
    
    init () {
        self.arrayFactors = []
        self.arrayLargestPrimePowers = []
    }

    func findPrimesAndPowers(number:Int) -> Int {
        
        // start with 2, smallest prime factor
        // 20 is the number
        let root = Int(sqrt(Float(number)))
        for i in 2...number {
            println("Analyzing number \(i)")
            var isPrime = true
            for prime in arrayFactors {
                if i % prime == 0 {
                    // return if it is not a prime
                    println("\(i) is not a prime")
                    isPrime = false
                    break // ?
                }
            }
            if isPrime {
                // i is a prime
                arrayFactors.append(i)
                println("Found prime \(i)")
                var k = 1
                var largestPrimePower = i
                // shouldn't compute twice...
                if i < root {
                    while Int(pow(Float(i),Float(k))) <= number {
                        largestPrimePower = Int(pow(Float(i),Float(k)))
                        ++k
                    }
                }
                arrayLargestPrimePowers.append(largestPrimePower)
                println("Found largest prime power \(largestPrimePower)")
            }

        }
        
        func arrayProduct(array:[Int]) -> Int {
            var product = 1
            for i in array {
                product *= i
            }
            return product
        }
        
        return arrayProduct(arrayLargestPrimePowers)
    }
}

let myPrimes = factor_primes_and_powers()
let number = 20
let smallestMultiple = myPrimes.findPrimesAndPowers(number)
println("smallest multiple of numbers 1 to \(number) is \(smallestMultiple)")

