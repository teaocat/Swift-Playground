//: [Previous](@previous)

import Foundation

/// Initialization 构造过程

/// Initializers 构造器
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
// 打印 "The default temperature is 32.0° Fahrenheit"


/// Default Property Values 默认属性值
struct Fahrenheit2 {
    var temperature = 32.0
}


/// Initialization Parameters 构造参数
