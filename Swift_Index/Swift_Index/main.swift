//
//  main.swift
//  Swift_Index
//
//  Created by Riches on 2016/10/28.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 定义
/**
subscript(index: Int) -> Int {
    get {
    }
    set {
    }
}
 */



// 应用
  // 需求：获取字符串第2个字符
    // 一般写法
func getCharacterByIndex(n: Int, string: String) -> Character? {
    let index = string.characters.index(string.characters.startIndex, offsetBy: n)
    return string.characters[index]
}
let c = getCharacterByIndex(n: 2, string: "FLNuo")
print(c!)

    // 扩展写法
let string = "Good afternoon, Mr Wang"
extension String {
    subscript(n: Int) -> Character {
        let index = self.index(self.characters.startIndex, offsetBy: n)
        return self.characters[index]
    }
}
let c_c = string[3]
print(c_c)


  // 需求: .截取范围内的字符串
extension String {
    subscript(begin: Int, end: Int) -> String {
        let rang = self.index(startIndex, offsetBy: begin) ... self.index(startIndex, offsetBy: end)
        return self[rang]
    }
}
// 调用
let cs = string[5, 13]
print(cs)



// 最优雅的写法
extension String {
    subscript(range: ClosedRange<Int>) -> String {
        let rang = self.index(startIndex, offsetBy: range.lowerBound) ... self.index(startIndex, offsetBy: range.upperBound)
        return self[rang]
    }
}
let cs_cs = string[5...13]
print(cs_cs)

/**
 1.下标的参数不能是inout 修饰的类型
 2.类或者结构体可以提供任意多个下标实现
 3.下标也是可以在枚举中使用的
 */

























































































































































































































































































































































































































