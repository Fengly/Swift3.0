//
//  main.swift
//  Swift_Protocol
//
//  Created by Riches on 2016/10/27.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// swift和Object-C 协议的区别
/**
 * 1.OC 中的协议只能用于类,swift中的协议不仅能用于类,还能用于结构体和枚举
 * 2.OC 中的协议可以设置可选实现,但Swift中的协议必须实现
 * 3.Swift中的协议增加了一个关键字mutating可以决定结构体和枚举实现协议的时候,是否可以修改属性的值
 */

// 协议的定义
protocol Love {
    var name:String{get set}
}

protocol Skill {
    var skill:String{get set}
}

// 协议可以继承协议(多个)
protocol LoveMusic:Love, Skill {
    func songMusic()
    var simpleDescription:String{get}
    mutating func modifyMusic(name:String)
}

// 协议的重写
//protocol Love{
//    var name:String{get set}
//}
//// 我们重写协议中的属性,让其只要get方法即可
//protocol LoveMusic:Love{
//    func songMusic()
//    var  simpleDescription: String { get }
//    mutating func modifyMusic(name:String)
//}

// 可以实现多个协议
class Student:Love, Skill {
    internal var skill: String = ""
    internal var name: String = ""
    internal func modifyMusic(name: String) {
    }
}


// 协议类型的变量
// 协议的标准写法
var prptocol:LoveMusic
var delegate:LoveMusic & Love & Skill

// 协议做函数参数
func getStudent(student:inout LoveMusic&Love) {
    student.songMusic()
    student.modifyMusic(name: "FLNuo")
}

/**
 * 在协议中定义属性的时候,必须使用set get \ get\ 修饰,但不能只用set修饰,swift要求我们属性必须有get方法
 
 * 类不能多次继承同一个协议
 */


/// 如果多个协议中有相同的方法和属性,只需要实现一次即可
protocol Love1{
    var name:String{get set}
    mutating func modifyMusic(name:String)
}
protocol Skill1{
    var name:String{get set}
    mutating func modifyMusic(name:String)
}
class Student1:Love1,Skill1{
    internal var name: String = ""
    internal func modifyMusic(name: String) {
    }
}




// 创建一个协议只能被类遵守
protocol MyClassDelegate: class{
    func getName()
}

// 当你要使用weak 修饰的时候
class UDP{
    weak var delegate: UDPDelegate?
    
    func associate() {
        delegate!.modifyMusic(name: "FLNuo")
    }
}
protocol UDPDelegate:class{
    func modifyMusic(name:String)
}











































































































