//
//  FNumber.swift
//  SwiftChallange
//
//  Created by Faisal Iqbal on 12/02/18.
//  Copyright © 2018 Faisal Iqbal. All rights reserved.
//

import Foundation
class FNumber {
    /**
     Write a function that counts from 1 through 100, and prints “Fizz” if the counter is evenly divisible by 3, “Buzz” if it’s evenly divisible by 5, “Fizz Buzz” if it’s even divisible by three and five, or the counter number for all other cases.

    */
    func challenge16a() {
        //1.
        (0...100).forEach {
          $0 % 3 == 0 ? ($0 % 5 == 0 ? print("Fiz Buzz") : print("Fizz")) : ($0%5 == 0 ? print("Buzz") : print($0))
        }
       
        //2.
        /*for i in 0...100 {
            switch (i%3 == 0, i%5 == 0) {
            case (true, false):
                print("Fizz")
            case (false, true):
                print("Buzz")
            case (true, true):
                print("Fizz Buzz")
            case (false, false):
                print(i)
                
            }
        }*/
    }
    /**
     Write a function that accepts positive minimum and maximum integers, and returns a random
     number between those two bounds, inclusive.
    */
    func challenge17(min: Int, max: Int) -> Int {
        /*arc4random returns an integer between 0 and (2^32)-1 while arc4random_uniform returns an integer between 0 and the upper bound you pass it ie  0<upperbound.
        For example if you want an integer between 0 and 4 you could use
        arc4random() % 5
        or
        arc4random_uniform(5)*/
        return Int(arc4random_uniform(UInt32(max-min+1))) + min
    }
    
