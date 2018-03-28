//
//  AddView.swift
//  iOSBoilerplate
//
//  Created by yk13475 on 2018/03/27.
//  Copyright © 2018年 tronperidot. All rights reserved.
//

import UIKit

class AddView: UIViewController {
  // viper
  // TODO: change interface to PresenterProtcol
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
    writeBtn.addTarget(self, action: #selector(self.addAction), for: UIControlEvents.touchUpInside)
    self.view.addSubview(writeBtn)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @objc func addAction() {
    self.presenter?.addAction()
  }
}
