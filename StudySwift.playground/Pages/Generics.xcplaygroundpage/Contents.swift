//: [Previous](@previous)

import Foundation

/// Generics 泛型

/// The Problem That Generics Solve 泛型所解决的问题
// 下面是一个标准的非泛型函数 swapTwoInts(_:_:)，用来交换两个 Int 值：
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// swapTwoInts(_:_:) 函数交换 b 的原始值到 a，并交换 a 的原始值到 b。你可以调用这个函数交换两个 Int 变量的值：
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// 打印 “someInt is now 107, and anotherInt is now 3”

// 诚然，swapTwoInts(_:_:) 函数挺有用，但是它只能交换 Int 值，如果你想要交换两个 String 值或者 Double值，就不得不写更多的函数，例如 swapTwoStrings(_:_:) 和 swapTwoDoubles(_:_:)，如下所示：
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}
/*
 你可能注意到 swapTwoInts(_:_:)、swapTwoStrings(_:_:) 和 swapTwoDoubles(_:_:) 的函数功能都是相同的，唯一不同之处就在于传入的变量类型不同，分别是 Int、String 和 Double。
 
 在实际应用中，通常需要一个更实用更灵活的函数来交换两个任意类型的值，幸运的是，泛型代码帮你解决了这种问题。（这些函数的泛型版本已经在下面定义好了。）
 
 注意
 在上面三个函数中，a 和 b 类型必须相同。如果 a 和 b 类型不同，那它们俩就不能互换值。Swift 是类型安全的语言，所以它不允许一个 String 类型的变量和一个 Double 类型的变量互换值。试图这样做将导致编译错误。
 */


/// Generic Functions 泛型函数
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
/*
 swapTwoValues(_:_:) 的函数主体和 swapTwoInts(_:_:) 函数是一样的，它们只在第一行有点不同，如下所示：
 
 func swapTwoInts(_ a: inout Int, _ b: inout Int)
 func swapTwoValues<T>(_ a: inout T, _ b: inout T)
 这个函数的泛型版本使用了占位类型名（在这里用字母 T 来表示）来代替实际类型名（例如 Int、String 或 Double）。占位类型名没有指明 T 必须是什么类型，但是它指明了 a 和 b 必须是同一类型 T，无论 T 代表什么类型。只有 swapTwoValues(_:_:) 函数在调用时，才会根据所传入的实际类型决定 T 所代表的类型。
 
 泛型函数和非泛型函数的另外一个不同之处，在于这个泛型函数名（swapTwoValues(_:_:)）后面跟着占位类型名（T），并用尖括号括起来（<T>）。这个尖括号告诉 Swift 那个 T 是 swapTwoValues(_:_:) 函数定义内的一个占位类型名，因此 Swift 不会去查找名为 T 的实际类型。
 
 swapTwoValues(_:_:) 函数现在可以像 swapTwoInts(_:_:) 那样调用，不同的是它能接受两个任意类型的值，条件是这两个值有着相同的类型。swapTwoValues(_:_:) 函数被调用时，T 所代表的类型都会由传入的值的类型推断出来。
 
 在下面的两个例子中，T 分别代表 Int 和 String：
 */
var someInt2 = 3
var anotherInt2 = 107
swapTwoValues(&someInt2, &anotherInt2)
// someInt 现在 107, and anotherInt 现在 3

var someString2 = "hello"
var anotherString2 = "world"
swapTwoValues(&someString2, &anotherString2)
// someString 现在 "world", and anotherString 现在 "hello"
/*
 注意
 上面定义的 swapTwoValues(_:_:) 函数是受 swap(_:_:) 函数启发而实现的。后者存在于 Swift 标准库，你可以在你的应用程序中使用它。如果你在代码中需要类似 swapTwoValues(_:_:) 函数的功能，你可以使用已存在的 swap(_:_:) 函数。
 */


