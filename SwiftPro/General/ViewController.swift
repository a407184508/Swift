//
//  ViewController.swift
//  SwiftPro
//
//  Created by Chuck on 2021/4/6.
//

import UIKit
import Then
import SQLite

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        
        let view = UIView()
        
        view.then {
            $0.isUserInteractionEnabled = true
        }.then {
            $0.isEqual(UIView.self)
        }.backgroundColor = .red
        
        view.do {
            $0.isUserInteractionEnabled = true
        }
    }
    
    
    let db = try! Connection("path/to/db.sqlite3", readonly: true)
    let users = Table("t_user")
    let id = Expression<Int64>("id")
    let name = Expression<String?>("name")
    let email = Expression<String>("email")
    
    
    @IBAction func createTable() {
        _ = try? db.run(users.create(block: { t in
            t.column(id, primaryKey: true)
            t.column(name)
            t.column(email, unique: true)
        }))
    }

    @IBAction func add() {
        let insert = users.insert(name <- "张三", email <- "407184508@qq.com")
        _ = try? db.run(insert)
    }
    
    @IBAction func remove() {
        let zhangsan = users.filter(id == 1)
        _ = try? db.run(zhangsan.delete())
    }
    
    @IBAction func update() {
        let zhangsan = users.filter(id == 1)
        _ = try? db.run(zhangsan.update(name <- "李四"))
    }
    
    @IBAction func select() {
        print(users.count)
        for user in try! db.prepare(users) {
            print(user)
        }
    }
}

