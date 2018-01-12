//: [Previous](@previous)

import Foundation

/// Enumerations 枚举

/// Enumerations Syntax 枚举语法
// 使用enum关键词来创建枚举并且把它们的整个定义放在一对大括号内：
enum SomeEnumeration {
    // 枚举定义放在这里
}

// 下面是用枚举表示指南针四个方向的例子：
enum CompassPoint {
    case north
    case south
    case east
    case west
}
// 枚举中定义的值（如 north，south，east和west）是这个枚举的成员值（或成员）。你可以使用case关键字来定义一个新的枚举成员值。
/*
 注意
 与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的CompassPoint例子中，north，south，east和west不会被隐式地赋值为0，1，2和3。相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的CompassPoint类型。
 */

// 多个成员值可以出现在同一行上，用逗号隔开：
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
// 每个枚举定义了一个全新的类型。像 Swift 中其他类型一样，它们的名字（例如CompassPoint和Planet）应该以一个大写字母开头。给枚举类型起一个单数名字而不是复数名字，以便于读起来更加容易理解：

var directionToHead = CompassPoint.west
// directionToHead的类型可以在它被CompassPoint的某个值初始化时推断出来。一旦directionToHead被声明为CompassPoint类型，你可以使用更简短的点语法将其设置为另一个CompassPoint的值：

directionToHead = .north
// 当directionToHead的类型已知时，再次为其赋值可以省略枚举类型名。在使用具有显式类型的枚举值时，这种写法让代码具有更好的可读性。


/// Matching Enumeration Values with a Switch Statement 使用 Switch 语句匹配枚举值
// 你可以使用switch语句匹配单个枚举值：
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// 打印 "Watch out for penguins”
print("在\(#line)上面打印\n----------")

/*
 正如在控制流中介绍的那样，在判断一个枚举类型的值时，switch语句必须穷举所有情况。如果忽略了.west这种情况，上面那段代码将无法通过编译，因为它没有考虑到CompassPoint的全部成员。强制穷举确保了枚举成员不会被意外遗漏。
 
 当不需要匹配每个枚举成员的时候，你可以提供一个default分支来涵盖所有未明确处理的枚举成员：
 */
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// 打印 "Mostly harmless”
print("在\(#line)上面打印\n----------")


/// Associated Values 关联值
// 在 Swift 中，使用如下方式定义表示两种商品条形码的枚举：
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
/*
 以上代码可以这么理解：
 
 “定义一个名为Barcode的枚举类型，它的一个成员值是具有(Int，Int，Int，Int)类型关联值的upc，另一个成员值是具有String类型关联值的qrCode。”
 
 这个定义不提供任何Int或String类型的关联值，它只是定义了，当Barcode常量和变量等于Barcode.upc或Barcode.qrCode时，可以存储的关联值的类型。
 
 然后可以使用任意一种条形码类型创建新的条形码，例如：
 */
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
// 上面的例子创建了一个名为productBarcode的变量，并将Barcode.upc赋值给它，关联的元组值为(8, 85909, 51226, 3)。

// 同一个商品可以被分配一个不同类型的条形码，例如：
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
/*
 这时，原始的Barcode.upc和其整数关联值被新的Barcode.qrCode和其字符串关联值所替代。Barcode类型的常量和变量可以存储一个.upc或者一个.qrCode（连同它们的关联值），但是在同一时间只能存储这两个值中的一个。
 
 像先前那样，可以使用一个 switch 语句来检查不同的条形码类型。然而，这一次，关联值可以被提取出来作为 switch 语句的一部分。你可以在switch的 case 分支代码中提取每个关联值作为一个常量（用let前缀）或者作为一个变量（用var前缀）来使用：
 */
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// 打印 "QR code: ABCDEFGHIJKLMNOP."
print("在\(#line)上面打印\n----------")
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
// 打印 "QR code: ABCDEFGHIJKLMNOP."
print("在\(#line)上面打印\n----------")


