class HomePresenter {
  weak var viewController: HomeViewController?
  var interactor: HomeInteractor?
  var router: HomeRouter?

  func viewDidLoad() {
    self.interactor?.tableInit()
  }
  
  func viewWillAppear() {
    self.viewController?.todos = self.interactor?.loadTask() ?? []
    self.viewController?.table.reloadData()
  }
  
  func toAddPage() {
//    let second = AddRouter.createModule()
//    let second = AddRouter.createModule()
//    let second = GraphRouter.createModule()
    let second = SwiftChartRouter.createModule()
    self.viewController?.navigationController?.pushViewController(second, animated: true)
  }
}
