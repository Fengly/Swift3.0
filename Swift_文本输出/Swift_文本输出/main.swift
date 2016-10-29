//
//  main.swift
//  Swift_文本输出
//
//  Created by Riches on 2016/10/29.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

// 文本方式输出对象
class Person: CustomStringConvertible {
    var name: String
    var age: Int
    var weight: Double
    init(name: String, age: Int, weight: Double) {
        self.name = name
        self.age = age
        self.weight = weight
    }
    var description: String {
        return name + " " + String(age) + " " + String(weight)
    }
}
let person = Person.init(name: "FLNuo", age: 23, weight: 133)
// 获取文本对象
let des = String(describing: person)
print(des)
////////////////// 让对象文本输出很简单，只要实现协议CustomStringConvertible 即可



//class Person:NSObject,CustomStringConvertible {
//    var name: String
//    var age: Int
//    var weight:Double
//    init(name:String,age:Int,weight:Double) {
//        self.name = name
//        self.age = age
//        self.weight = weight
//    }
//    var description: String{
//        return name + String(age) + String(weight)
//    }
//}

///////////////// NSObject 里面已经实现了协议CustomStringConvertible,不能重复实现,我们只需要重写var description: String 即可

//class Person:NSObject {
//    var name: String
//    var age: Int
//    var weight:Double
//    init(name:String,age:Int,weight:Double) {
//        self.name = name
//        self.age = age
//        self.weight = weight
//    }
//    override var description: String{
//        return name + String(age) + String(weight)
//    }
//}
































































































































































































