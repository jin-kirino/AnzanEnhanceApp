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
    let firstNumber: Int
    let secondNumber: Int
    let inputNumber: Double
    let operatorModel: OperatorModel
    private let soundPlayer = SoundPlayer()

    var body: some View {
        ZStack {
            BackgoundView(imageName: "bunbougu_kokuban")
            VStack {
                let newInputNumber = floor(inputNumber * 100) / 100
                let newResult = floor(result * 100) / 100
                let _ = print("newInputNumber→\(String(format: "%.2f", newInputNumber))")
                let _ = print("newResult→\(String(format: "%.2f", newResult))")
                Text("""
                    \(firstNumber) \(operatorModel.operationSign) \(secondNumber) = \(String(format: "%.2f", newInputNumber))
                    答えは\(String(format: "%.2f", newResult))
                    \(judgment)
                    """)
                .font(.largeTitle)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            }// VStack
        }// ZStack
        .onAppear(perform: {
            result = operatorModel.operation(firstNumber: firstNumber, secondNumber: secondNumber)
            if result == inputNumber {
                judgment = "正解"
                soundPlayer.correctPlay()
            } else {
                judgment = "不正解"
                soundPlayer.incorrectPlay()
            }// if-else
        })// onAppear
    }// body
}// ContentView

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(firstNumber: 0, secondNumber: 0, inputNumber: 0, operatorModel: .addition)
    }
}
