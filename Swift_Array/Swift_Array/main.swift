//
//  main.swift
//  Swift_Array
//
//  Created by Riches on 2016/10/26.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 数组的定义
let list1 = ["您好", "1", "2", "3"]
var list2:[String] = ["您好", "1", "2", "3"]
var list3:[Any] = ["您好", "1", "2", "3", 2]
let list4:NSArray = ["您好", "1", "2", "3", 3]
var list5:NSMutableArray = ["您好", "1", "2", "3", 2]
let list6:[Int] = [1, 2, 3, 4]

// 清空数组
list2.removeAll() // 必须是 var
list2 = [] // 必须是 var
list5.removeAllObjects()
list5 = []  // 必须是 var

// 取代操作
list3[1...2] = ["w", "e"] // 将数组 [1, 2) 的范围用指定的数组取代
print(list3)

// 插入移除操作
list3.insert("sss", at: 0)
let mapleSyrup = list3.remove(at: 1)
let apples = list3.removeLast()
print(list3, apples)

// 遍历数组
for item in list3 {
    print(item)
}
for (index, value) in list3.enumerated() {
    print("Item \(index): \(value)")
}



// map
// map 的定义
//func map<T>(_ transform: (Element) throws -> T rethrows -> [T]
/**
 解释:
 T 为泛型
 transform: 闭包函数 我们需要给它传入一个有参数有返回值的闭包函数
 [T] 函数会返回给我们一个T类型的数组
 
 应用:我们有这样一个需求,给一组数据中大于20的数字乘以3
 */
// 定义一个数组
var numbers = [21, 52, 7, 54]
// 创建一个有一个参数一个返回值的闭包函数
var closure = {(number:Int) -> Int in
    var result = number
    if number > 20 {
        result *= 3
    }
    return result
}
// 调用 map 函数
print(numbers.map(closure))
// swift有类型推断的功能
let mappedNumbers = numbers.map({number -> Int in
    if number > 20 {
        return 3 * number;
    }
    return number
})
print(mappedNumbers)
// 如果没有逻辑判断,给所有值统一乘以3,我们甚至可以这样写
let mappedNs = numbers.map({number -> Int in
    return number * 3
})
print(mappedNs)
// 再简洁点
let mappedN = numbers.map({number in
    number * 3
})
print(mappedN)
// 如果你要将数组中的值全部替换为0你可以像下面这样
let mapped = numbers.map({_ in
    return 0
})
print(mapped)


// sort 排序
// public func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element]
// 冒泡排序
numbers.sort(by: {$0 < $1})
for i in 0..<numbers.count {
    var num = numbers[i]
    for j in i..<numbers.count {
        if num > numbers[j] {
            (numbers[j], num) = (num, numbers[j])
        }
    }
}
print(numbers)

var nums = Array(repeating: 3, count: 1000000)
for i in 0..<nums.count {
    nums[i] = i
}
var date1 = NSDate()
nums.sort(by: {$0 > $1})
print(NSDate().timeIntervalSince(date1 as Date))






