//
//  main.swift
//  Swift_Dictionary
//
//  Created by Riches on 2016/10/26.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 创建
var namesOfIntagers = [Int:String]()
var airports:[String:String] = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]
var airports_2 = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]



// 赋值
namesOfIntagers[16] = "sixteen"
airports["LHR"] = "London Heathrow"
print(namesOfIntagers, airports)
// 更新值返回旧的值，值可能为nil
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}
print(airports)
if let x = airports["LHR"] {
    print(x)
}



// 清空
print(namesOfIntagers)
namesOfIntagers = [:]
print(namesOfIntagers)

//print(airports)
//airports = [:]
//print(airports)

// 检测是否为空
if airports.isEmpty {}

// 移除
airports["LHR"] = nil
print(airports)
airports.removeValue(forKey: "YYZ")
print(airports)

for (airportCode, airportName) in airports_2 {
    print("\(airportCode):\(airportName)")
}
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
for airportName in airports.values {
    print("Airport name: \(airportName)")
}

// 将字典的keys或者values放入数组中(不是数组,但是可以通过for...in遍历它里面的元素)
let keys = airports_2.keys;
let values = airports_2.values;
print(keys)
print(values)
for item in keys {
    print(item)
}
for item in values {
    print(item)
}

