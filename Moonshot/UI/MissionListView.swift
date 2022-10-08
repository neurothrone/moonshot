//
//  MissionListView.swift
//  Moonshot
//
//  Created by Zaid Neurothrone on 2022-10-08.
//

import SwiftUI

struct MissionListView: View {
  let astronauts: [String: Astronaut]
  let missions: [Mission]
  
  var body: some View {
    List(missions) { mission in
      NavigationLink {
        MissionView(mission: mission, astronauts: astronauts)
      } label: {
        HStack {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(width: 44, height: 44)
            .padding()
          
          VStack(alignment: .leading, spacing: 4) {
            Text(mission.displayName)
              .font(.headline)
              .foregroundColor(.white)
            
            Text(mission.formattedLaunchDate)
              .foregroundColor(.white.opacity(0.5))
          }
        }
      }
      .listRowBackground(Color.darkBackground)
    }
    .listStyle(.plain)
    .scrollContentBackground(.hidden)
  }
}

struct MissionListView_Previews: PreviewProvider {
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  static let missions: [Mission] = Bundle.main.decode("missions.json")
  
  
  static var previews: some View {
    MissionListView(astronauts: astronauts, missions: missions)
      .preferredColorScheme(.dark)
  }
}
