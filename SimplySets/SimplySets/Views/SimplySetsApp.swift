//
//  SimplySetsApp.swift
//  SimplySets
//
//  Created by Andrew Blad on 8/17/23.
//

import SwiftUI

@main
struct SimplySetsApp: App {
    @StateObject private var dataViewModel = DataViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataViewModel.container.viewContext)
        }
    }
}
