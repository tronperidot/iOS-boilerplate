//
//  MainView.swift
//  iOSBoilerplate
//

import UIKit
import Cartography

class MainView: UIView {
  let mainLabel = UILabel()
  let nextButton = UIButton()
  
  override init(frame: CGRect) {
    self.mainLabel.text = "Hello World!"
    self.mainLabel.textAlignment = .center
    self.nextButton.setTitle("next page", for: .normal)
    self.nextButton.layer.masksToBounds = true
    self.nextButton.backgroundColor = UIColor.darkGray
    super.init(frame: frame)
    self.backgroundColor = .white
    self.addSubview(mainLabel)
    self.addSubview(nextButton)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    
    super.layoutSubviews()
    let labelSize = self.mainLabel.sizeThatFits(self.bounds.size)
    let x = (self.bounds.width - labelSize.width) / 2
    let y = (self.bounds.height - labelSize.height) / 2
    let labelOrigin = CGPoint(x: x, y: y)
    self.mainLabel.frame = CGRect(origin: labelOrigin, size: labelSize)
    
    let buttonSize = self.nextButton.sizeThatFits(self.bounds.size)
    let buttonOrigin = CGPoint(x: (self.bounds.width - buttonSize.width) / 2,
                               y: (self.bounds.height - buttonSize.height) - 10)
    self.nextButton.frame = CGRect(origin: buttonOrigin, size: buttonSize)
  }
}
