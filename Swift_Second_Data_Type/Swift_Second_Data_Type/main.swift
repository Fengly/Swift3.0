//
//  main.swift
//  Swift_Second_Data_Type
//
//  Created by Riches on 2016/10/26.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 常量的定义
let a = 46;
let a1: Int = 5
let b = 2.2
let b1: Double = 2.3
let name = "FLNuo"
let red, green, blue: Double
let cat = "🐱"; print(cat)   // 如果有；单行可以写多个语句
let c = 0b10001  // 二进制
let d = 0o217 // 八进制
let e = 0x11  // 十六进制
let f = 1.0145e2 // 科学计数法
let g = 0xC.3p0 // 十六进制科学计数法
let h = 1_000_000  // 使用_线将数字分开,便于认知
print(h)

// 定义变量
var myVariable = 42

// 类型转换
let num1: Int = 10;
let str = "\(num1)"
let str1 = String(num1)
let num2 = Int(str1)
let num3 = Int(num1)
let num4 = Double(str1)

// 数组的集中定义方式
var list1 = ["你好", "1", "2", "3", "4", "5"]
var list2:[String] = ["你好", "1", "2", "3", "4", "5"]
var list3:[Any] = ["你好", "1", "2", 3, "3", "4", "5"]
let list4:NSArray = ["你好", "1", "2", "3", "4", "5"]
var list5:NSMutableArray = ["你好", "1", "2", "3", "4", "5"]
// 清空数组
list2.removeAll()   // 必须是var定义
list2 = []  // 必须是var定义
list5.removeAllObjects() // var 或 let 都可以
list5 = []  // 必须是var
// 取代操作
list1[2...4] = ["a", "b"] // 将数组4...6的范围用指定的数组取代
print(list1)
// 插入
list3.insert(10, at: 0)
print(list3)



// 字典
let dic1:[String:Int] = [:]
let dic2 = [String:Int]()
let dic3:NSDictionary = NSDictionary()
let dic4:NSMutableDictionary = NSMutableDictionary()


// 获取数据类型的最大和最小值
let minValue = UInt8.min
let maxValue = UInt8.max
print("min = \(minValue), max = \(maxValue)", minValue, maxValue)


// 给数据类型设置别名
typealias Code = Int32  // 给Int32 设置别名
var tel:Code = 3484




// 元组类型
 // 1. 定义
   // 第一中定义方法
let http404Error = (404, "not found")
let code = http404Error.0
let error = http404Error.1
   // 第二中定义方法
let http404Error_2 = (code:404, error:"not found")
let code_2 = http404Error_2.code;
let error_2 = http404Error_2.error
   // 第三中定义方法
let http404Error_3:(code:Int, error:String) = (404, "not found")
let code_3 = http404Error_3.code
let error_3 = http404Error_3.error
   // 第四中定义方法
let http404Error_4:(code:Int,error:String) = (code:404, error:"not found")  //
let code_4 = http404Error_4.code
let error_4 = http404Error_4.error
   // 第五种定义方式
let http404Error_5:(code:Int,error:String) = (_:404, _:"not found")  //
let code_5 = http404Error_4.code
let error_5 = http404Error_4.error

 // 2. 缺省不需要的值
let (statusCode, _) = http404Error // 缺省不需要的值
let (_, statusMessage) = http404Error

 // 3. 赋值
var http404Error_6:(code:Int,error:String)
http404Error_6 = (code: 404, error: "not found") // 完整
http404Error_6 = (404, error:"not found") // 部分缺省
http404Error_6 = (404,"Not Found")// 全部名称缺省
http404Error_6 = (_:404, _:"Not Found") // 可以使用_代替名称
//http404Error_6 = (code1:404,"Not Found") // 不允许这样必须,名称必需和定义时保持一致



// 字符串和字符
let string = "hello,"+"world "+String(minValue)  // 字符串拼接
print(string)
var name1 = "😁！"
name1.append("您好")
print(name1)
// 判断字符串是否为空
if name1.isEmpty {
    print(name)
}
// 获取字符串中每个字符
for character in "Dog!🐶".characters {
    print(character)
}
for index in string.characters.indices {
    print("\(string[index])", terminator:"\n")
}
// 定义字符
let exclamationMark: Character = "!"
// 定义字符数组
let charcters:[Character] = ["c", "a"]
// 字符串数组转字符串
let catString = String(charcters)
print(catString)
// Unicode编码
let precomposed: Character = "\u{D55C}"
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
print(precomposed, regionalIndicatorForUS)
var dogAndMe = "🐶 amd me"
print(dogAndMe.characters.count) // 8 一个不管是什么都算一个字符
// 截取字符串
var greeting = "Guten Tag!"
// 截取单个
let gr = greeting[greeting.startIndex]
// 截取一段
let gr_2 = greeting[greeting.index(greeting.startIndex, offsetBy: 2)..<greeting.index(greeting.endIndex, offsetBy: -3)]
// 在指定位置插入字符串
greeting.insert(contentsOf: " is SB".characters, at: greeting.index(greeting.endIndex, offsetBy: -1))
print(greeting, gr, gr_2)
// 移除字符串
greeting.remove(at: greeting.index(greeting.endIndex, offsetBy: -2))
print(greeting)
let range = greeting.index(greeting.endIndex, offsetBy: -3)..<greeting.endIndex
greeting.removeSubrange(range)
print(greeting)
// 前缀和后缀
// greeting.hasSuffix("") 后缀
if greeting.hasPrefix("1Guten") {
    print("YES");
} else {
    print("NO");
}
// 获取对应的编码数据
for codeUnit in dogAndMe.utf16 {
    print("\(codeUnit)", terminator:"")
}



// 扩展
extension Int {
    func description() -> String {
        return "\n我是一个Int类型的数字\(self)"
    }
}
print(3.description())

// 协议扩展
protocol NumerProtocol {
    func description() -> String
}
// 扩展实现协议
//extension Int:NumerProtocol {
//    func description()-> String{
//        return "我是一个Int类型的数字\(self)"
//    }
//}

// 定义个协议
protocol NumberProtocol{
}

// 扩展实现协议
extension Int:NumberProtocol{
}

extension Double:NumberProtocol{
}
extension NumberProtocol {
    func description()-> String{
        if self is Int{
            return "我是一个Int类型的数字\(self)"
        }
        if self is Double{
            return "我是一个Double类型的数字\(self)"
        }
        return "我既不是Int也不是Double类型的数字\(self)"
    }
}
print(3.44.description())
print(3.description())






