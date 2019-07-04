//
//  MainViewModel.swift
//  Hello-MVVM
//
//  Created by Muang on 4/7/2562 BE.
//  Copyright © 2562 khrongpop. All rights reserved.
//

import UIKit

class MainViewModel: MainInterface, MainInteractorOutput {
    
    var input: MainInteractorInput { return self }
    var output: MainInteractorOutput { return self }
    
    // MARK - Data-binding OutPut
    var showMessageAlert: ((String) -> Void)?
    var didError: (() -> Void)?
    
}

extension MainViewModel: MainInteractorInput {
    func saveMessageData(message: String?) {
        guard let msg = message,
            !msg.isEmpty,
            msg != "" else {
                didError?()
                return
        }
        showMessageAlert?(msg)
    }
}
