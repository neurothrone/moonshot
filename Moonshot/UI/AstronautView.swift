//
//  AstronautView.swift
//  Moonshot
//
//  Created by Zaid Neurothrone on 2022-10-08.
//

import SwiftUI

struct AstronautView: View {
  let astronaut: Astronaut
  
  var body: some View {
    ScrollView {
      VStack {
        Image(astronaut.id)
          .resizable()
          .scaledToFit()
        
        Text(astronaut.description)
          .padding()
      }
    }
    .background(.darkBackground)
    .navigationTitle(astronaut.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct AstronautView_Previews: PreviewProvider {
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  
  static var previews: some View {
    NavigationStack {
      AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
    }
  }
}
