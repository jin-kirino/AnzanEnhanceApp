//
//  ContentView.swift
//  AnzanEnhanceApp
//
//  Created by 神　樹里乃 on 2022/10/27.
//

import SwiftUI

struct ContentView: View {
    @State var firstNumber: Int = Int.random(in: 1...9)
    @State var secondNumber: Int = Int.random(in: 1...9)
    @State var inputNumber: String = ""
    @State var isShowSheet: Bool = false
    @State var showAlert: Bool = false

    var body: some View {
        ZStack {
            BackgoundView(imageName: "bunbougu_kokuban")

            VStack {
                HStack {
                    Spacer()
                    Text("\(firstNumber) + \(secondNumber) =")
                        .font(.largeTitle)
                    TextField("答えは？", text: $inputNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                }// HStack
                .frame(width: 230, height: 40)
                .padding()
                .background(Color.white.opacity(0.7))
                Button {
                    if Int(inputNumber) != nil {
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
                    AnswerView(firstNumber: firstNumber, secondNumber: secondNumber, inputNumber: Int(inputNumber)!)
                }// sheet
                .alert("数字を入力してください", isPresented: $showAlert) {
                    Button("OK") { return}
                }// alert
                .onAppear(perform: {
                    firstNumber = Int.random(in: 1...9)
                    secondNumber = Int.random(in: 1...9)
                    inputNumber = ""
                })
            }// VStack
        }// ZStack
    }// body
}// ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
