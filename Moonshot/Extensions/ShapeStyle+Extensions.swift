//
//  ShapeStyle+Extensions.swift
//  Moonshot
//
//  Created by Zaid Neurothrone on 2022-10-07.
//

import SwiftUI

extension ShapeStyle where Self == Color {
  static var darkBackground: Color {
    Color(red: 0.1, green: 0.1, blue: 0.2)
  }
  
  static var lightBackground: Color {
    Color(red: 0.2, green: 0.2, blue: 0.3)
  }
  
  static var gradientBackground: LinearGradient {
    LinearGradient(colors: [.purple, .indigo], startPoint: .top, endPoint: .bottom)
  }
}
