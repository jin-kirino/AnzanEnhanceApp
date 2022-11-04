import UIKit

// enum Color {
//    case clear
//    case red
//    case blue
//    case green
//
//    // 自分自身を指定
//    init() {
//        // 省略しないとself = Color.red
//        self = .clear
//    }
//    // イニシャライザに引数を指定、Color型
//    init(color: Color) {
//        self = color
//    }
// }// Color
//
// 実行
// var c = Color.red
// print(c)
// print(type(of: c))
//
// Color.greenが正式
// var d: Color = .green
// 自分自身を指定したイニシャライザ
// var e = Color()
// 2つ目のイニシャライザ
// var f = Color(color: .green)

// メンバには値(raw value:実体値)を付与できる（型名の後ろに「:型名」で指定する

enum Num: Int {
    case one = 1
    case two = 2
    case three = 3
}

// Num型の変数nをインスタンス化
 var number: Num = .three
// 実体値を「.rawValue」で出す
 number.rawValue

enum Animal {
    case dog, cat, horse, fox

    func info() {
        if self == .dog {
            print("犬")
        } else if self == .cat {
            print("猫")
        } else if self == .horse {
            print("馬")
        } else {
            print("狐")
        }
    }
}

var animal = Animal.dog
animal = .fox

enum Color: Int {
    case clear = 0
    case red = 1
    case blue = 2
    case green = 3

    init() {
        self = .clear
    }

    init(color: Color) {
        self = color
    }
}

var color = Color.red
color.rawValue

if color.rawValue == 1 {
    print("赤")
} else {
    print("赤じゃない")
}

enum EInt: Int {
    case zero, one, two, three
    case ten = 10
    case tenPlusOne
}

// 実体値は０から始まり１ずつ増えていく
EInt.one.rawValue
EInt.three.rawValue
// 飛ばしたい時は実体値を指定
EInt.ten.rawValue
// そこからまた１ずつ増やすには並べて記述する
EInt.tenPlusOne.rawValue

enum EString: String {
    case tokyo, osaka, kyoto
}
EString.tokyo.rawValue

// ---------------------------------------------
enum ArithmericExpression {
    // "case"+case名+(型名)
    case number(Int)
    // indirect→回帰的
    indirect case addition(ArithmericExpression, ArithmericExpression)
    indirect case multiplocation(ArithmericExpression, ArithmericExpression)
}

let five = ArithmericExpression.number(5)
let four = ArithmericExpression.number(4)
let sum = ArithmericExpression.addition(five, four)
let product = ArithmericExpression.multiplocation(sum, ArithmericExpression.number(2))
print(sum)
print(product)

func evaluate(_ expression: ArithmericExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplocation(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(sum))
print(evaluate(product))

// ------------------------------------------------

 enum ArithmericExpression2 {
    case number(Double)
    indirect case addition(ArithmericExpression2, ArithmericExpression2)
    indirect case subtraction(ArithmericExpression2, ArithmericExpression2)
    indirect case multiplication(ArithmericExpression2, ArithmericExpression2)
    indirect case division(ArithmericExpression2, ArithmericExpression2)
}

let ten = ArithmericExpression2.number(9)
print(type(of: ten))
let seven = ArithmericExpression2.number(5)
let tasu = ArithmericExpression2.addition(ten, seven)
let hiku = ArithmericExpression2.subtraction(ten, seven)
let kakeru = ArithmericExpression2.multiplication(ten, seven)
let waru = ArithmericExpression2.division(seven, ten)
print(tasu)
print(kakeru)

func evaluate2(_ expression: ArithmericExpression2) -> Double {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate2(left) + evaluate2(right)
    case let .subtraction(left, right):
        return evaluate2(left) - evaluate2(right)
    case let .multiplication(left, right):
        return evaluate2(left) * evaluate2(right)
    case let .division(left, right):
        return evaluate2(left) / evaluate2(right)
    }
}
print(evaluate2(tasu))
print(evaluate2(hiku))
print(evaluate2(kakeru))
print(evaluate2(waru))

let floorNum = floor(evaluate2(waru))/100
print(floorNum)

// ----------------------------------

// 一旦保留
// enum OperatorModel {
//    case number(Int)
//    // indirect→回帰的enum
//    indirect case addition(OperatorModel, OperatorModel)
//    indirect case subtraction(OperatorModel, OperatorModel)
//    indirect case multiplication(OperatorModel, OperatorModel)
//    indirect case division(OperatorModel, OperatorModel)
// }
//
// func evalute(_ expression: OperatorModel) -> Double {
//    switch expression {
//    case let .number(value):
//        return Double(value)
//    case let .addition(left, right):
//        return evalute(left) + evalute(right)
//    case let .subtraction(left, right):
//        return evalute(left) - evalute(right)
//    case let .multiplication(left, right):
//        return evalute(left) * evalute(right)
//    case let .division(left, right):
//        return evalute(left) / evalute(right)
//    }
// }

enum Keisan {
    // 4つの計算パターン
    case start
    case addition
    case subtraction
    case multiplication
    case division

    // 表示させる記号
    var kigo: String {
        switch self {
        case .start:
            return ""
        case .addition:
            return "+"
        case .subtraction:
            return "-"
        case .multiplication:
            return "×"
        case .division:
            return "÷"
        }
    }
}

let aaa = 3.344555
let www = floor(aaa * 100) / 100
print(aaa)
print(www)

var greeting = "こんにちは!"
greeting.append("swift")
print(greeting)

greeting += "頑張る"
print(greeting)

var kekka = "firstNumber"
kekka.append(" oparatorModel.operationSign")
kekka.append(" secondNumber")
kekka.append(" =")
kekka.append(" newInputNumber")
print(kekka)
