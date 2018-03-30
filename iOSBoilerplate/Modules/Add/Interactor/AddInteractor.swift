class AddInteractor {
  weak var presenter: AddPresenter?
  var localDataManager: LocalDataManager?

  func addTask(text: String) -> Bool {
    return self.localDataManager?.writeTask(text: text) ?? false
  }
}
