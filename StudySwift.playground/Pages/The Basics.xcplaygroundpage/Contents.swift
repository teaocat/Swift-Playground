//: Playground - noun: a place where people can play

import UIKit

/// The Basics 基础部分


/// Declaring Constants and Variables 声明常量和变量
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

/// Type Annotations 类型标注
var welcomeMessage: String

welcomeMessage = "LC"

var red, green, blue: Double

/// Naming Constants and Variables 常量和变量的命名
/// Constant and variable names can contain almost any character, including Unicode characters:
/// 你可以用任何你喜欢的字符作为常量和变量名，包括 Unicode 字符
var π = 3.14159
var 你好 = "你好LC"
var 🐶🐮 = "dogcow"

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// friendlyWelcome is now "Bonjour!"
// friendlyWelcome 现在是 "Bonjour!"

let languageName = "Swift"
//languageName = "Swift++"
// This is a compile-time error: languageName cannot be changed.
// 这会报编译时错误 - languageName 不可改变

/// Printing Constants and Variables 输出常量和变量
print(friendlyWelcome)
// Prints "Bonjour!"

/// Swift 用字符串插值（string interpolation） 将常量或变量名放入圆括号中，并在开括号前使用反斜杠将其转义
print("The current value of friendlyWelcome is \(friendlyWelcome)")
// Prints "The current value of friendlyWelcome is Bonjour!"

/// 注释

// 这是一个注释

/* 这是一个,
 多行注释 */

/// 与 C 语言多行注释不同，Swift 的多行注释可以嵌套在其它的多行注释之中。
/* 这是第一个多行注释的开头
 /* 这是第二个被嵌套的多行注释 */
 这是第一个多行注释的结尾 */

/// Semicolons 分号
let cat = "🐱"; print(cat)
// Prints "🐱"

/// Integers 整数

/// 整数范围
let minValue = UInt8.min  // minValue 为 0，是 UInt8 类型
let maxValue = UInt8.max  // maxValue 为 255，是 UInt8 类型

/*
 Int
 一般来说，你不需要专门指定整数的长度。Swift 提供了一个特殊的整数类型Int，长度与当前平台的原生字长相同：
 
 在32位平台上，Int 和 Int32 长度相同。
 在64位平台上，Int 和 Int64 长度相同。
 除非你需要特定长度的整数，一般来说使用 Int 就够了。这可以提高代码一致性和可复用性。即使是在32位平台上，Int 可以存储的整数范围也可以达到 -2,147,483,648 ~ 2,147,483,647 ，大多数时候这已经足够大了。
 
 
 UInt
 Swift 也提供了一个特殊的无符号类型 UInt，长度与当前平台的原生字长相同：
 
 在32位平台上，UInt 和 UInt32 长度相同。
 在64位平台上，UInt 和 UInt64 长度相同。
 注意：
 尽量不要使用UInt，除非你真的需要存储一个和当前平台原生字长相同的无符号整数。除了这种情况，最好使用Int，即使你要存储的值已知是非负的。统一使用Int可以提高代码的可复用性，避免不同类型数字之间的转换，并且匹配数字的类型推断
 */

/*
 浮点数
 浮点数是有小数部分的数字，比如 3.14159 ，0.1 和 -273.15。
 
 浮点类型比整数类型表示的范围更大，可以存储比 Int 类型更大或者更小的数字。Swift 提供了两种有符号浮点数类型：
 
 Double表示64位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型。
 Float表示32位浮点数。精度要求不高的话可以使用此类型。
 注意：
 Double精确度很高，至少有15位数字，而Float只有6位数字。选择哪个类型取决于你的代码需要处理的值的范围，在两种类型都匹配的情况下，将优先选择 Double。
 */

/// Type Safety and Type Inference 类型安全和类型推断
let meaningOfLife = 42
// meaningOfLife is inferred to be of type Int
// meaningOfLife 会被推测为 Int 类型

let pi = 3.14159
// pi is inferred to be of type Double
// pi 会被推测为 Double 类型

let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double
// anotherPi 会被推测为 Double 类型

