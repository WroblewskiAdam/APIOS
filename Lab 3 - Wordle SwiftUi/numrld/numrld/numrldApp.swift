//
//  numrldApp.swift
//  numrld
//
//  Created by apios on 24/04/2023.
//

import SwiftUI

@main
struct numrldApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(wordleData: WordleData())
        }
    }
}
