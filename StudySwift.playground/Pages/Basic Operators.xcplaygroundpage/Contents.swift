//: Playground - noun: a place where people can play

import UIKit

/// Basic Operators 基本运算符

/// Assignment Operator 赋值运算符

let b = 10
var a = 5
a = b
// a 现在等于 10

/// 如果赋值的右边是一个多元组，它的元素可以马上被分解成多个常量或变量：
let (x, y) = (1, 2)
// 现在 x 等于 1，y 等于 2

//if x = y {
//    // 此句错误, 因为 x = y 并不返回任何值
//}


/// Arithmetic Operators 算术运算符
1 + 2       // 等于 3
5 - 3       // 等于 2
2 * 3       // 等于 6
10.0 / 2.5  // 等于 4.0

/*
 与 C 语言和 Objective-C 不同的是，Swift 默认情况下不允许在数值运算中出现溢出情况。但是你可以使用 Swift 的溢出运算符来实现溢出运算（如 a &+ b）。详情参见溢出运算符。
 
 加法运算符也可用于 String 的拼接：
 */
"hello, " + "world"  // 等于 "hello, world"

/// Remainder Operator 求余运算符
/// 在对负数 b 求余时，b 的符号会被忽略。这意味着 a % b 和 a % -b 的结果是相同的
print(9 % 6)
print(9 % -6)


/// Unary Minus Operator 一元负号运算符
let three = 3
let minusThree = -three       // minusThree 等于 -3
let plusThree = -minusThree   // plusThree 等于 3, 或 "负负3"

/// Unary Plus Operator 一元正号运算符
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix 等于 -6
/// 虽然一元正号符什么都不会改变，但当你在使用一元负号来表达负数时，你可以使用一元正号来表达正数，如此你的代码会具有对称美。


/// Compound Assignment Operators 组合赋值运算符
var a2 = 1
a2 += 2
// a2 现在是 3


/// Comparison Operators 比较运算符
/*
 等于（a == b）
 不等于（a != b）
 大于（a > b）
 小于（a < b）
 大于等于（a >= b）
 小于等于（a <= b）
 */
1 == 1   // true, 因为 1 等于 1
2 != 1   // true, 因为 2 不等于 1
2 > 1    // true, 因为 2 大于 1
1 < 2    // true, 因为 1 小于2
1 >= 1   // true, 因为 1 大于等于 1
2 <= 1   // false, 因为 2 并不小于等于 1

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// 输出 "hello, world", 因为 `name` 就是等于 "world"

/// 如果两个元组的元素相同，且长度相同的话，元组就可以被比较。比较元组大小会按照从左到右、逐值比较的方式，直到发现有两个值不等时停止。如果所有的值都相等，那么这一对元组我们就称它们是相等的。例如：
(1, "zebra") < (2, "apple")   // true，因为 1 小于 2
(3, "apple") < (3, "bird")    // true，因为 3 等于 3，但是 apple 小于 bird
(4, "dog") == (4, "dog")      // true，因为 4 等于 4，dog 等于 dog

/// Bool 不能被比较，也意味着存有布尔类型的元组不能被比较
("blue", -1) < ("purple", 1)       // 正常，比较的结果为 true
//("blue", false) < ("purple", true) // 错误，因为 < 不能比较布尔类型


/// Ternary Conditional Operator 三目运算符
/*
三目运算符是以下代码的缩写形式：
 if question {
 answer1
 } else {
 answer2
 }
 */
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight 现在是 90
// 上面的写法比下面的代码更简洁：
var rowHeight2 = contentHeight
if hasHeader {
    rowHeight2 = rowHeight2 + 50
} else {
    rowHeight2 = rowHeight2 + 20
}
// rowHeight 现在是 90


/// Nil Coalescing Operator 空合运算符
/*
 空合运算符（a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解封，否则就返回一个默认值 b。表达式 a 必须是 Optional 类型。默认值 b 的类型必须要和 a 存储值的类型保持一致。
 
 a != nil ? a! : b
 
 上述代码使用了三目运算符。当可选类型 a 的值不为空时，进行强制解封（a!），访问 a 中的值；反之返回默认值 b。无疑空合运算符（??）提供了一种更为优雅的方式去封装条件判断和解封两种行为，显得简洁以及更具可读性。
 
 注意： 如果 a 为非空值（non-nil），那么值 b 将不会被计算。这也就是所谓的短路求值。
 */
let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"

/// 分配一个非空值（non-nil）给 userDefinedColorName，再次执行空合运算，运算结果为封包在 userDefaultColorName 中的值，而非默认值
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 非空，因此 colorNameToUse 的值为 "green"


/// Range Operators 区间运算符

