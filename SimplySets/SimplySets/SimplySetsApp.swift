//
//  SimplySetsApp.swift
//  SimplySets
//
//  Created by Andrew Blad on 8/17/23.
//

import SwiftUI

@main
struct SimplySetsApp: App {
    //let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
