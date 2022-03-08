//
//  ContentView.swift
//  lazyVGrid_tutorial_self
//
//  Created by Jaeson.dev on 2022/03/08.
//

import SwiftUI

enum LayoutTypes: CaseIterable {  //레이아웃 타입들 케이스 구조체. 타입을 반복문에서 ForEach를 사용하려면 CaseIterable 설정을 해줘야한다.
    case table, grid, multiple
}

extension LayoutTypes { //layouttypes를 확장. 레이아웃 타입에 대한 컬럼이 자동으로 설정되도록.
    var columns : [GridItem] {
        switch self {   //self를 통해 자기 자신의 케이스들을 콜함
        case .table:
            return [
                GridItem(.flexible())
            ]
        case .grid:
            return [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        case .multiple:
            return [
                GridItem(.adaptive(minimum: 100))
            ]
        }
    }
}

struct ContentView: View {
    
    var dummyData = MyModel.dummDataArray
    
    @State private var selectedLayoutType = LayoutTypes.table
    
    var body: some View {
        VStack {
            Picker(selection: $selectedLayoutType, content: {
                ForEach(LayoutTypes.allCases, id: \.self, content: { layoutType in
                    switch layoutType {
                    case .table:
                        Image(systemName: "list.dash")
                    case .grid:
                        Image(systemName: "square.grid.2x2.fill")
                    case .multiple:
                        Image(systemName: "square.grid.3x3.fill")
                    }
                })
                
            }, label: {
                Text("layout type")
            })
                .pickerStyle(.segmented)
                .frame(width: 250)
            
            ScrollView {
                LazyVGrid(columns: selectedLayoutType.columns, content: {
                    ForEach(dummyData, content: { (dataItem: MyModel) in
                        switch selectedLayoutType {
                        case .table:
                            MyCard(icon: "book.fill", title: "책읽기", start: "1PM", end: "3PM", bgColor: Color.yellow)
                        case .grid:
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.yellow)
                                .frame(height: 100)
                                .overlay(content: {
                                    VStack(spacing: 2) {
                                        Circle().frame(height: 50)
                                            .foregroundColor(.blue)
                                        Text("\(dataItem.title)")
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                        Text("\(dataItem.content)")
                                            .font(.system(size: 15))
                                    }
                                })
                        case .multiple:
                            Rectangle()
                                .foregroundColor(.purple)
                                .frame(height: 100)
                        }
                    })
                })
            }
            
        }   //VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
