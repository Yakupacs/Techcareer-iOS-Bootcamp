import UIKit

// MARK: - Set - HashSet

var fruits = Set<String>()

fruits.insert("Apple")
fruits.insert("Orange")
fruits.insert("Banana")

print(fruits)

fruits.insert("Amasya Apple")

print(fruits)

print("Size: \(fruits.count)\n")

fruits.remove("Orange")

for (i,fruit) in fruits.enumerated()
{
    print("\(i + 1).\(fruit)")
}

var index = fruits.firstIndex(of: "Apple")
fruits.remove(at: index!)

print("")

for (i,fruit) in fruits.enumerated()
{
    print("\(i + 1).\(fruit)")
}

fruits.removeAll()

print("")

for (i,fruit) in fruits.enumerated()
{
    print("\(i + 1).\(fruit)")
}


// MARK: - Dictionary - Map - HashMap

var cities = [Int: String]()

// APPEND
cities[34] = "Istanbul"
cities[16] = "Bursa"
cities[01] = "Adana"
cities[06] = "Ankara"

// UPDATE
cities[34] = "New Istanbul"

print(cities)

for (key, value) in cities
{
    print("\(value) city code is \(key).")
}

print("---------------------")
cities.removeValue(forKey: 6)

for (key, value) in cities
{
    print("\(value) city code is \(key).")
}
