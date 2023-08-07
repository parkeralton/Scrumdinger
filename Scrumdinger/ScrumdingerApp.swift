//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by York MacBook 043 on 8/2/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App { //this is the entry point
    
@StateObject private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) //the scrumsView is the root view
                .task{
                    do{
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
