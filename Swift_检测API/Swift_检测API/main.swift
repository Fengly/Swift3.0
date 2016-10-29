//
//  main.swift
//  Swift_检测API
//
//  Created by Riches on 2016/10/28.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 基本写法

 // 写法一
if #available(iOS 10, *) {
    print("支持iOS10")
} else {
    print("不支持10,支持10之前的版本")
}

 // 写法二
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}




