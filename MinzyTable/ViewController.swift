//
//  ViewController.swift
//  MinzyTable
//
//  Created by MINJI KIM on 2021/12/04.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //데이터 몇개 -> 숫자
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 데이터 무엇 -> 반복 10번?
        // 방법 2가지
        // 1. 임의의 셀을 만든다.
        let cell  = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
    }
    
    //tableview 테이블로 된 뷰 - 여러개의 행이 모여있는 목록(화면)
    //tableview 사용 이유? 정갈하게 보이기 위해 ex) 전화번호부
    
    //1. 테이블에 사용되는 데이터가 무엇인지? - 전화번호부 목록
    //2. 그 데이터가 몇개인지- 100, 1000, 10000...
    //3. optional) 데이터 행을 누름 - 클릭
    
}

