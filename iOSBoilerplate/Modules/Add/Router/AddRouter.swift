import UIKit

class AddRouter {

  class func createModule() -> UIViewController {
    let presenter = AddPresenter()
    let interactor = AddInteractor()
    let router = AddRouter()
    let viewController = AddViewController()
    let localDataManager = LocalDataManager()

    viewController.presenter = presenter
    presenter.viewController = viewController
    presenter.interactor = interactor
    presenter.router = router
    interactor.presenter = presenter
    interactor.localDataManager = localDataManager
    
    return viewController
  }
}
