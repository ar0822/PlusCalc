//
//  SecondViewController.swift
//  PulsCal
//
//  Created by RAN on 2015/02/12.
//  Copyright (c) 2015年 nagae. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource,UITabBarDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        var myDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! UITableViewCell
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        let label = cell.viewWithTag(1) as! UILabel
        let label2 = cell.viewWithTag(2) as! UILabel
        let label3 = cell.viewWithTag(3) as! UILabel
        
        
        //リスト１とリスト２のデータのカウントが同じでないとエラーになるため、もし、リスト２が少ない場合は、空いている部分に”０”を設定るし、カウントを合わせる処理をする
        if answerListHyoujiYou1.count > answerListHyoujiYou2.count {
            
            let Dcount = answerListHyoujiYou1.count - answerListHyoujiYou2.count
            
            for _ in 1...Dcount {
                
                answerListHyoujiYou2.append("0")
            }
            
        } else if answerListHyoujiYou1.count < answerListHyoujiYou2.count {
            
            let Ccount = answerListHyoujiYou2.count - answerListHyoujiYou1.count
            
            for _ in 1...Ccount {
                
                answerListHyoujiYou1.append("0")
                
            }
            
        }
        
        //○×を入れる処理
        jadgment(count: answerListHyoujiYou1.count)
        
        
        label.text = answerListHyoujiYou1[indexPath.row]
        label2.text = answerListHyoujiYou2[indexPath.row]
        label3.text = jadgmentList[indexPath.row]
        
        return cell
        
    }
    
   
    
    
    

    

    @IBOutlet weak var tableView: UITableView!

    //比較して◯か×を入れるリスト
    var jadgmentList:[String] = []
    
    //タブを開くたびに表示用のテーブルにリストを保存して表示する処理をする。そうすれば、
    //計算中に何回でも答えをチェックすることが可能になる。
    var answerListHyoujiYou1:[String] = []
    var answerListHyoujiYou2:[String] = []
    
    //テーブルビューのセルの数を設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        var TableCount = 0
        
        //        var myDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //リストカウントが多い方をリターンする
        if answerListHyoujiYou1.count > answerListHyoujiYou2.count {
            
            TableCount = answerListHyoujiYou1.count
            
        }
        
        if answerListHyoujiYou1.count < answerListHyoujiYou2.count {
            
            TableCount = answerListHyoujiYou2.count
            
        }
        
        if answerListHyoujiYou1.count == answerListHyoujiYou2.count {
            
            TableCount = answerListHyoujiYou1.count
        }
        
        return TableCount
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //テーブルを初期化する処理
    
    
    override var prefersStatusBarHidden: Bool {
    
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {

//        self.tableView.reloadData()
        
        super.viewWillAppear(animated)
        //reloadData()をしないとテーブルの再表示に前回のデータが残ってしまうので下記の処理を行なう。reloadData()する場合、tableViewをアウトレット接続する必要がる

        jadgmentList = []
        answerListHyoujiYou1 = []
        answerListHyoujiYou2 = []
        
        let myDelegate = UIApplication.shared.delegate as! AppDelegate
        
        var Ar = 0
        
        for n in myDelegate.answerList1 {
            
            answerListHyoujiYou1.append(n)
            
            print(answerListHyoujiYou1[Ar])
            
            Ar+=1
            
        }
        
        Ar = 0
        
        for n in myDelegate.answerList2 {
            
            answerListHyoujiYou2.append(n)
            
            print(answerListHyoujiYou2[Ar])
            
            Ar+=1
        }

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //viewWillAppearをオーバーライドしているので読み込む
        self.tableView.reloadData()
        super.viewWillAppear(animated)


        
        }
        
    
    
    func jadgment(count:Int) {
        
//        var myDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let ct = count - 1
        
        for x in 0...ct {
            
            if answerListHyoujiYou1[x] == answerListHyoujiYou2[x] {
                
                jadgmentList.append("◯")
                
            } else {
                
                jadgmentList.append("×")
                
            }
            
        }
    }
    
}

