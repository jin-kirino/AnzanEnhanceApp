//
//  ContentView.swift
//  AnzanEnhanceApp
//
//  Created by 神　樹里乃 on 2022/10/27.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumber: Int = Int.random(in: 1...9)
    @State private var secondNumber: Int = Int.random(in: 1...9)
    @State private var inputNumber: String = ""
    @State private var isShowSheet: Bool = false
    @State private var showAlert: Bool = false
    @State private var operatorModel: OperatorModel = .addition

    var body: some View {
        ZStack {
            BackgoundView(imageName: "bunbougu_kokuban")

            VStack {
                HStack {
                    Spacer()
                    Text("\(firstNumber) \(operatorModel.operationSign) \(secondNumber) =")
                        .font(.largeTitle)
                    TextField("答えは？", text: $inputNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                }// HStack
                .frame(width: 230, height: 40)
                .padding()
                .background(Color.white.opacity(0.7))
                Button {
                    if Double(inputNumber) != nil {
                        isShowSheet.toggle()
                    } else {
                        showAlert.toggle()
                    }
                } label: {
                    Text("答える")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.white.opacity(0.7))
                }// Button
                .sheet(isPresented: $isShowSheet) {
                    AnswerView(firstNumber: firstNumber,
                               secondNumber: secondNumber,
                               inputNumber: Double(inputNumber)!,
                               operatorModel: operatorModel)
                }// sheet
                .alert("数字を入力してください", isPresented: $showAlert) {
                    Button("OK") { return}
                }// alert
                // 監視対象: isShowSheet
                .onChange(of: isShowSheet) { value in
                    // falseのタイミングでランダム＆空欄
                    if value == false {
                        firstNumber = Int.random(in: 1...9)
                        secondNumber = Int.random(in: 1...9)
                        inputNumber = ""
                        operatorModel.randomOperator()
                    }// if
                }// onChange
                .onAppear()
            }// VStack
        }// ZStack
    }// body
}// ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
