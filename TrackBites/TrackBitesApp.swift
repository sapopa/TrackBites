//
//  TrackBitesApp.swift
//  TrackBites
//
//  Created by Sebastian-Alexandru Popa on 23.11.2024.
//

import SwiftUI
import SwiftData

@main
struct TrackBitesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Order.self)
        }
    }
}
