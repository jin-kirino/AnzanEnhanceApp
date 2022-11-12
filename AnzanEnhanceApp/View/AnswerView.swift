//
//  AnswerView.swift
//  AnzanEnhanceApp
//
//  Created by 神　樹里乃 on 2022/10/27.
//

import SwiftUI

struct AnswerView: View {
    // 外部から値を設定する
    let leftSideNumber: Int
    let rightSideNumber: Int
    let inputDoubleNumber: Double
    let calculation: OperatorModel
    // 四則演算の計算結果を格納
    @State private var calculationResult: Double = 0.0
    // 「正解」or「不正解」を格納
    @State private var judgmentResult: String = ""
    // 画面の黒板に表示させる文字列
    @State private var basicArithmeticOperations: String = ""
    // SoundPlayerインスタンス化
    private let soundPlayer = SoundPlayer()

    var body: some View {
        ZStack {
            BackgoundView(imageName: "bunbougu_kokuban")
            VStack {
                Text("""
                    \(basicArithmeticOperations)
                    答えは\(String(format: "%.2f", calculationResult))
                    \(judgmentResult)
                """)
                .font(.largeTitle)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            }// VStack
        }// ZStack
        .onAppear(perform: {
            let returnValue = calculation.calculationResultCheck(leftSideNumber: leftSideNumber,
                                                 rightSideNumber: rightSideNumber,
                                                 inputNumber: inputDoubleNumber)
            calculationResult = floor(returnValue.result * 100) / 100
            // 正解or不正解
            if returnValue.check == true {
                judgmentResult = "正解"
                soundPlayer.correctPlay()
            } else {
                judgmentResult = "不正解"
                soundPlayer.incorrectPlay()
            }// if-else
            print("メソッドの戻り値:\(returnValue)")
            basicArithmeticOperations = "\(leftSideNumber) \(calculation.rawValue)"
            basicArithmeticOperations.append(" \(rightSideNumber) = \(String(format: "%.2f", inputDoubleNumber))")
        })// onAppear
    }// body
}// ContentView

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(leftSideNumber: 0, rightSideNumber: 0, inputDoubleNumber: 0.0, calculation: .addition)
    }
}
