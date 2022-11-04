//
//  CheckModel.swift
//  AnzanEnhanceApp
//
//  Created by 神　樹里乃 on 2022/11/04.
//

import Foundation

// 列挙型で正誤チェック機能を実装

enum CheckModel: String {
    case correct = "正解"
    case wrong = "不正解"

    func checkAnswer(result: Double, inputNumber: Double) -> String {
        var _ = ""
        switch self {
        case .correct:
            return rawValue
        case .wrong:
            return rawValue
        }
    }
}
