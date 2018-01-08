//: Playground - noun: a place where people can play

import UIKit

/// Strings and Characters 字符串和字符

/// String Literals 字符串字面量

let someString = "Some string literal value"
/// 注意someString常量通过字符串字面量进行初始化，Swift 会推断该常量为String类型。

/// Multiline String Literals 多行字符串字面量
// 如果你需要一个字符串是跨越多行的，那就使用多行字符串字面量 —— 由一对三个双引号包裹着的具有固定顺序的文本字符集：
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print("\(quotation)\n以上为\(#line)行打印\n----------")

/*
 一个多行字符串字面量包含了所有的在开启和关闭引号（"""）中的行。这个字符从开启引号(""")之后的第一行开始，到关闭引号(""")之前为止。这就意味着字符串开启引号之后(""")或者结束引号(""")之前都没有换行符号。（译者：下面两个字符串其实是一样的，虽然第二个使用了多行字符串的形式）
 */
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

/*
 如果你的代码中，多行字符串字面量包含换行符的话，则多行字符串字面量中也会包含换行符。如果你想换行，以便加强代码的可读性，但是你又不想在你的多行字符串字面量中出现换行符的话，你可以用在行尾写一个反斜杠(\)作为续行符。
 */
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print("\(softWrappedQuotation)\n以上为\(#line)行打印\n----------")

/// 为了让一个多行字符串字面量开始和结束于换行符，请将换行写在第一行和最后一行，例如：
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
print("\(lineBreaks)\n以上为\(#line)行打印\n----------")

/*
 一个多行字符串字面量能够缩进来匹配周围的代码。关闭引号(""")之前的空白字符串告诉Swift编译器其他各行多少空白字符串需要忽略。然而，如果你在某行的前面写的空白字符串超出了关闭引号(""")之前的空白字符串，则超出部分将被包含在多行字符串字面量中。
 */
let linesWithIndentation = """
    This string starts with a line break.
    It also ends with a line break.
        This string starts with a line break.
    It also ends with a line break.
    """
print("\(linesWithIndentation)\n以上为\(#line)行打印\n----------")


/// Special Characters in String Literals 字符串字面量的特殊字符
/*
 字符串字面量可以包含以下特殊字符：
 
 转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
 Unicode 标量，写成\u{n}(u为小写)，其中n为任意一到八位十六进制数且可用的 Unicode 位码。
 */

// 下面的代码为各种特殊字符的使用示例。 wiseWords常量包含了两个双引号。 dollarSign、blackHeart和sparklingHeart常量演示了三种不同格式的 Unicode 标量：
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imageination is more important than knowledge" - Enistein
let dollarSign = "\u{24}"             // $, Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥, Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖, Unicode 标量 U+1F496
print("\(wiseWords)\r\(dollarSign)\n\(blackHeart)\r\(sparklingHeart)\n以上为\(#line)行打印\r----------")

/// 要在多行字符串字面量中使用 """ 的话，就需要使用至少一个转义符（\）：
let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""
print("\(threeDoubleQuotes)\n以上为\(#line)行打印\r----------")


/// Initialize as Empty String 初始化空字符串
var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法
// 两个字符串均为空并等价。

// 您可以通过检查其Bool类型的isEmpty属性来判断该字符串是否为空：
if emptyString.isEmpty {
    print("Nothing to see here\n以上为\(#line)行打印\r----------")
}
// 打印输出："Nothing to see here"

/// String Mutability 字符串可变性
var variableString = "Horse"
variableString += " and carriage"
// variableString 现在为 "Horse and carriage"

//let constantString = "Highlander"
//constantString += " and another Highlander"
// 这会报告一个编译错误 (compile-time error) - 常量字符串不可以被修改。


/// String Are Value Types 字符串是值类型

/// Working With Characters 使用字符
for character in "Dog!🐶" {
    print(character)
}
print("以上为\(#line)行打印\n----------")

/// 通过标明一个Character类型并用字符字面量进行赋值，可以建立一个独立的字符常量或变量：
let exclamationMark: Character = "!"

/// 字符串可以通过传递一个值类型为Character的数组作为自变量来初始化：
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print("\(catString)\r以上为\(#line)行打印\n----------")
// 打印输出："Cat!🐱"


/// Concatenating String and Character 连接字符串和字符
/// 字符串可以通过加法运算符（+）相加在一起（或称“连接”）创建一个新的字符串：
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome 现在等于 "hello there"

/// 您也可以通过加法赋值运算符 (+=) 将一个字符串添加到一个已经存在字符串变量上：
var instruction = "look over"
instruction += string2
// instruction 现在等于 "look over there"

/// 您可以用append()方法将一个字符附加到一个字符串变量的尾部：
let exclamationMark2: Character = "!"
welcome.append(exclamationMark2)
// welcome 现在等于 "hello there!"
/*
 注意：
 您不能将一个字符串或者字符添加到一个已经存在的字符变量上，因为字符变量只能包含一个字符。
 */

