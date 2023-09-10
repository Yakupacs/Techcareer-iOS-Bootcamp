import UIKit

// MARK: - PROTOCOL

protocol MyProtocol
{
    var variable: Int { get set }
    
    func method1()
    func method2() -> String
}

class ClassA : MyProtocol
{
    var variable: Int = 42

    func method1() {
        print("Method1 called.")
    }
    
    func method2() -> String {
        return "Method2 called."
    }
    

}

let classA = ClassA()
print(classA.variable)
classA.method1()
print(classA.method2())

// MARK: - EXTENSION

extension Int
{
    func multiple(num: Int) -> Int
    {
        return (num * self)
    }
}

print(3.multiple(num: 3))


// MARK: - CLOSURE

let expression = {
    print("Closure çalıştı")
}

expression()
