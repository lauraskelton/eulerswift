//
//  Euler6.swift
//  
//
//  Created by Laura Skelton on 8/16/14.
//
//

// For larger calculations, Swift playgrounds are too slow. Run in terminal instead.

// To run in the terminal:
//  /Applications/Xcode6-Beta4.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift -i Euler6.swift

//    The sum of the squares of the first ten natural numbers is,
//
//    12 + 22 + ... + 102 = 385
//    The square of the sum of the first ten natural numbers is,
//
//    (1 + 2 + ... + 10)2 = 552 = 3025
//    Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
//
//    Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

import Foundation

func findDifferentSquaresAndSum(number:Double) -> Double {
    
    // start with 1
    // 100 is the number
    
    var sum: Double = 0
    var powSum: Double = 0
    for i in 1...Int(number) {
        powSum += Double(pow(Float(i),2))
        sum += Double(i)
        println("Power sum plus \(i) is \(sum).")
    }
    return Double(pow(Float(sum),2)) - powSum
}

let number:Double = 100
let difference = findDifferentSquaresAndSum(number)
println("difference between sum of squares and square of sum of numbers from 1 to \(number) is \(difference)")

