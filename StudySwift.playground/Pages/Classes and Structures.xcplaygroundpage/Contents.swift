//: [Previous](@previous)

import Foundation

/// Classes and Structures 类和结构体
/*
 类和结构体对比
 Swift 中类和结构体有很多共同点。共同处在于：
 
 定义属性用于存储值
 定义方法用于提供功能
 定义下标操作使得可以通过下标语法来访问实例所包含的值
 定义构造器用于生成初始化值
 通过扩展以增加默认实现的功能
 实现协议以提供某种标准功能
 
 与结构体相比，类还有如下的附加功能：
 
 继承允许一个类继承另一个类的特征
 类型转换允许在运行时检查和解释一个类实例的类型
 析构器允许一个类实例释放任何其所被分配的资源
 引用计数允许对一个类的多次引用
 
 注意
 结构体总是通过被复制的方式在代码中传递，不使用引用计数。
 */

/// Definition Syntax 定义语法
class SomeClass {
    // 在这里定义类
}
struct SomeStructure {
    // 在这里定义结构体
}
/*
 注意
 在你每次定义一个新类或者结构体的时候，实际上你是定义了一个新的 Swift 类型。因此请使用UpperCamelCase这种方式来命名（如SomeClass和SomeStructure等），以便符合标准 Swift 类型的大写命名风格（如String，Int和Bool）。相反的，请使用lowerCamelCase这种方式为属性和方法命名（如framerate和incrementCount），以便和类型名区分。
 */
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}


/// Class and Structure Instances 类和结构体实例
let someResolution = Resolution()
let someVideoMode = VideoMode()


/// Accessing Properties 属性访问
print("The width of someResolution is \(someResolution.width)")
// 打印 "The width of someResolution is 0"
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// 打印 "The width of someVideoMode is 0"
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// 打印 "The width of someVideoMode is now 1280"
/*
 注意
 与 Objective-C 语言不同的是，Swift 允许直接设置结构体属性的子属性。上面的最后一个例子，就是直接设置了someVideoMode中resolution属性的width这个子属性，以上操作并不需要重新为整个resolution属性设置新值。
 */


/// Memberwise Initializers for Structure Types 结构体类型的成员逐一构造器
// 所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。新实例中各个属性的初始值可以通过属性的名称传递到成员逐一构造器之中：
let vga = Resolution(width:640, height: 480)


/// Structures and Enumerations Are Value Types 结构体和枚举是值类型
/*
 值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。
 
 在之前的章节中，我们已经大量使用了值类型。实际上，在 Swift 中，所有的基本类型：整数（Integer）、浮点数（floating-point）、布尔值（Boolean）、字符串（string)、数组（array）和字典（dictionary），都是值类型，并且在底层都是以结构体的形式所实现。
 
 在 Swift 中，所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制。
 */
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
// 下面，为了符合数码影院放映的需求（2048 像素宽，1080 像素高），cinema的width属性需要作如下修改：
cinema.width = 2048
// 这里，将会显示cinema的width属性确已改为了2048：
print("cinema is now  \(cinema.width) pixels wide")
// 打印 "cinema is now 2048 pixels wide"
// 然而，初始的hd实例中width属性还是1920：
print("hd is still \(hd.width) pixels wide")
// 打印 "hd is still 1920 pixels wide"

// 枚举也遵循相同的行为准则：
enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remembered direction is still .West")
}
// 打印 "The remembered direction is still .West"


/// Classes Are Reference Types 类是引用类型
// 与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，引用的是已存在的实例本身而不是其拷贝。
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
// tenEighty被赋予名为alsoTenEighty的新常量，同时对alsoTenEighty的帧率进行修改：
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
// 因为类是引用类型，所以tenEight和alsoTenEight实际上引用的是相同的VideoMode实例。换句话说，它们是同一个实例的两种叫法。
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// 打印 "The frameRate property of theEighty is now 30.0"
/*
 需要注意的是tenEighty和alsoTenEighty被声明为常量而不是变量。然而你依然可以改变tenEighty.frameRate和alsoTenEighty.frameRate，因为tenEighty和alsoTenEighty这两个常量的值并未改变。它们并不“存储”这个VideoMode实例，而仅仅是对VideoMode实例的引用。所以，改变的是被引用的VideoMode的frameRate属性，而不是引用VideoMode的常量的值。
 */


/// Identity Operators 恒等运算符
/*
 因为类是引用类型，有可能有多个常量和变量在幕后同时引用同一个类实例。（对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。）
 
 如果能够判定两个常量或者变量是否引用同一个类实例将会很有帮助。为了达到这个目的，Swift 内建了两个恒等运算符：
 
 等价于（===）
 不等价于（!==）
 */
// 运用这两个运算符检测两个常量或者变量是否引用同一个实例：
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same Resolution instance.")
}
//打印 "tenEighty and alsoTenEighty refer to the same Resolution instance."
/*
 请注意，“等价于”（用三个等号表示，===）与“等于”（用两个等号表示，==）的不同：
 
 “等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
 “等于”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。
 */

/*
 类和结构体的选择
 在你的代码中，你可以使用类和结构体来定义你的自定义数据类型。
 
 然而，结构体实例总是通过值传递，类实例总是通过引用传递。这意味两者适用不同的任务。当你在考虑一个工程项目的数据结构和功能的时候，你需要决定每个数据结构是定义成类还是结构体。
 
 按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
 
 该数据结构的主要目的是用来封装少量相关简单数据值。
 有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
 该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
 该数据结构不需要去继承另一个既有类型的属性或者行为。
 
 举例来说，以下情境中适合使用结构体：
 
 几何形状的大小，封装一个width属性和height属性，两者均为Double类型。
 一定范围内的路径，封装一个start属性和length属性，两者均为Int类型。
 三维坐标系内一点，封装x，y和z属性，三者均为Double类型。
 
 在所有其它案例中，定义一个类，生成一个它的实例，并通过引用来管理和传递。实际中，这意味着绝大部分的自定义数据构造都应该是类，而非结构体。
 */


/// Assignment and Copy Behavior for Strings, Arrays, and Dictionaries 字符串、数组、和字典类型的赋值与复制行为
/*
 Swift 中，许多基本类型，诸如String，Array和Dictionary类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。
 
 Objective-C 中NSString，NSArray和NSDictionary类型均以类的形式实现，而并非结构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用。
 
 注意
 以上是对字符串、数组、字典的“拷贝”行为的描述。在你的代码中，拷贝行为看起来似乎总会发生。然而，Swift 在幕后只在绝对必要时才执行实际的拷贝。Swift 管理所有的值拷贝以确保性能最优化，所以你没必要去回避赋值来保证性能最优化。
 */
