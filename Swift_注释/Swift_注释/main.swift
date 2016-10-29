//
//  main.swift
//  Swift_注释
//
//  Created by Riches on 2016/10/28.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")



// 单行注释




/* 多行注释 */



/* 注释的开头
 /* 注释的内容部分 */
 注释的结尾 */




// MARK: - 标记在函数的前面




/*
 * @func  定义一个查询学生成绩的接口
 * @param name 学生姓名
 * @param nums 序号
 * @return 返回查询到的成绩
 */




/// 苹果官方使用/// 注释属性




/// 定义一个查询学生成绩的接口  苹果官方注释方法
///
///     let score =  getScoreStudentName(name: "FLNuo", nums: "LOVE")
///
/// - Parameters:
///     - name:  学生姓名
///     - nums:  学号
/// - Returns: 返回学生成绩

func getScoreStudentName(name:String,nums:String)->Double{
    return 0.0
}



/**
 定义一个查询学生成绩的接口
 
 let score =  getScoreStudentName1(name: "FLNuo", nums: "SI")
 
 - Parameters:
 - name:  学生姓名
 - nums:  学号
 - Returns: 返回学生成绩
 */
func getScoreStudentName1(name:String,nums:String)->Double{
    return 0.0
}




// MARK: 粗体标签
// WARNING:  警告提示
// TODO: 提示未完成的地方
// FIXME: 提示需要修改的地方
























