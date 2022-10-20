//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 村上尚哉 on 2022/10/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var modorubtn: UIButton!
    @IBOutlet weak var susumubtn: UIButton!
    @IBOutlet weak var saiseibtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var nowIndex:Int = 0
    
    var timer: Timer!
    
    var imageArray:[UIImage] = [
        UIImage(named: "春")!,
        UIImage(named: "夏")!,
        UIImage(named: "秋")!,
        UIImage(named: "冬")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imageArray[nowIndex]
    }

    @IBAction func modorubtn(_ sender: Any) {
        if (nowIndex > 0) {
        nowIndex -= 1
        imageView.image = imageArray[nowIndex]
        } else {
            nowIndex = 3
            imageView.image = imageArray[nowIndex]
        }
    }
    
    @IBAction func susumubtn(_ sender: Any) {
        if (nowIndex < 3) {
        nowIndex += 1
        imageView.image = imageArray[nowIndex]
        } else {
            nowIndex = 0
            imageView.image = imageArray[nowIndex]
        }
        
    }
    
    @IBAction func saiseibtn(_ sender: Any) {
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeimage), userInfo: nil, repeats: true)
            saiseibtn.setTitle("停止", for: .normal)
            modorubtn.isEnabled = false
            susumubtn.isEnabled = false
        } else {
            timer.invalidate()
            timer = nil
            saiseibtn.setTitle("再生", for: .normal)
            modorubtn.isEnabled = true
            susumubtn.isEnabled = true
            
        }
    }
    
    
    
    @objc func changeimage() {
        nowIndex += 1
        
        if (nowIndex == imageArray.count) {
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
    }
    
    
    @IBAction func tap(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
        
        timer.invalidate()
        timer = nil
        saiseibtn.setTitle("再生", for: .normal)
        modorubtn.isEnabled = true
        susumubtn.isEnabled = true

        

        }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
            }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController: ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.image = imageArray[nowIndex]
    }
    
    
    
    
    
    
    
    }
    

    



