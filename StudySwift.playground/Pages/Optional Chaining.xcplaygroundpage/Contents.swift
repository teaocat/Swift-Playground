//: [Previous](@previous)

import Foundation

/// Optional Chaining 可选链式调用

/*
 可选链式调用是一种可以在当前值可能为nil的可选值上请求和调用属性、方法及下标的方法。如果可选值有值，那么调用就会成功；如果可选值是nil，那么调用将返回nil。多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为nil，整个调用链都会失败，即返回nil。
 
 注意
 Swift 的可选链式调用和 Objective-C 中向nil发送消息有些相像，但是 Swift 的可选链式调用可以应用于任意类型，并且能检查调用是否成功。
 */

/// Optional Chaining as an Alternative to Forced Unwrapping 使用可选链式调用代替强制展开
/*
 通过在想调用的属性、方法、或下标的可选值后面放一个问号（?），可以定义一个可选链。这一点很像在可选值后面放一个叹号（!）来强制展开它的值。它们的主要区别在于当可选值为空时可选链式调用只会调用失败，然而强制展开将会触发运行时错误。
 
 为了反映可选链式调用可以在空值（nil）上调用的事实，不论这个调用的属性、方法及下标返回的值是不是可选值，它的返回结果都是一个可选值。你可以利用这个返回值来判断你的可选链式调用是否调用成功，如果调用有返回值则说明调用成功，返回nil则说明调用失败。
 
 特别地，可选链式调用的返回结果与原本的返回结果具有相同的类型，但是被包装成了一个可选值。例如，使用可选链式调用访问属性，当可选链式调用成功时，如果属性原本的返回结果是Int类型，则会变为Int?类型。
 
 下面几段代码将解释可选链式调用和强制展开的不同。
 */
// 首先定义两个类Person和Residence：
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

/*
 Residence有一个Int类型的属性numberOfRooms，其默认值为1。Person具有一个可选的residence属性，其类型为Residence?。
 
 假如你创建了一个新的Person实例,它的residence属性由于是是可选型而将初始化为nil,在下面的代码中,john有一个值为nil的residence属性：
 */
let john = Person()
/*
 如果使用叹号（!）强制展开获得这个john的residence属性中的numberOfRooms值，会触发运行时错误，因为这时residence没有可以展开的值：
 
 let roomCount = john.residence!.numberOfRooms
 // 这会引发运行时错误
 
 john.residence为非nil值的时候，上面的调用会成功，并且把roomCount设置为Int类型的房间数量。正如上面提到的，当residence为nil的时候上面这段代码会触发运行时错误。
 
 可选链式调用提供了另一种访问numberOfRooms的方式，使用问号（?）来替代原来的叹号（!）：
 */
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// 打印 “Unable to retrieve the number of rooms.”
print("第\(#line)行上打印\n==========")

// 可以将一个Residence的实例赋给john.residence，这样它就不再是nil了：
john.residence = Residence()

// john.residence现在包含一个实际的Residence实例，而不再是nil。如果你试图使用先前的可选链式调用访问numberOfRooms，它现在将返回值为1的Int?类型的值：
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// 打印 “John's residence has 1 room(s).”
print("第\(#line)行上打印\n==========")


/// Defining Model Classes for Optional Chaining 为可选链式调用定义模型类
class Person2 {
    var residence: Residence2?
}
// Residence类比之前复杂些，增加了一个名为rooms的变量属性，该属性被初始化为[Room]类型的空数组：
class Residence2 {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
// Room类是一个简单类，其实例被存储在rooms数组中。该类只包含一个属性name，以及一个用于将该属性设置为适当的房间名的初始化函数：
class Room {
    let name: String
    init(name: String) { self.name = name }
}
// 最后一个类是Address，这个类有三个String?类型的可选属性。buildingName以及buildingNumber属性分别表示某个大厦的名称和号码，第三个属性street表示大厦所在街道的名称：
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}


/// Accessing Properties Through Optional Chaining 通过可选链式调用访问属性
// 下面的代码创建了一个Person2实例，然后像之前一样，尝试访问numberOfRooms属性：
let john2 = Person2()
if let roomCount = john2.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// 打印 “Unable to retrieve the number of rooms.”
print("第\(#line)行上打印\n==========")

// 还可以通过可选链式调用来设置属性值：
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john2.residence?.address = someAddress

// 上面代码中的赋值过程是可选链式调用的一部分，这意味着可选链式调用失败时，等号右侧的代码不会被执行。对于上面的代码来说，很难验证这一点，因为像这样赋值一个常量没有任何副作用。下面的代码完成了同样的事情，但是它使用一个函数来创建Address实例，然后将该实例返回用于赋值。该函数会在返回前打印“Function was called”，这使你能验证等号右侧的代码是否被执行。
func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}
john2.residence?.address = createAddress()
print("第\(#line)行上打印\n==========")


/// Calling Methods Through Optional Chaining 通过可选链式调用调用方法
//func printNumberOfRooms() {
//    print("The number of rooms is \(numberOfRooms)")
//}

if john2.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
// 打印 “It was not possible to print the number of rooms.”
print("第\(#line)行上打印\n==========")

