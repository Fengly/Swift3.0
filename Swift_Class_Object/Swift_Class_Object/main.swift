//
//  main.swift
//  Swift_Class_Object
//
//  Created by Riches on 2016/10/27.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")


// 定义一个类
class Shape {
    var numberOfSides = 0 // 属性
    // 对象方法
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    // 类方法
    class func shapeDescription() -> String {
        return "我是一个定义形状的类"
    }
}

// 初始化
class NameShape {
    var numberOfSides: Int = 0
    var name: String
    // 注意初始化前面没有func
    init(name: String) {
        self.name = name
    }
}

// 继承
class Square: NameShape {
    var  sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
}

// 属性setter和getter
class Circle {
    var area: Double = 0.0 {
        willSet {
            r = sqrt(newValue/3.1415926)
        }
    }
    var r: Double {
        set {   // set(newValue){}
            area = newValue * newValue * 3.1415926
        }
        get {
            return sqrt(area/3.1415926)
        }
    }
}
// 监测属性willSet和didSet，顾名思义,就是用来检测属性值的变化


// 协议的添加
// 协议 1
protocol LoveMusic {
    func songMusic()
    
}
// 协议2
protocol Draw {
    func draw()
}
var music: String?
// 给类添加协议
class Student:LoveMusic,Draw {
    var name = "小明"
    func addMusic(name: String) {
        music = name
    }
    func draw() {
        print("会画画")
    }
    func songMusic() {
        print("会唱歌");
    }
}

// 定义父类
class Person {
    var name: String
    var reName: String {
        return self.name
    }
    init(_ name: String) {
        self.name = name
    }
    func describe() -> String {
        return self.name
    }
    class func describeClass() -> String {
        return "这是一个描述人的类"
    }
}
// 重写父类
class Man: Person {
    var score: Double
    // 重写父类
    override var reName: String {
        set {
            self.name = newValue
        }
        get {
            return self.name
        }
    }
    // 重写初始化
    override init(_ name: String) {
        self.score = 0.0
        super.init(name)
    }
    // 重写对象方法
    override func describe() -> String {
        return self.name + "\(self.score)"
    }
    // 重写类方法
    override class func describeClass() -> String {
        return "我是描述一个Man的类"
    }
}










