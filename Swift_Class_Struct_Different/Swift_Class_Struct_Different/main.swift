//
//  main.swift
//  Swift_Class_Struct_Different
//
//  Created by Riches on 2016/10/27.
//  Copyright © 2016年 Riches. All rights reserved.
//

/**
 共同点
 a.定义存储属性
 b.定义函数
 c.定义下标,使用下表访问自己的值
 d.定义初始化设置自己的初始化状态
 e.扩展自己的功能
 f.实现协议提供某种特定的标准功能
 
 不同点(类有更多功能)
 a.类可以继承,结构体不能继承
 b.类能够在运行时检查和解释类实例的类型
 c.Deinitializers使一个类的实例来释放任何资源分配
 d.类有引用计数,允许对象被多次引用
 */

import Foundation

print("Hello, World!")


// 定义
 // 类
class StudentC {
    
}
 // 结构体
struct StudentS {
    
}

// 定义存储属性
 // 类
class StudentC1 {
    var name:String?
}
 // 结构体
struct StudentS1 {
    var name:String
}

// 定义函数
 // 类
class StudentC2 {
    static var des:String = "学生的类"
    var name:String?
    func getName() -> String {
        return name!
    }
    
    class func describe() -> String {
        return des
    }
    
    static func getClassDescribe() -> String {
        return des
    }
}
 // 结构体
struct StudentS2 {
    static var des:String = "学生结构体"
    var name:String
    static func describe() -> String {
        return "这是一个定义学生的类"
    }
}



// 拓展
class StudentC3 {
    var names:[String] = ["1","2","3","4","5"]
    subscript (index:Int)->String?{
        get{
            if names.count <= index{
                return nil
            }
            return names[index]
        }
    }
}
// 定义结构体
struct StudentS3 {
    var names:[String] = ["1","2","3","4","5"]
    subscript (index:Int)->String?{
        get{
            if names.count <= index{
                return nil
            }
            return names[index]
        }
    }
}
// 执行
let student = StudentC3()
print(student[1]!)




// 初始化
// 定义类
class StudentC4 {
    var name:String
    init( name:String) {
        self.name = name
    }
}

// 定义结构体(默认带初始化方法)
struct StudentS4 {
    var name:String
//    init(name:String) {
//        self.name = name
//    }
}
let student1 = StudentC4(name: "FLNuo")
let student2 = StudentS4(name: "Still it")
print(student1.name, student2.name)


// 拓展功能
//extension StudentC {
//    func describe()->String{
//        return "学生" + self.name
//    }
//}
//extension StudentS {
//    func describe()->String{
//        return "学生" + self.name
//    }
//}


// 实现协议
// 定义一个协议
protocol Capacity{
    func draw() // 协议方法
}
// 定义类
class StudentC5:Capacity {
    // 实现协议方法
    internal func draw() {
    }
    var name:String
    init( name:String) {
        self.name = name
    }
}
// 定义结构体
struct StudentS5:Capacity {
    // 实现协议方法
    internal func draw() {
    }
    var name:String
}


// 继承
// 定义基类
class Person {
    var name:String
    init(name: String) {
        self.name = name
    }
}
// 定义类
class Student:Person {
    var score:Float
    init(name: String, score: Float) {
        self.score = score;
        super.init(name: name)
        self.name = name
    }
}

// 结构体不能继承



///////// mutating 关键字的作用
// 例子1
protocol Action {
    var myY: Int{mutating get}
}
struct Point {
    var x: Int
    var y: Int
    // 结构体或者枚举修改值必须在函数前面加mutating
    mutating func modifyX(x: Int) {
        self.x = x
    }
    // 注意计算属性,mutating 要加在getter方法前面
    var myY:Int {
        mutating get {
            self.y = self.y * 2
            return y
        }
    }
}
// 例子2
struct Point1 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point1(x: x + deltaX, y: y + deltaY)
    }
}
// 例子3
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
/**
 * 1.计算属性setter方法不用修改属性值不用添加mutating
 * 2.计算属性setter方法中修改属性值的时候，一定要加mutating
 */



// 检测两个对象地址是不是相同
class StudentC6 {
    var name: String
    init(name: String) {
        self.name = name
    }
}
let stu1 = StudentC6(name: "FLNuo")
let stu2 = stu1
if stu1 === stu2 {
    print("地址相同")
} else {
    print("地址不同")
}
/////// 类是引用类型,结构体是值类型,不能使用===/!== 判断地址



// 定义结构体
struct StudentS7 {
    var name:String
}
let stud1 = StudentS7 (name: "FLNuo A")
var stud2 = stud1
stud2.name = "FLNuo"
print(stud1.name)
print(stud2.name)




/////// Deinitializers使一个类的实例来释放任何资源分配
// 定义类
class StudentC8{
    var name:String
    init( name:String) {
        self.name = name
    }
    deinit {
        // 释放资源
    }
}



/////////// 什么时候用结构体
/**
 1.该结构的主要目的是封装几个相对简单的数据值
 2.如果你希望你的结构在传递的时候被赋值而不是引用
 3.希望结构在传递的时候,内部的属性也被复制而不是引用
 4.不需要继承属性或者方法
 */












































































































































































































































