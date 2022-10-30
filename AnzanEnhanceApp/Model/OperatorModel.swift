//
//  OperatorModel.swift
//  AnzanEnhanceApp
//
//  Created by 神　樹里乃 on 2022/10/29.
//

import Foundation

// 四則演算子を管理する
// ランダムで四則演算子を生成する

enum OperatorModel {
    // 4つの計算パターン
    case start
    case addition
    case subtraction
    case multiplication
    case division

    // 表示させる記号
    var operationSign: String {
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

    mutating func createOperator() {
        // 起動画面
        var newOparator: OperatorModel = .start
        // 演算子の種類を配列に格納
        let oparatorPattern: [OperatorModel] = [.addition, .subtraction, .multiplication, .division]

        repeat {
            // ランダムに抽出
            newOparator = oparatorPattern.randomElement()!
            // 前回と同じなら再度ランダム
        } while self == newOparator
        // 違うならselfに返す
        self = newOparator
    }// createOperator()

     func operation(firstNumber: Int, secondNumber: Int) -> Double {
        var _: Double = 0.0
        switch self {
        case .start:
            return 0.0
        case .addition:
            return Double(firstNumber) + Double(secondNumber)
        case .subtraction:
            return Double(firstNumber) - Double(secondNumber)
        case .multiplication:
            return Double(firstNumber) * Double(secondNumber)
        case .division:
            return Double(firstNumber) / Double(secondNumber)
        }
    }
}// OperatorModel
