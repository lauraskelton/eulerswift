//
//  Euler1.swift
//  
//
//  Created by Laura Skelton on 7/29/14.
//
//

// For larger calculations, Swift playgrounds are too slow. Run in terminal instead.

// To run in the terminal:
//  /Applications/Xcode6-Beta4.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift -i Euler1.swift

//If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
//
//Find the sum of all the multiples of 3 or 5 below 1000.

import Foundation

func euler1() -> NSInteger {
    
    // Find the sum of all the multiples of 3 or 5 below 1000.
    
    var sum = 0
    
    for var i=1; i<1000; i++
    {
        if i % 3 == 0 || i % 5 == 0
        {
            sum += i
        }
    }
    
    return sum
}

println("final sum: \(euler1())")
