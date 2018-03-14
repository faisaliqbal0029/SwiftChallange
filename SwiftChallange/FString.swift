//
//  FString.swift
//  SwiftChallange
//
//  Created by Faisal Iqbal on 11/02/18.
//  Copyright © 2018 Faisal Iqbal. All rights reserved.
//

import Foundation
class FString {
/**Write a function that accepts a String as its only parameter, and returns true if the string has
 only unique letters, taking letter case into account.
 */
    func challenge1a(input: String) -> Bool {
        var uniqueChar = [Character]()
        for char in input {
            if uniqueChar.contains(char) {
                return false
            }
            uniqueChar.append(char)
        }
        return true
    }
    func challenge1b(input: String) -> Bool {
        return Set(input).count == input.count
    }
    /**
     Checking if string is palindrome
    */
    func challenge2a(str:String)->Bool {
        
        //1.
        //return str == String(str.reversed())
        
        //2.
        var i = 0, j = str.count-1
        /*var array = Array(str)
          while i < j {
            if array[i] != array[j] {
                return false
            }
            i += 1
            j -= 1
        }*/
        //3.
        i = 0
        j = str.count-1
        while i < j {
            let left = str.index(str.startIndex, offsetBy: i)
            let right = str.index(str.startIndex, offsetBy: j)
            if str[left] != str[right] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
    /**
     Write a function that accepts two String parameters, and returns true if they contain the same characters in any order taking into account letter case.
    */
    func challenge3a(string1: String, string2: String) -> Bool {
        //1.
        /*let a1 = Array(string1.lowercased()).sorted()
        let a2 = Array(string2.lowercased()).sorted()
        return a1 == a2*/
        //2.
        let s1 = Set(string1.lowercased())
        let s2 = Set(string2.lowercased())
        return s1 == s2
    }
    /** Write your own version of the contains() method on String that ignores letter case, and
     without using the existing contains() method.
     */
    func challenge4a(string1: String, contains string2: String) -> Bool {
        print(string1.contains(string2))
        return string1.range(of: string2, options:.caseInsensitive) != nil
    }
    //Count character
    func challenge5a(input: String, count: Character) -> Int {
        //1.
        //return input.reduce(0) { $1 == count ? $0 + 1 : $0 }
        //2.
        let countedSet = NSCountedSet(array: Array(input))
        return countedSet.count(for:count)
    }
    /** Write a function that accepts a string as its input, and returns the same string just with
     duplicate letters removed.
     */
    func challenge6a(string: String) -> String {
        //1. set, but problem in retaining orders
        //return String(Set(string))
        
        //2.
        /*var set = Set<Character>()
        return String(string.filter{ set.insert($0).inserted } )*/
        //3.
        /*let array = string.map { String($0) }
        let set = NSOrderedSet(array: array)
        let letters = Array(set) as! Array<String>
        return letters.joined()*/
        //4.
        /*var used = [Character: Bool]()
        return String(string.filter { used.updateValue(true, forKey: $0) == nil })*/
        //5.
        var used = [Character]()
        
        for char in string {
            if !used.contains(char) {
                used.append(char)
            }
        }
        return String(used)
    }
    /**
     Write a function that returns a string with any consecutive spaces replaced with a single space.
    */
    func challenge7a(input: String) -> String {
        //1.
        return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
        //2.
        var spaceSeen = false
        var returnValue = ""
        for char in input {
            if char == " " {
                if spaceSeen { continue }
                spaceSeen = true
            } else {
                spaceSeen = false
            }
            returnValue.append(char)
        }
        return returnValue
    }
    /**
     Write a function that returns a string with any consecutive charcter replaced with a single character. example aaabcdddaa -> abcda
     */
    func challenge7b(input: String) -> String {
        
        var currentChar:Character? = nil
        var returnValue = ""
        for char in input {
            if currentChar == char {
                continue
            } else {
                currentChar = char
            }
            returnValue.append(char)
        }
        return returnValue
    }
    /***Write a function that accepts two strings, and returns true if one string is rotation of the other,
     taking letter case into account.
     */
    func challenge8(input: String, rotated: String) -> Bool {
        guard input.count == rotated.count else { return false }
        let combined = input + input
        return combined.contains(rotated)
    }
    /***Write a function that accepts strings, and returns true if string is PANGRAMS contain all 26 alphabets.
     */
    func challenge9(input: String) -> Bool {
        let set = Set(input.lowercased())
        let letters = set.filter { $0 >= "a" && $0 <= "z" }
        return letters.count == 26
    }
    /**
     function to count vowels and consonents
    */
    func challenge10c(string:String) -> (vowels:Int, consonents:Int) {
        let vowels = "aeiou"
        let consonants = "bcdfghjklmnpqrstvwxyz"
        var vowelCount = 0
        var consonantCount = 0
        for c in string {
            if vowels.contains(c) {
                vowelCount += 1
            } else if consonants.contains(c) {
                consonantCount += 1
            }
        }
        return (vowelCount, consonantCount)
    }
    /**
     Write a function that accepts two strings, and returns true if they are identical in length but
     have no more than three different letters, taking case and string order into account.

    */
    func challenge11(first: String, second: String) -> Bool {
        let firstArray = Array(first)
        let secondArray = Array(second)
        var differences = 0
        for (index, value) in firstArray.enumerated() {
            if value != secondArray[index] {
                differences += 1
                if differences == 4 {
                    return false
                }
            }
        }
        return true
    }
    /**
     Write a function that accepts a string of words with a similar prefix, separated by spaces, and
     returns the longest substring that prefixes all words.
    */
    func challenge12(input: String) -> String {
        let words = input.components(separatedBy: " ")
        guard let first = words.first else { return "" }
        
        var bestPrefix = ""
        for c in first {
            bestPrefix.append(c)
            for word in words {
                if !word.hasPrefix(bestPrefix) {
                    bestPrefix.removeLast()
                    return bestPrefix
                }
            }
        }
        return bestPrefix
    }
    /**
     Write a function that accepts a string as input, then returns how often each letter is repeated in
     a single run, taking case into account.
    */
    func challenge13b(input: String) -> String {
        //1.
        var returnValue = ""
        var currentChar:Character?
        var letterCount = 0
        for c in input {
            if c == currentChar {
                letterCount += 1
            } else {
                if let char = currentChar {
                    returnValue += "\(char)\(letterCount)"
                }
                letterCount = 1
                currentChar = c
            }
            
        }
        if let char = currentChar {
            returnValue += "\(char)\(letterCount)"
        }
        return returnValue
        
        //2,
        /*var returnValue = ""
        var letterCount = 0
        let array = Array(input)
        for i in 0 ..< array.count {
            
            letterCount += 1
            if array.count == i+1 || array[i] != array[i+1] {
                returnValue += "\(array[i])\(letterCount)"
                letterCount = 0
            }
        }
        return returnValue*/
    }
    /**
     Write a function that prints all possible permutations of a given input string.
    */
    func challenge14(string: String, current: String = "") {
        let length = string.count
        let strArray = Array(string)
        if (length == 0) {
            // there's nothing left to re-arrange; print the result
            print(current)
            print("******")
        } else {
            print(current)
            // loop through every character
            for i in 0 ..< length {
                // get the letters before me
                let left = String(strArray[0 ..< i])
                // get the letters after me
                let right = String(strArray[i+1 ..< length])
                // put those two together and carry on
                challenge14(string: left + right, current: current +
                    String(strArray[i]))
            } }
    }
    func permute(items: String) -> [String] {
        var scratch = Array(items) // This is a scratch space for Heap's algorithm
        var result: [[Character]] = [] // This will accumulate our result
        
        // Heap's algorithm
        func heap(_ n: Int) {
            if n == 1 {
                result.append(scratch)
                return
            }
            
            for i in 0..<n-1 {
                heap(n-1)
                let j = (n%2 == 1) ? 0 : i
                scratch.swapAt(j, n-1)
            }
            heap(n-1)
        }
        
        // Let's get started
        heap(scratch.count)
        
        // And return the result we built up
        return result.map{ String($0) }
    }
    /**
     Write a function that returns a string with each of its words reversed but in the original order,
     without using a loop.
    */
    func challenge15(string: String) -> String {
        let wordArray = string.components(separatedBy: " ")
        let reverseWord = wordArray.map { String($0.reversed()) }
        return reverseWord.joined(separator: " ")
    }
}
