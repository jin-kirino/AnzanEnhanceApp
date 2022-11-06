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
    func operation(firstNumber: Int, secondNumber: Int, inputNumber: Double) -> (aaa: Double, kekka: Bool) {
        var value: Double = 0.0
        var kekka: Bool
        switch self {
        case .addition:
            value = Double(firstNumber) + Double(secondNumber)
        case .subtraction:
            value = Double(firstNumber) - Double(secondNumber)
        case .multiplication:
            value = Double(firstNumber) * Double(secondNumber)
        case .division:
            value = Double(firstNumber) / Double(secondNumber)
            print("value:\(floor(value * 100) / 100)")
            value = floor(value * 100) / 100
        }
        if value == inputNumber {
            kekka = true
        } else {
            kekka = false
        }
        return (value, kekka)
    }// operation
}// OperatorModel
