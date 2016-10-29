//
//  main.swift
//  Swift_自动引用计数(strong,weak,unowned)
//
//  Created by Riches on 2016/10/28.
//  Copyright © 2016年 Riches. All rights reserved.
//

import Foundation

print("Hello, World!")


//// 自动引用计数的工作原理
/**
 1.每次创建一个类的新实例时，都会分配一个内存块来存储有关该实例的信息。此内存保存实例的类型的信息，以及与该实例关联的任何存储属性的值
 2.当一个实例不再需要时，ARC释放由该实例使用的内存，以便内存可以用于其他用途
 3.ARC 释放对象后,它将不能再继续访问对象的属性,或者调用对象方法,如果你依然继续访问对象,App将会崩溃
 4.为了确保对象使用时, 不被释放,ARC 跟踪属性,变量和常量,只要有一个对象引用存在,在对象不会被释放
 5.当您将一个类实例分配给属性、常量或变量时，属性、常量或变量对实例会有一个强引用,确保对象不会被释放
 */



/// 探讨strong,weak和unowned 的区别
// 创建对象
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    deinit {
        print("对象释放成功，name的值为:\(name)")
    }
}
// 创建对象
var reference:Person? = Person(name: "FLNuo")
print(reference!)
reference = nil;  // 释放
print("name的值为:\(reference?.name)")



//// weak引用对象
weak var referencel2: Person? = Person(name: "FLN")
print(referencel2?.name)
/////// weak 修饰的变量或者常量必须为可选值 ? 或者 ！



//// unowned 引用对象
// unowned var reference3:Person? = Person(name: "FLNuo?")
// unowned var reference4:Person! = Person(name: "FLNuo!")
/////// 不能修饰可选值类型的变量或者常量
// 正确写法如下
unowned var reference5:Person = Person(name: "YES")


////////** 总结
/**
 1.强引用的对象,不会被释放
 2.weak 或者unowned 引用的对象,当没有强引用的时候,会被立即释放
 3.weak 修饰的变量和常量必须为可选类型,但是unowned刚好和其相反必须为非可选类型
*/




var reference6: Person = Person(name: "FLyNuo")
weak var reference7 = reference6
unowned var reference8 = reference6
print(reference7?.name)
print(reference8.name)



/*
var  reference1:Person = Person(name: "酷走天涯")
weak  var reference2 = reference1
unowned var reference3 = reference2
//// weak 修饰的变量reference2 虽然没有指明变量类型,但是swift会推断出来它的类型为Person?,这个时候我们把一个person? 的类型付给unowned修饰的变量,系统不运行
*/
var  reference1:Person = Person(name: "酷走天涯")
weak  var reference2 = reference1
unowned var reference3 = reference2!




/// 使用 weak 和unowned 的 意义
// 定义两个类Teacher 和School,Teacher 有一个属性school ,school 也有一个属性Teacher,我们让其相互引用
// 老师类
/*
class Teacher {
    var school: School?
    deinit {
        print("老师对象释放")
    }
    
}
// 学校类
class School {
    var teacher: Teacher? // 强引用
    deinit {
        print("学校对象释放了")
    }
}
var school: School? = School()
var teacher: Teacher? = Teacher()
school!.teacher = teacher
teacher!.school = school
school = nil
teacher = nil
 */
// 两个对象都没有释放
// School 要释放必须先释放它的属性Teacher ,系统就去释放Teacher的内存空间,发现他有一个属性叫School 然后又去释放School,就这样构成死循环,谁都无法释放
// 遇到上面的问题,原因就是相互强引用了,接下来,我们使用将student的属性school 使用weak修饰
// 如下
class Teacher {
    var school: School?
    deinit {
        print("老师对象释放")
    }
    
}
// 学校类
class School {
    weak var teacher: Teacher? // 强引用
    deinit {
        print("学校对象释放了")
    }
}
var school: School? = School()
var teacher: Teacher? = Teacher()
school!.teacher = teacher
teacher!.school = school
school = nil
teacher = nil





////// 怎么选择unowned和weak
// 使用unowned
// 苹果类
/*
class Apple {
    unowned var fruit: Fruit
    init(fruit: Fruit) {
        self.fruit = fruit
    }
    deinit {
        print("苹果对象释放")
    }
    func describe() {
        print("苹果在\(fruit.describe())中是甜的")
    }
}
// 水果类
class Fruit {
    var apple: Apple?
    deinit {
        print("水果对象释放了")
    }
    func describe() -> String {
        return "水果"
    }
}
// 调用
var fruit: Fruit? = Fruit()
var apple: Apple? = Apple(fruit: fruit!)
fruit!.apple = apple
// 水果不用了 释放
// fruit = nil
apple?.describe()  // 出现 野指针问题 fruit = nil 水果对象已经释放
*/

class Apple {
    weak var fruit: Fruit?
    init(fruit: Fruit) {
        self.fruit = fruit
    }
    deinit {
        print("苹果对象释放")
    }
    func describe() {
        print("苹果在\(fruit?.describe())中是甜的")
    }
}
// 水果类
class Fruit {
    var apple: Apple?
    deinit {
        print("水果对象释放了")
    }
    func describe() -> String {
        return "水果"
    }
}
// 调用
var fruit: Fruit? = Fruit()
var apple: Apple? = Apple(fruit: fruit!)
fruit!.apple = apple
// 水果不用了 释放
fruit = nil
apple?.describe()
////// 由于Fruit被弱引用,计数器减一,Fruit对象就被释放了,所以我们在调用的时候进行检测,如果对象存在再去执行方法,这样就避免了此类错误
/**
 使用unowned 修饰属性时,必须保证自己的实体独享要比引用的对象先释放
 如果循环引用中,弱引用的对象必须为非可选类型,这个时候,就可以考虑使用unowned
 */


// 实例分析
class HTNLElement {
    let name: String
    let text: String?
    lazy var asHTNL:() -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    /**
    lazy var asHTML: () -> String = {
        [unowned self] in  // 释放name的时候, 是被弱引用的,引用计数没有加1,不用考虑,直接释放自己，释放asHTML 时发现,name 已经被释放了,
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    */
    init(name: String, text: String? = nil) {
        self.name = name;
        self.text = text;
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
/**
var x: HTNLElement? = HTNLElement(name: "title")
x = nil
 */
//// 眨眼一看,释放了,为什么被释放了,因为我们使用lazy关键字,asHTML 闭包没有被创建,这里注意,如果要在存储属性的闭包中访问自己的属性,必须加Lazy

var x: HTNLElement? = HTNLElement(name: "title")
print(x?.asHTNL())
x = nil
//// 释放对象,首先释放属性,释放name发现name被闭包引用了,然后去释放闭包,发现释放self.name ,构成了死循环











































































































































































































































































































































































































































































