//
//  MomentApp.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI
import SwiftData

@main
struct MomentApp: App {
	@State private var isLoading = true
	
	var sharedModelContainer: ModelContainer = {
		let schema = Schema([
			MomentRecord.self, MomentBook.self
		])
		let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
		
		do {
			return try ModelContainer(for: schema, configurations: [modelConfiguration])
		} catch {
			fatalError("Could not create ModelContainer: \(error)")
		}
	}()
	
	var body: some Scene {
		WindowGroup {
			if isLoading {
				SplashView(isActive: $isLoading)
			} else {
				ContentView()
					.modelContainer(sharedModelContainer)
			}
		}
	}
}