/// Type Parameters 类型参数
/*
 在上面的 swapTwoValues(_:_:) 例子中，占位类型 T 是类型参数的一个例子。类型参数指定并命名一个占位类型，并且紧随在函数名后面，使用一对尖括号括起来（例如 <T>）。
 
 一旦一个类型参数被指定，你可以用它来定义一个函数的参数类型（例如 swapTwoValues(_:_:) 函数中的参数 a 和 b），或者作为函数的返回类型，还可以用作函数主体中的注释类型。在这些情况下，类型参数会在函数调用时被实际类型所替换。（在上面的 swapTwoValues(_:_:) 例子中，当函数第一次被调用时，T 被 Int 替换，第二次调用时，被 String 替换。）
 
 你可提供多个类型参数，将它们都写在尖括号中，用逗号分开。
 */


/// Naming Type Parameters 命名类型参数
/*
 在大多数情况下，类型参数具有一个描述性名字，例如 Dictionary<Key, Value> 中的 Key 和 Value，以及 Array<Element> 中的 Element，这可以告诉阅读代码的人这些类型参数和泛型函数之间的关系。然而，当它们之间没有有意义的关系时，通常使用单个字母来命名，例如 T、U、V，正如上面演示的 swapTwoValues(_:_:) 函数中的 T 一样。
 
 注意
 请始终使用大写字母开头的驼峰命名法（例如 T 和 MyTypeParameter）来为类型参数命名，以表明它们是占位类型，而不是一个值。
 */


/// Generic Types 泛型类型
/*
 除了泛型函数，Swift 还允许你定义泛型类型。这些自定义类、结构体和枚举可以适用于任何类型，类似于 Array 和 Dictionary。
 
 这部分内容将向你展示如何编写一个名为 Stack （栈）的泛型集合类型。栈是一系列值的有序集合，和 Array 类似，但它相比 Swift 的 Array 类型有更多的操作限制。数组允许在数组的任意位置插入新元素或是删除其中任意位置的元素。而栈只允许在集合的末端添加新的元素（称之为入栈）。类似的，栈也只能从末端移除元素（称之为出栈）。
 
 注意
 栈的概念已被 UINavigationController 类用来构造视图控制器的导航结构。你通过调用 UINavigationController 的 pushViewController(_:animated:) 方法来添加新的视图控制器到导航栈，通过 popViewControllerAnimated(_:) 方法来从导航栈中移除视图控制器。每当你需要一个严格的“后进先出”方式来管理集合，栈都是最实用的模型。
 */
// 下面展示了如何编写一个非泛型版本的栈，以 Int 型的栈为例：
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

/*
 这个结构体在栈中使用一个名为 items 的 Array 属性来存储值。Stack 提供了两个方法：push(_:) 和 pop()，用来向栈中压入值以及从栈中移除值。这些方法被标记为 mutating，因为它们需要修改结构体的 items 数组。
 
 上面的 IntStack 结构体只能用于 Int 类型。不过，可以定义一个泛型 Stack 结构体，从而能够处理任意类型的值。
 
 下面是相同代码的泛型版本：
 */
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

/*
 注意，Stack 基本上和 IntStack 相同，只是用占位类型参数 Element 代替了实际的 Int 类型。这个类型参数包裹在紧随结构体名的一对尖括号里（<Element>）。
 
 Element 为待提供的类型定义了一个占位名。这种待提供的类型可以在结构体的定义中通过 Element 来引用。在这个例子中，Element 在如下三个地方被用作占位符：
 
 创建 items 属性，使用 Element 类型的空数组对其进行初始化。
 指定 push(_:) 方法的唯一参数 item 的类型必须是 Element 类型。
 指定 pop() 方法的返回值类型必须是 Element 类型。
 由于 Stack 是泛型类型，因此可以用来创建 Swift 中任意有效类型的栈，就像 Array 和 Dictionary 那样。
 
 你可以通过在尖括号中写出栈中需要存储的数据类型来创建并初始化一个 Stack 实例。例如，要创建一个 String 类型的栈，可以写成 Stack<String>()：
 */
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
// 栈中现在有 4 个字符串

// 移除并返回栈顶部的值 "cuatro"，即将其出栈：
let fromTheTop = stackOfStrings.pop()
