//
//  main.swift
//  Swift_Property
//
//  Created by Riches on 2016/10/27.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 定义结构体
//struct Range {
//    // 结构体定义存储属性
//    let first: Int
//    var length: Float
//}
//class Student {
//    // 类定义存储属性
//    var name: String!
//    var score: String!
//    var age: Int!
//}

// 计算属性（用于 类、结构体、枚举）
   // 1. 定义
       // 结构体的使用
struct Range {
    var first: Int
    var reFirst: Int { // 有setter 和 getter的计算属性
        set {
            first = newValue
        }
        get {
            return first
        }
    }
    
    var length: Int
    var reLength: Int { // 只有get方法计算属性
        get {
            return length
        }
    }
}
       // 枚举的使用
enum Person: String {
    case Man = "男"
    case Woman = "女"
    // get
    var name: String {
        return self.rawValue
    }
    // setter && getter
    var reName: String {
        set(newName) {
            self = Person(rawValue: newName)!
        }
        get {
            return self.rawValue
        }
    }
}
var person = Person.Man
print(person.rawValue)
person.reName = "女"
print(person.rawValue)
/**
 * 1.如果计算属性只有getter 方法,那么这个get 可以被省略
 * 2.setter 可以设置新值名字,如果没有设置默认为newValue
 * 3.let 不能修饰计算属性
 */
print("------------------------")


// 监测属性
class Circle {
    var area: Double = 0.0
    var r: Double = 0.0 {
        willSet {
            print("有新值")
            area = Double.pi * newValue * newValue
        }
    }
}
let circle = Circle()
//circle.r = 10.0
//print(circle.area)
func calcalate(r:inout Double) {
    print("函数开始执行")
    r = 2.0
    print("函数执行结束")
}
calcalate(r: &circle.r)
print(circle.area, circle.r)
/**
 * 1.监测属性,其实是给存储属性上添加的一种监测功能,willSet 监测新值,didSet 监测旧值
 * 2.如果函数的参数是 inout 修饰的,你如果将监测的属性传入这个函数的时候,此时会将属性的值拷贝一份,在函数结束的时候,将值重新付给属性,所以函数执行完毕后,会触发监测函数(打印结果证实)
 */



// Lazy 关键字使用(只能用于存储属性)
/**
 * 1.只能用于存储属性
 * 2.修饰的属性必须有初始化
 * 3.在结构体中使用Lazy 修饰的属性,在访问的方法前必须加mutating 修饰
 * 4.不能用于全局属性或者静态变量
 * 5.存储属性被lazy修饰,只被初始化一次,在多线程访问时,不需要使用lazy标记
 */
print("------------------------")
struct Animal {
    lazy var name = "Animal"
    mutating func calculate() {
        let name = self.name
        print("name = \(name)")
    }
    var myName: String { // getter方法
        mutating get {
            return name
        }
    }
}
var animal = Animal()
print(animal.myName)
animal.calculate()
animal.name = "Dog"
print(animal.myName)
animal.calculate()
print("------------------------")


// static 和 class 关键字的用法
// ---------- 相同点 ----------
/**
 * 1.可以修饰方法,static 修饰的方法叫做静态方法,class修饰的叫做类方法
 * 2.都可以修饰计算属性
 */
// ---------- 不同点 ----------
/**
 * class 不能修饰存储属性
 * class 修饰的计算属性可以被重写,static 修饰的不能被重写
 * static 可以修饰存储属性,static修饰的存储属性称为静态变量(常量)
 * static 修饰的静态方法不能被重写,class 修饰的类方法可以被重写
 * class 修饰的类方法被重写时,可以使用static 让方法变为静态方法
 * class 修饰的计算属性被重写时,可以使用static 让其变为静态属性,但它的子类就不能被重写了
 * class 只能在类中使用,但是static 可以在类,结构体,或者枚举中使用
 */
class Fruit {
    static var describe: String = "这是一个水果"
    class var score: Int {
        return 0
    }
    // class 修饰的类方法可以被子类重写， static 修饰的静态方法不能被重写
    class func getSoreI() -> Int {
        return score
    }
}
class Apple: Fruit {
    // 重写计算数学 可以使用static 来重写， 但是static 重写后，就不能被它的子类再次重写了
    class override var score: Int {
        return 1
    }
    // 重写类方法时用 static 让其变成静态方法
    static override func getSoreI() -> Int {
        return score
    }
}
let apple = Apple()
print(Apple.score, Apple.getSoreI())
print("------------------------")



// 参数是闭包执行的结果
class Student {
    var name: String
    var score: Int
    init(_ name:String, _ score:Int) {
        self.name = name;
        self.score = score;
    }
    let describe: String = {
        print("闭包已经开始执行")
        return "我在 \(getTime()) 被创建"
    }()
}
// 获取时间
func getTime() -> Date {
    return Date()
}
let p = Student("FLNuo", 99)
print(p.describe)

// 下面和上面是同一样的效果
//class Student{
//    var name:String
//    var score:Int
//    init(name:String,score:Int) {
//        self.name = name
//        self.score = score
//    }
//    let describe: String = myDescribe()
//}
//
//// 获取时间
//func getTime()-> Date{
//    return Date()
//}
//func myDescribe()->String{
//    return "我在\(getTime())被创建了"
//}
//let p = Student(name: "酷走天涯", score: 3)
print("------------------------")

// 参数是闭包
class Teacher {
    var name: String
    var course: String
    init(name: String, course: String) {
        self.name = name;
        self.course = course
    }
    let describe:() -> String = {
        print("闭包开始执行")
        return "我在\(getTime1())被创建了"
    }
}
// 获取时间
func getTime1() -> Date {
    return Date()
}
func myDescribe() -> String{
    return "我在\(getTime1())被创建了"
}
let t = Teacher.init(name: "FLNuo", course: "English")
print(t.describe())


//class Teacher{
//    var name:String
//    var score:Int
//    init(name:String,score:Int) {
//        self.name = name
//        self.score = score
//    }
//    let describe: ()->String = myDescribe
//}
//// 获取时间
//func getTime1()-> Date{
//    return Date()
//}
//func myDescribe()->String{
//    return "我在\(getTime1())被创建了"
//}
//let t = Teacher(name: "FLNuo", course: "English")
//print(t.describe())
print("------------------------")

// 练习
  /**
    * 需求：
          有个自定义类,类中有一个数组,数组中包含20位斐波那契数列
   */

class Calculate {
    var fibo:[Int] = {
        // 定义一个数组
        var nums:[Int] = []
        func Func(n:Int) -> Int {
            if n < 2 {
                return n
            } else {
                return Func(n: n - 1) + Func(n: n - 2)
            }
        }
        for i in 0..<20 {
            print(i)
            nums.append(Func(n: i))
        }
        return nums
    }()
}

let c = Calculate()
print(c.fibo)


print("------------------------")






















