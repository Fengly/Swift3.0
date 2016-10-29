//
//  main.swift
//  Swift_泛型
//
//  Created by Riches on 2016/10/28.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 需求: 
    // 将一个不确定的类型初始化后放入一个数组中,设计一个这样的接口
@discardableResult
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0 ..< numberOfTimes {
        result.append(item)
    }
    return result
}
var ar = ["1", "2", "3", "4"]
print(makeArray(repeating: 10, numberOfTimes: 1))
print(makeArray(repeating: 11, numberOfTimes: 1))

// 需求:
    // 写一个接口,判断两个数组中否包含有相同的对象(不是地址相等,是内容相等)
@discardableResult
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
/**
 Sequence: 一种协议 序列
 Equatable : 一种协议 实现了这种协议的对象 就能用 == 进行判断了
 Iterator: 提供了序列的迭代接口
 Element: 序列中的元素
 
 如果T U 实现了Sequence 协议，并且T里面的元素实现了Equatable 协议 你就可以调用这个接口
 */


// 如何返回获取相交的数据呢?
@discardableResult
func anyCommonArray<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Array<T.Iterator.Element>
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        var array: [T.Iterator.Element] = Array()
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    array.append(lhsItem)
                }
            }
        }
        return array
}

let a = ["4", "3", "2", "1"]
let b = ["3", "4", "5", "6"]
print(anyCommonArray(a, b))



































































































































































































