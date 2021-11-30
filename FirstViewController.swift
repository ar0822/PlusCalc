//
//  FirstViewController.swift
//  PulsCal
//
//  Created by RAN on 2015/02/12.
//  Copyright (c) 2015年 nagae. All rights reserved.
//

//以前のバージョンアップの変更点
//＋ー×÷が連続して入力された場合にでるバグを修正○
//スイッチボタンがオンになった時の色を変更○
//プラスモード中に途中で画面遷移をしても継続して足し算ができるように修正

//バージョン2.10の変更点
//割引ボタンを追加

//バージョン2.12の変更点
//テーブルビューを画面のサイズに合わせて最適化
//
//



import UIKit

class FirstViewController: UIViewController {
    
    var answerData:Double = 0.0
    var firstanswerData:Double = 0.0
    var Mdouble:Double = 0.0
    var Mstring:NSString = ""
    
    var firstLabelControlSW = 0
    
    var clearSW = 0

    var mainAnswerLabelHozaon:String = "0"
    
    var syokinyuryokuSW = 0
    
    let TAG_Label = 2
    
    //＋ー×÷が連続して入力されるのを防ぐ
    var calcSW = 0
    
    //割引の計算で使用。割引の計算を行なうと１が入力される。クリアボタンを押すと０が入力される。
    var waribikiSW = 0
    
    //MR用に作成2020年5月16日
    var MRBtn:Double = 0.0
    var Kakunin:Double = 0.0
    
    //このスイッチは再計算時に使用
    var saikeisanSW = 0
    
    //M＋やMーの操作を行うときに、桁数操作を行わないためのフラグ
    var sisokuenzanSW = 0
    

    

    
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var pulsButton: UIButton!
    @IBOutlet weak var equalsButton: UIButton!
    @IBOutlet weak var firstAnswer: UILabel!
    @IBOutlet weak var calcLabel: UILabel!
    @IBOutlet weak var mainAnswerLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    //スイッチボタン
    @IBOutlet weak var ChangedswichOutlet: UISwitch!
    
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btnSyousuten: UIButton!
    
    //スイッチボタン
    @IBOutlet weak var PlusModeSwitch: UISwitch!
    
    @IBOutlet weak var waribiki50btn: UIButton!
    @IBOutlet weak var waribiki40btn: UIButton!
    @IBOutlet weak var waribiki30btn: UIButton!
    @IBOutlet weak var waribiki20btn: UIButton!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.firstAnswer.tag = self.TAG_Label
        self.firstAnswer.isUserInteractionEnabled = true
        
        //スイッチボタンの色を変更している
        PlusModeSwitch.onTintColor = UIColor.green
        
        waribiki20btn.layer.borderWidth = 1
        waribiki20btn.layer.borderColor = UIColor.white.cgColor

        waribiki30btn.layer.borderWidth = 1
        waribiki30btn.layer.borderColor = UIColor.white.cgColor

        waribiki40btn.layer.borderWidth = 1
        waribiki40btn.layer.borderColor = UIColor.white.cgColor

        waribiki50btn.layer.borderWidth = 1
        waribiki50btn.layer.borderColor = UIColor.white.cgColor

        
        divideButton.layer.borderWidth = 1
        divideButton.layer.borderColor = UIColor.white.cgColor

        multiplyButton.layer.borderWidth = 1
        multiplyButton.layer.borderColor = UIColor.white.cgColor

        minusButton.layer.borderWidth = 1
        minusButton.layer.borderColor = UIColor.white.cgColor

        equalsButton.layer.borderWidth = 1
        equalsButton.layer.borderColor = UIColor.white.cgColor

        pulsButton.layer.borderWidth = 1
        pulsButton.layer.borderColor = UIColor.white.cgColor

        btn0.layer.borderWidth = 1
        btn0.layer.borderColor = UIColor.white.cgColor

        btn1.layer.borderWidth = 1
        btn1.layer.borderColor = UIColor.white.cgColor
        
