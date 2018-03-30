import XCTest

class AddPresenterTest: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  class MockInteractor: AddInteractorInput {

  }

  class MockRouter: AddRouterInput {

  }

  class MockViewController: AddViewInput {

    func setupInitialState() {

    }
  }
}
