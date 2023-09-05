import UIKit

// MARK: - OPTIONAL - NULLABLE - NULL SAFETY
// nil, null, NaN, ?, !

var message : String?
print(message)

message = "Hello World!"
print(message)

if message != nil
{
    print(message!) // Unwrapped
}
else
{
    print("Message is nil.")
}

// MARK: - Optional binding
if let temp = message // Unwrapped
{
    print(temp)
}
else
{
    print("Temp is nil.")
}

if var temp = message // Unwrapped
{
    print(temp)
}
else
{
    print("Temp is nil.")
}


