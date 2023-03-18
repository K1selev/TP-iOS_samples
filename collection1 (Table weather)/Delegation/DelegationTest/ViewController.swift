//
//  ViewController.swift
//  DelegationTest
//
//  Created by Artur Sardaryan on 08.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var someView = SomeView(delegate: self)


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(someView)
        someView.frame = view.frame
        someView.delegate = self
    }
}

extension ViewController: SomeViewDelegate {
    func buttonText() -> String? {
        return "View Controller"
    }
    
    func didTapButton() {
        print("Button Tapped")
    }
}
    

protocol SomeViewDelegate: AnyObject {
    func didTapButton()
    func buttonText() -> String?
}

final class SomeView: UIView {
    private let button: UIButton = UIButton()
    
    weak var delegate: SomeViewDelegate?
    
    init(delegate: SomeViewDelegate?) {
        super.init(frame: .zero)
        self.delegate = delegate
        setup()
    }
    
    private func setup() {
        addSubview(button)

        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.setTitle(delegate?.buttonText(), for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.frame = CGRect(x: 20, y: frame.height / 2, width: frame.width - 40, height: 48)
    }
    
    @objc
    private func didTapButton() {
        delegate?.didTapButton()
    }
    
}

