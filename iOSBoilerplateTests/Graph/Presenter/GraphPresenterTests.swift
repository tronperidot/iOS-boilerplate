import XCTest

class GraphPresenterTest: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  class MockInteractor: GraphInteractorInput {

  }

  class MockRouter: GraphRouterInput {

  }

  class MockViewController: GraphViewInput {

    func setupInitialState() {

    }
  }
}
