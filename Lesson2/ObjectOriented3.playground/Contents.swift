import UIKit

class House
{
    var windowCount: Int?
    
    init(windowCount: Int)
    {
        self.windowCount = windowCount
    }
}

class Palace: House
{
    var towerCount: Int?
    
    init(towerCount: Int, windowCount: Int)
    {
        self.towerCount = towerCount
        super.init(windowCount: windowCount)
    }
}

class Villa: House
{
    var haveGarage: Bool?
    
    init(haveGarage: Bool, windowCount: Int)
    {
        self.haveGarage = haveGarage
        super.init(windowCount: windowCount)
    }
}

let topkapiPalace = Palace(towerCount: 5, windowCount: 300)
let bogazVilla = Villa(haveGarage: true, windowCount: 50)

print(topkapiPalace.towerCount!)
print(topkapiPalace.windowCount!)

print(bogazVilla.haveGarage!)
print(bogazVilla.windowCount!)

// MARK: - Downcasting, Upcasting

// House -> Palace      Downcasting
let hp = House(windowCount: 30) as? Palace

// House -> Villa       Downcasting
let hv = House(windowCount: 20) as? Villa

// Palace -> House      Upcasting
let ph = Palace(towerCount: 3, windowCount: 100) as House
if ph is House
{
    print("Nesne ev sınıfından türetilmiştir.")
}
else
{
    print("Nesne ev sınıfından türetilmemiştir.")
}


// Villa -> House       Upcasting
let vh = Villa(haveGarage: true, windowCount: 30) as House



// MARK: - Override


class Animal
{
    func makeSound()
    {
        print("I haven't sound :(")
    }
}

class Memeli: Animal
{
    
}

class Cat: Memeli
{
    override func makeSound() {
        print("Meow!")
    }
}

class Dog: Memeli
{
    override func makeSound() {
        print("Hav!")
    }
}

let a = Animal()
let m = Memeli()
let c = Cat()
let d = Dog()

a.makeSound()
m.makeSound()
c.makeSound()
d.makeSound()