        btn2.layer.borderWidth = 1
        btn2.layer.borderColor = UIColor.white.cgColor
        
        btn3.layer.borderWidth = 1
        btn3.layer.borderColor = UIColor.white.cgColor
        
        btn4.layer.borderWidth = 1
        btn4.layer.borderColor = UIColor.white.cgColor
        
        btn5.layer.borderWidth = 1
        btn5.layer.borderColor = UIColor.white.cgColor
        
        btn6.layer.borderWidth = 1
        btn6.layer.borderColor = UIColor.white.cgColor
        
        btn7.layer.borderWidth = 1
        btn7.layer.borderColor = UIColor.white.cgColor
        
        btn8.layer.borderWidth = 1
        btn8.layer.borderColor = UIColor.white.cgColor
        
        btn9.layer.borderWidth = 1
        btn9.layer.borderColor = UIColor.white.cgColor
        
        btnSyousuten.layer.borderWidth = 1
        btnSyousuten.layer.borderColor = UIColor.white.cgColor
        
        calcLabel.layer.borderWidth = 1
        calcLabel.layer.borderColor = UIColor.white.cgColor
        
        clearButton.layer.borderWidth = 1
        clearButton.layer.borderColor = UIColor.white.cgColor
        
        mainAnswerLabel.layer.borderWidth = 1
        mainAnswerLabel.layer.borderColor = UIColor.white.cgColor
        
        firstAnswer.layer.borderWidth = 1
        firstAnswer.layer.borderColor = UIColor.white.cgColor
        

        

        firstAnswer.text = "0"
        mainAnswerLabel.text = "0"
        
        calcLabel.text = ""

    }
    
    ///////////////////スイッチボタンの制御////////////////////////////////////////////////////////////////////
    @IBAction func ChangedSwitch(sender: UISwitch) {
        
        divideButton.isEnabled = !(sender.isOn)
        if divideButton.isEnabled == false {
            
            divideButton.layer.borderColor = UIColor.gray.cgColor
            
            //テキストの色を変更する
            divideButton.setTitleColor(UIColor.white, for: .normal)
            
            
        } else {
            
            divideButton.layer.borderColor = UIColor.white.cgColor
            
            //テキストの色を変更する
            divideButton.setTitleColor(UIColor.black, for: .normal)
        }
        
        multiplyButton.isEnabled = !(sender.isOn)
        
        if multiplyButton.isEnabled == false {
            
            multiplyButton.layer.borderColor = UIColor.gray.cgColor
            
            //テキストの色を変更する
            multiplyButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            
            multiplyButton.layer.borderColor = UIColor.white.cgColor
            

            //テキストの色を変更する
            multiplyButton.setTitleColor(UIColor.black, for: .normal)
        
        }
        minusButton.isEnabled = !(sender.isOn)

        if minusButton.isEnabled == false {
            
            minusButton.layer.borderColor = UIColor.gray.cgColor
            
            //テキストの色を変更する
            minusButton.setTitleColor(UIColor.white, for: .normal)

        } else {
            
            minusButton.layer.borderColor = UIColor.white.cgColor
            
            //テキストの色を変更する
            minusButton.setTitleColor(UIColor.black, for: .normal)
        
        }
        
        //スイッチがオンになる時にFirstAnserLableを0にする
        if ChangedswichOutlet.isOn == true {
            
            firstAnswer.text = "0"
        }
        
        if ChangedswichOutlet.isOn == false {
            
            //var myDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let myDelegate = UIApplication.shared.delegate as! AppDelegate
            myDelegate.answerList1 = []
            myDelegate.answerList2 = []

            
//            firstAnswer.text = "0"
            firstLabelControlSW = 0
            calcLabel.text! = ""
//            mainAnswerLabel.text = "0"
        }
        
    }
    
    @IBAction func numverButton(thebuttn:UIButton) {
    
        print("\(MRBtn)")
        
        //＋ー×÷が連続で入力されるのを防ぐ
        calcSW = 0
        
      //  if saikeisanSW == 1 {
            
      //      clearAC()

      //  }
        
        
        let formatter = NumberFormatter()
        //formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator =  ","
        formatter.groupingSize = 3
        
        var _:Double = 0.0
        
//        switch calcLabel.text!{
            
//        case "=":
            
//            calcLabel.text = ""
            
//            mainAnswerLabel.text = thebuttn.titleLabel!.text!
            
//        default:
        
//        if syokinyuryokuSW == 0 {
//            syokinyuryokuSW = 1
//            mainAnswerLabel.text = ""
//        }
        
        
            if mainAnswerLabel.text == "0" && syokinyuryokuSW == 0 {

                mainAnswerLabel.text = thebuttn.titleLabel!.text!
                syokinyuryokuSW = 1
                mainAnswerLabelHozaon = thebuttn.titleLabel!.text!
                
            } else {
                
                if syokinyuryokuSW == 0 {
                    
                    mainAnswerLabel.text = thebuttn.titleLabel!.text!
                    syokinyuryokuSW = 1
                    
                } else {
                    
                    //小数点を複数回入力できないように制御する処理
                    if thebuttn.titleLabel!.text! == "." {
                        
                        //文字列の中に小数点があったら抜け出す処理
                        //if let r = mainAnswerLabel.text!.rangeOfString(".") {
                        if mainAnswerLabel!.text!.contains(".") {
                            return
                            
                        }
                        
                    }
                    
                    //calclabelに＝が入力されいる場合、文字をつなげない
                    if calcLabel.text == "=" {
                        return
                    }

                    mainAnswerLabel.text = mainAnswerLabel.text! + thebuttn.titleLabel!.text!
                    
                }
                
                //ラベルに数字をつなげていく処理
                
                
//                mainAnswerLabelHozaon = mainAnswerLabelHozaon + thebuttn.titleLabel!.text!
//                kariansnswer = (mainAnswerLabelHozaon as NSString).doubleValue
//                mainAnswerLabel.text = formatter.stringFromNumber(kariansnswer)
                mainAnswerLabelHozaon = mainAnswerLabel!.text!
//            }
        }
        
        
    }
