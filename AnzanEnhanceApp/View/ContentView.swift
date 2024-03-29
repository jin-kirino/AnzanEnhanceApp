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
    @State var calculation: OperatorModel = .start
    // inputTextをDoluble型にキャストした後の数字を格納する
    @State private var inputDoubleNumber: Double = 0.0

    var body: some View {
        ZStack {
            // BackgoundViewにbunbougu_kokubanを指定
            BackgoundView(imageName: "bunbougu_kokuban")
            VStack {
                HStack {
                    Spacer()
                    // 計算式とTextFieldを並べて表示する
                    Text("\(leftSideNumber) \(calculation.rawValue) \(rightSideNumber) =")
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
                        print("入力値：\(inputText)")
                        print("アンラップ後：\(unwrappedInputNumber)")
                        // AnswerViewを表示す
                        isShowAnswerSheet.toggle()
                        // 小数点第２位までの数字を格納する（小数点第１位で割り切れたらそこまで）
                        inputDoubleNumber = floor(unwrappedInputNumber * 100) / 100
                        print("小数点第２位：\(inputDoubleNumber)")

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
                               inputDoubleNumber: inputDoubleNumber,
                               calculation: calculation)
                }// sheet
                .alert("数字を入力してください", isPresented: $isShowAlert) {
                    Button("OK") { return}
                }// alert
                // 監視対象: isShowSheetがfalseのタイミング（閉じた時）に新しい計算を表示させる
                .onChange(of: isShowAnswerSheet) { value in
                    // falseのタイミングでランダム＆空欄
                    if value == false {
                        leftSideNumber = Int.random(in: 1...9)
                        rightSideNumber = Int.random(in: 1...9)
                        inputText = ""
                        calculation.randomOperator()
                    }// if
                }// onChange
                // アプリ起動時にランダムで四則演算を生成する
                .onAppear {
                    calculation.randomOperator()
                    print("記号の種類\(calculation.rawValue)")
                }
            }// VStack
        }// ZStack
    }// body
}// ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
