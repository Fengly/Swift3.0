//
//  main.swift
//  Swift_异常错误
//
//  Created by Riches on 2016/10/28.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")
/*
// 定义异常枚举类型
enum OSUserLoginError: Error {
    case AllNoComplete
    case UserNameEmpty
    case PasswordEmpty
}
 */
  //////// 注意异常枚举类型必须遵守Error 协议



// 可以输出错误值的枚举定义
  // 需求
      // 录入学生成绩,如果输入的成绩不在0...100 抛出异常
// 定义错误协议
enum ScoreInputError: Error {
    case lowZero(name: String, score: Float)
    case highHundred(name: String, score: Float)
}
// 定义含有异常机制的函数
func inputStudentName(name: String, score: Float)throws -> Bool {
    if score < 0 {
        throw ScoreInputError.lowZero(name: name, score: score)
    } else if score > 100 {
        throw ScoreInputError.highHundred(name: name, score: score)
    }
    // 开始录入
    // 录入结束
    return true
}
// 调用函数
do {
    let result = try inputStudentName(name: "FLNuo", score: 300)
} catch ScoreInputError.lowZero(let name, let score) {
    print("异常：\(name)的成绩为\(score)--小于0")
} catch ScoreInputError.highHundred(let name, let score) {
    print("异常：\(name)的成绩为\(score)--大于100")
}



// 处理不同类型的异常
  // 需求:
      // 用户输入的密码或者用户名为空抛出异常,如果是密码为空,输入密码为空的用户
// 异常
enum OSUserLoginError: Error {
    case AllNoComplete   // 都空
    case UserNameEmpty   // 用户为空
    case PasswordEmpty   // 密码为空
}
// 定义含有异常机制的函数
@discardableResult
func verifyUserName(userName: String, password: String)throws -> Bool {
    if userName == "" && password == "" {
        throw OSUserLoginError.AllNoComplete
    } else if userName == "" && password != "" {
        throw OSUserLoginError.UserNameEmpty
    } else if userName != "" && password == "" {
        throw OSUserLoginError.PasswordEmpty
    }
    return true
}
// 使用含有异常的函数
do {
    try verifyUserName(userName: "", password: "")
} catch OSUserLoginError.AllNoComplete {
    print("Error")
} catch OSUserLoginError.UserNameEmpty {
    print("用户名为空")
} catch OSUserLoginError.PasswordEmpty {
    print("密码为空")
}



// where 在错误类型的使用
enum ErrorType: Error {
    case success
    case error(code: Int)
}
@discardableResult
func inputScore(score: Int)throws -> Bool {
    if score < 0 {
        throw ErrorType.error(code: 0)
    } else if score > 100 {
        throw ErrorType.error(code: 1)
    }
    return true
}
do {
    let score = try inputScore(score: 112)
} catch ErrorType.error(let x) where x == 0 {  // 可以做判断错误类型
    print(x)
} catch {
    print(error)
}



// defer 的延时作用
  // 需求:
    // 我们定义一个用户对象,包含姓名和用户图像数据流
// 定义错误协议
enum StudentError: Error {
    case NameEmpty
    case ScoreLowZero
}
// 定义学生类
class Student {
    var name: String = "123"
    var score: Float = 0.0
    var userIcon:UnsafeMutableRawPointer = malloc(40 * 40 * 4) // 定义用户图像数据流
    init(name: String) throws {
        if name == "" {
            defer {
                free(self.userIcon)
                print("第二步 发生异常清理内存")
            }
            print("第一步 抛出异常")
            throw StudentError.NameEmpty
        }
        self.name = name
    }
}
// 调用函数
do {
    let student = try Student(name: "是")
} catch {
    print(error)
}
/**
 1.类中使用defer,在对象方法中,使用defer,在defer块中,调用属性之前,必须初始化所有存储属性,重要事说三遍,所有的存储属性,所有的,存储属性
 2.defer 在定义的当前作用域最后一步执行
 */






/// try 、try!、try? 的用法
   // try
// let student1 = try Student(name: "")
// print("运行结果\(student1)")



   // try!
// let student2 = try! Student(name: "")
// print("运行结果\(student2)")


   // try?
let student3 = try? Student(name: "")
print("运行结果\(student3)")

let student4 = try? Student(name: "234")
print("运行结果\(student4)")






// 应用
public enum OSNetError: Error {
    /// 错误类型枚举值
    case requestError(RequestError)
    case responseError(ResponseError)
    
    /// 请求错误异常
    public enum RequestError {
        case invalidUrl(url: URL)
        case parameterException
    }
    
    /// 响应错误异常
    public enum ResponseError: Int {
        case dataFileNill
        case missingContentType
        case unacceptableStatusCode
        case dataFileReadFailed
    }
}
// 请求
func requesUrl(url: URL)throws {
    if !url.absoluteString.contains("http") {
        throw OSNetError.requestError(.invalidUrl(url: url))
    } else if url.absoluteString.contains("//\\") {
        throw OSNetError.requestError(.parameterException)
    }  else if url.absoluteString.contains("0")  {
        throw OSNetError.responseError(.dataFileNill)
    }
}
// 调用
do {
    let a = URL.init(string: "http//0")
    try requesUrl(url: a!)
} catch OSNetError.requestError(.parameterException) {
    print("aaas")
} catch OSNetError.requestError(.invalidUrl) {
    print("网址错误")
} catch OSNetError.responseError(.dataFileNill) {
    print("请求错误")
}
































