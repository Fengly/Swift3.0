//
//  main.swift
//  Swift_Set
//
//  Created by Riches on 2016/10/26.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 集合的定义
var letters = Set<Character>()
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favorite: Set = ["Rock", "Classical", "Hip hop"]


// 清空
letters = []
letters.removeAll()

// 插入
letters.insert("a")

// 判断集合是否为空
if letters.isEmpty {
    
}

// 插入元素
favoriteGenres.insert("Jazz")

// 移除元素
if let removeGenre = favoriteGenres.remove("Rock") {
    print("\(removeGenre)?I'm over it.")
} else {
    print("I never much cared for that.")
}
print(favoriteGenres)

// 是否包含元素
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}


// 遍历集合中的元素
let favoriteGenre:Set = ["A","B","C","G","D"]
for genre in favoriteGenre.sorted(by: >) {
    print("\(genre)")
}


// 集合的运算
let oddDigits:Set = [1, 2, 3, 4, 5]
let evenDigits:Set = [2, 4, 6, 7, 9]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
// 并运算（并集）
let a = oddDigits.union(evenDigits).sorted()
print(a)
// 交运算（交集）
let b = oddDigits.intersection(evenDigits).sorted()
print(b)
// 减运算（差集）
let c = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
print(c)
//
let d = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
print(d)











		
