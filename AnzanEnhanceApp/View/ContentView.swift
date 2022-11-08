//
//  ContentView.swift
//  AnzanEnhanceApp
//
//  Created by 神　樹里乃 on 2022/10/27.
//

import SwiftUI

struct ContentView: View {

    // 左辺の数字を格納する
    @State private var leftSideNumber: Int = Int.random(in: 1...9)
    // 右辺の数字を格納する
    @State private var rightSideNumber: Int = Int.random(in: 1...9)
    // 入力された文字を格納する
    @State private var inputText: String = ""
    // AnswerViewの表示を管理する
    @State private var isShowAnswerSheet: Bool = false
    // アラートの表示を管理する
    @State private var isShowAlert: Bool = false
    // OperatorModelをインスタンス化
    @State private var operatorModel: OperatorModel = .addition
    // inputNumber
    @State private var stringToDoubleNumber: Double = 0.0

    var body: some View {
        ZStack {
            // BackgoundViewにbunbougu_kokubanを指定
            BackgoundView(imageName: "bunbougu_kokuban")
            VStack {
                HStack {
                    Spacer()
                    // 計算式とTextFieldを並べて表示する
                    Text("\(leftSideNumber) \(operatorModel.rawValue) \(rightSideNumber) =")
                        .font(.largeTitle)
                    TextField("答えは？", text: $inputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                }// HStack
                .frame(width: 230, height: 40)
                .padding()
                // opacity：半透明の色を設定
                .background(Color.white.opacity(0.7))
                Button {
                    // 数字が入力されていることが確認できたらAnswerViewに画面遷移
                    if let unwrappedInputNumber = Double(inputText) {
                        // AnswerViewを表示する
                        isShowAnswerSheet.toggle()
                        // キャスト後の値を格納する
                        stringToDoubleNumber = unwrappedInputNumber
                    } else {
                        // アラートを表示する
                        isShowAlert.toggle()
                    }
                } label: {
                    Text("答える")
                        .font(.largeTitle)
                        .padding()
                        // opacity：半透明の色を設定
                        .background(Color.white.opacity(0.7))
                }// Button
                .sheet(isPresented: $isShowAnswerSheet) {
                    // AnswerViewに値を受け渡す
                    AnswerView(leftSideNumber: leftSideNumber,
                               rightSideNumber: rightSideNumber,
                               inputNumber: stringToDoubleNumber,
                               operatorModel: operatorModel)
                }// sheet
                .alert("数字を入力してください", isPresented: $isShowAlert) {
                    Button("OK") { return}
                }// alert
                // 監視対象: isShowSheet
                .onChange(of: isShowAnswerSheet) { value in
                    // falseのタイミングでランダム＆空欄
                    if value == false {
                        leftSideNumber = Int.random(in: 1...9)
                        rightSideNumber = Int.random(in: 1...9)
                        inputText = ""
                        operatorModel.randomOperator()
                    }// if
                }// onChange
            }// VStack
        }// ZStack
    }// body
}// ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
