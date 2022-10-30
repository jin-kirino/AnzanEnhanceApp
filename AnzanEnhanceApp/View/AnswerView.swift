//
//  AnswerView.swift
//  AnzanEnhanceApp
//
//  Created by 神　樹里乃 on 2022/10/27.
//

import SwiftUI

struct AnswerView: View {

    @State private var result: Int = 0
    @State private var judgment: String = ""
    let firstNumber: Int
    let secondNumber: Int
    let inputNumber: Int
    let operatorModel: OperatorModel
    private let soundPlayer = SoundPlayer()

    var body: some View {
        ZStack {
            BackgoundView(imageName: "bunbougu_kokuban")
            VStack {
                Text("""
                    \(firstNumber) \(operatorModel.operationSign) \(secondNumber) = \(operatorModel.operation(firstNumber: firstNumber, secondNumber: secondNumber))
                    答えは\(inputNumber)
                    \(judgment)
                    """)
                .font(.largeTitle)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            }// VStack
        }// ZStack
        .onAppear(perform: {
            result = Int(operatorModel.operation(firstNumber: firstNumber, secondNumber: secondNumber))
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
        AnswerView(firstNumber: 0, secondNumber: 0, inputNumber: 0, operatorModel: .start)
    }
}
