//
//  main.swift
//  Swift_Flow_Control
//
//  Created by Riches on 2016/10/26.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 三目运算符(?)
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)


// ?? 的使用
let a:Int! = 3
let b = 4
// 如果a不为nil则对a进行解包，赋值给b,否则赋值将b的值付给a，再给c
let c = a != nil ? a! : b
print(c)
// 使用?? 可以很方便实现上面的功能
let c_c = a ?? b // 如果a为nil则使用b的值替换a的值,如果a不为nil,则对a解包然后将值付给b


// 范围操作符 ... && ..<
for index in 1..<5 {
    print("\(index) times 5 is \(index * 5)")
}

// 多种逻辑操作符的结合
//if entereDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
//    
//}

// for...in
// 遍历数组
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)")
}
// 遍历字典
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (key, value) in numberOfLegs {
    print("key:\(key), value:\(value)")
}

// while 
var i = 10
while i > 1 {
    print("i = \(i)")
    i -= 1
}

// repeat ... while
var j = 10
repeat {
    print("j = \(j)")
    j -= 1
} while j >= 0

// switch
   // 间隔法
   // 条件判断法
   // 元组法
func inputPoint0(point : (Float,Float)) {
    switch point {
    case (_,0):
        print("在x轴上")
    case (0,_):
        print("在y轴上")
    case (_,_):
        print("既不在x轴,也不在y轴上")
    }
}
   // 值绑定法
//func inputPoint1(point : (Float,Float)) {
//    switch point {
//    case (let x ,0):
//        print("在x轴上\\(x)")
//    case (0,let y):
//        print("在y轴上\\(y)")
//    case let (x,y):
//        print("既不在x轴,也不在y轴上\\(x),\\(y)")
//    } 
//}



















