//
//  ViewController.swift
//  hageeee
//
//  Created by Kae on 2015/02/22.
//  Copyright (c) 2015年 Kae. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var hage4: UIImageView!
    @IBOutlet weak var hage3: UIImageView!
    @IBOutlet weak var hage2: UIImageView!
    @IBOutlet weak var hage1: UIImageView!
    
    @IBOutlet weak var shojiro: UIImageView!
    @IBOutlet weak var hageImageView: UIImageView!
    
    @IBOutlet weak var white: UIImageView!
    
    @IBOutlet weak var mawari1View: UIImageView!
    
    @IBOutlet weak var mawari2View: UIImageView!
    
    @IBOutlet weak var mawari3View: UIImageView!
    
    
    @IBOutlet weak var mawari4View: UIImageView!
    
    
    @IBOutlet weak var mawari5View: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGestureUp:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        hage1.hidden = true
        hage2.hidden = true
        hage3.hidden = true
        hage4.hidden = true
        
        white.hidden = true
        hageImageView.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func respondToSwipeGestureUp(gesture: UIGestureRecognizer){
        
        var HageNumber = arc4random()%4 + 1
        
        hage1.hidden = true
        hage2.hidden = true
        hage3.hidden = true
        hage4.hidden = true
        
        
        if(HageNumber == 1){
            hage1.hidden = false
        }else if(HageNumber == 2){
            hage2.hidden = false
        }else if(HageNumber == 3){
            hage3.hidden = false
        }else if(HageNumber == 4){
            hage4.hidden = false
        }
        
        
        println(HageNumber)
        
        
        
    }

    
    @IBAction func photoButtonAction(sender: UIButton) {
        pickImageFromCamera()
        
    }
    
    
    @IBAction func camerarollButtonAction(sender: UIButton) {
        hageImageView.hidden = false
        pickImageFromLibrary()
        
    }
    
    
    
    
    @IBAction func saveButtonAction(sender: UIButton) {
        println("button was pushed!")
//        println(hageImageView.image)
//        println(hageImageView.image?.size.height)
//        println(self)
        white.hidden = false
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutablePointer<Void>) {
        println("bbbbbbb")
        if error != nil {
            //プライバシー設定不許可など書き込み失敗時は -3310 (ALAssetsLibraryDataUnavailableError)
            println(error.code)
        }
    }
    
    // 写真を撮ってそれを選択
    func pickImageFromCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    // ライブラリから写真を選択する
    func pickImageFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    
    // 写真を選択した時に呼ばれる
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if info[UIImagePickerControllerOriginalImage] != nil {
//            let image = info[UIImagePickerControllerOriginalImage] as UIImage
            let image:UIImage? = info[UIImagePickerControllerOriginalImage] as? UIImage
            println("aaaaa")
            println(image)
            white.image = image
            mawari1View.hidden = false
            mawari2View.hidden = false
            mawari3View.hidden = false
            mawari4View.hidden = false
            mawari5View.hidden = false
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

}

