//
//  OperatorModel.swift
//  AnzanEnhanceApp
//
//  Created by 神　樹里乃 on 2022/10/29.
//

import SwiftUI
// 四則演算子を管理する
// ランダムで四則演算子を生成する
enum OperatorModel: String, CaseIterable {
    // 4つの計算パターン
    case addition = "+"
    case subtraction = "-"
    case multiplication = "×"
    case division = "÷"

    mutating func randomOperator() {
        // 起動画面
        var newOparator: OperatorModel = .addition
        // 演算子の種類を配列に格納
        let oparatorPattern: [OperatorModel] = OperatorModel.allCases

        repeat {
            // ランダムに抽出
            newOparator = oparatorPattern.randomElement()!
            // 前回と同じなら再度ランダム
        } while self == newOparator
        // 違うならselfに返す
        self = newOparator
    }// randomOperator()

    // 四則演算の計算結果、正誤チェク
    func operation(firstNumber: Int, secondNumber: Int, inputNumber: Double) -> (result: Double, check: Bool) {
        var result: Double = 0.0
        var check: Bool
        switch self {
        case .addition:
            result = Double(firstNumber) + Double(secondNumber)
        case .subtraction:
            result = Double(firstNumber) - Double(secondNumber)
        case .multiplication:
            result = Double(firstNumber) * Double(secondNumber)
        case .division:
            result = Double(firstNumber) / Double(secondNumber)
            print("value:\(floor(result * 100) / 100)")
            result = floor(result * 100) / 100
        }
        if result == inputNumber {
            check = true
        } else {
            check = false
        }
        return (result, check)
    }// operation
}// OperatorModel
