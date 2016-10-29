//
//  main.swift
//  Swift_动态调用对象(实例)方法
//
//  Created by Riches on 2016/10/29.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

// 实现步骤
/**
 * 1.定义一个父类
 * 2.在父类中定义动态调用的方法
 * 3.引用父类的动态方法
 * 4.子类重写父类的动态方法
 * 5.在3引用的动态方法中传入需要执行方法的子类
 * 6.执行方法
 */
// 定义一个父类
class Person {
    func describe() {
        print("父类")
    }
}
// 定义一个子类
class Man: Person {
    override func describe() {
        print("子类")
    }
}
// 动态调用
// 引用父类的方法
//let describe = Person.describe
//// 传入实际执行的实例对象
let man = Man()
//let describeS = describe(man)
//// 执行方法
//describeS()

Person.describe(man)()












































































































































































































