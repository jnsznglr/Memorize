//
//  Array+Only.swift
//  Memorize
//
//  Created by Jonas Zingler on 08.07.20.
//  Copyright © 2020 Jonas Zingler. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
