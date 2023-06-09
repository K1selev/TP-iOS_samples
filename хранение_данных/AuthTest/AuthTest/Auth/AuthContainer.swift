//
//  AuthContainer.swift
//  AuthTest
//
//  Created by Artur Sardaryan on 28.02.2023.
//  
//

import UIKit

final class AuthContainer {
    let input: AuthModuleInput
	let viewController: UIViewController
	private(set) weak var router: AuthRouterInput!

	class func assemble(with context: AuthContext) -> AuthContainer {
        let router = AuthRouter()
        let interactor = AuthInteractor()
        let presenter = AuthPresenter(router: router, interactor: interactor)
		let viewController = AuthViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return AuthContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AuthModuleInput, router: AuthRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AuthContext {
	weak var moduleOutput: AuthModuleOutput?
}
