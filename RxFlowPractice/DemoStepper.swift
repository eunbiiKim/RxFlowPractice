//
//  DemoStepper.swift
//  RxFlowPractice
//
//  Created by pineone on 2022/10/05.
//

import Foundation
import RxFlow
import RxCocoa

class DemoStepper: Stepper {
    static let shared = DemoStepper()
    
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    var initialStep: DemoStep {
        return .main
    }
    
    private init() {}
    
    func readyToEmitSteps() {
        steps.accept(initialStep)
    }
    
}
