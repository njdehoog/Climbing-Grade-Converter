//
//  MainViewController.swift
//  Climbing Grade Converter
//
//  Created by Niels de Hoog on 23/02/2017.
//  Copyright © 2017 Invisible Pixel. All rights reserved.
//

import ReSwift

class MainViewController: UIViewController {
    @IBOutlet var pickerView: UIPickerView!
    
    enum GradePickerComponent: Int {
        case french = 0
        case US
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.subscribe(self)
    }
}

extension MainViewController: StoreSubscriber {
    func newState(state: AppState) {
        pickerView.selectRow(state.frenchGradeSelectedIndex, inComponent: GradePickerComponent.french.rawValue, animated: true)
        pickerView.selectRow(state.USGradeSelectedIndex, inComponent: GradePickerComponent.US.rawValue, animated: true)
    }
}

extension MainViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch GradePickerComponent(rawValue: component)! {
        case .french:
            return Grades.french.count
        case .US:
            return Grades.US.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch GradePickerComponent(rawValue: component)! {
        case .french:
            return Grades.french[row]
        case .US:
            return Grades.US[row]
        }
    }
}

extension MainViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch GradePickerComponent(rawValue: component)! {
        case .french:
            store.dispatch(SelectFrenchGradeAction(index: row))
        case .US:
            store.dispatch(SelectUSGradeAction(index: row))
        }
    }
}
