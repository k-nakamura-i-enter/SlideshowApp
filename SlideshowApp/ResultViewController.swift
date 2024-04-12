//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 中村 行汰 on 2024/04/11.
//

import UIKit

class ResultViewController: UIViewController {
    var images: UIImage!
    
    @IBOutlet weak var largeImageView: UIImageView!
    {
        didSet{
            //画像表示
            largeImageView.image = images
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
