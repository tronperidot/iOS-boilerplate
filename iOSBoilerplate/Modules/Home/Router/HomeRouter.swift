import UIKit

class HomeRouter {

  class func createModule() -> UIViewController {
    let presenter = HomePresenter()
    let interactor = HomeInteractor()
    let router = HomeRouter()
    let viewController = HomeViewController()
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
