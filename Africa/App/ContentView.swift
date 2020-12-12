//
//  ContentView.swift
//  Africa
//
//  Created by Victor Manuel Puga Ruiz on 07/11/20.
//

import SwiftUI

struct ContentView: View {
  // MARK: - Properties
  let animals: [Animal] = Bundle.main.decode("animals.json")
  
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var isGridViewActive: Bool = false
  
  @State private var gridLayout: [GridItem] =  [GridItem(.flexible())]
  
  @State private var gridColumns: Int = 1
  @State private var toolbarIcon: String = "square.grid.2x2"
  
  // MARK: - Functions
  func gridSwitch() {
    // gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
    // gridColumn = gridLayout.count
    gridColumns = gridLayout.count % 3 + 1
    gridLayout = Array(repeating: .init(.flexible()), count: gridColumns)
    
    /// the icon has an offset of one
    switch gridColumns {
      case 1:
        toolbarIcon = "square.grid.2x2"
      case 2:
        toolbarIcon = "square.grid.3x2"
      case 3:
        toolbarIcon = "rectangle.grid.1x2"
      default:
        toolbarIcon = "square.grid.2x2"
    }
  }
  
  // MARK: - Body
  var body: some View {
    NavigationView {
      Group {
        if !isGridViewActive {
          List {
            CoverImageView()
              .frame(height: 300)
              .listRowInsets(
                EdgeInsets(
                  top: 0,
                  leading: 0,
                  bottom: 0,
                  trailing: 0
                )
              )
            ForEach(animals) { animal in
              NavigationLink(destination: AnimalDetailView(animal: animal)) {
                AnimalListItemView(animal: animal)
              }
            }
          } // :List
        } else {
          ScrollView(.vertical) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                  AnimalGridItemView(animal: animal)
                }
              }
            } // :Grid
            .padding()
            .animation(.easeInOut)
          } // :ScrollView
        }
      } // :Group
      .navigationBarTitle("Africa", displayMode: .large)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 10) {
            // List
            Button(action: {
              isGridViewActive = false
              haptics.impactOccurred()
            }) {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            }
            // Grid
            Button(action: {
              isGridViewActive = true
              haptics.impactOccurred()
              gridSwitch()
            }) {
              Image(systemName: toolbarIcon)
                .font(.title2)
                .foregroundColor(isGridViewActive ? .accentColor : .primary)
            }
            
          }
        }
      }
    }
  }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
