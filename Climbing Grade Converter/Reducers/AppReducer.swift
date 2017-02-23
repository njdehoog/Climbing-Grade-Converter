//
//  AppReducer.swift
//  Climbing Grade Converter
//
//  Created by Niels de Hoog on 23/02/2017.
//  Copyright © 2017 Invisible Pixel. All rights reserved.
//

import ReSwift

struct AppReducer: Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        guard state != nil else {
            return AppState(frenchGradeSelectedIndex: 0, USGradeSelectedIndex: 0)
        }
        
        switch action {
        case let action as SelectFrenchGradeAction:
            return AppState(frenchGradeSelectedIndex: action.index, USGradeSelectedIndex: action.index)
        case let action as SelectUSGradeAction:
            return AppState(frenchGradeSelectedIndex: action.index, USGradeSelectedIndex: action.index)
        default:
            fatalError("No implementation for \(action)")
        }
    }
}
