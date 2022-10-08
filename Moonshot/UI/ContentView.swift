//
//  ContentView.swift
//  Moonshot
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("showMissionsAsGrid")
  private var showMissionsAsGrid = false
  
  private let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  private let missions: [Mission] = Bundle.main.decode("missions.json")
  
  var body: some View {
    NavigationStack {
      Group {
        if showMissionsAsGrid {
          MissionGridView(astronauts: astronauts, missions: missions)
        } else {
          MissionListView(astronauts: astronauts, missions: missions)
        }
      }
      .navigationTitle("Moonshot")
      .background(.darkBackground)
      .preferredColorScheme(.dark)
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Button {
            showMissionsAsGrid.toggle()
          } label: {
            Label(
              showMissionsAsGrid
              ? "Show as List"
              : "Show as Grid",
              systemImage:
                showMissionsAsGrid
              ? "list.dash"
              : "square.grid.2x2"
            )
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
