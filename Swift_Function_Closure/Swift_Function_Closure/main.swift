//
//  main.swift
//  Swift_Function_Closure
//
//  Created by Riches on 2016/10/27.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")

// 无参无返回
func greet() -> Void {
}
func greet1() {
}

// 有参无返回
func greet2(name:String, age:Int) {
    print(name, age)
}
greet2(name: "FLNuo", age: 23)
// func greet2(_ name:String, _ age:Int) 这么写可省略外部参数

// 有参数有返回
func greet3(name:String, age:Int) -> (name:String, age:Int) {
    return (name:name, age:age)
}
print(greet3(name: "FLNuo", age: 23))

// 无参数有返回
func greet4() -> String {
    return greet3(name: "FLNuo", age: 23).name
}
print(greet4())


// 参数的定义
  // 1. 单值
func calculate(a:Int) {
    
}
  // 2. 多值
func calculate2(a:Int...) {
    for i in a {
        print(i)
    }
}
calculate2(a: 1, 2, 3)
  // 3. 元组
func calculate3(_ a:(name:String, age:Int)) {
    let name = a.name
    let age = a.age
    print(name, age)
}
calculate3(("FLNuo", 23))
  // 4. 数组
func calculate4(a:[String]) {
    print(a)
}
calculate4(a: ["a", "b", "c", "d"])
  // 5. 定义字典
func calculate5(a:[Int:String]) {
    print(a)
}
calculate5(a: [1:"a", 2:"b"])
  // 6. 函数作为参数
func add(a:Int, b:Int) -> Int {
    return a + b
}
func calculate6(a:(Int, Int) -> Int) {
    print(a(1, 2))
}
calculate6(a: add)
  // 7. 上面函数的闭包写法
//calculate6 {(a, b) -> Int in
//    return a + b
//}
//calculate7 {(a, b) in a + b}
  // 8. 参数为协议的方法
protocol Player { // 协议的定义
    func play()
}
func calulate8(player:Player) {
    player.play()
}
  // 9. 参数为结构体
struct Student {
    var name:String
    var age:Int
}
func getStudentDescription(student:Student) {
    print(student.name)
    print(student.age)
}
var student = Student(name:"FLNuo", age:23)
getStudentDescription(student: student)
  // 10. 参数为枚举类型
enum CarType:String {  // 枚举的定义
    case Lincoln = "林肯"
    case Mercury = "水星"
    case Suzuki  = "铃木"
}
func describeCar(carType:CarType) {
    print(carType.rawValue)
}
describeCar(carType: CarType.Lincoln)



// 函数的内部定义函数
 // 需求: 
     // 创建一个接口,输入true 返回 两个数相加的函数,输入false 返回两个数相减的函数
func generateFuncByFlag(flag:Bool) -> (Int, Int) -> Int {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    func decrease(a: Int, b: Int) -> Int {
        return a - b
    }
    if flag {
        return add
    } else {
        return decrease
    }
}
// 调用
let myFunction = generateFuncByFlag(flag: true)
// 执行
print(myFunction(1, 2))



// 设置默认参数值
func addStudent(student:(name:String, score:Double) = ("FLNuo", 23.0)) {
    print(student.name, student.score)
}
addStudent()
addStudent(student: ("Fengly", 22.0))


// inout的使用
   // 如果参数是let 修饰的常量
