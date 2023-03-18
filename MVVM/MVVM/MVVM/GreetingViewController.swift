//
//  GreetingViewController.swift
//  MVVM
//
//  Created by a.reshetnikov on 14/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import UIKit

class GreetingViewController: UIViewController {
    var viewModel: GreetingViewModelProtocol!
    
    override func viewDidLoad() {
        viewModel.greetingDidChange = { [weak self] viewModel in
            self?.myLabel.text = viewModel.state.greeting
        }
    }

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!

    @IBAction func didTapButton(_ sender: Any) {
        viewModel.showGreeting(text: "text")
    }
}
