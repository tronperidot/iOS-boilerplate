import UIKit

class GraphRouter {

  class func createModule() -> UIViewController {
    let presenter = GraphPresenter()
    let interactor = GraphInteractor()
    let router = GraphRouter()
    let viewController = GraphViewController()

    viewController.presenter = presenter
    presenter.viewController = viewController
    presenter.interactor = interactor
    presenter.router = router
    interactor.presenter = presenter
    
    return viewController
  }
}
