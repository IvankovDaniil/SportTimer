//
//  Fonts.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 09.07.2025.
//

import SwiftUI

enum Fonts {
    case regular, bold, semibold, secondary
    
    var size: CGFloat {
        switch self {
        case .regular:
            return 16
        case .bold:
            return 24
        case .semibold:
            return 18
        case .secondary:
            return 14
        }
    }
    
    var weight: Font.Weight {
        switch self {
        case .regular, .secondary:
                .regular
        case .bold:
                .bold
        case .semibold:
                .semibold
        }
    }
}

extension View {
    func font(type: Fonts, _ foregroundColor: Color = .txtPrimary) -> some View {
        self
            .font(Font.system(size: type.size, weight: type.weight))
            .foregroundStyle(foregroundColor)
    }
}
