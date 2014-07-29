//
//  Euler4.swift
//
//
//  Created by Laura Skelton on 7/29/14.
//
//

// For larger calculations, Swift playgrounds are too slow. Run in terminal instead.

// To run in the terminal:
//  /Applications/Xcode6-Beta4.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift -i Euler4.swift

//A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
//
//Find the largest palindrome made from the product of two 3-digit numbers.

import Foundation
import Cocoa


func isPalindromic(number: Int) -> Bool {
    // split the number into an array of digits
    var thisNumber: CGFloat = CGFloat(number)
    var digitsArray: [Int] = []
    
    while thisNumber >= 1 {
        // keep going until we have run out of digits
        let nextNumber = CGFloat(floor(thisNumber / 10))
        
        var thisDigit: Int = Int(thisNumber - (nextNumber * 10))
        digitsArray.append(thisDigit)
        
        thisNumber = nextNumber
    }
    
    // digitsArray is in reverse, but it doesn't matter since we're looking for mirror symmetry anyway
    if digitsArray.count == 1 {
        // single digits are palindromic
        println(digitsArray)
        return true
    }
    
    // then, compare first to last, second to second-to-last, etc
    
    for i: Int in 0..<Int(floor(CGFloat(digitsArray.count) / 2)) {
        // we don't care about the middle number if odd number of digits, so floor is OK here
        if digitsArray[i] != digitsArray[digitsArray.count - 1 - i] {
            return false
        }
    }
    println(digitsArray)
    return true
}

func findPalindrome() -> (Int, Int, Int) {
    
    // start with upper limit
    // largest possible value of 3 digit number multiples is 999 * 999 = 998001
    
    // want i + j to be as small as possible, and then for i - j to be as small as possible
    // for (999 - i) * (999 - j)
    // 999 * 999 -> 0 = 998001
    // 999 * 998 -> 1 = 997002
    // 998 * 998 -> 2 = 996004
    // 999 * 997 -> 2 = 996003
    // 998 * 997 -> 3 = 995006
    // 999 * 996 -> 3 = 995004
    // 997 * 997 -> 4 = 994009
    // 998 * 996 -> 4 = 994008
    // 999 * 995 -> 4 = 994005
    // 997 * 996 -> 5 = 993012
    // 998 * 995 -> 5 = 993101
    // 999 * 994 -> 5 = 993006
    // 996 * 996 -> 6 = 992016
    // 997 * 995 -> 6 = 992015
    // 998 * 994 -> 6 = 992012
    // 999 * 993 -> 6 = 992007
    
    // start: i = 0, j = 0 (sum: 0, diff: 0)
    // next: i = 0, j = 1 (sum: 1, diff: 1)
    // next: i = 1, j = 1 (sum: 2, diff: 0)
    // next: i = 0, j = 2 (sum: 2, diff: 2)
    // next: i = 1, j = 2 (sum: 3, diff: 1)
    // next: i = 0, j = 3 (sum: 3, diff: 3)
    // next: i = 2, j = 2 (sum: 4, diff: 0)
    // next: i = 1, j = 3 (sum: 4, diff: 2)
    // next: i = 0, j = 4 (sum: 4, diff: 4)
    // next: i = 2, j = 3 (sum: 5, diff: 1)
    
    // start: sumIJ = 0, i = floor(sumIJ/2), j = sumIJ - i (so here, i = 0 and j = 0)
    // while i >= 0, subtract 1 from i and add it to j
    // so next is i = floor(sumIJ/2) - 1, j = sumIJ - i + 1
    
    var sumIJ = 0
    
    while sumIJ < (900 + 900) { // must still be 3 digit numbers, so 999 - i > 99 means i and j < 900 means sum < 900 + 900
        
        // starting value is ideally as close to half the sum as possible, to minimize difference between two numbers we're multiplying
        var i = Int(floor(CGFloat(sumIJ)/2)) // first i
        var j = sumIJ - i // first j
        
        while i >= 0 && j < 900 {
            
            let multiple: Int = Int((999-i) * (999-j))
            if isPalindromic(multiple) {
                return (multiple, 999-i, 999-j)
            }
            i -= 1
            j += 1
        }
        sumIJ += 1
    }
    return (0,0,0) // palindrome not found
}

let palindromeTuple = findPalindrome()

println("largest palindrome multiple of two 3-digit numbers is \(palindromeTuple.1) * \(palindromeTuple.2) = \(palindromeTuple.0)")