/// Closed Range Operator 闭区间运算符
//闭区间运算符（a...b）定义一个包含从 a 到 b（包括 a 和 b）的所有值的区间。a 的值不能超过 b。 ‌ 闭区间运算符在迭代一个区间的所有值时是非常有用的，如在 for-in 循环中：
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}
// 1 * 5 = 5
// 2 * 5 = 10
// 3 * 5 = 15
// 4 * 5 = 20
// 5 * 5 = 25

/// Half-Open Range Operator 半开区间运算符
// 半开区间运算符（a..<b）定义一个从 a 到 b 但不包括 b 的区间。 之所以称为半开区间，是因为该区间包含第一个值而不包括最后的值。
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}
// 第 1 个人叫 Anna
// 第 2 个人叫 Alex
// 第 3 个人叫 Brian
// 第 4 个人叫 Jack
// 数组有 4 个元素，但 0..<count 只数到3（最后一个元素的下标），因为它是半开区间。

/// One-Sided Ranges 单侧区间
// 闭区间操作符有另一个表达形式，可以表达往一侧无限延伸的区间 —— 例如，一个包含了数组从索引 2 到结尾的所有值的区间。在这些情况下，你可以省略掉区间操作符一侧的值。这种区间叫做单侧区间，因为操作符只有一侧有值。例如：
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

// 半开区间操作符也有单侧表达形式，附带上它的最终值。就像你使用区间去包含一个值，最终值并不会落在区间内。例如：
for name in names[..<2] {
    print(name)
}
// Anna
// Alex
/*
 单侧区间不止可以在下标里使用，也可以在别的情境下使用。你不能遍历省略了初始值的单侧区间，因为遍历的开端并不明显。你可以遍历一个省略最终值的单侧区间；然而，由于这种区间无限延伸的特性，请保证你在循环里有一个结束循环的分支。你也可以查看一个单侧区间是否包含某个特定的值，就像下面展示的那样。
 */
let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true


/// Logical Operators 逻辑运算符
/*
 逻辑非（!a）
 逻辑与（a && b）
 逻辑或（a || b）
 */

/// Logical NOT Operator 逻辑非运算符
/*
 逻辑非运算符（!a）对一个布尔值取反，使得 true 变 false，false 变 true。
 
 它是一个前置运算符，需紧跟在操作数之前，且不加空格。读作 非 a ，例子如下：
 */
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// 输出 "ACCESS DENIED"

/// Logical AND Operator 逻辑与运算符
/*
 逻辑与运算符（a && b）表达了只有 a 和 b 的值都为 true 时，整个表达式的值才会是 true。
 
 只要任意一个值为 false，整个表达式的值就为 false。事实上，如果第一个值为 false，那么是不去计算第二个值的，因为它已经不可能影响整个表达式的结果了。这被称做短路计算（short-circuit evaluation）。
 
 以下例子，只有两个 Bool 值都为 true 的时候才允许进入 if：
 */
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出 "ACCESS DENIED"

/// Logical OR Operator 逻辑或运算符
/*
 逻辑或运算符（a || b）是一个由两个连续的 | 组成的中置运算符。它表示了两个逻辑表达式的其中一个为 true，整个表达式就为 true。
 
 同逻辑与运算符类似，逻辑或也是「短路计算」的，当左端的表达式为 true 时，将不计算右边的表达式了，因为它不可能改变整个表达式的值了。
 
 以下示例代码中，第一个布尔值（hasDoorKey）为 false，但第二个值（knowsOverridePassword）为 true，所以整个表达是 true，于是允许进入：
 */
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出 "Welcome!"

/// Combining Logical Operators 逻辑运算符组合计算
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出 "Welcome!"
/*
 这个例子使用了含多个 && 和 || 的复合逻辑。但无论怎样，&& 和 || 始终只能操作两个值。所以这实际是三个简单逻辑连续操作的结果。我们来解读一下：
 
 如果我们输入了正确的密码并通过了视网膜扫描，或者我们有一把有效的钥匙，又或者我们知道紧急情况下重置的密码，我们就能把门打开进入。
 
 前两种情况，我们都不满足，所以前两个简单逻辑的结果是 false，但是我们是知道紧急情况下重置的密码的，所以整个复杂表达式的值还是 true。
 
 注意： Swift 逻辑操作符 && 和 || 是左结合的，这意味着拥有多元逻辑操作符的复合表达式优先计算最左边的子表达式。
 */

/// Explicit Parentheses 使用括号来明确优先级
/// 为了一个复杂表达式更容易读懂，在合适的地方使用括号来明确优先级是很有效的，虽然它并非必要的。在上个关于门的权限的例子中，我们给第一个部分加个括号，使它看起来逻辑更明确：
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出 "Welcome!"
// 这括号使得前两个值被看成整个逻辑表达中独立的一个部分。虽然有括号和没括号的输出结果是一样的，但对于读代码的人来说有括号的代码更清晰。可读性比简洁性更重要，请在可以让你代码变清晰的地方加个括号吧！
