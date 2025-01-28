//
//  ContentView.swift
//  GDBS Project
//
//  Created by Alexandre César Brandão de Andrade on 13/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndicator: IndicatorType = .idqa
    @State private var showMenu = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            MapView(selectedIndicator: $selectedIndicator)
                .edgesIgnoringSafeArea(.all)

            if showMenu {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Select Indicator:")
                        .font(.headline)

                    ForEach(IndicatorType.allCases) { indicator in
                        Button(action: {
                            selectedIndicator = indicator
                            showMenu.toggle()
                        }) {
                            HStack {
                                Image(systemName: selectedIndicator == indicator ? "checkmark.circle.fill" : "circle")
                                Text(indicator.rawValue)
                            }
                        }
                        .foregroundColor(.black)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.top, 50)
                .padding(.leading, 10)
            }

            Button(action: {
                withAnimation {
                    showMenu.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 3)
            }
            .padding(.top, 10)
            .padding(.leading, 10)

            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Legend")
                            .font(.footnote)
                            .padding(.bottom, 5)

                        Text("Color scale:")
                            .font(.caption)

                        HStack {
                            LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: .trailing)
                                .frame(width: 150, height: 8)
                                .cornerRadius(5)
                        }

                        Text("Low -> High")
                            .font(.footnote)
                    }
                    .padding(5)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(8)
                    .shadow(radius: 3)
                    Spacer()
                }
                .padding(.bottom, 10)
                .padding(.leading, 10)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

