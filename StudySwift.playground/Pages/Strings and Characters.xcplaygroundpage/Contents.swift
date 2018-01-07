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








































































































































































































































































































