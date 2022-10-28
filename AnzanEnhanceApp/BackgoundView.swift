//
//  BackgoundView.swift
//  AnzanEnhanceApp
//
//  Created by 神　樹里乃 on 2022/10/27.
//

import SwiftUI

struct BackgoundView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct BackgoundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgoundView(imageName: "bunbougu_kokuban")
    }
}