//////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////計算ボタンが押された時の処理////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
    @IBAction func calcButton(thebutton:UIButton){
                
        if calcSW == 0 {
            
            let myDelegate = UIApplication.shared.delegate as! AppDelegate
            
            if calcLabel.text == "" {
                
                let myDelegate = UIApplication.shared.delegate as! AppDelegate
                
                if ChangedswichOutlet.isOn == true {
                    
                    if thebutton.titleLabel!.text! == "+" {
                        
                        if firstLabelControlSW == 0 {
                            
                            myDelegate.answerList1.append(String(mainAnswerLabelHozaon))
                            
                        } else {
                            
                            myDelegate.answerList2.append(String(mainAnswerLabelHozaon))
                        }
                    }
                    
                    
                }
                
                
                
                Mstring = mainAnswerLabelHozaon as NSString
                Mdouble = Mstring.doubleValue
                answerData = Mdouble
                calcLabel.text = thebutton.titleLabel!.text!
                mainAnswerLabelHozaon = "0"
                syokinyuryokuSW = 0
                
                
                
            } else {
                
                
                switch thebutton.titleLabel!.text! {
                    
                case "×":
                    print("×")
                    //計算する
                    calc(kubun: calcLabel.text!)
                    
                    calcLabel.text = "×"
                    mainAnswerLabelHozaon = "0"
                    
                    syokinyuryokuSW = 0
                    
                case "÷":
                    print("÷")
                    //計算する
                    calc(kubun: calcLabel.text!)
                    
                    calcLabel.text = "÷"
                    mainAnswerLabelHozaon = "0"
                    syokinyuryokuSW = 0
                    
                case "-":
                    print("-")
                    //計算する
                    calc(kubun: calcLabel.text!)
                    
                    calcLabel.text = "-"
                    mainAnswerLabelHozaon = "0"
                    syokinyuryokuSW = 0
                    
                    
                case "+":
                    
                    syokinyuryokuSW = 0
                    
                    if ChangedswichOutlet.isOn == true {
                        
                        if firstLabelControlSW == 0 {
                            
                            myDelegate.answerList1.append(mainAnswerLabel.text!)
                            
                        } else {
                            
                            myDelegate.answerList2.append(mainAnswerLabel.text!)
                        }
                        
                        
                    }
                    
                    
                    
                    print("+")
                    
                    //計算する
                    calc(kubun: calcLabel.text!)
                    
                    calcLabel.text = "+"
                    mainAnswerLabelHozaon = "0"
                    
                default:
                    print("err")
                }
                
                
            }
            
            calcSW = 1
            
        } else {
            
            calcLabel.text = thebutton.titleLabel?.text
            
        }

        
        
        
    }
    
    func calc(kubun:String){
        print("\(MRBtn)")
        Mstring = mainAnswerLabelHozaon as NSString
        Mdouble = Mstring.doubleValue
        
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3

        
        switch kubun {
            
        case "":
            
            answerData = Mdouble
            
            mainAnswerLabel.text = "0"
            
        case "×":
            print("×")
            answerData = answerData * Mdouble
            
            Mstring = NSString(format: "%f", answerData)
            
//            Ketasousa(Mstring)
            
            mainAnswerLabel.text = formatter.string(from: NSNumber(value: answerData))
            
            print(Mstring)
            
        case "÷":
            print("÷")
            answerData = answerData / Mdouble
            
            Mstring = NSString(format: "%f", answerData)
            
//            Ketasousa(Mstring)

            mainAnswerLabel.text = formatter.string(from: NSNumber(value: answerData))

            print(Mstring)
            
        case "-":
            print("-")

            answerData = answerData - Mdouble
            
            Mstring = NSString(format: "%f", answerData)
            
//            Ketasousa(Mstring)
            
            mainAnswerLabel.text = formatter.string(from: NSNumber(value: answerData))
            
            print(Mstring)
            
        case "+":
            print("+")
            
            answerData = answerData + Mdouble
            
            Mstring = NSString(format: "%f", answerData)
            
//            Ketasousa(Mstring)
            
            mainAnswerLabel.text = formatter.string(from: NSNumber(value: answerData))

            print(Mstring)
            
        default:
            print("error")
        }
        print("\(MRBtn)")
    }
    //＝を押したときの処理////////////////////////////////////////////////////////////////////////////////////////////
    @IBAction func equalsButtn(theButton:UIButton){
 
        equalA()
        
    }
    
    func equalA(){
        
        let myDelegate = UIApplication.shared.delegate as! AppDelegate

                _ = 0
                
                var kakuinInt = 0
                
                var kakuinDouble:Double = 0.0
                
                if ChangedswichOutlet.isOn == true {
                    
                    if firstLabelControlSW == 0 {
                        
                        myDelegate.answerList1.append(mainAnswerLabel.text!)
                        
                    } else {
                        
                        myDelegate.answerList2.append(mainAnswerLabel.text!)
                    }
                    
                    
                }

                
                calc(kubun: calcLabel.text!)
                
                if firstAnswer.text == "0" {

                    firstanswerData = answerData

                }
                
                print("=を押した時のfirstanserdata\(firstanswerData)")
                
         
                //小数点以下に数字があるか確認する処理
                kakuinInt = Int(answerData)
                
                kakuinDouble = Double(kakuinInt)
                
                
                Mstring = "\(kakuinDouble)" as NSString
            
            print(sisokuenzanSW)
            //四則演算スイッチが０の時のみ桁数操作を行う
            if sisokuenzanSW == 0 {
            
                Ketasousa(testString: Mstring as String)

            }
                
                calcLabel.text = "="
                
                clearSW = 1
              //  saikeisanSW = 1
        
                
                //＝を押したあとに、再計算ができない事象を修正するために下記の３行をコメントとした2015年6月4日
        //        syokinyuryokuSW = 0
                
        //        answerData = 0.0
                
        //        mainAnswerLabelHozaon = "0"
        
    }
    
    @IBAction func waribikiButton(thebutton:UIButton) {
        print("\(MRBtn)")
        print("\(Kakunin)")
        
        
        //四則演算スイッチが１のときは桁数操作を行わない
        sisokuenzanSW = 1
        
        equalA()
        
        calcLabel.text = ""
        
        //2020年6月12日追加
        //この追加により、MRボタンタップ後にすぐに数字が入力できるようになった
        syokinyuryokuSW = 0

        
        if waribikiSW == 0 {
       
            //print(thebutton.titleLabel!.text)
            
            //var MainanswerHozonArea:NSString = ""
            var Keisanyou:Double = 0.0
            
            //MainanswerHozonArea = mainAnswerLabel.text! as NSString
            //Keisanyou = MainanswerHozonArea.doubleValue
            Keisanyou = answerData
            
            switch thebutton.titleLabel!.text! {
                
            case "５０％":
                
                Keisanyou = Keisanyou * 0.5
                
                
            case "４０％":
                
                Keisanyou = Keisanyou * 0.6
                
            case "３０％":
                
                Keisanyou = Keisanyou * 0.7
                
            case "２０％":
                
                Keisanyou = Keisanyou * 0.8
                
            case "MC":
                
                MRBtn = 0.0
                Keisanyou = MRBtn
                            
            case "M+":
                
                MRBtn = MRBtn + Keisanyou
            
                //equalA()
                print("\(MRBtn)")
            case "M-":
                
                MRBtn = MRBtn - Keisanyou
            
                //equalA()
                print("\(MRBtn)")
            case "MR":
                
                print("\(MRBtn)")
                Keisanyou = MRBtn
                print("\(MRBtn)")
                print("\(Keisanyou)")
                //equalA()
                
            default:
                
                print("\(Keisanyou)")
                
            }
            
            print("\(Keisanyou)")
            print("\(MRBtn)")
            mainAnswerLabel.text! = "\(Keisanyou)"
            
            sisokuenzanSW = 0
            //MRボタンの追加で下記のコードを一旦破棄　2020年5月16日
            //waribikiSW = 1
        }
        print("\(MRBtn)")
        Kakunin = MRBtn
    }
    
    func clearAC(){
        if clearSW == 1 {

            if firstAnswer.text == "" {

                mainAnswerLabelHozaon = "0"
                answerData = 0.0
                
            }
            
            mainAnswerLabel.text = "0"
            calcLabel.text = ""
            
            waribikiSW = 0
            
            clearSW = 0
            

            
        } else {
            
                if mainAnswerLabel.text != "0" {
                    
                    mainAnswerLabel.text = "0"
                    mainAnswerLabelHozaon = "0"
                    
                } else {
                    
                    mainAnswerLabelHozaon = "0"
                    mainAnswerLabel.text = "0"
                    answerData = 0.0
                    calcLabel.text = ""
                    firstAnswer.text = "0"
                    firstanswerData = 0.0
                    
                    //2020年6月12日追加
                    MRBtn = 0.0
                    
                    waribikiSW = 0
                    
                }
            
        }
        syokinyuryokuSW = 0
        saikeisanSW = 0
    }
    
    
    //クリアボタンを押したときの処理
    @IBAction func clearButton(thebutton:UIButton){
        
        clearAC()
    
        //クリアボタンではクリアしないようにした　2020年5月21日
    //    MRBtn = 0.0
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //小数点以下の桁の処理
    func Ketasousa(testString:String){
        var answrString:String = ""
        var konmaString:String = ""
        var syousuutennika:String = ""
        var tunagiString:String = ""
        
        var syousutenikaKakunin:Int = 0
        
        var DoubleChang = 0.0
        
        
        _ = ""
        
        var sw = 0
        var sw2 = 0
        _ = 0
        var countA = 0
        
        
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        
        
        for ch in testString{
            switch ch {
            case "1":
                print(ch)
                if sw == 1 {
                    sw2 = 1
                    syousuutennika = syousuutennika + String(ch)
                    sw = 0
                    countA+=1
                } else {
                    if sw2 != 1{
                        answrString = answrString + String(ch)
                        
                    } else {
                        sw = 0
                        if countA <= 5 {
                            syousuutennika = syousuutennika + String(ch)
                            countA+=1
                        }
                    }
                    
                }
                
                
            case "2":
                print(ch)
                if sw == 1 {
                    sw2 = 1
                    syousuutennika = syousuutennika + String(ch)
                    sw = 0
                    countA+=1
                } else {
                    if sw2 != 1{
                        answrString = answrString + String(ch)
                        
                    } else {
                        sw = 0
                        if countA <= 5 {
                            syousuutennika = syousuutennika + String(ch)
                            countA+=1
                        }
                    }
                    
                }
                
            case "3":
                print(ch)
                print(ch)
                if sw == 1 {
                    sw2 = 1
                    syousuutennika = syousuutennika + String(ch)
                    sw = 0
                    countA+=1
                } else {
                    if sw2 != 1{
                        answrString = answrString + String(ch)
                        
                    } else {
                        sw = 0
                        if countA <= 5 {
                            syousuutennika = syousuutennika + String(ch)
                            countA+=1
                        }
                    }
                    
                }
                
            case "4":
                print(ch)
                print(ch)
                if sw == 1 {
                    sw2 = 1
                    syousuutennika = syousuutennika + String(ch)
                    sw = 0
                    countA+=1
                } else {
                    if sw2 != 1{
                        answrString = answrString + String(ch)
                        
                    } else {
                        sw = 0
                        if countA <= 5 {
                            syousuutennika = syousuutennika + String(ch)
                            countA+=1
                        }
                    }
                    
                }
                
            case "5":
                print(ch)
                print(ch)
                if sw == 1 {
                    sw2 = 1
                    syousuutennika = syousuutennika + String(ch)
                    sw = 0
                    countA+=1
                } else {
                    if sw2 != 1{
                        answrString = answrString + String(ch)
                        
                    } else {
                        sw = 0
                        if countA <= 5 {
                            syousuutennika = syousuutennika + String(ch)
                            countA+=1
                        }
                    }
                    
                }
                
            case "6":
                print(ch)
                print(ch)
                if sw == 1 {
                    sw2 = 1
                    syousuutennika = syousuutennika + String(ch)
                    sw = 0
                    countA+=1
                } else {
                    if sw2 != 1{
                        answrString = answrString + String(ch)
                        
                    } else {
                        sw = 0
                        if countA <= 5 {
                            syousuutennika = syousuutennika + String(ch)
                            countA+=1
                        }
                    }
                    
                }
                
            case "7":
                print(ch)
                print(ch)
                if sw == 1 {
                    sw2 = 1
                    syousuutennika = syousuutennika + String(ch)
                    sw = 0
                    countA+=1
                } else {
                    if sw2 != 1{
                        answrString = answrString + String(ch)
                        
                    } else {
                        sw = 0
                        if countA <= 5 {
                            syousuutennika = syousuutennika + String(ch)
                            countA+=1
                        }
                    }
                    
                }
                
            case "8":
                print(ch)
                print(ch)
                if sw == 1 {
                    sw2 = 1
                    syousuutennika = syousuutennika + String(ch)
                    sw = 0
                    countA+=1
                } else {
                    if sw2 != 1{
                        answrString = answrString + String(ch)
                        
                    } else {
                        sw = 0
                        if countA <= 5 {
                            syousuutennika = syousuutennika + String(ch)
                            countA+=1
                        }
                    }
                    
                }
                
            case "9":
                print(ch)
                if sw == 1 {
                    sw2 = 1
                    syousuutennika = syousuutennika + String(ch)
                    sw = 0
                    countA+=1
                } else {
                    if sw2 != 1{
                        answrString = answrString + String(ch)
                        
                    } else {
                        sw = 0
                        if countA <= 5 {
                            syousuutennika = syousuutennika + String(ch)
                            countA+=1
                        }
                    }
                    
                }
                
                
            case "0":
                print(ch)
                
                if sw == 1 {
                    sw2 = 1
                    syousuutennika = syousuutennika + String(ch)
                    sw = 0
                    countA+=1
                } else {
                    if sw2 != 1{
                        answrString = answrString + String(ch)
                        
                    } else {
                        sw = 0
                        if countA <= 5 {
                            syousuutennika = syousuutennika + String(ch)
                            countA+=1
                        }
                    }
                    
                }
                
                
            case ".":
                konmaString = String(ch)
                print(ch)
                sw2 = 1
                
            case "-":
                answrString = String(ch)
                
            default:
                print(ch)
                
            }
        }

        
        //todo:ここから下の処理を変更して、小数点以下がちゃんと表示される表に調整する,konmaString,answrString,syousuutennika,DoubleChang
        syousutenikaKakunin = Int(syousuutennika)!
        
        DoubleChang = (answrString as NSString).doubleValue
        
        if syousutenikaKakunin > 0 {
            
//            mainAnswerLabel.text = "\(answerData)"
//            mainAnswerLabel.text = formatter.stringFromNumber(answerData)
            
            tunagiString = formatter.string(from: NSNumber(value: DoubleChang))!
            mainAnswerLabel.text = tunagiString + konmaString + syousuutennika
            
            if firstAnswer.text == "0" {
                
                firstAnswer.text = mainAnswerLabel.text
                
            }
            
        } else {
            
//            mainAnswerLabel.text = answrString
            mainAnswerLabel.text = formatter.string(from: NSNumber(value: answerData))
            
            if firstAnswer.text == "0" {
                
                firstAnswer.text = mainAnswerLabel.text
                
            }
        }
        
                if ChangedswichOutlet.isOn == true && firstLabelControlSW == 0 {
        
                    if syousutenikaKakunin > 0 {
        
//                        firstAnswer.text = "\(answerData)"
//                        firstAnswer.text = formatter.stringFromNumber(answerData)

                        tunagiString = formatter.string(from: NSNumber(value: DoubleChang))!
                        mainAnswerLabel.text = tunagiString + konmaString + syousuutennika
                        
                        if firstAnswer.text == "0" {
                            
                            firstAnswer.text = mainAnswerLabel.text
                        
                        }
                        
                        
                        firstLabelControlSW = 1
        
                    } else {
        
//                        firstAnswer.text = answrString
                        firstAnswer.text = formatter.string(from: NSNumber(value: answerData))
                        
                        firstLabelControlSW = 1
        
                    }
        
                }

    }

    //firstAnserをタップした時に答えをmainAnswerLableに送るイベント
    
    //override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let t: UITouch = touch as! UITouch
            
            if t.view?.tag == self.firstAnswer.tag {
                
                mainAnswerLabel.text = firstAnswer.text
                //                Mstring = firstAnswer.text!
                //                Mdouble = Mstring.doubleValue
                answerData = firstanswerData
                
                
                print("firstanswerタップ後\(answerData)")
                
                mainAnswerLabelHozaon = firstAnswer.text!
                syokinyuryokuSW = 1
                
                calcLabel.text = "○"
                
                //                mainAnswerLabelHozaon = "0"
                //                answerData = 0.0
                //                calcLabel.text = ""
                
                clearSW = 0
                
                
                
            }
        }
    }
    
    
    
    



}

