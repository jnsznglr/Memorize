//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Jonas Zingler on 02.07.20.
//  Copyright © 2020 Jonas Zingler. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
