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
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {//the scrumsView is the root view
                Task{
                    do {
                        try await store.save(scrums: store.scrums)
                    }catch{
                        errorWrapper = ErrorWrapper(error: error,
                        guidance: "Try again later.")
                    }
                }
            }
                .task{
                    do{
                        try await store.load()
                    } catch {
                        errorWrapper = ErrorWrapper(error: error,
                        guidance: "Scrumdinger will load sample data and continue.")
                    }
                }
                .sheet(item: $errorWrapper){
                    store.scrums = DailyScrum.sampleData
                } content: {
                    wrapper in
                    ErrorView(errorWrapper: wrapper)
                }
        }
    }
}
