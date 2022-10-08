//
//  MissionView.swift
//  Moonshot
//
//  Created by Zaid Neurothrone on 2022-10-08.
//

import SwiftUI



struct MissionView: View {
  struct CrewMember {
      let role: String
      let astronaut: Astronaut
  }
  
  let mission: Mission
  let crew: [CrewMember]
  
  init(mission: Mission, astronauts: [String: Astronaut]) {
    self.mission = mission
    self.crew = mission.crew.map { member in
      if let astronaut = astronauts[member.name] {
        return CrewMember(role: member.role, astronaut: astronaut)
      } else {
        fatalError("❌ -> Missing \(member.name)")
      }
    }
  }
  
  var body: some View {
    GeometryReader { geo in
      ScrollView {
        VStack {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: geo.size.width * 0.6)
            .padding(.top)
          
          Label(
            mission.launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A",
            systemImage: "calendar"
          )
          .font(.title3)
          .padding(.top, 15)
          .padding(.bottom, 10)
          
          VStack(alignment: .leading) {
            Text("Mission Highlights")
              .font(.title.bold())
              .padding(.bottom, 5)
            
            CustomDividerView()
            Text(mission.description)
            CustomDividerView()
            Text("Crew")
              .font(.title.bold())
              .padding(.bottom, 5)
          }
          .padding(.horizontal)
          
          MissionCrewView(crew: crew)
        }
        .padding(.bottom)
      }
    }
    .navigationTitle(mission.displayName)
    .navigationBarTitleDisplayMode(.inline)
    .background(.darkBackground)
  }
}

struct MissionView_Previews: PreviewProvider {
  static let missions: [Mission] = Bundle.main.decode("missions.json")
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  
  static var previews: some View {
    NavigationStack {
      MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
    }
  }
}


