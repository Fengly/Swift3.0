//
//  main.swift
//  Swift_对象判等
//
//  Created by Riches on 2016/10/29.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

/**
 1.对象遵守协议Equatable
 2.实现协议的方法
 */
// 第一种写法 在类内部实现
//class A: Equatable {
//    var name: String?
//    static func == (lhs: A, rhs: A) -> Bool {
//        return lhs.name == rhs.name
//    }
//}

// 第二种写法 将实现方法写到全局去
//class A: Equatable{
//    var name:String?
//}
//func ==(lhs: A, rhs: A) -> Bool{
//    return lhs.name == rhs.name
//}
//
//
//
//// 使用扩展方式去实现协议
//extension A: Equatable {
//    static func == (lhs: A, rhs: A) -> Bool {
//        return lhs.name == rhs.name
//    }
//}














































