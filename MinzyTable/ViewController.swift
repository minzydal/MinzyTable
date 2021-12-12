//
//  ViewController.swift
//  MinzyTable
//
//  Created by MINJI KIM on 2021/12/04.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    var newsData : Array<Dictionary <String, Any>>?
    
    //1, 뉴스 http 통신 방법 - urlsession
    //2. 뉴스 정보 JSON 데이터 형태 {"돈":"10000"} {["100", "1000", "10000"]}
    //3. 테이블 뷰의 데이터 매칭
    
    //500회
    func getNews(){
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=4a03a9ab163f480786b1c64cbac822cb")!) { (data, response, error) in
            
            if let dataJson = data {
            
                //JSON으로 변환(파싱)
                do{
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary <String, Any>
                    
                    //Dictionary
                    let articles = json["articles"] as! Array<Dictionary <String, Any>>
                    self.newsData = articles
                    
                    DispatchQueue.main.async {
                        self.TableViewMain.reloadData()
                    }
                    
                   
                }
                catch {}
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //데이터 몇개 -> 숫자
        if let news = newsData {
            return news.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 데이터 무엇 -> 반복 10번?
        // 방법 2가지
        // 1. 임의의 셀을 만든다.
        // 2. 스토리보드 + id
        //let cell  = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        let cell  = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        cell.LabelText.text = "\(indexPath.row)"
        //as? as! - 부모 자식 친자확인

        let idx = indexPath.row
        if let news = newsData {
            let row = news[idx]
            if let r = row as? Dictionary <String,Any> {
                if let title = r["title"] as? String {
                    cell.LabelText.text = title
                }
            }
        }
        return cell
    }
    
    //옵션 - 클릭 감지
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("CLICK !!! \(indexPath.row)")
    }
    
    // 1. 디테일 (상세) 화면 감지
    // 2. 값을 보내기 2가지
    // 1) tableview delegate // 2) storyboard (segue)
    // 3. 화면 이동 (이동하기 전에 값을 미리 세팅해야한다!!!)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        getNews()
    }
    
    //tableview 테이블로 된 뷰 - 여러개의 행이 모여있는 목록(화면)
    //tableview 사용 이유? 정갈하게 보이기 위해 ex) 전화번호부
    
    //1. 테이블에 사용되는 데이터가 무엇인지? - 전화번호부 목록
    //2. 그 데이터가 몇개인지- 100, 1000, 10000...
    //3. optional) 데이터 행을 누름 - 클릭
    
    }
    
