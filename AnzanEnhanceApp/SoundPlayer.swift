//
//  SoundPlayer.swift
//  AnzanEnhanceApp
//
//  Created by 神　樹里乃 on 2022/10/28.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    // correctのデータを読み込み
    private let correctData = NSDataAsset(name: "correct")!.data
    // correct用のプレイヤーの変数
    // AVAudioPlayer→音源ファイルを再生できるようにする機能
    private var correctPlayer: AVAudioPlayer!
    // incorrectのデータを読み込み
    private let incorrectData = NSDataAsset(name: "incorrect")!.data
    // incorrect用のプレイヤーの変数
    private var incorrectPlayer: AVAudioPlayer!

    // 正解の音
    func correctPlay() {
        do {
            //
            correctPlayer = try AVAudioPlayer(data: correctData)
            correctPlayer.play()
        } catch {
            print("correct sound error")
        }
    }// correctPlay

    // 不正解の音
    func incorrectPlay() {
        do {
            //
            incorrectPlayer = try AVAudioPlayer(data: incorrectData)
            incorrectPlayer.play()
        } catch {
            print("incorrect sound error")
        }
    }// incorrectPlay
}// SoundPlayer
