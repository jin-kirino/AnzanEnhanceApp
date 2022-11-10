//
//  OperatorModel.swift
//  AnzanEnhanceApp
//
//  Created by 神　樹里乃 on 2022/10/29.
//

import SwiftUI
// 四則演算子を管理する
// ランダムで四則演算子を生成する
// CaseIterableプロトコル：全ての値を配列で取得する
enum OperatorModel: String, CaseIterable {
    // 4つの計算パターン
    case start = ""
    case addition = "+"
    case subtraction = "-"
    case multiplication = "×"
    case division = "÷"

    // mutating：OperatorModel自身の値を変更する
    mutating func randomOperator() {
        // 算出された演算子を格納する変数
        var newOparator: OperatorModel
        // 演算子の種類を配列に格納
        let oparatorPattern: [OperatorModel] = OperatorModel.allCases

        repeat {
            // ランダムに抽出
            newOparator = oparatorPattern.randomElement()!
            print("ランダム→\(newOparator)")
            // 前回と同じ&.startだったら再度ランダム
        } while self == newOparator || newOparator == .start
        // 違うならselfに返す
        self = newOparator
    }// randomOperator()

    // 四則演算の計算結果、正誤チェク
    func calculation(leftSideNumber: Int, rightSideNumber: Int, inputNumber: Double) -> (result: Double, check: Bool) {
        var result: Double = 0.0
        var check: Bool
        // 条件分岐で演算を行い、演算結果をresultに格納
        switch self {
        case .start:
            result = 0.0
        case .addition:
            result = Double(leftSideNumber) + Double(rightSideNumber)
        case .subtraction:
            result = Double(leftSideNumber) - Double(rightSideNumber)
        case .multiplication:
            result = Double(leftSideNumber) * Double(rightSideNumber)
        case .division:
            result = Double(leftSideNumber) / Double(rightSideNumber)
            // floor:切り捨て
            // 小数点第２位まで表示させるから(result * 100) / 100)
            print("result:\(floor(result * 100) / 100)")
            result = floor(result * 100) / 100
        }
        // swichの結果と入力値を比較してBool
        if result == inputNumber {
            check = true
        } else {
            check = false
        }
        // 戻り値タプル
        return (result, check)
    }// operation
}// OperatorModel
