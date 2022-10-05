//
//  DemoFlow.swift
//  RxFlowPractice
//
//  Created by pineone on 2022/10/05.
//

import Foundation
import RxFlow

class DemoFlow: Flow {
    static let shared = DemoFlow()

    var root: Presentable {
        return self.rootViewController
    }
    
    private let rootViewController = UINavigationController()
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else {
            return FlowContributors.none
        }
        
        switch step {
            case .login:
                return navigateToLoginScreen()
            case .logout:
                return navigateToLogoutScreen()
            case .setting:
                return navigateToSettingScreen()
            case .main:
                return navigateToMainScreen()
        }
    }
    
    init() { }
}

/// UINavigationController의 메소드인 push, pop, present 같은 화면이동 로직은 Flow에서 구현한다.
/// 즉 Flow는 앱 내의 화면이동 로직을 담당함.
/// 특정 Step과 결합하면 화면이동액션이 트리거됨.
/// 반드시 구현해야하는 2가지
/// var root: Presentable : 해당 Flow내에서 Flow 내의 루트뷰 컨트롤러.... 라고 생각하면됨..? -> 코드로는 어떤건지는 알겠는데 개념적으로 설명하지는 못하겟다.
/// func navigate(to step: Step) -> FlowContributors : Flow 및 Step에 따라 탐색 작업이 발생하도록 함

extension DemoFlow {
    private func navigateToLoginScreen() -> FlowContributors {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBlue
        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: FlowContributor.forwardToCurrentFlow(withStep: DemoStep.self as! Step))
    }
    
    private func navigateToLogoutScreen() -> FlowContributors {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemYellow
        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: FlowContributor.forwardToCurrentFlow(withStep: DemoStep.self as! Step))
    }
    
    private func navigateToSettingScreen() -> FlowContributors {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemMint
        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: FlowContributor.forwardToCurrentFlow(withStep: DemoStep.self as! Step))
    }
    
    private func navigateToMainScreen() -> FlowContributors {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemIndigo
        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: FlowContributor.forwardToParentFlow(withStep: DemoStep.main))
    }
}
