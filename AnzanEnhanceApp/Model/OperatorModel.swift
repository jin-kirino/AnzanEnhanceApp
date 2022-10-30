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
    case number(Int)
    // indirect→回帰的enum
    indirect case addition(OperatorModel, OperatorModel)
    indirect case subtraction(OperatorModel, OperatorModel)
    indirect case multiplication(OperatorModel, OperatorModel)
    indirect case division(OperatorModel, OperatorModel)
}

func evalute(_ expression: OperatorModel) -> Double {
    switch expression {
    case let .number(value):
        return Double(value)
    case let .addition(left, right):
        return evalute(left) + evalute(right)
    case let .subtraction(left, right):
        return evalute(left) - evalute(right)
    case let .multiplication(left, right):
        return evalute(left) * evalute(right)
    case let .division(left, right):
        return evalute(left) / evalute(right)
    }
}
