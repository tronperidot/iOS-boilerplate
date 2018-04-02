class HomeInteractor: BaseInteractor {
  weak var presenter: HomePresenter?
  
  func loadTask() -> [Task] {
    return self.resourceService.task.all()
  }
  
  func tableInit() {
    self.resourceService.initService.migration()
  }
}
