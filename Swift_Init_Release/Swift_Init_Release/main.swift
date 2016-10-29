//
//  main.swift
//  Swift_Init_Release
//
//  Created by Riches on 2016/10/27.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

class Person {
    var name:String
    var age:Int = 0
    var weight:Double = 0.0
    var Height:Double = 0.0
    init(name:String, height:Double) {
        self.name = name
        self.Height = height
    }
    init(name:String) {
        self.name = name
    }
    // 1.定义一个convenience 修饰的初始化方法,如果在同一个类中必须 调用其他没有convenience修饰的初始化方法
    convenience init(name:String, age:Int) {
        self.init(name:name)
        self.age = age;
    }
    // 2.如果定义两个或者多个convenience 修饰的初始化,只需要调用任意一个初始化方法即可满足语法要求
    convenience init(name:String, age:Int, weight:Double) {
        self.init(name:name)
        self.age = age
        self.weight = weight
    }
}
/**
 * 1.在同一个类,使用convenience修饰的初始化方法必须调用一个其他初始化方法
 * 2.convenience 必须最终调用一个指定的初始化方法
 * 3.当子类继承父类时,子类的初始化方法,必须调用父类的指定初始化方法,不能调用使用convienience修饰的方便初始化方法
 * 4.在swift3.0 初始化中,可以自己调用自己的初始化方法,系统不会检测出来,在创建convenience方便初始化方法的时候,需要小心,千万不要相互引用了
 * http://upload-images.jianshu.io/upload_images/1594482-120578a2c07a954b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240
 */


// 子类
class Man: Person {
    var address:String = ""
    // 重写父类指定的初始化方法
    override init(name: String) {
        super.init(name: name)
    }
    // 重写父类 convenience 修饰的初始化方法 不需要添加 override 关键字
    init(name: String, age:Int, weight: Double) {
        super.init(name: name)
    }
    // 创建自己的初始化方法
    convenience init(name: String, age:Int, weight:Double, address:String) {
        self.init(name:name)
        self.address = address
        self.age = age
        self.weight = weight
    }
}
/**
 * 1.创建新的指定初始化方法,必须调用父类的指定初始化方法 (Designated)
 * 2.创建新的方便初始化方法,必须调用自己的指定初始化方法,或者方便初始化方法(convenience)
 * 3.重写父类的指定初始化方法,在方法名前加override ,然后调用父类的指定初始化方法
 * 4.重写父类的方便初始化方法(convenience) 不需要加override 或者convenience 关键字,调用父类的指定初始化方法,如果加上convenice关键字,则必须调用自己的初始化方法
 * 5.如果子类没有初始化方法,系统会自动继承父类的初始化方法
 * 6.初始化调用父类初始化时,需要先初始化子类的存储属性,但是如果是convenience修饰的初始化方法,要先调用自己的其他初始化方法,然后再给自己的存储属性赋值
 */





// 反初始化(deinit) 释放
   // 例子: 
       // 有一个赌徒在银行存了10_000 元,赌徒从银行取钱然后去赌博,当赌徒对象释放了就将钱全部存到银行
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested:Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        print(numberOfCoinsToVend)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receve(coins:Int) {
        coinsInBank += coins
        print(coinsInBank)
    }
}
class Player {
    var coinsInpurse:Int
    init(coins:Int) {
        coinsInpurse = Bank.distribute(coins: coins)
    }
    func win(coins:Int) {
        coinsInpurse += coins
    }
    func loseAll(coins:Int) {
        coinsInpurse = 0;
        coinsInpurse = Bank.distribute(coins: coins)
        print("www", coinsInpurse, "!=!=!=!=!=!=!=!=", coins)
    }
    deinit {
        Bank.receve(coins: coinsInpurse)
    }
}
// 执行
var player_one:Player? = Player.init(coins: 1_000)
player_one!.win(coins: 2_000)
player_one!.loseAll(coins: 2_2000)
player_one = nil



































