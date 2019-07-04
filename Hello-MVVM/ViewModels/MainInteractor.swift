//
//  MainInteractor.swift
//  Hello-MVVM
//
//  Created by Muang on 4/7/2562 BE.
//  Copyright © 2562 khrongpop. All rights reserved.
//

import Foundation

// MARK Data-binding
protocol MainInteractorInput {
    func saveMessageData(message: String?)
}

protocol MainInteractorOutput: class {
    var showMessageAlert: ((String) -> Void)? { get set }
    var didError: (() -> Void)? { get set }
}

protocol MainInterface: MainInteractorInput, MainInteractorOutput  {
    var input: MainInteractorInput { get }
    var output: MainInteractorOutput { get }
}
