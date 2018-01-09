//: Playground - noun: a place where people can play

import UIKit

/// Collection Types 集合类型

/// Creating an Empty Array 创建一个空数组
var someInts: [Int] = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
print("以上在\(#line)打印\n----------")

someInts.append(3)
// someInts 现在包含一个 Int 值

someInts = []
// someInts 现在是空数组，但是仍然是 [Int] 类型的。


/// Create an Array With a Default Value 创建一个带有默认值的数组
var threeDefault: [Double] = Array(repeating: 0.0, count: 3)
// threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]

/// Creating an Array by Adding Two Arrays Together 通过两个数组相加创建一个数组
var anotherThreeDefault: [Double] = Array(repeating: 2.5, count: 3)
// 等价于 [2.5, 2.5, 2.5]

var sixDoubles: [Double] = threeDefault + anotherThreeDefault
// 等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]


/// Creating an Array with an Array Literal 用数组字面量构造数组
var shoppingList: [String] = ["Eggs", "Milk"]
// shoppingList 已经被构造并且拥有两个初始项。
/*
 注意：
 shoppingList数组被声明为变量（var关键字创建）而不是常量（let创建）是因为以后可能会有更多的数据项被插入其中。
 */

/// 由于 Swift 的类型推断机制，当我们用字面量构造只拥有相同类型值数组的时候，我们不必把数组的类型定义清楚。 shoppingList的构造也可以这样写：
var shoppingList2 = ["Eggs", "Milk"]


/// Accessing and Modifying an Array 访问和修改数组
print("The shopping list contains \(shoppingList.count) items.")
print("以上在\(#line)打印\n----------")
// 输出 "The shopping list contains 2 items."（这个数组有2个项）

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
print("以上在\(#line)打印\n----------")
// 打印 "The shopping list is not empty."（shoppinglist 不是空的）

// append(_:)方法在数组后面添加新的数据项：
shoppingList.append("Flour")
// shoppingList 现在有3个数据项

// 使用加法赋值运算符（+=）也可以直接在数组后面添加一个或多个拥有相同类型的数据项：
shoppingList += ["Baking Powder"]
// shoppingList 现在有四项了
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList 现在有七项了

// 可以直接使用下标语法来获取数组中的数据项，把我们需要的数据项的索引值放在直接放在数组名称的方括号中：
var firstItem = shoppingList2[0]
/*
 注意：
 第一项在数组中的索引值是0而不是1。 Swift 中的数组索引总是从零开始。
 */

// 我们也可以用下标来改变某个已有索引值对应的数据值：
shoppingList2[0] = "Six Six Six Eggs"
// 其中的第一项现在是 "Six Six Six Eggs" 而不是 "Eggs"

// 还可以利用下标来一次改变一系列数据值，即使新数据和原有数据的数量是不一样的。下面的例子把"Chocolate Spread"，"Cheese"，和"Butter"替换为"Bananas"和 "Apples"：
shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList 现在有6项
/*
 注意：
 不可以用下标访问的形式去在数组尾部添加新项。
 */

// 调用数组的insert(_:at:)方法来在某个具体索引值之前添加数据项：
shoppingList.insert("Maple Syrup", at: 0)
// shoppingList 现在有7项
// "Maple Syrup" 现在是这个列表中的第一项

shoppingList.remove(at: 0)
// 索引值为0的数据项被移除
// shoppingList 现在只有6项，而且不包括 Maple Syrup
// mapleSyrup 常量的值等于被移除数据项的值 "Maple Syrup"

shoppingList.removeLast()
// 数组的最后一项被移除了
// shoppingList 现在只有5项，不包括 Apples
// apples 常量的值现在等于 "Apples" 字符串


/// Iterating Over an Array 数组的遍历
for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas
print("以上在\(#line)打印\n----------")

for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas
print("以上在\(#line)打印\n----------")


/// Sets 集合
// 集合(Set)用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。
// 集合类型语法
// Swift 中的Set类型被写为Set<Element>，这里的Element表示Set中允许存储的类型，和数组不同的是，集合没有等价的简化形式。
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// 打印 "letters is of type Set<Character> with 0 items.")
print("以上在\(#line)打印\n----------")
/*
 注意：
 通过构造器，这里的letters变量的类型被推断为Set<Character>。
*/

letters.insert("a")
// letters 现在含有1个 Character 类型的值
letters = []
// letters 现在是一个空的 Set, 但是它依然是 Set<Character> 类型

/// 用数组字面量创建集合
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// favoriteGenres 被构造成含有三个初始值的集合

var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]
// 由于数组字面量中的所有元素类型相同，Swift 可以推断出Set<String>作为favoriteGenres变量的正确类型。


/// Accessing and Modifying a Set 访问和修改一个集合
print("I have \(favoriteGenres.count) favorite music genres.")
// 打印 "I have 3 favorite music genres."
print("以上在\(#line)打印\n----------")

// 使用布尔属性isEmpty作为一个缩写形式去检查count属性是否为0
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// 打印 "I have particular music preferences."
print("以上在\(#line)打印\n----------")

favoriteGenres.insert("Jazz")
// favoriteGenres 现在包含4个元素

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// 打印 "Rock? I'm over it."
print("以上在\(#line)打印\n----------")

