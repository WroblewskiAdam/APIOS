//
//  ContentView.swift
//  KalkulatorSwiftUI
//
//  Created by apios on 05/05/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var kalkulatorData: KalkulatorData
    
    var body: some View {
        VStack(){
            // Display
            KalkDisplay(kalkulatorData: kalkulatorData)
            
            Spacer()
                .frame(width: 1.0, height: 20.0)

            // Keybord
            HStack(alignment: .bottom) {
                KeybordFunc(kalkulatorData: kalkulatorData)

                Spacer()
                    .frame(width: 17.0, height: 1.0)

                KeybordNum(kalkulatorData: kalkulatorData)
            }
        }
        .padding(20)
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(kalkulatorData: KalkulatorData())
    }
}
