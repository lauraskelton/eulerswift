//
//  Euler7.swift
//  
//
//  Created by Laura Skelton on 8/16/14.
//
//

// For larger calculations, Swift playgrounds are too slow. Run in terminal instead.

// To run in the terminal:
//  /Applications/Xcode6-Beta4.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift -i Euler7.swift
//
//    By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
//
//    What is the 10 001st prime number?

import Foundation

class Primes {
    var arrayPrimes: [Int]
    
    init () {
        self.arrayPrimes = [2]
    }
    
    subscript(i:Int) -> Int {
        // computes the prime at this index when accessed through Primes[index]

        return findPrimeAtIndex(i)
    }
    
    func findPrimeAtIndex(number:Int) -> Int {
        
        let primesCount = arrayPrimes.count
        
        if number <= primesCount {
            return arrayPrimes[number-1]
        }
        
        // start with 2, smallest prime number
        // 10_001 is the index of the prime
        
        // largest known prime
        var i = arrayPrimes[primesCount - 1] + 1
        
        while arrayPrimes.count <= number {
            // keep adding primes to arrayPrimes
            var isPrime = true
            let root = Int(sqrt(Float(i)))
            for prime in arrayPrimes {
                if i % prime == 0 {
                    // return if it is not a prime
                    isPrime = false
                    break
                }
                if prime >= root {
                    break
                }
            }
            if isPrime {
                // i is a prime
                arrayPrimes.append(i)
                println("Found prime \(i)")
            }
            ++i
        }
        return arrayPrimes[number-1]
    }
}

let myPrimes = Primes()
let number = 10_001
println("The \(number)st prime is \(myPrimes[number])")









