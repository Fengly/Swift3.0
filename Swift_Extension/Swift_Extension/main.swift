//
//  main.swift
//  Swift_Extension
//
//  Created by Riches on 2016/10/28.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 给存在的类型增加扩展
protocol Custom {
    var describe: String{get}
}
// 通过拓展的方式，让 Int 实现协议
extension Int: Custom {
    var describe: String {
        return String(self)
    }
}


// 需求: 
    // 给Array 扩展一个属性,但是只能让元素为Int 时才能使用
extension Array where Element: Custom {
    var lastValue: Element {
        return self[count - 1]
    }
}
// 使用
let nums = [1, 2, 3, 4, 5]
print(nums.lastValue)

////////// 1.不能给对象扩展存储属性




















































