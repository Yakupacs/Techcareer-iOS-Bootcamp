import UIKit

// MARK: ARRAY, SET, DICTIONARY
// Set içerisinde girilen veriler karışık bir şekilde depolanıyor. Set yalnızca farklı elemanları tutar.

var numbers = [42,43,44]
var fruits = [String]()

// Append
fruits.append("Apple")
fruits.append("Peach")
fruits.append("Strawberry")

print(fruits)

// Update
fruits[0] = "New Apple"
print(fruits)

// Insert
fruits.insert("Orange", at: 1)
print(fruits)

// Read
let fruit = fruits[2]
print(fruit)


print("Empty check   : \(fruits.isEmpty)") // Empty check   : false
print("Size          : \(fruits.count)")   // Size          : 4
print("First element : \(fruits.first!)")  // First element : New Apple
print("Last element  : \(fruits.last!)")   // Last element  : Strawberry
print("Is contains   : \(fruits.contains("New Apple"))") // Is contains   : true
print("Find Index    : \(fruits.firstIndex(of: "Orange")!)") // Find Index    : 1


// Foreach
for fruit in fruits
{
    print("Result: \(fruit)")
}

for (i, fruit) in fruits.enumerated()
{
    print("\(i + 1).\(fruit)")
}

fruits.remove(at: 1)
print(fruits)

fruits.removeAll()
print(fruits)


class Food
{
    var id: Int?
    var name: String?
    var price: Int?
    var rate: Double?
    
    init(id: Int, name: String, price: Int, rate: Double) {
        self.id = id
        self.name = name
        self.price = price
        self.rate = rate
    }
}

var f1 = Food(id: 1, name: "Hamburger", price: 59, rate: 4.7)
var f2 = Food(id: 2, name: "Big Chicken", price: 139, rate: 3.8)
var f3 = Food(id: 3, name: "Süper İkili", price: 89, rate: 4.1)

var foods = [Food]()
foods.append(f1)
foods.append(f2)
foods.append(f3)

for food in foods
{
    print("Id: \(food.id!) - Name: \(food.name!) - Price: \(food.price!)₺ - Rate: \(food.rate!)")
}

 // Filter
var filtered = foods.filter { $0.price! > 100 && $0.rate! > 3.7}

for filter in filtered
{
    print("Filtered -> Id: \(filter.id!) - Name: \(filter.name!) - Price: \(filter.price!)₺ - Rate: \(filter.rate!)")
}