/*
 数值型字面量
 整数字面量可以被写作：
 
 一个十进制数，没有前缀
 一个二进制数，前缀是0b
 一个八进制数，前缀是0o
 一个十六进制数，前缀是0x
 */
let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17

/// 数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量：
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

/// Integer Conversion 整数转换
//let cannotBeNegative: UInt8 = -1
// UInt8 类型不能存储负数，所以会报错
//let tooBig: Int8 = Int8.max + 1
// Int8 类型不能存储超过最大值的数，所以会报错

/// SomeType(ofInitialValue) 是调用 Swift 构造器并传入一个初始值的默认方法。

/// Integer and Floating-Point Conversion 整数和浮点数转换
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine
// pi 等于 3.14159，所以被推测为 Double 类型
let integerPi = Int(pi2)
// integerPi 等于 3，所以被推测为 Int 类型
/*
 注意：
 结合数字类常量和变量不同于结合数字类字面量。字面量3可以直接和字面量0.14159相加，因为数字字面量本身没有明确的类型。它们的类型只在编译器需要求值的时候被推测。
 */

/// Type Aliases 类型别名
/// 类型别名（type aliases）就是给现有类型定义另一个名字。你可以使用typealias关键字来定义类型别名。
typealias AudioSample = UInt16
var maxAmplitudeFound  = AudioSample.min
// maxAmplitudeFound 现在是 0

/// Booleans 布尔值
/// Swift 有一个基本的布尔（Boolean）类型，叫做Bool。布尔值指逻辑上的值，因为它们只能是真或者假。Swift 有两个布尔常量，true 和 false
/// 只是是 true 或者 false swift里面并没有非0即真的说法
let orangesAreOrange = true
let turnipsAreDelicious = false

/// Tuples 元组
/// 元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。
let http404Error = (404, "Not Found")
// http404Error 的类型是 (Int, String)，值是 (404, "Not Found")

/// 你可以将一个元组的内容分解（decompose）成单独的常量和变量
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// 输出 "The status code is 404"

print("The status message is \(statusMessage)")
// 输出 "The status message is Not Found"

// 如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记：
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// 输出 "The status code is 404"

// 此外，你还可以通过下标来访问元组中的单个元素，下标从零开始：
print("The status code is \(http404Error.0)")
// 输出 "The status code is 404"
print("The status message is \(http404Error.1)")
// 输出 "The status message is Not Found"

// 你可以在定义元组的时候给单个元素命名：
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
// 输出 "The status code is 200"
print("The status message is \(http200Status.description)")
// 输出 "The status message is OK"

/*
 注意：
 元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。如果你的数据结构并不是临时使用，请使用类或者结构体而不是元组。
 */

/// Optionals 可选类型
/*
 来看一个例子。Swift 的 Int 类型有一种构造器，作用是将一个 String 值转换成一个 Int 值。然而，并不是所有的字符串都可以转换成一个整数。字符串 "123" 可以被转换成数字 123 ，但是字符串 "hello, world" 不行。
 */
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"

/// nil
/// 你可以给可选变量赋值为nil来表示它没有值：
var serverResponseCode: Int? = 404
// serverResponseCode 包含一个可选的 Int 值 404
serverResponseCode = nil
// serverResponseCode 现在不包含值

/*
 注意：
 nil不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。
 */

// 如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 nil：
var surveyAnswer: String?
// surveyAnswer 被自动设置为 nil

/// If Statements and Forced Unwrapping if 语句以及强制解析
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// 输出 "convertedNumber contains some integer value."

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// 输出 "convertedNumber has an integer value of 123."
/*
 注意：
 使用 ! 来获取一个不存在的可选值会导致运行时错误。使用 ! 来强制解析值之前，一定要确定可选包含一个非 nil 的值。
 */

/// Optional Binding 可选绑定
/*
if let constantName = someOptional {
    statements
}*/

if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}
// // 输出 "'123' has an integer value of 123"

