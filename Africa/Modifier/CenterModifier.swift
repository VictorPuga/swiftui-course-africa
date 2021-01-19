//
//  CenterModifier.swift
//  Africa
//
//  Created by Víctor Manuel Puga Ruiz on 14/12/20.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
