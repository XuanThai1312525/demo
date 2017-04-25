//
//  NhaHang.swift
//  GK_NhaHang
//
//  Created by haiconga on 4/24/17.
//  Copyright © 2017 haiconga. All rights reserved.
//

import Foundation
import SQLite
class BanAn {
    var db: Connection? = nil
    // ================================== //
    let ban_an = Table("BANAN")
    let ma_ban = Expression<Int64>("MABAN")
    let ma_khu_vuc = Expression<Int64>("MAKHUVUC")
    let hinh_anh = Expression<String?>("HINHANH")
    let stt_ban = Expression<String>("STTBAN")
    
    
    internal func connection(){
        do {
            let path = NSSearchPathForDirectoriesInDomains(
                .applicationSupportDirectory, .userDomainMask, true
                ).first! + Bundle.main.bundleIdentifier!
            db = try Connection("\(path)/db.sqlite3")
        } catch {
            
        }
    }
    
    internal func createBanAnDB(){
        
        do {
            if !tableExists(tableName: "BANAN"){
                try db?.run(ban_an.create { t in
                    t.column(ma_ban, primaryKey: true)
                    t.column(ma_khu_vuc)
                    t.column(stt_ban)
                })
            } else {
                return
            }
        } catch {
            
        }
        
    }
    
    func insert(maBan: Int64, maKhuVuc: Int64, sttBan: String){
        
        if let db = db {
            do {
                let insert = ban_an.insert(ma_ban <- maBan, ma_khu_vuc <- maKhuVuc, stt_ban <- sttBan)
//                let insert1 = ban_an.insert(or: .ignore , <#T##values: Setter...##Setter#>)
                
                try db.run(insert)
            } catch {
                print(error)
            }
        }
    }
    
    func select() {
        if let db = db {
            do {
                for ban in try db.prepare(ban_an) {
                    print("ma ban: \(ban[ma_ban]), name: \(ban[ma_khu_vuc]), email: \(ban[stt_ban])")
                }
            } catch {
                print(error)
            }
        }
    }
    
    func tableExists(tableName: String) -> Bool {
        do {
            let count:Int64 = try db!.scalar(
                "SELECT EXISTS(SELECT name FROM sqlite_master WHERE name = ?)", tableName
                ) as! Int64
            if count>0{
                return true
            }
            else{
                return false
            }
            
        } catch{
            
        }
        return false
    }
    
}

