//
//  CustomDividerView.swift
//  Moonshot
//
//  Created by Zaid Neurothrone on 2022-10-08.
//

import SwiftUI

struct CustomDividerView: View {
  var body: some View {
    Rectangle()
      .frame(height: 2)
      .foregroundColor(.lightBackground)
      .padding(.vertical)
  }
}

struct CustomDividerView_Previews: PreviewProvider {
  static var previews: some View {
    CustomDividerView()
  }
}