/// 如果你需要使用多行字符串字面量来拼接字符串，并且你需要字符串每一行都以换行符结尾，包括最后一行：
let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end + "\n以上为\(#line)行打印\n----------")
// 打印两行:
// one
// twothree
let goodStart = """
one
two

"""
print(goodStart + end + "\n以上为\(#line)行打印\n----------")
// 打印两行:
// one
// two
// three


/// String Interpolation 字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message + "\n以上为\(#line)行打印\n----------")
// message 是 "3 times 2.5 is 7.5"
/*
 注意：
 插值字符串中写在括号中的表达式不能包含非转义反斜杠 (\)，并且不能包含回车或换行符。不过，插值字符串可以包含其他字面量。
*/


/// Unicode
/*
Unicode是一个国际标准，用于文本的编码和表示。 它使您可以用标准格式表示来自任意语言几乎所有的字符，并能够对文本文件或网页这样的外部资源中的字符进行读写操作。 Swift 的String和Character类型是完全兼容 Unicode 标准的。
*/

/// Unicode 标量
/*
Swift 的String类型是基于 Unicode 标量 建立的。 Unicode 标量是对应字符或者修饰符的唯一的21位数字，例如U+0061表示小写的拉丁字母(LATIN SMALL LETTER A)("a")，U+1F425表示小鸡表情(FRONT-FACING BABY CHICK) ("🐥")。
 
 注意： Unicode 码位(code poing) 的范围是U+0000到U+D7FF或者U+E000到U+10FFFF。Unicode 标量不包括 Unicode 代理项(surrogate pair) 码位，其码位范围是U+D800到U+DFFF。
 
 注意不是所有的21位 Unicode 标量都代表一个字符，因为有一些标量是留作未来分配的。已经代表一个典型字符的标量都有自己的名字，例如上面例子中的LATIN SMALL LETTER A和FRONT-FACING BABY CHICK。
 */


/// Extended Grapheme Clusters 可扩展的字形群集
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"
// eAcute 是 é, combinedEAcute 是 é

// 可扩展的字符群集是一个灵活的方法，用许多复杂的脚本字符表示单一的Character值。 例如，来自朝鲜语字母表的韩语音节能表示为组合或分解的有序排列。 在 Swift 都会表示为同一个单一的Character值：
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed 是 한, decomposed 是 한

// 可拓展的字符群集可以使包围记号(例如COMBINING ENCLOSING CIRCLE或者U+20DD)的标量包围其他 Unicode 标量，作为一个单一的Character值：
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute 是 é⃝

// 地域性指示符号的 Unicode 标量可以组合成一个单一的Character值，例如REGIONAL INDICATOR SYMBOL LETTER U(U+1F1FA)和REGIONAL INDICATOR SYMBOL LETTER S(U+1F1F8)：
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS 是 🇺🇸


/// Counting Characters 计算字符数量
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters\n以上为\(#line)行打印\n----------")
// 打印输出 "unusualMenagerie has 40 characters"
/*
 注意在 Swift 中，使用可拓展的字符群集作为Character值来连接或改变字符串时，并不一定会更改字符串的字符数量。
 
 例如，如果你用四个字符的单词cafe初始化一个新的字符串，然后添加一个COMBINING ACTUE ACCENT(U+0301)作为字符串的结尾。最终这个字符串的字符数量仍然是4，因为第四个字符是é，而不是e：
*/
var word = "cafe"
print("the number of characters in \(word) is \(word.count)\n以上为\(#line)行打印\n----------")
// 打印输出 "the number of characters in cafe is 4"

word += "\u{301}"    // 拼接一个重音, U+0301
print("the number of characters in \(word) is \(word.count)\n以上为\(#line)行打印\n----------")
// 打印输出 "the number of characters in café is 4"
/*
 注意：
 可扩展的字符群集可以组成一个或者多个 Unicode 标量。这意味着不同的字符以及相同字符的不同表示方式可能需要不同数量的内存空间来存储。所以 Swift 中的字符在一个字符串中并不一定占用相同的内存空间数量。因此在没有获取字符串的可扩展的字符群的范围时候，就不能计算出字符串的字符数量。如果您正在处理一个长字符串，需要注意count属性必须遍历全部的 Unicode 标量，来确定字符串的字符数量。
 
 另外需要注意的是通过count属性返回的字符数量并不总是与包含相同字符的NSString的length属性相同。NSString的length属性是利用 UTF-16 表示的十六位代码单元数字，而不是 Unicode 可扩展的字符群集。
*/


/// Accessing and Modifying a String 访问和修改字符串
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a
/*
试图获取越界索引对应的 Character，将引发一个运行时错误。
 
 greeting[greeting.endIndex] // error
 greeting.index(after: endIndex) // error
*/

// 使用 indices 属性会创建一个包含全部索引的范围(Range)，用来在一个字符串中访问单个字符。
for index in greeting.indices {
    print("\(greeting[index])", terminator:" ")
}
// 打印输出 "G u t e n   T a g ! "
/*
 注意：
 您可以使用 startIndex 和 endIndex 属性或者 index(before:) 、index(after:) 和 index(_:offsetBy:) 方法在任意一个确认的并遵循 Collection 协议的类型里面，如上文所示是使用在 String 中，您也可以使用在 Array、Dictionary 和 Set中。
 */


















































































































