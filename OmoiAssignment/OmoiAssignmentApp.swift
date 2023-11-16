//
//  OmoiAssignmentApp.swift
//  OmoiAssignment
//
//  Created by Sumayya Siddiqui on 16/11/23.
//

import SwiftUI

@main
struct OmoiAssignmentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
