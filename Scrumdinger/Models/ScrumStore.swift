//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by York MacBook 043 on 8/7/23.
//

import SwiftUI

@MainActor
class ScrumStore: ObservableObject{
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("scrums.data")
    }
    
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        let scrums = try await task.value
        self.scrums = scrums
    }
    
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data  = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value // underscore says we arent interested in response. without underscore, i think we get compiler warning. this line makes sure the task completes. we want any error within this task is reported to caller
    }
    
}
