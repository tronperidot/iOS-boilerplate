class HomeInteractor {
  weak var presenter: HomePresenter?
  
  var localDataManager: LocalDataManager?
  
  func tableInit() {
    self.localDataManager?.tableInit()
  }
  
  func loadTask() -> [String] {
    return localDataManager?.loadTasks() ?? []
  }

}
