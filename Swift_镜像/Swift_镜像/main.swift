//
//  main.swift
//  Swift_镜像
//
//  Created by Riches on 2016/10/29.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation


////////////////////////////////////////////////
/** *************输出对象的内容到控制台***********************
 */
struct Person {
    var name: String
    var age: Int
    var wight: Double
}
let person:Any = Person(name: "FLNuo", age: 23, wight: 36.0)
dump(person)


// 镜像的使用
  // 做个简单的对象转字典应用
@discardableResult
func anyobjectConvertDic(any: Any) -> [String: Any]? {
    var dic: [String: Any] = [:]
    for childer in Mirror(reflecting: any).children {
        dic[childer.label!] = childer.value
    }
    return dic
}
print(anyobjectConvertDic(any: person))











































































































































































































