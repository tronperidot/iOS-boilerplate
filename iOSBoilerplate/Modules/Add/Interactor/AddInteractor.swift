class AddInteractor: BaseInteractor {
  weak var presenter: AddPresenter?

  func addTask(text: String) -> Bool {
    return self.resourceService.task.insert(text) > 0
  }
}
