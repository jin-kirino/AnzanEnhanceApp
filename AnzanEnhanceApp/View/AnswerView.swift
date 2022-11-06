//
//  AnswerView.swift
//  AnzanEnhanceApp
//
//  Created by 神　樹里乃 on 2022/10/27.
//

import SwiftUI

struct AnswerView: View {

    @State private var result: Double = 0.0
    @State private var judgment: String = ""
    // 画面の黒板に表示させる文字列
    @State private var basicArithmeticOperations: String = ""
    let firstNumber: Int
    let secondNumber: Int
    let inputNumber: Double
    let operatorModel: OperatorModel
    private let soundPlayer = SoundPlayer()

    var body: some View {
        let result = operatorModel.operation(firstNumber: firstNumber,
                                          secondNumber: secondNumber,
                                          inputNumber: inputNumber)
        let newInputNumber = floor(inputNumber * 100) / 100
        let newResult = floor(result.result * 100) / 100

        ZStack {
            BackgoundView(imageName: "bunbougu_kokuban")
            VStack {
                Text("""
                    \(basicArithmeticOperations)
                    答えは\(String(format: "%.2f", newResult))
                    \(judgment)
                """)
                .font(.largeTitle)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            }// VStack
        }// ZStack
        .onAppear(perform: {
            let result = operatorModel.operation(firstNumber: firstNumber,
                                                 secondNumber: secondNumber,
                                                 inputNumber: inputNumber)
            // 正解or不正解
            if result.check == true {
                judgment = "正解"
                soundPlayer.correctPlay()
            } else {
                judgment = "不正解"
                soundPlayer.incorrectPlay()
            }// if-else
            print("result:\(result)")
            print("inputNumber:\(inputNumber)")
            basicArithmeticOperations = "\(firstNumber) \(operatorModel.rawValue)"
            basicArithmeticOperations.append(" \(secondNumber) = \(String(format: "%.2f", newInputNumber))")
        })// onAppear
    }// body
}// ContentView

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(firstNumber: 0, secondNumber: 0, inputNumber: 0.0, operatorModel: .addition)
    }
}
