//
//  main.swift
//  Swift_元类型
//
//  Created by Riches on 2016/10/28.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

/**
// 认识AnyClass
typealias AnyClass = AnyObject.Type
/**
 所有类都隐士实现的协议
 当你在一个或者类中使用@obj 创建类方法或者属性时,会被系统知道,认为它是AnyClass 的方法
 */

// 例子
class Student {
    @objc static let describe = "这是个学生类"
    @objc class func getDefaultValue() -> Int {
        return 0
    }
}
// 定义两个方法
func getDefaultValue(_ c: AnyClass) -> Int? {
    return c.getDefaultValue?()
}
func getDescribeValue(_ c: AnyClass) -> String? {
    return c.describe
}
// 调用
print(getDefaultValue(Student.self))
print(getDescribeValue(Student.self))

print(getDefaultValue(NSString.self))
print(getDescribeValue(NSString.self))
 */


// 类的类型
// let AnyClass = AnyObject.type
 // 获取类的类型
class Student {
    required init() {
    }
}
// 定义类的类型变量
let StudentType: Student.Type = Student.self
// AnyClass 可以接受任何类的类型
let type: AnyClass = Student.self
print(StudentType, type)

 // 通过类的类型初始化对象
let student = StudentType.init()
///// 通过这种方式初始化对象的时候,必须有required 修饰的初始化方法才行





// 对类的类型做类型检测
protocol TeacherDelegate {
    
}
class Teacher: TeacherDelegate {
    
}
let teacherType = Teacher.self
func isStudentDelegate(_ type: AnyClass) -> Bool {
    if type is TeacherDelegate.Type {
        return true
    } else {
        return false
    }
}
print(isStudentDelegate(teacherType))



























































































































































































