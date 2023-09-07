import UIKit

class Function
{
    func sayHi() -> Void
    {
        let say = "Hello World!"
        print(say)
    }
    
    func sum() -> String
    {
        let result = "Hello World"
        return result
    }
    
    func sayHiTo(to name: String)
    {
        print("Hello \(name)!")
    }
    
    func sum(_ number1: Float, _ number2: Float) -> Float
    {
        return (number1 + number2)
    }
    
    // Overloading
    func sum(_ number1: Int, _ number2: Int) -> Int
    {
        return (number1 + number2)
    }
    
    func sum(_ string1: String, _ string2: String) -> String
    {
        return ("\(string1) \(string2)")
    }
}

let f = Function()

f.sayHi()
print(f.sum())
f.sayHiTo(to: "Yakup")
print(f.sum(23.42, 32.43))
print(f.sum(23, 32))
print(f.sum("Yakup", "Açış"))

// MARK: - AClass

class AClass
{
    var x = 10
    
    // Static tanımlandığında Sınıf ismi ile method'a erişebiliyoruz!
    static func method()
    {
        print("Method called!")
    }
}

let a = AClass()
AClass.method()

//print(a.x)
//a.method()
//
// Virtual Object - Sanal Nesne - Nameless Object - İsimsiz Nesne
//print(AClass().x)
//AClass().method()

// MARK: - Enum

enum ConserveSize
{
    case small
    case medium
    case large
}

func calculatePrice(boyut: ConserveSize, size: Int)
{
    switch boyut
    {
    case .small: print("Price is \(size * 10)₺")
    case .medium: print("Price is \(size * 25)₺")
    case .large: print("Price is \(size * 47)₺")
    }
}

calculatePrice(boyut: .medium, size: 30)

class Category
{
    var categoryID: Int?
    var categoryName: String?
    
    init(id: Int, name: String)
    {
        self.categoryID = id
        self.categoryName = name
    }
}

class Director
{
    var directorID: Int?
    var directorName: String?
    
    init(id: Int, name: String) {
        self.directorID = id
        self.directorName = name
    }
}

class Movie
{
    var movieID: Int?
    var movieName: String?
    var movieYear: Int?
    var movieCategory: Category? // Composition
    var movieDirector: Director? // Composition
    
    init(id: Int, name: String, year: Int, category: Category, director: Director) {
        self.movieID = id
        self.movieName = name
        self.movieYear = year
        self.movieCategory = category
        self.movieDirector = director
    }
}

let c1 = Category(id: 1, name: "Drama")
let c2 = Category(id: 2, name: "Science Fiction")

let d1 = Director(id: 1, name: "Quentin Tarantino")
let d2 = Director(id: 2, name: "Christopher Nolan")

let m1 = Movie(id: 1, name: "Django", year: 2013, category: c1, director: d1)
let m2 = Movie(id: 2, name: "Inception", year: 2013, category: c2, director: d2)

print("Movie id:       \(m1.movieID!)")
print("Movie name:     \(m1.movieName!)")
print("Movie year:     \(m1.movieYear!)")
print("Movie category: \(m1.movieCategory!.categoryName!)")
print("Movie director: \(m1.movieDirector!.directorName!)")
