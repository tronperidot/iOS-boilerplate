import UIKit

class SwiftChartRouter {

  class func createModule() -> UIViewController {
    let presenter = SwiftChartPresenter()
    let interactor = SwiftChartInteractor()
    let router = SwiftChartRouter()
    let viewController = SwiftChartViewController()

    viewController.presenter = presenter
    presenter.viewController = viewController
    presenter.interactor = interactor
    presenter.router = router
    interactor.presenter = presenter
    
    return viewController
  }
}
