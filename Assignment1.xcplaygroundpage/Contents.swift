//: [Previous](@previous)

//use swift/any language
//
//Reverse array program
//Prime number finder from the given array
//Even odd finder from given array
//Find factorial of a given number
//
//
//Given an array [1,2,3,4,5,6] and groupSize = 2, produce array: [[1,2], [3,4], [5,6]]
//Test case 2 = [1,2,3,4,5,6, 7] and groupSize = 2, produce  array: [[1,2], [3,4], [5,6]]


import Foundation

func reverseArray (a: Array<Any>) -> Array<Any> {
    var reversedArray = Array<Any>()
    
    if a.isEmpty {
        return a
    }
    reversedArray = a.reversed()
    return reversedArray
}


func isPrime (num: Int) -> String {
    var count = 2
    while count < num {
        if num % count == 0 {
            return "Not Prime"
        }
        count += 1
    }
    return "Prime"
}


func evenOddFinder(a: Array<Int>) {
    var even = Array<Int>()
    var odd = Array<Int>()
    
    for item in a {
        if item % 2 == 0 {
            even.append(item)
        } else {
            odd.append(item)
        }
    }
    print("Even Elements: ")
    for item in even {
        print(item)
    }
    
    print("Odd Elements: ")
    for item in odd {
        print(item)
    }
}

func findFactorial(num: Int) -> Int {
    var f = 1
    
    if(num == 0 || num == 1) {
        return num
    }
    
    for n in stride(from: num, to: 1, by: -1) {
        f *= n
    }
    return f
}



func arrayGrouping(arr: Array<Any>, groupSize: Int) -> Array<Any> {
    var iterator = 0
    var tempArray = Array<Any>()
    var slice = ArraySlice<Any>()
    var chunk = Array<Any>()
    
    
    while (iterator + groupSize-1) < arr.count {
        slice = arr[iterator...(iterator+groupSize-1)]
        chunk = Array(slice)
        tempArray.append(chunk)
        iterator += groupSize
    }
    return tempArray
}




//TEST CASES
var arr:[Any] = ["b", 0, 0, "y", "a", "h"]
arr = reverseArray(a: arr)
print("Array Reverse Function Output: ")

for item in arr {
    print(item)
}

print("")



print("Prime Number Finder Output: ")

let twentyFive = 25
let sixtyOne = 61
let sixtyThree = 63

print("25 is " + isPrime(num: twentyFive))
print("61 is " + isPrime(num: sixtyOne))
print("63 is " + isPrime(num: sixtyThree))

print("")



let arrNums = [1,2,3,4,5,6,7,8,9,10]
print("Even/Odd Finder Function Output: ")
evenOddFinder(a: arrNums)

let seven = findFactorial(num: 7)
let zero = findFactorial(num: 0)
let ten = findFactorial(num: 10)
let one = findFactorial(num: 1)
print("Factorial Function Output: ")
print("The Factorial of 0 is: \(zero)")
print("The Factorial of 1 is: \(one)")
print("The Factorial of 7 is: \(seven)")
print("The Factorial of 10 is: \(ten)")

print("")


print("Array Grouping Function Output: ")
var groupArr:[Any] = [1,2,3,4,5,6]
var groupArr2:[Any] = [1,2,3,4,5,6,7]

print("Group 1:")


print("\(arrayGrouping(arr: groupArr, groupSize: 2))")

print("Group 2:")

print("\(arrayGrouping(arr: groupArr2, groupSize: 2))")

//: [Next](@next)
