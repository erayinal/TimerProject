//
//  ViewController.swift
//  TimerProject
//
//  Created by Eray İnal on 4.11.2023.
//



// Timerlar ile birlikte biz istediğimiz her saniyede veya iki saniyede veya istediğimiz periyotlarla aynı işlemi yapmayı sağlayacağız

// 10'dan 0'a geri sayan bir uygulama yaparak bu konuyu pekiştirelim



import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 10
//      timeLabel.text = "Time: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)   // timeInterval'ı 1 vererek 1 saniyelik periyotlar seçtik
        
    }
    
    
    @objc func timerFunction(){
        timeLabel.text = "Time: \(counter)"
        counter -= 1
        
        if(counter == -1){
            timer.invalidate()  // Bu fonksiyon timer'ı durdurur çünkü counter 0 olacak
            timeLabel.text = "Time's Over"
        }
    }

    
    @IBAction func myButton(_ sender: Any) {
    }
    
    
    
    // Şimdi biz timeLabel içerisindeki zamanı 10'dan geriye doğru 'Thread.sleep(100)' ile de yapabilirdik ama bu yöntemin çalışma yöntemi bize uymaz çünkü 1 saniye boyunca bütün kodu durdurur ve biz uygulamada başka bir şey yapamayız(örneğin butona basmak istesek basamayız çünkü 1 saniye boyunca uygulama duracak). Ama Timer ile biz geri sayım yaparken aynı aynda başka butonlara vs basabiliriz, başka işlemler yapabiliriz.
    
}

