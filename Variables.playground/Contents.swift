import UIKit

var allFeature = [Any]()

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd/MM/yyyy"

let city = "Istanbul"
let country = "Turkey"
let telephone = 90_534_627_24_17
let postalCode = 34344
let email = "ykpacs@gmail.com"
let job = "Computer Engineer"
let stockQuantity = 547
let customerName = "Kasım"
let balance = 425.25
let birthday = dateFormatter.date(from: "09/04/2000")
let salary = 8544.25
let maritalStatus = false
let productReview = "Nice product!"
let paymentDate = dateFormatter.date(from: "07/09/2023")
let payment = "Cash"
let orderQuantity = 30
let carModel = "Tesla"
let bookName = "Melekler ve Şeytanlar"
let releaseDate = dateFormatter.date(from: "02/09/2023")
let discountAmount = 20.50
let roomCount = 3
let latitude = 47.23
let longitude = 23.41
let productName = "Shoe"
let mealPrice = 99.99
let trademark = "Nike"
let musicName = "Farid Farjad - Beyada Gity"
let videoDuration = 120
let productScore = 4.5
let imageName = "image.png"
let fileFormat = ".txt"
let color = UIColor.blue
let colorCode = 0x1F1F1F
let telephoneModel = "Iphone 14 Pro"
let screenSize = (1080, 720)
let weight = 85.5
let nationalDay = "30 Ağustos"
let vacationDay = dateFormatter.date(from: "30/08/2023")
let reservationDate = dateFormatter.date(from: "05/09/2023")
let streetName = "Kuskonmaz Street"
let busLine = "62G"
let remainingMinute = 30
let trackingCode = 53869237473
let couponDuration = 32
let couponCode = 2543735346
let billingAddress = "My Address"

allFeature.append(city)
allFeature.append(country)
allFeature.append(telephone)
allFeature.append(postalCode)
allFeature.append(email)
allFeature.append(job)
allFeature.append(stockQuantity)
allFeature.append(customerName)
allFeature.append(balance)
allFeature.append(birthday!)
allFeature.append(salary)
allFeature.append(maritalStatus)
allFeature.append(productReview)
allFeature.append(paymentDate!)
allFeature.append(payment)
allFeature.append(orderQuantity)
allFeature.append(carModel)
allFeature.append(bookName)
allFeature.append(releaseDate!)
allFeature.append(discountAmount)
allFeature.append(roomCount)
allFeature.append(latitude)
allFeature.append(longitude)
allFeature.append(productName)
allFeature.append(mealPrice)
allFeature.append(trademark)
allFeature.append(videoDuration)
allFeature.append(productScore)
allFeature.append(imageName)
allFeature.append(fileFormat)
allFeature.append(color)
allFeature.append(colorCode)
allFeature.append(telephoneModel)
allFeature.append(screenSize)
allFeature.append(weight)
allFeature.append(nationalDay)
allFeature.append(vacationDay!)
allFeature.append(reservationDate!)
allFeature.append(streetName)
allFeature.append(busLine)
allFeature.append(remainingMinute)
allFeature.append(trackingCode)
allFeature.append(couponDuration)
allFeature.append(couponCode)
allFeature.append(billingAddress)

for (index,item) in allFeature.enumerated()
{
    if let date = (item as AnyObject) as? Date{
        let dateString = dateFormatter.string(from: date)
        print("\(index + 1).feature: \(dateString)")
    }
    else
    {
        print("\(index + 1).feature: \(item)")
    }
}
