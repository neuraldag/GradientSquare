//
//  ViewController.swift
//  GradientSquare
//
//  Created by Gamid Gapizov on 01.02.2024.
//

    import UIKit

class ViewController: UIViewController {
    
    
    let squareView = UIView()
    let gradient = CAGradientLayer()
    
    
    // - MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(squareView)
        
        createSquareView()
        
        addGradientToView(squareView, gradientLayer: gradient, gradientWidth: 120, gradientHeight: 120, colorOne: .systemCyan, colorTwo: .systemRed)
        
        addShadowToView(squareView, shadowOpacity: 0.2, shadowRadius: 7, shouldRasterize: true, shadowOffsetByWidth: 0, shadowOffsetByHeight: 10)
    }
    
    
    // - MARK: Creating the View
    private func createSquareView() {
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.layer.cornerRadius = 12
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: squareView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120),
            NSLayoutConstraint(item: squareView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120),
            NSLayoutConstraint(item: squareView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 100),
            NSLayoutConstraint(item: squareView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        ])
    }
    
    // - MARK: Adding gradient layer to the View
    private func addGradientToView(_ view: UIView, gradientLayer: CAGradientLayer, gradientWidth: CGFloat, gradientHeight: CGFloat, colorOne: UIColor, colorTwo: UIColor) {
        gradientLayer.frame = .init(x: 0, y: 0, width: gradientWidth, height: gradientHeight)
        gradientLayer.cornerRadius = view.layer.cornerRadius
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.startPoint = CGPoint(x: -0.4, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    // - MARK: Adding shadow layer to the View
    private func addShadowToView(_ view: UIView, shadowOpacity: Float, shadowRadius: CGFloat, shouldRasterize: Bool, shadowOffsetByWidth: CGFloat, shadowOffsetByHeight: CGFloat) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowOffset = .init(width: shadowOffsetByWidth, height: shadowOffsetByHeight)
        view.layer.shadowRadius = shadowRadius
        view.layer.shouldRasterize = shouldRasterize
        view.layer.rasterizationScale = UIScreen.main.scale
    }
}

