//
//  main.swift
//  Swift_探究Self的用途
//
//  Created by Riches on 2016/10/29.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

// 如何实现对象拷贝
/**
  * 第一种方法：
      1. 遵守协议 NSCopying
      2. 实现协议
 */
// NSCopying协议
//public protocol NSCopying {
//    public func copy(with zone: NSZone? = nil) -> Any
//}

class Student: NSCopying {
    var name: String
    required init(name: String) {
        self.name = name
    }
    func copy(with zone: NSZone? = nil) -> Any {
        let student = Student(name: self.name)
        return student
    }
}
// 使用
let student1 = Student(name: "FLNuo")
let student2: Student = student1.copy() as! Student
//student2.name = "FenglyNuo Wang"
print(student1.name)
print(student2.name)



/**
 * 第二种方法
     1. 创建一个一个required 修饰的初始化方法
     2. 自定义一个copy方法
 */
class Teacher {
    var name: String
    required init(name: String) {
        self.name = name
    }
    func copy() -> Self {
        let result = type(of: self).init(name: self.name)
        return result
    }
}
// 使用
let teacher1 = Teacher(name: "FLNuo")
let teacher2 = teacher1.copy()
//student2.name = "FenglyNuo Wang"
print(student1.name)
print(student2.name)
////////////////
/**
   type(of: self)获取到自身类的类型,然后通过init(name:self.name) 初始化一个对象 ,初始化的对象为Self 类型
 */
/////////////////




/// 像拷贝这种行为, 不是很多对象都具有的行为,我们应该把它设计成协议，让类去继承它
protocol Copy {
    func copy() -> Self
}
//func copy() -> Student {
//    let result = Student.self.init(name: self.name)
//    return result
//}
//func copy() -> Student{
//    let result = Student.init(name: self.name)
//    return result
//}
//
//func copy() -> Student{
//    let result = Student(name: self.name)
//    return result
//}





/// 给多个对象扩展相同的方法
  /// 需求:
      /// 给数字扩展一个返回平方的操作
// 定义一个协议
protocol NumberProtocol {
}
// 扩展实现协议
extension Int: NumberProtocol {
}
extension Double: NumberProtocol {
}
// 给协议扩展方法
extension NumberProtocol {
    // 我们不确定返回的Self 到底是什么类型
    func squreValue() -> Self {
        if self is Int {
            let n = self as! Int
            return n * n as! Self
        }
        if self is Double{
            let n = self as! Double
            return n * n as! Self
        }
        return 0 as! Self
    }
}
print(3.44.squreValue())
print(3.squreValue())

















