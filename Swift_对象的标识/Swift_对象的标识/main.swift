//
//  main.swift
//  Swift_对象的标识
//
//  Created by Riches on 2016/10/28.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 获取类的标识
class Student {
}
let x = Student()
let y = x
print(ObjectIdentifier(x) == ObjectIdentifier(y))
print(x === y)
let z = Student()
print(ObjectIdentifier(x) == ObjectIdentifier(z))
print(x === z)
/// 创建对象的时候,会给对象分配一个独一无二的标识


