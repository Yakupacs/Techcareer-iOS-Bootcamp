import UIKit

// MARK: - Guard

func person(name: String)
{
    if (name == "Yakup")
    {
        print("If - Hello Yakup!")
    }
    else
    {
        print("If - Unknown User!")
    }
}
person(name: "Yakup")
person(name: "Yakupp")


func person2(name: String)
{
    guard name == "Yakup" else {
        print("Guard - Unknown User!")
        return
    }
    print("Guard - Hello Yakup!")
}

person2(name: "Yakup")
person2(name: "Yakupp")

// MARK: - Try Catch

// Compile error
let number = 10
// number = 50

// Runtime error: Exception
let number1 = 10
let number2 = 0

enum ErrorCodes: Error
{
    case zeroDividedError
}

func divided(num1: Int, num2: Int) throws -> Int
{
    if (num2 == 0)
    {
        throw ErrorCodes.zeroDividedError
    }
    return (num1 / num2)
}

do{
    let result = try divided(num1: number1, num2: number2)
    print(result)
}catch{
    print("Error!")
}

let result1 = try? divided(num1: 10, num2: 1)

if let result = result1
{
    print(result)
}
else
{
    
}