// 同样的，可以据此判断通过可选链式调用为属性赋值是否成功。在上面的通过可选链式调用访问属性的例子中，我们尝试给john.residence中的address属性赋值，即使residence为nil。通过可选链式调用给属性赋值会返回Void?，通过判断返回值是否为nil就可以知道赋值是否成功：
if (john2.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}
// 打印 “It was not possible to set the address.”
print("第\(#line)行上打印\n==========")


/// Accessing Subscripts Through Optional Chaining 通过可选链式调用访问下标
/*
 通过可选链式调用，我们可以在一个可选值上访问下标，并且判断下标调用是否成功。
 
 注意
 通过可选链式调用访问可选值的下标时，应该将问号放在下标方括号的前面而不是后面。可选链式调用的问号一般直接跟在可选表达式的后面。
 
 下面这个例子用下标访问john.residence属性存储的Residence实例的rooms数组中的第一个房间的名称，因为john.residence为nil，所以下标调用失败了：
 */
if let firstRoomName = john2.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// 打印 “Unable to retrieve the first room name.”
print("第\(#line)行上打印\n==========")
/*
 在这个例子中，问号直接放在john.residence的后面，并且在方括号的前面，因为john.residence是可选值。
 
 类似的，可以通过下标，用可选链式调用来赋值：
 */
john2.residence?[0] = Room(name: "Bathroom")
/*
 这次赋值同样会失败，因为residence目前是nil。
 
 如果你创建一个Residence实例，并为其rooms数组添加一些Room实例，然后将Residence实例赋值给john.residence，那就可以通过可选链和下标来访问数组中的元素：
 */
let johnsHouse = Residence2()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john2.residence = johnsHouse

if let firstRoomName = john2.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// 打印 “The first room name is Living Room.”
print("第\(#line)行上打印\n==========")


/// Accessing Subscripts of Optional Type 访问可选类型的下标
// 如果下标返回可选类型值，比如 Swift 中Dictionary类型的键的下标，可以在下标的结尾括号后面放一个问号来在其可选返回值上进行可选链式调用：
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
// "Dave" 数组现在是 [91, 82, 84]，"Bev" 数组现在是 [80, 94, 81]
// 上面的例子中定义了一个testScores数组，包含了两个键值对，把String类型的键映射到一个Int值的数组。这个例子用可选链式调用把"Dave"数组中第一个元素设为91，把"Bev"数组的第一个元素+1，然后尝试把"Brian"数组中的第一个元素设为72。前两个调用成功，因为testScores字典中包含"Dave"和"Bev"这两个键。但是testScores字典中没有"Brian"这个键，所以第三个调用失败。


/// Linking Multiple Levels of Chaining 连接多层可选链式调用
/*
 可以通过连接多个可选链式调用在更深的模型层级中访问属性、方法以及下标。然而，多层可选链式调用不会增加返回值的可选层级。
 
 也就是说：
 
 如果你访问的值不是可选的，可选链式调用将会返回可选值。
 如果你访问的值就是可选的，可选链式调用不会让可选返回值变得“更可选”。
 因此：
 
 通过可选链式调用访问一个Int值，将会返回Int?，无论使用了多少层可选链式调用。
 类似的，通过可选链式调用访问Int?值，依旧会返回Int?值，并不会返回Int??。
 */
// 下面的例子尝试访问john中的residence属性中的address属性中的street属性。这里使用了两层可选链式调用，residence以及address都是可选值：
if let johnsStreet = john2.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// 打印 “Unable to retrieve the address.”
print("第\(#line)行上打印\n==========")

/*
 john.residence现在包含一个有效的Residence实例。然而，john.residence.address的值当前为nil。因此，调用john.residence?.address?.street会失败。
 
 需要注意的是，上面的例子中，street的属性为String?。john.residence?.address?.street的返回值也依然是String?，即使已经使用了两层可选链式调用。
 
 如果为john.residence.address赋值一个Address实例，并且为address中的street属性设置一个有效值，我们就能过通过可选链式调用来访问street属性：
 */
let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john2.residence?.address = johnsAddress

if let johnsStreet = john2.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// 打印 “John's street name is Laurel Street.”
print("第\(#line)行上打印\n==========")


/// Chaining on Methods with Optional Return Values 在方法的可选返回值上进行可选链式调用
/*
 上面的例子展示了如何在一个可选值上通过可选链式调用来获取它的属性值。我们还可以在一个可选值上通过可选链式调用来调用方法，并且可以根据需要继续在方法的可选返回值上进行可选链式调用。
 
 在下面的例子中，通过可选链式调用来调用Address的buildingIdentifier()方法。这个方法返回String?类型的值。如上所述，通过可选链式调用来调用该方法，最终的返回值依旧会是String?类型：
 */
if let buildingIdentifier = john2.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}
// 打印 “John's building identifier is The Larches.”
print("第\(#line)行上打印\n==========")

// 如果要在该方法的返回值上进行可选链式调用，在方法的圆括号后面加上问号即可：
if let beginsWithThe = john2.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}
// 打印 “John's building identifier begins with "The".”
print("第\(#line)行上打印\n==========")
/*
 注意
 在上面的例子中，在方法的圆括号后面加上问号是因为你要在buildingIdentifier()方法的可选返回值上进行可选链式调用，而不是方法本身。
 */
