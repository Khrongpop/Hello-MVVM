//
//  MainViewController.swift
//  Hello-MVVM
//
//  Created by Muang on 4/7/2562 BE.
//  Copyright © 2562 khrongpop. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet var baseView: BaseView!
    
    var viewModel: MainInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(interface: MainViewModel())
        
        // Do any additional setup after loading the view.
    }
    
    fileprivate func showAlert(msg: String) {
        let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert,animated: true)
    }
    
    func configure( interface: MainInterface) {
        self.viewModel = interface
        bindToViewModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitAction(_ sender: UIButton) {
        viewModel.input.saveMessageData(message: inputTextField.text)
//        viewModel.input.saveMessageData(message: baseView.inputTextField.text)
        
    }
 
}
//MARK: - Binding
extension MainViewController {
    
    func bindToViewModel() {
        viewModel.output.showMessageAlert = showAlert()
        viewModel.output.didError = didError()
    }
    
    func didError() -> (() -> Void) {
        return { [weak self] in
            
            guard let weakSelf = self else { return }
            weakSelf.showAlert(msg: "error")
        }
    }
    
    func showAlert() -> ((String) -> Void) {
        return {  [weak self] message in
            
            guard let weakSelf = self else { return }
            weakSelf.showAlert(msg: message)
            
        }
    }
}
