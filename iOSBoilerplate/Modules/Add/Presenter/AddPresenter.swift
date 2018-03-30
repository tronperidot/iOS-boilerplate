class AddPresenter {
  weak var viewController: AddViewController?
  var interactor: AddInteractor?
  var router: AddRouter?

  func viewDidLoad() {
  }
  
  func viewWillAppear() {
  }
  
  func addAction() {
    let text = self.viewController?.textField.text ?? "unknown"
    if self.interactor?.addTask(text: text) ?? false {
      self.viewController?.navigationController?.popViewController(animated: true)
    }
  }
}
