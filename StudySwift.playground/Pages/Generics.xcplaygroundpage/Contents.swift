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


/// Extending a Generic Type 扩展一个泛型类型
/*
 当你扩展一个泛型类型的时候，你并不需要在扩展的定义中提供类型参数列表。原始类型定义中声明的类型参数列表在扩展中可以直接使用，并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用。
 
 下面的例子扩展了泛型类型 Stack，为其添加了一个名为 topItem 的只读计算型属性，它将会返回当前栈顶端的元素而不会将其从栈中移除：
 */
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items.last // [items.count - 1]
    }
}
/*
 topItem 属性会返回一个 Element 类型的可选值。当栈为空的时候，topItem 会返回 nil；当栈不为空的时候，topItem 会返回 items 数组中的最后一个元素。
 
 注意，这个扩展并没有定义一个类型参数列表。相反的，Stack 类型已有的类型参数名称 Element，被用在扩展中来表示计算型属性 topItem 的可选类型。
 
 计算型属性 topItem 现在可以用来访问任意 Stack 实例的顶端元素且不移除它：
 */
if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}
// 打印 “The top item on the stack is tres.”


/// Type Constraints 类型约束
/*
 swapTwoValues(_:_:) 函数和 Stack 类型可以作用于任何类型。不过，有的时候如果能将使用在泛型函数和泛型类型中的类型添加一个特定的类型约束，将会是非常有用的。类型约束可以指定一个类型参数必须继承自指定类，或者符合一个特定的协议或协议组合。
 
 例如，Swift 的 Dictionary 类型对字典的键的类型做了些限制。在字典的描述中，字典的键的类型必须是可哈希（hashable）的。也就是说，必须有一种方法能够唯一地表示它。Dictionary 的键之所以要是可哈希的，是为了便于检查字典是否已经包含某个特定键的值。若没有这个要求，Dictionary 将无法判断是否可以插入或者替换某个指定键的值，也不能查找到已经存储在字典中的指定键的值。
 
 为了实现这个要求，一个类型约束被强制加到 Dictionary 的键类型上，要求其键类型必须符合 Hashable 协议，这是 Swift 标准库中定义的一个特定协议。所有的 Swift 基本类型（例如 String、Int、Double 和 Bool）默认都是可哈希的。
 
 当你创建自定义泛型类型时，你可以定义你自己的类型约束，这些约束将提供更为强大的泛型编程能力。抽象概念，例如可哈希的，描述的是类型在概念上的特征，而不是它们的显式类型。
 */


/// Type Constraint Syntax 类型约束语法
/*
 你可以在一个类型参数名后面放置一个类名或者协议名，并用冒号进行分隔，来定义类型约束，它们将成为类型参数列表的一部分。对泛型函数添加类型约束的基本语法如下所示（作用于泛型类型时的语法与之相同）：
 
 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
 // 这里是泛型函数的函数体部分
 }
 上面这个函数有两个类型参数。第一个类型参数 T，有一个要求 T 必须是 SomeClass 子类的类型约束；第二个类型参数 U，有一个要求 U 必须符合 SomeProtocol 协议的类型约束。
 */


/// Type Constraints in Action 类型约束实践
// 这里有个名为 findIndex(ofString:in:) 的非泛型函数，该函数的功能是在一个 String 数组中查找给定 String 值的索引。若查找到匹配的字符串，findIndex(ofString:in:) 函数返回该字符串在数组中的索引值，否则返回 nil：
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for(index, value) in array.enumerated() {
        if valueToFind == value {
            return index
        }
    }
    return nil
}

// findIndex(ofString:in:) 函数可以用于查找字符串数组中的某个字符串：
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}
// 打印 “The index of llama is 2”

