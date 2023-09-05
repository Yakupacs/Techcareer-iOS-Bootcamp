import UIKit

// MARK: - Comparison Operators

var a = 40
var b = 50

var x = 90
var y = 80

print("a == b: \(a == b)")
print("a != b: \(a != b)")
print("a >  b: \(a > b)")
print("a >= b: \(a >= b)")
print("a <  b: \(a < b)")
print("a <= b: \(a <= b)")

print("a > b || x > y : \(a > b || x > y)")
print("a > b && x > y : \(a > b && x > y)")

// MARK: - Control Statements

let name = "Yakup"
let age = 23

if (age >= 18) {
    print("You are an adult.")
}
else {
    print("You aren't an adult.")
}

if (name == "Yakup") {
    print("I know \(name)")
}
else if (name == "Ali") {
    print("I know \(name)")
}
else {
    print("I don't know \(name)")
}

var username = "admin"
var password = 12345

if (username == "admin" && password == 12345)
{
    print("Login is success")
}
else
{
    print("Login failed")
}

var result = 42

if (result == 42 || result == 41)
{
    print("Result is 42 or 41")
}
else
{
    print("Result isn't 42 or 41")
}

// MARK: - Ternary Operator

var z = 10
var t = 20

z == t ? print("10 is equal 20") : print("10 is not equal 20")

// MARK: - Switch

var day = 4

switch day{
    case 1:
        print("Today is Monday")
    case 2:
        print("Today is Tuesday")
    case 3:
        print("Today is Wednesday")
    case 4:
        print("Today is Thursday")
    case 5:
        print("Today is Friday")
    case 6:
        print("Today is Satuday")
    case 7:
        print("Today is Sunday")
    default:
        break
}

// MARK: - FOR EACH

for index in 1...3
{
    print("Loop 1:", index)
}

for index in stride(from: 5, through: 25, by: 5)
{
    print("Loop 2:", index)
}

for index in stride(from: 0, through: -25, by: -5)
{
    print("Loop 3:", index)
}

// MARK: - WHILE

var counter = 0

while (counter < 3)
{
    print("Loop 4:", counter)
    counter += 1
}

// MARK: - BREAK

for i in 1...5
{
    if (i == 3)
    {
        break
    }
    print("Loop 5: \(i)")
}
