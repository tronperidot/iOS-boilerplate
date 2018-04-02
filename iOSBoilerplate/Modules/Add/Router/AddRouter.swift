import UIKit

class AddRouter {

  class func createModule() -> UIViewController {
    let presenter = AddPresenter()
    let interactor = AddInteractor(ResourceService())
    let router = AddRouter()
    let viewController = AddViewController()

    viewController.presenter = presenter
    presenter.viewController = viewController
    presenter.interactor = interactor
    presenter.router = router
    interactor.presenter = presenter
    
    return viewController
  }
  
  
}