/// Raw Value 原始值
// 在关联值小节的条形码例子中，演示了如何声明存储不同类型关联值的枚举成员。作为关联值的替代选择，枚举成员可以被默认值（称为原始值）预填充，这些原始值的类型必须相同。
// 这是一个使用 ASCII 码作为原始值的枚举：
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
// 枚举类型ASCIIControlCharacter的原始值类型被定义为Character，并设置了一些比较常见的 ASCII 控制字符。Character的描述详见字符串和字符部分。
/*
 原始值可以是字符串，字符，或者任意整型值或浮点型值。每个原始值在枚举声明中必须是唯一的。
 注意
 原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值，像上述三个 ASCII 码。对于一个特定的枚举成员，它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化。
 */


/// Implicitly Assigned Raw Values 原始值的隐式赋值
/*
 在使用原始值为整数或者字符串类型的枚举时，不需要显式地为每一个枚举成员设置原始值，Swift 将会自动为你赋值。
 
 例如，当使用整数作为原始值时，隐式赋值的值依次递增1。如果第一个枚举成员没有设置原始值，其原始值将为0。
 
 下面的枚举是对之前Planet这个枚举的一个细化，利用整型的原始值来表示每个行星在太阳系中的顺序：
 */
enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
/*
 在上面的例子中，Plant.mercury的显式原始值为1，Planet.venus的隐式原始值为2，依次类推。
 
 当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称。
 
 下面的例子是CompassPoint枚举的细化，使用字符串类型的原始值来表示各个方向的名称：
 */
enum CompassPoint2: String {
    case north, south, east, west
}
/*
 上面例子中，CompassPoint.south拥有隐式原始值south，依次类推。
 
 使用枚举成员的rawValue属性可以访问该枚举成员的原始值：
 */
let earthsOrder = Planet2.earth.rawValue
// earthsOrder 值为 3

let sunsetDirection = CompassPoint2.west.rawValue
// sunsetDirection 值为 "west"


/// Initializing from a Raw Value 使用原始值初始化枚举实例
/*
 如果在定义枚举类型的时候使用了原始值，那么将会自动获得一个初始化方法，这个方法接收一个叫做rawValue的参数，参数类型即为原始值类型，返回值则是枚举成员或nil。你可以使用这个初始化方法来创建一个新的枚举实例。
 
 这个例子利用原始值7创建了枚举成员uranus：
 */
let possiblePlanet = Planet2(rawValue: 7)
// possiblePlanet 类型为 Planet? 值为 Planet.uranus
/*
 然而，并非所有Int值都可以找到一个匹配的行星。因此，原始值构造器总是返回一个可选的枚举成员。在上面的例子中，possiblePlanet是Planet?类型，或者说“可选的Planet”。
 注意
 原始值构造器是一个可失败构造器，因为并不是每一个原始值都有与之对应的枚举成员。
 */
// 如果你试图寻找一个位置为11的行星，通过原始值构造器返回的可选Planet值将是nil：
let positionToFind = 11
if let somePlanet = Planet2(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
// 输出 "There isn't a planet at position 11
// 这个例子使用了可选绑定（optional binding），试图通过原始值11来访问一个行星。if let somePlanet = Planet(rawValue: 11)语句创建了一个可选Planet，如果可选Planet的值存在，就会赋值给somePlanet。在这个例子中，无法检索到位置为11的行星，所以else分支被执行。
print("在\(#line)上面打印\n----------")


/// Recursive Enumerations 递归枚举
/*
 递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上indirect来表示该成员可递归。
 
 例如，下面的例子中，枚举类型存储了简单的算术表达式：
 */
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
// 你也可以在枚举类型开头加上indirect关键字来表明它的所有成员都是可递归的：
indirect enum ArithmeticExpression2 {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
/*
 上面定义的枚举类型可以存储三种算术表达式：纯数字、两个表达式相加、两个表达式相乘。枚举成员addition和multiplication的关联值也是算术表达式——这些关联值使得嵌套表达式成为可能。例如，表达式(5 + 4) * 2，乘号右边是一个数字，左边则是另一个表达式。因为数据是嵌套的，因而用来存储数据的枚举类型也需要支持这种嵌套——这意味着枚举类型需要支持递归。下面的代码展示了使用ArithmeticExpression这个递归枚举创建表达式(5 + 4) * 2
 */
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
// 打印 "18"
