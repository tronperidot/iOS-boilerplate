class BaseInteractor {
  let resourceService: ResourceService
  
  init(_ service: ResourceService) {
    self.resourceService = service
  }
}
