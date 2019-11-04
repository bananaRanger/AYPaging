// MIT License
//
// Copyright (c) 2019 Anton Yereshchenko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import AYPaging

//MARK: ViewController class
class ViewController: UIViewController {
  
  @IBOutlet weak var stripesPagingView: AYPagingView!
  @IBOutlet weak var circlesPagingView: AYPagingView!

  @IBOutlet weak var imgBackView: UIImageView!
  @IBOutlet weak var backView: UIView!

  @IBOutlet weak var lblTitle: UILabel!

  @IBOutlet weak var imgIcon: UIImageView!
  @IBOutlet weak var lblDetails: UILabel!

  @IBOutlet weak var btnNextAction: UIButton!
  
  private var cards: [Card] = Card.cards
  
  private var selectedCardIndex = 0
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    reloadData()
  }
  
}

//MARK: IBActions
extension ViewController {
  @IBAction func btnNextActionTouchUpInside(sender: UIButton) {
    let increasedIndex = selectedCardIndex + 1
    selectedCardIndex = increasedIndex >= cards.count ? 0 : increasedIndex
    stripesPagingView.next()
    circlesPagingView.next()
    reloadData()
  }
}

//MARK: ViewController fileprivate extension
fileprivate extension ViewController {
  func setupUI() {
    stripesPagingView.count = cards.count
    stripesPagingView.cornerRadiusFactor = 2
    stripesPagingView.fillingAnimationDuration = 0.32
    stripesPagingView.color = UIColor.black.withAlphaComponent(0.32)
    stripesPagingView.selectedColor = UIColor.white.withAlphaComponent(1)

    circlesPagingView.count = cards.count
    circlesPagingView.scalingAnimationDuration = 0.32
    circlesPagingView.scalingAnimationFactor = 1.32
    circlesPagingView.fillingAnimationDuration = 0.32
    circlesPagingView.cornerRadiusFactor = 4
    circlesPagingView.isCircles = true
    
    btnNextAction.backgroundColor = UIColor(red: 0/255, green: 191/255, blue: 255/255, alpha: 1)
    btnNextAction.setTitleColor(.white, for: .normal)
    btnNextAction.layer.cornerRadius = 8
  }
  
  func reloadData() {
    let card = cards[selectedCardIndex]
    
    lblTitle.text = card.title
    lblDetails.text = card.details
    
    imgBackView.setImageWithTransitionAnimation(card.image, options: [.transitionCrossDissolve])
    imgIcon.setImageWithTransitionAnimation(card.icon, options: [.transitionFlipFromLeft])
  }
  
}

//MARK: UIImageView fileprivate extension
fileprivate extension UIImageView {
  func setImageWithTransitionAnimation(_ image: UIImage?,
                                       duration: TimeInterval = 0.64,
                                       options: UIView.AnimationOptions = []) {
      UIView.transition(
        with: self,
        duration: duration,
        options: options,
        animations: { [weak self] in self?.image = image },
        completion: nil)
    }
}
