//
//  ViewController.swift
//  SwiftChallange
//
//  Created by Faisal Iqbal on 11/02/18.
//  Copyright © 2018 Faisal Iqbal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var string:FString = FString()
    var number:FNumber = FNumber()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        testStringChallanges()
        //testNumberChallanges()
    }

    func testStringChallanges() {
        //print(string.challenge1a(input: "hello world"))
        //print(string.challenge2a(str: "asdfghgfdsa"))
        //print(string.challenge3a(string1: "abcd", string2: "Dcba"))
        //print(string.challenge4a(string1: "abcdef", contains: "abed"))
        //print(string.challenge5a(input: "abcdabcd", count: "c"))
        //print(string.challenge6a(string: "abcdabcdabcd"))
        //print(string.challenge7a(input: "a      b      c       d  ef"))
        //print(string.challenge7b(input: "aaabbbcccdddaaabbbcccddd"))
        //print(string.challenge8(input: "abcdefgh", rotated: "efghabcd"))
        //print(string.challenge9(input: "The quick brown fox jumps over the lazy dog"))
        //print(string.challenge10c(string: "abcdef"))
        //print(string.challenge11(first: "Clamp", second: "Grams"))
        //print(string.challenge12(input: "swift switch swill swim"))
        print(string.challenge13b(input: "aaabbbcdeff"))
        //print(string.challenge14(string: "abc"))
        //print(string.challenge15(string: "a hello world"))
        
        let perms = string.permute(items: "ABC") // Get the character permutations
        print(perms) // output if you like
    }
    
    func testNumberChallanges() {
       // print(number.challenge16a())
        //print(number.challenge17(min: 2, max: 10))
        //print(number.challenge18a(number: 2, power: 5))
        /*var a = 10, b = 20
        number.challenge19a(a: &a, b: &b)
        print("a = \(a), b = \(b)")*/
        //print(number.challenge21b(number: 12))
        //print(number.challenge22(number: 8))
        //print(number.challenge23(input: "2"))
        //print(number.challenge24a(string: "as10d6f20h4"))
        //print(number.challenge25a(input: 64))
        //print(number.challenge25b(input: 2))
        print(number.challenge26a(subtract: 3, from: 93))
    }

}

