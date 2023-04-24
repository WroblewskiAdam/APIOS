//
//  SwiftUIView.swift
//  KalkulatorSwiftUI
//
//  Created by apios on 08/12/2021.
//  Copyright © 2021 apios. All rights reserved.
//

import SwiftUI

struct KalkDisplay: View {
    @ObservedObject var kalkulatorData: KDalkulatorata

    var body: some View {
        // Display
        ZStack(alignment: .trailing){
            Rectangle()w
                .foregroundColor(.white)
                .frame(width: 212.0, height: 28.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

            Text(String(kalkulatorData.dispValue))
                .padding(6.0)
        }
    }
}

struct CalcDisplay_Previews: PreviewProvider {
    static var previews: some View {
        KalkDisplay(kalkulatorData: KalkulatorData())
    }
}