// 你可以包含多个可选绑定或多个布尔条件在一个 if 语句中，只要使用逗号分开就行。只要有任意一个可选绑定的值为nil，或者任意一个布尔条件为false，则整个if条件判断为false，这时你就需要使用嵌套 if 条件语句来处理
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// 输出 "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// 输出 "4 < 42 < 100"
/*
注意： 在 if 条件语句中使用常量和变量来创建一个可选绑定，仅在 if 语句的句中(body)中才能获取到值。相反，在 guard 语句中使用常量和变量来创建一个可选绑定，仅在 guard 语句外且在语句后才能获取到值
 */

/// Implicitly Unwrapped Optionals 隐式解析可选类型

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号
/*
 注意：
 如果你在隐式解析可选类型没有值的时候尝试取值，会触发运行时错误。和你在没有值的普通可选类型后面加一个惊叹号一样。
 */

// 你仍然可以把隐式解析可选类型当做普通可选类型来判断它是否包含值：
if assumedString != nil {
    print(assumedString)
}
// 输出 "An implicitly unwrapped optional string."

// 你也可以在可选绑定中使用隐式解析可选类型来检查并解析它的值：
if let definiteString = assumedString {
    print(definiteString)
}
// 输出 "An implicitly unwrapped optional string."


/// Error Handling 错误处理
/*
 你可以使用 错误处理（error handling） 来应对程序执行中可能会遇到的错误条件。
 
 相对于可选中运用值的存在与缺失来表达函数的成功与失败，错误处理可以推断失败的原因，并传播至程序的其他部分。
 
 当一个函数遇到错误条件，它能报错。调用函数的地方能抛出错误消息并合理处理。
 */
func canThrowAnError() throws {
// 这个函数有可能抛出错误
}

// 一个函数可以通过在声明中添加throws关键词来抛出错误消息。当你的函数能抛出错误消息时, 你应该在表达式中前置try关键词。

do {
    try canThrowAnError()
    // 没有错误消息抛出
} catch {
    // 有一个错误消息抛出
}
// 一个do语句创建了一个新的包含作用域,使得错误能被传播到一个或多个catch从句。

// 这里有一个错误处理如何用来应对不同错误条件的例子。

func makeASandwich() throws {
    // ...
}
/*
do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch Sandwich.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}
*/

/// Assertions and Preconditions 断言和先决条件

/*
 使用断言和先决条件不是一个能够避免出现程序出现无效状态的编码方法。然而，如果一个无效状态程序产生了，断言和先决条件可以强制检查你的数据和程序状态，使得你的程序可预测的中止（译者：不是系统强制的，被动的中止），并帮助使这个问题更容易调试。一旦探测到无效的状态，执行则被中止，防止无效的状态导致的进一步对于系统的伤害。
 
 断言和先决条件的不同点是，他们什么时候进行状态检测：断言仅在调试环境运行，而先决条件则在调试环境和生产环境中运行。在生产环境中，断言的条件将不会进行评估。这个意味着你可以使用很多断言在你的开发阶段，但是这些断言在生产环境中不会产生任何影响。
 */

/// Debugging with Assertions 使用断言进行调试
let age = -3
//assert(age > 0, "A person's age cannot be less than zero")

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can ride the ferris wheel.")
} else {
    //assertionFailure("A person's age can't be less than zero.")
}

/// Enforcing Preconditions 强制执行先决条件
precondition(1 > 0, "Index must be greater than zero.")
/*
 注意：
 如果你使用unchecked模式（-Ounchecked）编译代码，先决条件将不会进行检查。编译器假设所有的先决条件总是为true（真），他将优化你的代码。然而，fatalError(_:file:line:)函数总是中断执行，无论你怎么进行优化设定。
 你能使用 fatalError(_:file:line:)函数在设计原型和早期开发阶段，这个阶段只有方法的声明，但是没有具体实现，你可以在方法体中写上fatalError("Unimplemented")作为具体实现。因为fatalError不会像断言和先决条件那样被优化掉，所以你可以确保当代码执行到一个没有被实现的方法时，程序会被中断。
 */

//fatalError("Unimplemented")