    /**
     Create a function that accepts positive two integers, and raises the first to the power of the
     second.
    */
    func challenge18a(number: Int, power: Int) -> Int {
        
        guard number > 0,  power > 0 else { return 0 }
        
        //1.
        /*var returnNumber = number
        for _ in 1 ..< power {
            returnNumber *= number
        }
        return returnNumber*/
        
        if power == 1 {
            return number
        }
        return number * challenge18a(number:number, power:power-1)
    }
    //Swap two positive variable integers, a and b, without using a temporary variable.
    func challenge19a(a: inout Int, b: inout Int) {
        //1.
        /*a = a + b
        b = a - b
        a = a - b*/
        //2.
        /*a = a ^ b
        b = a ^ b
        a = a ^ b*/
        //3.
        //swap(&a, &b)
        //4.
        (a, b) = (b, a)
        
    }
    /**
     check for prime number
    */
    /*Note:
     if the number n is not prime, it means it can be reached by multiplying two factors, x and y. If both of those numbers were greater than the square root of n, then x * y would be greater than n, which is not possible. So, we can be sure that at least one of x or y is less than or equal to the square root of n.

     */
    func challenge20b(number: Int) -> Bool {
        /*floor is the greatest integer less than n.
         ceil is the smallest integer greater than n.*/
        guard number >= 2 else { return false }
        guard number != 2 else { return true }
        let max = Int(ceil(sqrt(Double(number))))
        
        for i in 2 ... max {
            if number % i == 0 {
                return false
            }
        }
        return true
    }
    /*Create a function that accepts any positive integer and returns the next highest and next lowest number that has the same number of ones in its binary representation. If either number is not possible, return nil for it.*/
    func challenge21a(number: Int) -> (nextHighest: Int?,
        nextLowest: Int?) {
            let targetBinary = String(number, radix: 2)
            let targetOnes = targetBinary.filter { (char: Character) ->
                Bool in char == "1" }.count
            var nextHighest: Int? = nil
            var nextLowest: Int? = nil
            for i in number + 1...Int.max {
                let currentBinary = String(i, radix: 2)
                let currentOnes = currentBinary.filter { (char:
                    Character) -> Bool in char == "1" }.count
                if targetOnes == currentOnes {
                    nextHighest = i
                    break
                }
            }
            for i in (0 ..< number).reversed() {
                let currentBinary = String(i, radix: 2)
                let currentOnes = currentBinary.filter { (char:
                    Character) -> Bool in char == "1" }.count
                if targetOnes == currentOnes {
                    nextLowest = i
                    break
                }
            }
            return (nextHighest, nextLowest)
    }
    func challenge21b(number: Int) -> (nextHighest: Int?,
        nextLowest: Int?) {
            
            func ones(in number: Int) -> Int {
                let currentBinary = String(number, radix:2)
                return currentBinary.filter { (char: Character) -> Bool in
                    char == "1"
                    }.count
            }
            var nextHighest: Int? = nil
            var nextLowest: Int? = nil
            let targetOnes = ones(in: number)
            for i in number + 1 ... Int.max {
                if targetOnes == ones(in: i) {
                    nextHighest = i
                    break
                }
            }
            for i in (0 ..< number).reversed() {
                if targetOnes == ones(in: i) {
                    nextLowest = i
                    break
                }
            }
            return (nextHighest, nextLowest)
    }
    /*Create a function that accepts an unsigned 8-bit integer and returns its binary reverse, padded
     so that it holds precisely eight binary digits.*/
    func challenge22(number: UInt) -> UInt {
        let binaryString = String(number, radix:2)
        let padding = 8 - binaryString.count
        let paddedNumberString = String(repeating:"0", count:padding) + binaryString
        let reversedStringNumber = String(paddedNumberString.reversed())
        return UInt(reversedStringNumber, radix:2)!
    }
    /*Write a function that accepts a string and returns true if it contains only numbers, i.e. the digits
     0 through 9.*/
    func challenge23(input: String) -> Bool {
        
        //1.
        /*for char in input {
            if Int(String(char)) == nil {
                return false
            }
        }
        return true*/
        
        return input.rangeOfCharacter(from: CharacterSet(charactersIn:"0123456789").inverted) == nil
    }
    /*Given a string that contains both letters and numbers, write a function that pulls out all the
     numbers then returns their sum.*/
    func challenge24a(string: String) -> Int {
        var currentNumber = 0
        var total = 0
        for c in string {
            if let int = Int(String(c)) {
                currentNumber = currentNumber * 10 + int
            } else if currentNumber != 0 {
                total += currentNumber
                currentNumber = 0
            }
        }
        if currentNumber != 0 {
            total += currentNumber
        }
        return total
    }
    /*Write a function that returns the square root of a positive integer, rounded down to the nearest
     integer, without using sqrt().*/
    func challenge25a(input: Int) -> Int {
        if input == 0 || input == 1 {
            return input
        }
        //1. return Int(floor(pow(Double(input), 0.5)))
        //2.
        /*for i in 1 ... input/2 + 1 {
            if i * i == input {
                return i
            }
        }
        return 0*/
        //3.
        var lower = 0
        var upper = 1 + input/2
        while lower < upper {
            let mid = lower + (upper - lower)/2
            if mid * mid == input {
                return mid
            } else if (mid * mid > input) {
                upper = mid
            } else {
                lower = mid
            }
        }
        return lower
    }
    /*Write a function that returns the square root of a double, without using sqrt().*/
    func challenge25b(input: Double) -> Double {
        
        var s = 0.0
        for case let i in stride(from: 0, through: input/2.0+1, by: 1.0) where i*i > input {
            s = i - 1.0
            break
        }
        var x = 0.0
        for case let i in stride(from: x, through: 1.0, by: 0.001) where ((s+i) * (s+i)) > input {
            x = s + i - 0.001
            break
        }
        return x
    }
    //Create a function that subtracts one positive integer from another, without using -.
    func challenge26a(subtract: Int, from: Int) -> Int {
        //1.
        return from + -subtract
        //2.
        //return from % subtract + (from/subtract - 1) * subtract
        //3.
        //return from + -1 * subtract
        //4
        //return from + ~subtract+1
    }
    
}
