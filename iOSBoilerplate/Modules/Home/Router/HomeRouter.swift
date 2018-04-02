import UIKit

class HomeRouter {

  class func createModule() -> UIViewController {
    let presenter = HomePresenter()
    let interactor = HomeInteractor(ResourceService())
    let router = HomeRouter()
    let viewController = HomeViewController()

    viewController.presenter = presenter
    presenter.viewController = viewController
    presenter.interactor = interactor
    presenter.router = router
    interactor.presenter = presenter
    
    return viewController
  }
}
