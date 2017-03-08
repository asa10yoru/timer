//
//  ViewController.swift
//  timer
//
//  Created by ぽんじゅうす on 2017/03/04.
//  Copyright © 2017年 asa10yoru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var timerLabel: UILabel!
    // タイマー用の時間のための変数
    var timer: NSTimer!
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // タイマーの作成、始動
       // NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
  //      NSTimer.scheduledTimerWithTimeInterval(1.0, target: targetObject, selector: #selector(TargetObject.update(_:)), userInfo: nil, repeats: true)
      //  let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: targetObject, selector: #selector(TargetObject.update(_:)), userInfo: nil, repeats: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateTimer(timer: NSTimer) {
        self.timer_sec += 0.1
        self.timerLabel.text = String(format: "%.1f", timer_sec)
    }
    
    
    
    @IBAction func startTimer(sender: AnyObject) {
        // 再生ボタンを押すとタイマー作成、始動
   //     self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
   
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }

    @IBAction func pauseTimer(sender: AnyObject) {
        if self.timer != nil {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
        }
    }

    @IBAction func resetTimer(sender: AnyObject) {
        self.timer_sec = 0
        self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        
        if self.timer != nil {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
        }
    }
    
    
}

