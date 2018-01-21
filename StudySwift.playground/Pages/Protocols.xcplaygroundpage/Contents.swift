//: [Previous](@previous)

import Foundation

/// Protocols 协议

/// Protocols 协议语法
/*
 协议的定义方式与类、结构体和枚举的定义非常相似：
 
 protocol SomeProtocol {
     // 这里是协议的定义部分
 }
 要让自定义类型遵循某个协议，在定义类型时，需要在类型名称后加上协议名称，中间以冒号（:）分隔。遵循多个协议时，各协议之间用逗号（,）分隔：
 
 struct SomeStructure: FirstProtocol, AnotherProtocol {
     // 这里是结构体的定义部分
 }
 拥有父类的类在遵循协议时，应该将父类名放在协议名之前，以逗号分隔：
 
 class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
     // 这里是类的定义部分
 }
 */


/// Property Requirements 属性要求
/*
 协议可以要求遵循协议的类型提供特定名称和类型的实例属性或类型属性。协议不指定属性是存储型属性还是计算型属性，它只指定属性的名称和类型。此外，协议还指定属性是可读的还是可读可写的。
 
 如果协议要求属性是可读可写的，那么该属性不能是常量属性或只读的计算型属性。如果协议只要求属性是可读的，那么该属性不仅可以是可读的，如果代码需要的话，还可以是可写的。
 
 协议总是用 var 关键字来声明变量属性，在类型声明后加上 { set get } 来表示属性是可读可写的，可读属性则用 { get } 来表示：
 
 protocol SomeProtocol {
     var mustBeSettable: Int { get set }
     var doesNotNeedToBeSettable: Int { get }
 }
 */
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}
protocol FullyNamed {
    var fullName: String { get }
}

// 下面是一个遵循 FullyNamed 协议的简单结构体：
struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")
// john.fullName 为 "John Appleseed"

// 下面是一个更为复杂的类，它适配并遵循了 FullyNamed 协议：
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
// ncc1701.fullName 是 "USS Enterprise"


/// Method Requirements 方法要求
/*
 协议可以要求遵循协议的类型实现某些指定的实例方法或类方法。这些方法作为协议的一部分，像普通方法一样放在协议的定义中，但是不需要大括号和方法体。可以在协议中定义具有可变参数的方法，和普通方法的定义方式相同。但是，不支持为协议中的方法的参数提供默认值。
 
 正如属性要求中所述，在协议中定义类方法的时候，总是使用 static 关键字作为前缀。当类类型遵循协议时，除了 static 关键字，还可以使用 class 关键字作为前缀：
 
 protocol SomeProtocol {
     static func someTypeMethod()
 }
 */

// 下面的例子定义了一个只含有一个实例方法的协议:
protocol RandomNumberGenerator {
    func random() -> Double
}
/*
 RandomNumberGenerator 协议要求遵循协议的类型必须拥有一个名为 random， 返回值类型为 Double 的实例方法。尽管这里并未指明，但是我们假设返回值在 [0.0,1.0) 区间内。
 
 RandomNumberGenerator 协议并不关心每一个随机数是怎样生成的，它只要求必须提供一个随机数生成器。
 
 如下所示，下边是一个遵循并符合 RandomNumberGenerator 协议的类。该类实现了一个叫做 线性同余生成器（linear congruential generator） 的伪随机数算法。
 */
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// 打印 “Here's a random number: 0.37464991998171”
print("And another one: \(generator.random())")
// 打印 “And another one: 0.729023776863283”


/// Mutating Method Requirements Mutating 方法要求
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
// lightSwitch 现在的值为 .On


/// Initializer Requirements 构造器要求
// 协议可以要求遵循协议的类型实现指定的构造器。你可以像编写普通构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体：
protocol SomeProtocol {
    init(someParameter: Int)
}


/// Class Implementations of Protocol Initializer Requirements 构造器要求在类中的实现
// 你可以在遵循协议的类中实现构造器，无论是作为指定构造器，还是作为便利构造器。无论哪种情况，你都必须为构造器实现标上 required 修饰符：
class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        // 这里是构造器的实现部分
    }
}
/*
 使用 required 修饰符可以确保所有子类也必须提供此构造器实现，从而也能符合协议。
 
 关于 required 构造器的更多内容，请参考必要构造器。
 
 注意
 如果类已经被标记为 final，那么不需要在协议构造器的实现中使用 required 修饰符，因为 final 类不能有子类。
 */

// 如果一个子类重写了父类的指定构造器，并且该构造器满足了某个协议的要求，那么该构造器的实现需要同时标注 required 和 override 修饰符：
protocol SomeProtocol2 {
    init()
}

class SomeSuperClass {
    init() {
        // 这里是构造器的实现部分
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol2 {
    // 因为遵循协议，需要加上 required
    // 因为继承自父类，需要加上 override
    required override init() {
        // 这里是构造器的实现部分
    }
}


/// Failable Initializer Requirements 可失败构造器要求
/*
 协议还可以为遵循协议的类型定义可失败构造器要求，详见可失败构造器。
 
 遵循协议的类型可以通过可失败构造器（init?）或非可失败构造器（init）来满足协议中定义的可失败构造器要求。协议中定义的非可失败构造器要求可以通过非可失败构造器（init）或隐式解包可失败构造器（init!）来满足。
 */


/// Protocols as Types 协议作为类型
/*
 尽管协议本身并未实现任何功能，但是协议可以被当做一个成熟的类型来使用。
 
 协议可以像其他普通类型一样使用，使用场景如下：
 
 作为函数、方法或构造器中的参数类型或返回值类型
 作为常量、变量或属性的类型
 作为数组、字典或其他容器中的元素类型
 注意
 协议是一种类型，因此协议类型的名称应与其他类型（例如 Int，Double，String）的写法相同，使用大写字母开头的驼峰式写法，例如（FullyNamed 和 RandomNumberGenerator）。
 
 下面是将协议作为类型使用的例子：
 */
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

/*
 例子中定义了一个 Dice 类，用来代表桌游中拥有 N 个面的骰子。Dice 的实例含有 sides 和 generator 两个属性，前者是整型，用来表示骰子有几个面，后者为骰子提供一个随机数生成器，从而生成随机点数。
 
 generator 属性的类型为 RandomNumberGenerator，因此任何遵循了 RandomNumberGenerator 协议的类型的实例都可以赋值给 generator，除此之外并无其他要求。
 
 Dice 类还有一个构造器，用来设置初始状态。构造器有一个名为 generator，类型为 RandomNumberGenerator 的形参。在调用构造方法创建 Dice 的实例时，可以传入任何遵循 RandomNumberGenerator 协议的实例给 generator。
 
 Dice 类提供了一个名为 roll 的实例方法，用来模拟骰子的面值。它先调用 generator 的 random() 方法来生成一个 [0.0,1.0) 区间内的随机数，然后使用这个随机数生成正确的骰子面值。因为 generator 遵循了 RandomNumberGenerator 协议，可以确保它有个 random() 方法可供调用。
 
 下面的例子展示了如何使用 LinearCongruentialGenerator 的实例作为随机数生成器来创建一个六面骰子：
 */
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}
// Random dice roll is 3
// Random dice roll is 5
// Random dice roll is 4
// Random dice roll is 5
// Random dice roll is 4


/// Delegation 委托（代理）模式
