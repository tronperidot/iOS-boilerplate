import UIKit

class AddViewController: UIViewController {
  var presenter: AddPresenter?
  
  var textField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Add"
    self.view.backgroundColor = UIColor.cyan
    textField = UITextField(frame: CGRect(x: 100, y: 100, width: 200, height: 30))
    textField.borderStyle = UITextBorderStyle.roundedRect
    self.view.addSubview(textField)
    let writeBtn: UIButton = UIButton(frame: CGRect(x: 100, y: 150, width: 200, height: 30))
    writeBtn.backgroundColor = UIColor.magenta
    writeBtn.setTitle("タスク保存", for: UIControlState.normal)
    writeBtn.addTarget(self, action: #selector(self.onClickWriteBtn), for: UIControlEvents.touchUpInside)
    self.view.addSubview(writeBtn)
    self.presenter?.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    self.presenter?.viewWillAppear()
  }
  
  @objc func onClickWriteBtn() {
    self.presenter?.addAction()
  }
}
