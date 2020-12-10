//
//  GalleryView.swift
//  Africa
//
//  Created by Victor Manuel Puga Ruiz on 07/11/20.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - Properties
    @State private var selectedAnimal: String = "lion"
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumns: Double = 3.0
    
    let animals: [Animal] = Bundle.main.decode("animals.json")

    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumns))
    }
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .center, spacing: 30) {
                // MARK: - Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // MARK: - Slider
                Slider(value: $gridColumns, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumns, perform: { value in
                        gridSwitch()
                        haptics.impactOccurred()
                    })
                
                // MARK: - Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                    }
                }
                .animation(.easeInOut)
                .onAppear(perform: {
                    gridSwitch()
                })
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
