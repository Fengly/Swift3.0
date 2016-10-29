//
//  main.swift
//  Swift_空间命名
//
//  Created by Riches on 2016/10/28.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 如果你不想给类名加前缀,然后又想避免出现类名冲突,这个时候,就可以使用它了
struct MyClassContrainer1 {
    class Student {
        func getName() -> String {
            return "name"
        }
    }
}
struct MyClassContrainer2 {
    class Student {
        func getName() -> String {
            return "FLNuo"
        }
    }
}
let student1 = MyClassContrainer1.Student()
let student2 = MyClassContrainer2.Student()
print(student1.getName(), student2.getName())

/**
// 通知中心
NotificationCenter.default.post(name: Notification.Name("SocketConnectFailure"), object: ["errorCode": 000])
// 注册通知中心
NotificationCenter.default.addObserver(MyClassContrainer2.Student.self, selector: #selector(SocketConnectFailure(notification:)), name: Notification.init(name: "SocketConnectFailure"), object: nil)
func SocketConnectFailure(notification: NotificationCenter) {
}
 */

extension Notification.Name {
    /// 使用命名空间的方式
    public struct SocketTask {
        public static let connectFailure = Notification.Name(rawValue: "SocketConnectFailure")
        public static let connectSuccess = Notification.Name(rawValue: "SocketConnectSuccess")
    }
}
// 使用
// 通知中心post 消息
/**
NotificationCenter.default.post(name: Notification.Name.SocketTask.connectFailure, object: ["errorCode":000])
// 增加观察者
NotificationCenter.default.addObserver(self, selector: #selector(SocketConnectFailure(notification:)), name: Notification.Name.SocketPort.connectFailure, object: nil)

func notification(no: NotificationCenter) {
    
}
 */



























































































































































































































