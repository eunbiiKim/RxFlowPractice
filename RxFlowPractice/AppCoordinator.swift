//
//  AppCoordinator.swift
//  RxFlowPractice
//
//  Created by pineone on 2022/10/05.
//

import Foundation
import RxCocoa
import RxFlow
import RxSwift
import UIKit

class AppCoordinator {
    public static let shared = AppCoordinator()
    fileprivate let coordinator = FlowCoordinator()
    fileprivate var disposeBag = DisposeBag()
    
    fileprivate lazy var initialFlow = {
        return DemoFlow.shared
    }()
    
    func start(inWindow window: UIWindow, flow: Flow? = nil) {
        let demoFlow = initialFlow
        
        Flows.use(demoFlow, when: .ready) { flowRoot in
            window.rootViewController = flowRoot
            window.makeKeyAndVisible()
        }
        
        coordinator.coordinate(flow: demoFlow, with: DemoStepper.shared)
        coordinator.rx.didNavigate.subscribe(onNext: { flow, step in
            if let step = step as? DemoStep {
                switch step {
                    default:
                        return
                }
            }
        }).disposed(by: disposeBag)
    }
}

