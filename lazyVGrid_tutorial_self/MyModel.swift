//
//  MyModel.swift
//  lazyVGrid_tutorial_self
//
//  Created by Jaeson.dev on 2022/03/08.
//

import Foundation

struct MyModel : Identifiable {
    let id = UUID()
    let title: String
    let content: String
}

extension MyModel {
    static var dummDataArray: [MyModel] {
        (1...2000).map{
                MyModel(title: "title: \($0)", content: "content: \($0)")
        }
    }
}
