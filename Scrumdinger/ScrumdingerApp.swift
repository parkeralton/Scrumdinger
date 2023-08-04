//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by York MacBook 043 on 8/2/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App { //this is the entry point
    
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums) //the scrumsView is the root view
        }
    }
}
