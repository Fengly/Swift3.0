//
//  main.swift
//  Swift_One_TheBasicData
//
//  Created by Riches on 2016/10/26.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")
// let常量的定义
let constant = 2
// constant = 25 //出错
// var变量的定义
var variable = 4
variable = 21

// 初始化类型
// 不指定类型
let i_int = 20
let i_double = 10.0
// 指定数据类型
let e_double: Double = 70

// 未初始化类型
var numb_double: Double
var numb_int: Int

// 字符串的定义(基本数据类型)
let label = "label"
// 数据转化
let d = 8
let d_str = String(d)
let apples = 3
let oranges = 5
let fruitSummary = "I have \\(apples + oranges) pieces of fruit."
print(fruitSummary)

// 数组的定义(基本数据类型)
var arr = ["a", "b", "c", "d"]
arr[1] = "e"
print(arr)
arr.insert("b", at: 1)
print(arr)
// 数组的清空
arr = []
print("ssss", arr)
// 定义空数组
let emptyArr = [String]()
let emptyArr2: [String] = []
print(emptyArr, emptyArr2)

// 字典的定义(基本数据类型)
var dic = ["a":"1",
           "b":"2",
           "c":"3"]
print(dic)
// 清空字典
dic = [:]
print("ssss",dic)
// 定义空字典
let emptyDic = [String: Float]()
let emptyDic2: [String: Float] = [:]
print(emptyDic, emptyDic2)

// 定义可选值
let nik: String?
let nickName: String? = "FLNuo"
print(nickName!)

let nickName2: String? = nil
let fullName: String = "FLNuo"
let informalGreeting = "Hi \(nickName2 ?? fullName)"
print(informalGreeting)

// 函数的定义
func first(a: String, b: String) -> String {
    return "s"
}
var s = first(a: "a", b: "b")
// 缺省参数名
func second(_ a: String, _ b: String) -> String {
    return "c"
}
var c = second("a", "b")

// 函数返回类型是元祖
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int, a: String) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum, "a")
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.a)
print(statistics.2)


// 定义多个类型相同的参数
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
let i = sumOf()
let j = sumOf(numbers: 42, 597, 12, 10, 20, 30)

// 函数的嵌套
func qianTaoFunction() -> Int {
    var x = 10
    func add() {
        x += 5
    }
    // 方法内部定义方法,声明周期为方法
    add()
    return x
}
let x = qianTaoFunction()
print(x)

// 函数的返回值是函数
func returnFunc() -> ((String) -> String) {
    
    func add(str: String) -> String{
        return str
    }
    return add
}
var str = returnFunc()
let str1 = str("a")
print(str1, str)

// 参数是函数
func pramIsFunc(list: [Double], condition:(Int) -> Bool) -> Int {
    for item in list {
        if condition(Int(item)) {
            return 1
        } else {
            return 0
        }
    }
    return 0
}

func conditionFunc(d: Int) -> Bool {
    return d < 10
}
let arr_double = [20.0, 9.0, 11.0, 7.0]
let bb = pramIsFunc(list: arr_double, condition: conditionFunc)
print(bb)

// 定义一个类
class MyFirstSwift {
    var a = 1
    func c() -> String {
        return "ss"
    }
}

// 初始化方法，和对象方法
class NameShap {
    var a =  0
    var name: String
    // 初始化方法
    init(name: String) {
        self.name = name
        let c = self.simpleDescription()
        print(c)
    }
    // 定义成员方法
    func simpleDescription() -> String {
        return "sss"
    }
}

// 继承
class Square: NameShap {
    var side: Double
    init(name: String, side: Double) {
        self.side = side
        super.init(name: name) // 父类方法
        a = 10   // 父类属性
    }
    
    func area() -> Double {
        return side * side
    }
    // 重写父类方法
    override func simpleDescription() -> String {
        return "aaaa"
    }
}

// setter 和 getter
class MySetAndGet: NameShap {
    var v: Double = 0.0
    init(name: String, side: Double) {
        self.v = side
        super.init(name: name)
        a = 55
    }
    
    var vv: Double {
        get {
            return 3.0 * v
        }
        set {
            v = newValue / 3.0
        }
    }
    override func simpleDescription() -> String {
        return "ssssss"
    }
}

class ss: MySetAndGet {
    init(name: String, sidew: Double) {
        super.init(name: name, side: sidew)
        vv = 10
    }
}


// 观察属性
class TriangleAndSquare {
    // 定一个三角形对象
    var triangle: MySetAndGet {
        willSet {
            square.a = newValue.a
        }
    }
    // 定一个一个正方形对象
    var square: Square {
        willSet {
            triangle.a = newValue.a
        }
    }
    // 通过检测属性,我们让两个对象的边保持一样长
    init(size: Double, name: String) {
        square = Square(name: name, side: size)
        triangle = MySetAndGet(name: name, side: size)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.a)
print(triangleAndSquare.triangle.a)
triangleAndSquare.square = Square(name: "larger     square", side: 50)
print(triangleAndSquare.triangle.a)


// 枚举
enum Rank: Int { // Int 设置枚举值的类型
    // 定义枚举值设置值
    case ace = 1
    // 可以case 后面一次定义多个枚举值
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    // 定义函数 如果多人合作的时候,可以使用这个让别人更加了解你定义的属性的含义
    func simpleDescription() -> String {
        switch self { // self 就是这个枚举本身
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
// 使用
let ace = Rank.ace
let aceRawValue = ace.simpleDescription()
let two = Rank.jack
let two_ = two.simpleDescription()

print(ace, aceRawValue, two.rawValue, two_)


// 结构体的定义
struct Card {
    // 定义结构体
    var rank: Rank
    var suit: String
    // 结构体内可以定义方法
    func simpleDescription() -> String {
        return "The \\(rank.simpleDescription()) of \\(suit.simpleDescription())"
    }
}
let aaa = Card(rank: .three, suit: "aa")
let bbb = aaa.simpleDescription()
print(aaa.rank, aaa.suit, bbb)

// 协议
// 定义
protocol ddDelegate {
    var simpleDescription: String { get }
    mutating func adjust()
}

// 类添加协议
class SimpleClass: ddDelegate {
    var simpleDescription: String = "sssdw"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "Now 100% adjusted"
    }
}

// 结构体添加协议
struct SimpleStructure: ddDelegate {
    var simpleDescription: String = "ssdsds"
    mutating func adjust() {
        simpleDescription += "sdsdwdsd"
    }
}

// 定义协议变量
//let protocolValue: ddDelegate = "as" as! ddDelegate
//print(protocolValue.simpleDescription)

// 扩展
// 给Int 添加一个协议
extension Int: ddDelegate {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print("sdsdsdsdsdsdsd", 7.simpleDescription)

// 错误枚举
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}



