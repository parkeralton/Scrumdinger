//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by York MacBook 043 on 8/2/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
