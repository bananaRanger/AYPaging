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

//MARK: - AYPagingView class
open class AYPagingView: UIView {
  //MARK: properties
  
  /// Numbers of displaying items
  public var count: Int = 1 {
    didSet { updateLayers() }
  }

  /// Horizontal spacing
  public var hSpacing: CGFloat = 8 {
    didSet { updateLayers() }
  }
  
  /// Vertical spacing
  public var vSpacing: CGFloat = 0 {
    didSet { updateLayers() }
  }

  /// Selected item color
  public var selectedColor: UIColor = .white {
    didSet { updateLayers() }
  }
  
  /// Items color
  public var color: UIColor = .lightGray {
    didSet { updateLayers() }
  }
    
  /// Index of selected item
  public var selected: Int = 0 {
    didSet {
      if selected >= count { selected = 0 }
      if selected < 0 { selected = count - 1 }
      updateLayers()
    }
  }
  
  /// Is items represent as circles (true) or as stripes (false)
  public var isCircles: Bool = false {
    didSet { updateLayers() }
  }
  
  /// Duration of changing color animation
  public var fillingAnimationDuration: TimeInterval = 0
  
  /// Duration of scaling color animation
  public var scalingAnimationDuration: TimeInterval = 0

  /// Scaling animation multiplier
  public var scalingAnimationFactor: CGFloat = 1
  
  /// Corner radius multiplier
  public var cornerRadiusFactor: CGFloat = 0

  private var minItemHeight: CGFloat = 1
  private var minItemWidth: CGFloat = 8

  private var className = String(describing: self)
    
  //MARK: methods
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateLayers()
  }
  
  /// Go to the previous item
  public func prevItem() {
    selected -= 1
  }
  
  /// Go to the next item
  public func nextItem() {
    selected += 1
  }
}

//MARK: - AYPagingView layers management fileprivate extension
fileprivate extension AYPagingView {
  func addLayers() {
    let layers = isCircles ? circlesLayers() : stripesLayers()
    layers.forEach { [weak self] layer in self?.layer.addSublayer(layer) }
    animationChange(for: layers[selected])
  }
  
  func removeLayers() {
    layer.sublayers?.forEach {
      if $0.name?.contains(className) == true {
        $0.removeFromSuperlayer()
      }
    }
  }
  
  func updateLayers() {
    removeLayers()
    addLayers()
  }
  
  func nameForLayer(with index: Int) -> String {
    return className.appending(String(index))
  }
}

//MARK: - AYPagingView layers types fileprivate extension
fileprivate extension AYPagingView {
  func stripesLayers() -> [CALayer] {
    var layers = [CALayer]()
    
    let hSpace = hSpacing
    let pages = CGFloat(count)
    
    let allHSpace = hSpace * (pages + 1)

    var partHeight = bounds.height - vSpacing * 2
    partHeight = partHeight >= minItemHeight ? partHeight : minItemHeight
    
    var partWidth = (bounds.width - allHSpace) / pages
    partWidth = partWidth >= minItemWidth ? partWidth : minItemWidth
    
    var partX = hSpace
    let partY = bounds.height / 2 - partHeight / 2
            
    (0..<count).forEach { index in
      let layer = CALayer()
      layer.name = nameForLayer(with: index)
      layer.frame = CGRect(x: partX, y: partY, width: partWidth, height: partHeight)
      layer.cornerRadius = cornerRadiusFactor != 0 ? partHeight / cornerRadiusFactor : 0
      layer.backgroundColor = color.cgColor
      layers.append(layer)
      
      partX += hSpace + partWidth
    }
    return layers
  }
  
  func circlesLayers() -> [CALayer] {
    var layers = [CALayer]()
    
    let hSpace = hSpacing
    let pages = CGFloat(count)
    let allHSpace = hSpacing * (pages + 1)

    var partHeight = bounds.height - vSpacing * 2
    partHeight = partHeight >= minItemHeight ? partHeight : minItemHeight

    let partWidth = partHeight
    let workingWidth = allHSpace + (pages * partHeight)
    
    let width = (bounds.width / 2) - (workingWidth / 2)
    
    var partX = width + hSpacing
    partX = partX >= hSpace ? partX : hSpace
    
    let partY = bounds.height / 2 - partWidth / 2
            
    (0..<count).forEach { index in
      let layer = CALayer()
      layer.name = nameForLayer(with: index)
      layer.frame = CGRect(x: partX, y: partY, width: partWidth, height: partHeight)
      layer.cornerRadius = cornerRadiusFactor != 0 ? partHeight / cornerRadiusFactor : 2
      layer.backgroundColor = color.cgColor
      layers.append(layer)

      partX += hSpace + partWidth
    }
    return layers
  }
}

//MARK: - AYPagingView animation fileprivate extension
fileprivate extension AYPagingView {
  func animationChange(for layer: CALayer) {
    let factor = scalingAnimationFactor

    defer {
      layer.backgroundColor = selectedColor.cgColor
      layer.transform = CATransform3DMakeScale(factor, factor, 0)
    }
            
    let animationsGroup = CAAnimationGroup()
    animationsGroup.animations = [CAAnimation]()
    
    if fillingAnimationDuration != 0 {
      let fillingAnimation = CALayer.fillingAnimation(
        from: color.cgColor,
        to: selectedColor.cgColor,
        with: fillingAnimationDuration)

      layer.add(fillingAnimation, forKey: "fillingAnimation")
      animationsGroup.animations?.append(fillingAnimation)
    }
    
    if scalingAnimationFactor != 0 {
      let scalingAnimation = CALayer.scalingAnimation(
        with: factor,
        with: scalingAnimationDuration)
      
      layer.add(scalingAnimation, forKey: "scalingAnimation")
      animationsGroup.animations?.append(scalingAnimation)
    }
  }
}
