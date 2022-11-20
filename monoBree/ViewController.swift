//
//  ViewController.swift
//  monoBree
//
//  Created by ac1ra on 20.11.2022.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mainImageVIew: UIImageView!
    
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
        iScreenSizes()
    }

    private func setMinZoomScaleForImageSize(_ imageSize: CGSize){
        let widthScale = view.frame.width / imageSize.width
        let heightScale = view.frame.height / imageSize.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale
    
        let imageWidth = imageSize.width * minScale
        let imageHeight = imageSize.height * minScale
        
        let newImageFrame = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
        mainImageVIew.frame = newImageFrame
        
        centerImage()
    }
    private func centerImage() {
        
        let imageViewSize = mainImageVIew.frame.size
        let scrollViewSize = view.frame.size
        
        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        
        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            setMinZoomScaleForImageSize(pickedImage.size)
            mainImageVIew.image = pickedImage

        }
        dismiss(animated: true, completion: nil)
    }

    @IBAction func doubleTapImg(_ sender: UITapGestureRecognizer) {
        if scrollView.zoomScale == scrollView.minimumZoomScale{
            scrollView.zoom(to: zoomRectangle(scale: scrollView.maximumZoomScale, center: sender.location(in: sender.view)), animated: true)
        }else{
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        }
    }
    private func zoomRectangle(scale: CGFloat, center:CGPoint) -> CGRect{
        var zoomRect = CGRect.zero
        
        zoomRect.size.height = mainImageVIew.frame.size.height / scale
        zoomRect.size.width = mainImageVIew.frame.size.width / scale
        zoomRect.origin.x = center.x - (center.x * scrollView.zoomScale)
        zoomRect.origin.y = center.y - (center.y * scrollView.zoomScale)
        
        return zoomRect
    }
    func iScreenSizes() {
                    let height = UIScreen.main.bounds.size.height
                    print("Device height: \(height)")
                    switch height {
                    case 480.0:
                        print("iPhone 3 | iPhone 4 | iPhone 4S")
                    case 568.0:
                        print("iPhone 5 | iPhone 5S | iPhone 5C | iPhone SE")
                      let squarePath = UIBezierPath()
                      squarePath.move(to: CGPoint(x: 0, y: 0))
                      
                      
                      squarePath.addLine(to: CGPoint(x: mainImageVIew.frame.maxX, y: 0))
                      squarePath.addLine(to: CGPoint(x: mainImageVIew.frame.maxX, y: 20))
                      squarePath.addLine(to: CGPoint(x: 0, y: 20))

                      squarePath.close()
                      
                      let square = CAShapeLayer()
                      square.path = squarePath.cgPath
                      square.fillColor = UIColor.blue.cgColor
                      self.view.layer.addSublayer(square)
                    case 667.0:
                        print("iPhone 6 | iPhone 7 | iPhone 8 | iPhone SE(2nd gen)")
                      let squarePath = UIBezierPath()
                      squarePath.move(to: CGPoint(x: 0, y: 0))
                      
                      
                      squarePath.addLine(to: CGPoint(x: mainImageVIew.frame.maxX, y: 0))
                      squarePath.addLine(to: CGPoint(x: mainImageVIew.frame.maxX, y: 20))
                      squarePath.addLine(to: CGPoint(x: 0, y: 20))

                      squarePath.close()
                      
                      let square = CAShapeLayer()
                      square.path = squarePath.cgPath
                      square.fillColor = UIColor.red.cgColor
                      self.view.layer.addSublayer(square)
                      
                    case 736.0:
                        print("iPhone 6+ | iPhone 7+ | iPhone 8+")
                    case 780.0:
                        print("iPhone 12 Mini")
                      let squarePath = UIBezierPath()
                      squarePath.move(to: CGPoint(x: 0, y: 0))
                      
                      
                      squarePath.addLine(to: CGPoint(x: mainImageVIew.frame.maxX, y: 0))
                      squarePath.addLine(to: CGPoint(x: mainImageVIew.frame.maxX, y: 34))
                      squarePath.addLine(to: CGPoint(x: 0, y: 34))

                      squarePath.close()
                      
                      let square = CAShapeLayer()
                      square.path = squarePath.cgPath
                      square.fillColor = UIColor.black.cgColor
                      self.view.layer.addSublayer(square)
                      
                    case 812.0:
                      
                        print("iPhone X | iPhone XS | iPhone 11 Pro | iPhone 12 mini")
                      let squarePath = UIBezierPath()
                      squarePath.move(to: CGPoint(x: 0, y: 0))
                      
                      squarePath.addLine(to: CGPoint(x: mainImageVIew.frame.maxX, y: 0))
                      squarePath.addLine(to: CGPoint(x: mainImageVIew.frame.maxX, y: 44))
                      squarePath.addLine(to: CGPoint(x: 0, y: 44))
                        
                      squarePath.close()
                      
                      let square = CAShapeLayer()
                      square.path = squarePath.cgPath
                      square.fillColor = UIColor.black.cgColor
                        
                      self.view.layer.addSublayer(square)
                        
                      //** make line on the layer
                        
                        let linePath = UIBezierPath()
                        linePath.move(to: CGPoint(x: 0, y: 44))
                        
                        linePath.addLine(to: CGPoint(x: mainImageVIew.frame.maxX, y: 44))
                          
                        squarePath.close()
                        
                    let lineLayer = CAShapeLayer()
                        lineLayer.path = linePath.cgPath
                        lineLayer.strokeColor = UIColor.white.cgColor
                        lineLayer.lineWidth = 0.8

                        self.view.layer.addSublayer(lineLayer)
                        
                        
                    case 844.0:
                        print("iPhone 12 | iPhone 12 Pro")
                        let squarePath = UIBezierPath()
                        squarePath.move(to: CGPoint(x: 0, y: 0))
                        
                        squarePath.addLine(to: CGPoint(x: mainImageVIew.frame.maxX, y: 0))
                        squarePath.addLine(to: CGPoint(x: mainImageVIew.frame.maxX, y: 44))
                        squarePath.addLine(to: CGPoint(x: 0, y: 44))
                          
                        squarePath.close()
                        
                        let square = CAShapeLayer()
                        square.path = squarePath.cgPath
                        square.fillColor = UIColor.black.cgColor
                          
                        self.view.layer.addSublayer(square)
                          
                        //** make line on the layer
                          
                          let linePath = UIBezierPath()
                          linePath.move(to: CGPoint(x: 0, y: 44))
                          
                          linePath.addLine(to: CGPoint(x: mainImageVIew.frame.maxX, y: 44))
                            
                          squarePath.close()
                          
                      let lineLayer = CAShapeLayer()
                          lineLayer.path = linePath.cgPath
                          lineLayer.strokeColor = UIColor.white.cgColor
                          lineLayer.lineWidth = 0.8

                          self.view.layer.addSublayer(lineLayer)
                        
                    case 896.0:
                        print("iPhone XR | iPhone XS Max | iPhone 11 | iPhone 11 Pro Max")
                    case 926.0:
                        print("iPhone 12 Pro Max")
                    case 1024.0:
                        print("iPad 1st gen | iPad 2 | iPad 3rd gen | iPad mini | iPad 4th gen | iPad Air | iPad mini 2 | iPad mini 3 | iPad Air 2 | iPad mini 4 | iPad 5th gen | iPad 6th gen | iPad  mini 5")
                    case 1112.0:
                        print("iPad Pro 2nd gen 10.5'' | iPad Air 3")
                    case 1194.0:
                        print("iPad Pro 3rd gen 11.0'' | iPad Pro 4th gen 11.0''")
                    case 1366.0:
                        print("iPad Pro 1st gen 12.9'' | iPad 2nd gen 12.9'' | iPad 3rd gen 12.9'' | iPad Pro 4th gen 12.9''")
                    default:
                        print("not listed in function")
                    }
                }

}

extension ViewController: UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mainImageVIew
    }
    func scrollViewDidZoom(_ scrollView:UIScrollView){
        self.centerImage()
    }
}
