//
//  main.swift
//  Swift_类簇
//
//  Created by Riches on 2016/10/29.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

/****
    - 类簇
      - 使用一个统一的接口定制单一的对象
*/
class Drinking: NSObject {
    class func drink(name: String) -> Drinking? {
        var drink: Drinking?
        switch name {
        case "Coke": drink = Coke(name: name)
        case "Beer": drink = Bear(name: name)
        default: break
        }
        return drink
    }
}
class Coke: Drinking {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Bear: Drinking {
    var name: String
    init(name: String) {
        self.name = name
    }
}
let coke = Drinking.drink(name: "Coke") as! Coke
print(coke.name)
