//func swapTwoInts(a:Int, b:Int) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
func swapTwoInts(a:inout Int, b:inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var a = 30
var b = 40
swapTwoInts(a: &a, b: &b)
print(a)
print(b)
/**
 * 1.inout的位置 在: 后面,数据类型前面
 * 2.inout 修饰的参数不能有默认值
 * 3.inout 不能用于修饰多值(如a:Int...)
 */




// 定义函数类型的变量
func swapTwoInt(a:inout Int, b:inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var swap1:(inout Int, inout Int) -> Void = swapTwoInt
// 错误的写法  不能使用a,b标签
//var swap2:( a :inout Int, b: inout Int)->Void = swapTwoInt
// 你应该像下面这样
var swap3:( _ :inout Int, _: inout Int)->Void = swapTwoInt
// 或者下面这样也可以,a,b 不一定要和实际函数对应
var swap4:( _ a:inout Int, _ b: inout Int)->Void = swapTwoInt
// 建议还是用下面这种
var swap5:( inout Int, inout Int)->Void = swapTwoInt


// 定义闭包类型数据 (闭包：无参有返的闭包形式，如下)
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let customerProvider = { customersInLine.remove(at: 0)}
print(customersInLine.count)
print("Now serving \(customerProvider())!")
print(customersInLine.count)
print(customerProvider())


// 关键字 @discardableResult
  // 函数的setNewScore 方法有返回值,但是调用的时候,没有使用常量或者变量接受这个返回值,系统会产生警告
  // 通过加关键字@discardableResult去除这种警告 如下
class OSStudent {
    var name:String!
    var score:Double!
    @discardableResult
    func setNewScore(score:Double) -> Bool {
        if name == nil || name.isEmpty{
            return false
        }
        self.score = score
        return true
    }
}
OSStudent().setNewScore(score: 34.0)


// 如何获取,函数自己的名称,在那个文件中,在文件多少行
// 定义一个获取获取函数名称,获取文件路径的函数
func getFunctionName(name:String = #function, line:Int = #line, file:String = #file){
    print(name)
    print(line)
    print(file)
}
// 比如我们要获取下面函数的信息,只需要将函数写入要获取信息函数的内部调用即可
func  getUserName(){
    getFunctionName()
}
// 执行函数
getUserName()




// 定义一个父类
class Person{
}
// 定义一个男人
class Man:Person{
}
// 定义一个女人
class Woman:Person{
}

// 定义三个描述人的方法
func describePerson(_ person:Person){
    print("我是人类")
}

func describePerson(_ woman:Woman){
    print("我是女人")
}

func describePerson(_ person:Man){
    print("我是男人")
}

// 定义一个描述男人的女人的方法
func descripePerson(_ person:Person,_ woman:Woman){
    describePerson(person)
    describePerson(woman)
}
// 执行
descripePerson(Man(), Woman())
/**
 * 参数man 在值没有传入之前,被默认为Person 进行编译了,所以不管我们传入男人或者女人都之调用人类描述的方法。
 */
print("------------------------")
// 处理如下
func descripePerson2(_ person:Person...){
    for per in person {
        if per is Woman {
            describePerson(per as! Woman)
        } else {
            describePerson(per as! Man)
        }
    }
//    describePerson(woman)
}
// 执行
descripePerson2(Man(), Woman())

////下面这种写法也是可以的
//func descripePerson(_ person:Person,_ woman:Woman){
//    if let woman = person as?  Woman{
//        describePerson(woman)
//    } else {
//        describePerson(person as! Man)
//    }
//    describePerson(woman)
//}



// 泛型
func swap<T>(a:inout T, b:inout T) {
    (a, b) = (b, a)
}
var aaa = 1
var bbb = 2
print("交换前---------------------")
print(aaa)
print(bbb)
swap(a: &aaa, b: &bbb)
print("交换后----------------------")
print(aaa)
print(bbb)



class AWoman {
    var name = "女人"
    init(name: String) {
        self.name = name
    }
}
var f_w = AWoman.init(name: "小红")
var s_w = AWoman.init(name: "小白")
print("交换前---------------------")
print(f_w.name)
print(s_w.name)
swap(a: &f_w, b: &s_w)
print("交换后----------------------")
print(f_w.name)
print(s_w.name)



// @escaping 用法
//var downloadComplate:(Bool) -> ()
//func downLoadResource(url:String, complate:(Bool) -> ()) {
//    downloadComplate = complate
//    // 异步下载，下载完成调用
//    downloadComplate(true)
//    // 下载失败
//    downloadComplate(false)
//}
/**
 * 我们经常在下载等异步操作完成时,才调用闭包函数,我们有可能暂时不要把这个闭包存放在数组中,或者使用属性去引用它,那么这个时候就需要使用这个关键了
 */
// 解决如下
var downloadComplate:((Bool)->())!
func downloadResource(url:String,complate:@escaping (Bool)->())  {
    downloadComplate = complate
    // 异步下载,下载完成调动
    downloadComplate(true)
    // 下载失败
    downloadComplate(false)
}
// 调用
downloadResource(url: "www.baidu.com") {
    (flag) in
    print(flag)
}

// 如果我们不需要引用完全可以不使用关键字@escaping
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}



// 关键字@autoclosure 的用法
func serve(customer customerProvider: () -> String) {
    print(customerProvider())
}
serve { () -> String in
    return "没加@autoclosure"
}

func serve(customer customerProvider: @autoclosure () -> String)     {
    print (customerProvider())
}
serve(customer: "加了@autoclosure") // 调用


// @autoclosure 和 @escaping 组合使用方法
//func serve(customer customerProvider: @autoclosure @escaping() -> String) {
//    customerProvider = customerProvider
//    print (customerProvider())
//}
//serve1(customer:  customersInLine.remove(at: 0))




// @noescape
func calculate(fun:@noescape ()->()){
}
/**
 * 1.系统默认为@onescape 的类型
 * 2.不能被引用
 * 3.不能在异步执行
 */