if favoriteGenres.contains("Funk"){
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
// 打印 "It's too funky in here."
print("以上在\(#line)打印\n----------")

// Iterating Over a Set 遍历一个集合
for genre in favoriteGenres {
    print(genre)
}
//Jazz
//Hip hop
//Classical
print("以上在\(#line)打印\n----------")

/// Fundamental Set Operations 集合操作
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

/*
 使用intersection(_:)方法根据两个集合中都包含的值创建的一个新的集合。
 使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
 使用union(_:)方法根据两个集合的值创建一个新的集合。
 使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合。
 */
oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

oddDigits.intersection(evenDigits).sorted()
// []

oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]


/// Set Membership and Equality 集合成员关系和相等
/*
 使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值。
 使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
 使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值。
 使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
 使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)。
 */
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true

farmAnimals.isSuperset(of: houseAnimals)
// true

farmAnimals.isDisjoint(with: cityAnimals)
// true


/// Dictionaries 字典
/*
 注意：
 一个字典的Key类型必须遵循Hashable协议，就像Set的值类型。
 */

/// Creating an Empty Dictionary 创建一个空字典
var namesOfIntergers = [Int:String]()
// namesOfIntegers 是一个空的 [Int: String] 字典
// 这个例子创建了一个[Int: String]类型的空字典来储存整数的英语命名。它的键是Int型，值是String型。

// 如果上下文已经提供了类型信息，我们可以使用空字典字面量来创建一个空字典，记作[:]（中括号中放一个冒号）：
namesOfIntergers[18] = "Teaocat"
// namesOfIntegers 现在包含一个键值对
namesOfIntergers = [:]
// namesOfIntegers 又成为了一个 [Int: String] 类型的空字典

/// Creating a Dictionary with a Dictionary Literal 用字典字面量创建字典
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// 和数组一样，我们在用字典字面量构造字典时，如果它的键和值都有各自一致的类型，那么就不必写出字典的类型。 airports字典也可以用这种简短方式定义：
var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]


/// Accessing and Modifying a Dictionary 访问和修改字典
print("The airports dictionary contains \(airports.count) items.")
// 打印 "The dictionary of airports contains 2 items."（这个字典有两个数据项）
print("以上在\(#line)打印\n----------")

// 使用布尔属性isEmpty作为一个缩写形式去检查count属性是否为0：
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
// 打印 "The airports dictionary is not empty."
print("以上在\(#line)打印\n----------")

// 我们也可以在字典中使用下标语法来添加新的数据项。可以使用一个恰当类型的键作为下标索引，并且分配恰当类型的新值：
airports["LHR"] = "London"
// airports 字典现在有三个数据项

// 我们也可以使用下标语法来改变特定键对应的值：
airports["LHR"] = "London Heathrow"
// "LHR"对应的值 被改为 "London Heathrow

/*
 updateValue(_:forKey:)方法会返回对应值的类型的可选值。举例来说：对于存储String值的字典，这个函数会返回一个String?或者“可选 String”类型的值。
 
 如果有值存在于更新前，则这个可选值包含了旧值，否则它将会是nil。
 */
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// 输出 "The old value for DUB was Dublin."
print("以上在\(#line)打印\n----------")

/*
 我们也可以使用下标语法来在字典中检索特定键对应的值。因为有可能请求的键没有对应的值存在，字典的下标访问会返回对应值的类型的可选值。如果这个字典包含请求键所对应的值，下标会返回一个包含这个存在值的可选值，否则将返回nil：
 */
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
// 打印 "The name of the airport is Dublin Airport."
print("以上在\(#line)打印\n----------")

// 我们还可以使用下标语法来通过给某个键的对应值赋值为nil来从字典里移除一个键值对
airports["APL"] = "Apple Internation"
// "Apple Internation" 不是真的 APL 机场, 删除它
airports["APL"] = nil
// APL 现在被移除了

// 此外，removeValue(forKey:)方法也可以用来在字典中移除键值对。这个方法在键值对存在的情况下会移除该键值对并且返回被移除的值或者在没有值的情况下返回nil：
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
// prints "The removed airport's name is Dublin Airport."
print("以上在\(#line)打印\n----------")


/// Iterating Over a Dictionary 字典遍历

// 我们可以使用for-in循环来遍历某个字典中的键值对。每一个字典中的数据项都以(key, value)元组形式返回，并且我们可以使用临时常量或者变量来分解这些元组：
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// YYZ: Toronto Pearson
// LHR: London Heathrow
print("以上在\(#line)打印\n----------")

// 通过访问keys或者values属性，我们也可以遍历字典的键或者值：
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: YYZ
// Airport code: LHR
print("以上在\(#line)打印\n----------")

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: Toronto Pearson
// Airport name: London Heathrow
print("以上在\(#line)打印\n----------")

// 如果我们只是需要使用某个字典的键集合或者值集合来作为某个接受Array实例的 API 的参数，可以直接使用keys或者values属性构造一个新数组：
let airportCodes = [String](airports.keys)
// airportCodes 是 ["YYZ", "LHR"]

let airportNames = [String](airports.values)
// airportNames 是 ["Toronto Pearson", "London Heathrow"]
print("以上在\(#line)打印\n----------")


// Swift 的字典类型是无序集合类型。为了以特定的顺序遍历字典的键或值，可以对字典的keys或values属性使用sorted()方法。
