//
//  DemoStep.swift
//  RxFlowPractice
//
//  Created by pineone on 2022/10/05.
//

import Foundation
import RxFlow

enum DemoStep: Step {
    case login
    case logout
    case setting
    case main
}

/// Step 을 구현하기엔 Enum이 제격
/// - Enum은 사용하기 쉽다
/// - 각 케이스들은 한번만 정의됨 - 때문에 유일한 상태임.
/// - 사용하기에 안전 : Swift는 switch 문에서 가능한 모든 값을 구현함
/// - 참조타입이 아닌 값타입이므로 상속이나 공유되지 않는다.
/// - 한 화면에서 다른 화면으로 제공될 값(상태)을 포함할 수 있다. : 예를 들어 한 Step 안에 앱 내의 모든 화면이동을 정의할 수 있다.

