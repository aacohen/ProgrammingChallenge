//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func reverseDigits (int: [Int]) -> [Int] {
    var newIntArray: [Int] = []
    var indexArray: [Int] = []
    for (index, value) in int.enumerated() {
        if value < 0 {
            newIntArray.insert(abs(value), at: 0)
            indexArray.append(index)
        } else {
            newIntArray.insert(value, at: 0) }
    }
    for index in indexArray {
        var result = newIntArray[index]
        newIntArray[index] = -result
    }
    
     return newIntArray
}

reverseDigits(int: [-1,2,3, -6, 8])