/*
 如果只能查找字符串在数组中的索引，用处不是很大。不过，你可以用占位类型 T 替换 String 类型来写出具有相同功能的泛型函数 findIndex(_:_:)。
 
 下面展示了 findIndex(ofString:in:) 函数的泛型版本 findIndex(ofString:in:)。请注意这个函数返回值的类型仍然是 Int?，这是因为函数返回的是一个可选的索引数，而不是从数组中得到的一个可选值。需要提醒的是，这个函数无法通过编译，原因会在例子后面说明：
 */
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
/*
 上面所写的函数无法通过编译。问题出在相等性检查上，即 "if value == valueToFind"。不是所有的 Swift 类型都可以用等式符（==）进行比较。比如说，如果你创建一个自定义的类或结构体来表示一个复杂的数据模型，那么 Swift 无法猜到对于这个类或结构体而言“相等”意味着什么。正因如此，这部分代码无法保证适用于每个可能的类型 T，当你试图编译这部分代码时会出现相应的错误。
 
 不过，所有的这些并不会让我们无从下手。Swift 标准库中定义了一个 Equatable 协议，该协议要求任何遵循该协议的类型必须实现等式符（==）及不等符(!=)，从而能对该类型的任意两个值进行比较。所有的 Swift 标准类型自动支持 Equatable 协议。
 
 任何 Equatable 类型都可以安全地使用在 findIndex(of:in:) 函数中，因为其保证支持等式操作符。为了说明这个事实，当你定义一个函数时，你可以定义一个 Equatable 类型约束作为类型参数定义的一部分：
 
 findIndex(of:in:) 唯一的类型参数写做 T: Equatable，也就意味着“任何符合 Equatable 协议的类型 T ”。
 
 findIndex(of:in:) 函数现在可以成功编译了，并且可以作用于任何符合 Equatable 的类型，如 Double 或 String：
 */
let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
// doubleIndex 类型为 Int?，其值为 nil，因为 9.3 不在数组中
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
// stringIndex 类型为 Int?，其值为 2


/// Associated Types 关联类型
// 定义一个协议时，有的时候声明一个或多个关联类型作为协议定义的一部分将会非常有用。关联类型为协议中的某个类型提供了一个占位名（或者说别名），其代表的实际类型在协议被采纳时才会被指定。你可以通过 associatedtype 关键字来指定关联类型。


/// Associated Types in Action 关联类型实践
// 下面例子定义了一个 Container 协议，该协议定义了一个关联类型 ItemType：
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

/*
 Container 协议定义了三个任何采纳了该协议的类型（即容器）必须提供的功能：
 
 必须可以通过 append(_:) 方法添加一个新元素到容器里。
 必须可以通过 count 属性获取容器中元素的数量，并返回一个 Int 值。
 必须可以通过索引值类型为 Int 的下标检索到容器中的每一个元素。
 这个协议没有指定容器中元素该如何存储，以及元素必须是何种类型。这个协议只指定了三个任何遵从 Container 协议的类型必须提供的功能。遵从协议的类型在满足这三个条件的情况下也可以提供其他额外的功能。
 
 任何遵从 Container 协议的类型必须能够指定其存储的元素的类型，必须保证只有正确类型的元素可以加进容器中，必须明确通过其下标返回的元素的类型。
 
 为了定义这三个条件，Container 协议需要在不知道容器中元素的具体类型的情况下引用这种类型。Container 协议需要指定任何通过 append(_:) 方法添加到容器中的元素和容器中的元素是相同类型，并且通过容器下标返回的元素的类型也是这种类型。
 
 为了达到这个目的，Container 协议声明了一个关联类型 ItemType，写作 associatedtype ItemType。这个协议无法定义 ItemType 是什么类型的别名，这个信息将留给遵从协议的类型来提供。尽管如此，ItemType 别名提供了一种方式来引用 Container 中元素的类型，并将之用于 append(_:) 方法和下标，从而保证任何 Container 的行为都能够正如预期地被执行。
 
 下面是先前的非泛型的 IntStack 类型，这一版本采纳并符合了 Container 协议：
 */
