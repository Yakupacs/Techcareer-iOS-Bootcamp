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
