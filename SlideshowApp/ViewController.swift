//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 中村 行汰 on 2024/04/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var preButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!{
        didSet{
            imageView.image = UIImage(named: "TA課題用1.png")
        }
    }
    var imageIndex = 0
    var timer: Timer!
    
    let images = [
        UIImage(named: "TA課題用1.png"),
        UIImage(named: "TA課題用2.png"),
        UIImage(named: "TA課題用3.png")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        //画像タッチ
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
    }
    //スライドショーのとき呼び出されるもの
    @objc func updateSlide(_ timer: Timer){
        nextImage()
    }
    //画像タッチで呼び出されるもの
    @objc func imageTapped() {
        if self.timer != nil {
            self.timer.invalidate()
        }
        performSegue(withIdentifier: "toNext", sender: nil)
    }
    //戻った時
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        if self.timer != nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateSlide(_:)), userInfo: nil, repeats: true)
        }
    }
    //画像渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.images = images[imageIndex]
    }
    
    //次へ
    @IBAction func nextSlide(_ sender: Any) {
        nextImage()
    }
    //前へ
    @IBAction func previousSlide(_ sender: Any) {
        imageIndex = (imageIndex - 1 + images.count) % images.count
        imageView.image = images[imageIndex]
    }
    //スライドショー
    @IBAction func startSlideshow(_ sender: Any) {
        nextButton.isEnabled = !nextButton.isEnabled
        preButton.isEnabled = !preButton.isEnabled
        if self.timer == nil {
            startButton.setTitle("停止", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateSlide(_:)), userInfo: nil, repeats: true)
        }
        else {
            startButton.setTitle("再生", for: .normal)
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil
        }
    }
    
    //次へメソッド
    func nextImage(){
        imageIndex = (imageIndex + 1 + images.count) % images.count
        imageView.image = images[imageIndex]
    }
}

