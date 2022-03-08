//
//  MyCard.swift
//  lazyVGrid_tutorial_self
//
//  Created by Jaeson.dev on 2022/03/08.
//

import SwiftUI

struct MyCard: View {
    
    var icon: String
    var title: String
    var start: String
    var end: String
    var bgColor: Color
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 0){
                Divider().opacity(0)
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(.white)
                
                Spacer().frame(height: 5)
                
                Text("\(start) - \(end)")
                    .foregroundColor(.white)
            }
        }
        .padding(30)
        .background(bgColor)
        .cornerRadius(20)
    }
}
