//
//  List+Extensions.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 08/08/23.
//

import SwiftUI

extension List {
    init<Data: RandomAccessCollection, RowContent: View>(
        _ data: Data,
        @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent
    ) where Data.Element == any Identifiable {
        self.init(data) { row in
            rowContent(row)
                .background(Color.fromHex(Colors.mainColor.rawValue)) // Defina a cor de background aqui
        }
    }
}