struct IntStack2: Container {
    // IntStack 的原始实现部分
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // Container 协议的实现部分
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

/*
 IntStack 结构体实现了 Container 协议的三个要求，其原有功能也不会和这些要求相冲突。
 
 此外，IntStack 在实现 Container 的要求时，指定 ItemType 为 Int 类型，即 typealias ItemType = Int，从而将 Container 协议中抽象的 ItemType 类型转换为具体的 Int 类型。
 
 由于 Swift 的类型推断，你实际上不用在 IntStack 的定义中声明 ItemType 为 Int。因为 IntStack 符合 Container 协议的所有要求，Swift 只需通过 append(_:) 方法的 item 参数类型和下标返回值的类型，就可以推断出 ItemType 的具体类型。事实上，如果你在上面的代码中删除了 typealias ItemType = Int 这一行，一切仍旧可以正常工作，因为 Swift 清楚地知道 ItemType 应该是哪种类型。
 
 你也可以让泛型 Stack 结构体遵从 Container 协议：
 */
struct Stack2<Element>: Container {
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}


/// Extending an Existing Type to Specify an Associated Type 通过扩展一个存在的类型来指定关联类型
/*
 通过扩展添加协议一致性中描述了如何利用扩展让一个已存在的类型符合一个协议，这包括使用了关联类型的协议。
 
 Swift 的 Array 类型已经提供 append(_:) 方法，一个 count 属性，以及一个接受 Int 类型索引值的下标用以检索其元素。这三个功能都符合 Container 协议的要求，也就意味着你只需简单地声明 Array 采纳该协议就可以扩展 Array，使其遵从 Container 协议。你可以通过一个空扩展来实现这点，正如通过扩展采纳协议中的描述：
 */
extension Array: Container {}
// 如同上面的泛型 Stack 结构体一样，Array 的 append(_:) 方法和下标确保了 Swift 可以推断出 ItemType 的类型。定义了这个扩展后，你可以将任意 Array 当作 Container 来使用。


/// Using Type Annotations to Constrain an Associated Type 约束关联类型
// 你可以给协议里的关联类型添加类型注释，让遵守协议的类型必须遵循这个约束条件。例如，下面的代码定义了一个 Item 必须遵循 Equatable 的 Container 类型：
protocol Container2 {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
// 为了遵守了 Container 协议，Item 类型也必须遵守 Equatable 协议。


/// Generic Where Clauses 泛型 where 语句
func allItemsMatch<C1: Container, C2: Container>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {
        
        // 检查两个容器含有相同数量的元素
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        // 检查每一对元素是否相等
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
         // 所有元素都匹配，返回 true
        return true
}

var stackOfStrings2 = Stack2<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings2, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}
// Prints "All items match."


/// Extensions with a Generic Where Clause 具有泛型 where 子句的扩展
extension Stack2 where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

if stackOfStrings2.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}
// Prints "Top element is tres."

struct NotEquatable { }
var notEquatableStack = Stack<NotEquatable>()
let notEquatableValue = NotEquatable()
notEquatableStack.push(notEquatableValue)
//notEquatableStack.isTop(notEquatableValue)  // Error

extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}

if [9, 9, 9].startsWith(42) {
    print("Starts with 42.")
} else {
    print("Starts with something else.")
}
// Prints "Starts with something else."

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}
print([1260.0, 1200.0, 98.6, 37.0].average())
// Prints "648.9"


/// Associated Types with a Generic Where Clause 具有泛型 where 子句的关联类型
protocol Container3 {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}

protocol ComparableContainer: Container3 where Item: Comparable { }


/// Generic Subscripts 泛型下标
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
        where Indices.Iterator.Element == Int {
            var result = [Item]()
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}
/*
 这个 Container 协议的扩展添加了一个下标方法，接收一个索引的集合，返回每一个索引所在的值的数组。这个泛型下标的约束如下：
 
 这个 Container 协议的扩展添加了一个下标：下标是一个序列的索引，返回的则是索引所在的项目的值所构成的数组。这个泛型下标的约束如下：
 
 在尖括号中的泛型参数 Indices，必须是符合标准库中的 Sequence 协议的类型。
 下标使用的单一的参数，indices，必须是 Indices 的实例。
 泛型 where 子句要求 Sequence（Indices）的迭代器，其所有的元素都是 Int 类型。这样就能确保在序列（Sequence）中的索引和容器(Container)里面的索引类型是一致的。
 综合一下，这些约束意味着，传入到 indices 下标，是一个整型的序列. (译者：原来的 Container 协议，subscript 必须是 Int 型的，扩展中新的 subscript，允许下标是一个的序列，而非单一的值。)
 */
