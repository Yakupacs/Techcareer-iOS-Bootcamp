import UIKit

class Homework
{
    func toFahrenheit(value: Double) -> Double
    {
        return (value * 1.8 + 32)
    }

    func rectanglePerimeter(_ p1: Double, _ p2: Double, _ p3: Double, _ p4: Double)
    {
        print(p1 + p2 + p3 + p4)
    }
    
    func factorial(_ num: Int) -> Int
    {
        if (num == 0)
        {
            return (1)
        }
        if (num <= 1)
        {
            return num
        }
        else
        {
            return (factorial(num - 1) * num)
        }
    }
    
    func findALetter(_ str: String)
    {
        var count = 0
        var i = str.startIndex
        
        while (i < str.endIndex)
        {
            if (str[i] == "a" || str[i] == "A")
            {
                count += 1
            }
            i = str.index(after: i)
        }
        
        print("'a' or 'A' letter count is \(count)")
    }
    
    func sumOfInteriorAngles(_ edge: Int) -> Int
    {
        return ((edge - 2) * 180)
    }
    
    func salaryCalculation(_ day: Int) -> Int
    {
        var extra = 0
        var worked = day * 8
        if (worked > 160)
        {
            extra = worked - 160
        }
        var salary = (10 * (worked - extra)) + (20 * (extra))
        return salary
    }
    
    func calculateQuota(_ quota: Int) -> Int
    {
        var extra = 0
        var price = 0
        
        if (quota > 50)
        {
            extra = quota - 50
        }
        price = (extra * 4) + 100
        return price
    }
}

var h = Homework()

print("The fahrenheit of 34.5 is \(h.toFahrenheit(value: 34.5))")   // The fahrenheit of 34.5 is 94.1
h.rectanglePerimeter(10.5, 20.11, 30.05, 40.01)                     // 100.66999999999999
print("The factorial of 5 is \(h.factorial(5))")                    // The factorial of 5 is 120
h.findALetter("Yakup Açış Selam")                                   // 'a' or 'A' letter count is 3
print("The salary of 180 day is \(h.salaryCalculation(180))₺")      // The salary of 180 day is 27200₺
print("The quota of 70GB is \(h.calculateQuota(70))₺")              // The quota of 70GB is 180₺
