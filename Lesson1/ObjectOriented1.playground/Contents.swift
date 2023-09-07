import UIKit

class Product
{
    private var color : UIColor?
    private var price : Double?
    private var stock : Int = 0
    
    // Shadowing
    init(color: UIColor, price: Double, stock: Int) {
        print("Constructor called.")
        self.color = color
        self.price = price
        self.stock = stock
    }
    
    func printProduct()
    {
        print("---------------------")
        print("Color: \(self.color!)")
        print("Price: \(self.price!)₺")
        print("Stock: \(self.stock)")
        print("---------------------")
    }
    func sellProduct()
    {
        if (self.stock > 0)
        {
            self.stock -= 1
            print("The sale is successful. Current stock is \(self.stock)")
        }
        else
        {
            print("The product is out of stock.")
        }
    }
    func priceIncrease(price: Double)
    {
        self.price! += price
        print("New price is \(String(describing: self.price!))₺")
    }
    func priceDecrease(price: Double)
    {
        self.price! -= price
        print("New price is \(String(describing: self.price!))₺")
    }
}

let television = Product(color: UIColor.black, price: 27999.99, stock: 2)

television.printProduct()
television.sellProduct()
television.sellProduct()
television.sellProduct()
television.priceIncrease(price: 1000.0)
television.priceDecrease(price: 3000.0)


