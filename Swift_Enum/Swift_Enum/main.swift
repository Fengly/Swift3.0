//
//  main.swift
//  Swift_Enum
//
//  Created by Riches on 2016/10/27.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 基本用法
  // 最简单的定义
    // 多行写法
enum CompassPoint {
    case east
    case west
    case south
    case north
}
    // 单行写法
enum CompassPint1 {
    case east, west, south, north
}
//// Swift 3.0 开始,定义枚举值,统一小写


// 指定枚举类型的原始数据类型
enum Rank: Int { // Int 设置枚举值的类型
    // 定义枚举值设置值
    case ace
    // 可以case 后面一次定义多个枚举器
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    // 定义函数 如果多人合作的时候,可以使用这个让别人更加了解你定义的属性的含义
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace1"
        case .jack:
            return "jack1"
        case .queen:
            return "queen1"
        case .king:
            return "king1"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace // 非可选值
let rank = Rank(rawValue: 1)
print(ace, rank!)





// 给枚举设置原始值 (必须指定枚举值类型)
enum Compass: Character {
    case east = "1"
    case west = "2"
    case south = "3"
    case north = "4"
}



// 获取原始值
let aceRawValue = ace.rawValue;
print(aceRawValue)
/**
 1.如果你没有定义枚举的原始值类型,你不能通过上述方法获取原始值
 2.输入定义的是数字类型 ，原始值对应的是数字本身，
 3.如果定义的是字符串类型,但你没有給它赋值,这个时候,你获取的原始值就是你定义的名字
 */




//// 提供值创建枚举
enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
/**
 * 这个方式定义的枚举 不能使用 == 来做判断处理,我们应该使用模式匹配的方式处理,这种定义方式强调的是传值,如下
 */



switch success {
case let .result(sunrise, sunset): // 模式匹配
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}
//// 或者
//switch success {
//case  .result(let sunrise, let sunset): // 模式匹配
//    print("Sunrise is at \\(sunrise) and sunset is at \\(sunset).")
//case  .failure(let message):
//    print("Failure...  \\(message)")
//}





//////////  indirect 使用方法
   // ----------------- 主要用于递归枚举,看下面例子,你应该很清楚怎么使用 
 // 1. 使用方法
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let expression = ArithmeticExpression.addition(ArithmeticExpression.number(3), ArithmeticExpression.number(4))

 // 2. 使用方法
indirect enum ArithmeticExpression1 {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let expression2 = ArithmeticExpression1.addition(ArithmeticExpression.number(3), ArithmeticExpression.number(4))
print(expression, expression2)

// /// /// /// 如果你定义的枚举是递归的形式,必须有关键字indirect 修饰,不然系统会编译报错




// 重新实现SWIFT标准库的可选类型(使用泛型技术)
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInt: OptionalValue<Int> = .none
print(possibleInt)
possibleInt = .some(100)
print(possibleInt)



// 枚举可以继承协议
protocol Skill {
    mutating func modifyMusic(name: String)
}
enum Type: String, Skill {
    case name = "123"
    mutating internal func modifyMusic(name: String) {
        self = Type(rawValue: "123")!
    }
}


// 枚举不能包含存储属性,但是可以包含静态变量和计算属性
enum SomeEnumeration: Int {
    case one = 2
    case twwo = 345
    // 静态变量
    static var storedTypeProperty = "Some value."
    // 静态计算属性
    static var computedTypeProperty: Int {
        return 6
    }
    // 计算属性
    var getRaw: Int {
        return self.rawValue
    }
}

//
enum Locale {
    case none
    case base
    case language(String)
}
let locale = Locale.language("English")
//if locale == Locale.base {
//    // 编译错误,如果没有 case language(String) 这种赋值枚举,可以使用上面的方式,一点问题也没有,但是如果有这种类型,系统不允许使用 == 进行数据判断的
//}

switch locale {
    case Locale.base: print(locale)
    case Locale.none: print(locale)
    case Locale.language("English"): print(locale)
    case Locale.language(let x): print(x)
}



// 重新写一下上面的枚举,使用case 写出优雅的代码
enum Locale1 {
    case none
    case base
    case language(String)
    // 判断是否是汉语
    var isChinese: Bool {
        if case .language("Chinese") = self {
            return true;
        }
        return false
    }
    // 是否是其他语言
    var isLanguage: Bool {
        if case .language = self {
            return true
        }
        return false
    }
    var isBase: Bool {
        if case .base = self {
            return true
        }
        return false
    }
    var isNone: Bool {
        if case .none = self {
            return true
        }
        return false
    }
}
// 调用方法如下
let locale1 = Locale1.none
print(locale1.isLanguage)



































































































