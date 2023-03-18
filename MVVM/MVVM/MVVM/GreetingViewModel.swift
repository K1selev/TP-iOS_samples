//
//  GreetingViewModel.swift
//  MVVM
//
//  Created by a.reshetnikov on 14/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import UIKit

protocol GreetingViewModelProtocol: AnyObject {
    var state: State { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set } // function to call when greeting did change
    init(person: Person)
    func showGreeting(text: String)
}

struct State {
    var greeting: String
    // var name: String
}

class GreetingViewModel: GreetingViewModelProtocol {
    let person: Person
    
    var state: State {
        didSet {
            didUpdateState()
        }
    }
    
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    
    private func didUpdateState() {
        greetingDidChange?(self)
    }

    required init(person: Person) {
        self.person = person
        self.state = State(greeting: "")
    }
    
    func showGreeting(text: String) {
        self.state.greeting = text
    }
}
