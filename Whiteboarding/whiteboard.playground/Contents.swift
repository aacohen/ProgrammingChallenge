//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func primeNumber () -> [Int] {
    var primeNumberArray = [Int]()
    
    
    for i in 1...1000 {
        var divisibleCount = 0
        for x in  1...i {
            if i % x == 0 {
                divisibleCount += 1
            }
        }
        if divisibleCount == 2 {
            primeNumberArray.append(i)
        }
        
    }
    return primeNumberArray
}

print(primeNumber())

