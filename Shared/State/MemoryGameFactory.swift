//
//  MemoryGameFactory.swift
//  MemoryGame (iOS)
//
//  Created by michael gunnulfsen on 13/03/2022.
//

import Foundation

func createFuenteAlemo() -> [MemoryGame.MemoryGamePage] {
    let pages = [
        MemoryGame.MemoryGamePage(items: [
            MemoryGame.Card(id: 111, title: "Balansere", thumbnailImage: "balansere", videoPath: "balansere"),
            MemoryGame.Card(id: 112, title: "Busk", thumbnailImage: "busk", videoPath: "busk"),
            MemoryGame.Card(id: 113, title: "Huske", thumbnailImage: "huske", videoPath: "huske"),
            MemoryGame.Card(id: 114, title: "Skli", thumbnailImage: "skli", videoPath: "skli"),
            MemoryGame.Card(id: 115, title: "Tre", thumbnailImage: "tre", videoPath: "tre"),
            MemoryGame.Card(id: 117, title: "Trene", thumbnailImage: "trene", videoPath: "trene"),
            MemoryGame.Card(id: 118, title: "Vann", thumbnailImage: "vann", videoPath: "vann"),
            MemoryGame.Card(id: 120, title: "Sko", thumbnailImage: "sko", videoPath: "sko"),
            MemoryGame.Card(id: 119, title: "Vaske", thumbnailImage: "vaske", videoPath: "vaske"),
        ], title: "1"),
        
        MemoryGame.MemoryGamePage(items: [
            MemoryGame.Card(id: 1, title: "Ball", thumbnailImage: "ball", videoPath: "ball"),
            MemoryGame.Card(id: 2, title: "Blå", thumbnailImage: "blå", videoPath: "blå"),
            MemoryGame.Card(id: 3, title: "Fly", thumbnailImage: "fly", videoPath: "fly"),
            MemoryGame.Card(id: 4, title: "Grønn", thumbnailImage: "grønn", videoPath: "grønn"),
            MemoryGame.Card(id: 5, title: "Gul", thumbnailImage: "gul", videoPath: "gul"),
            MemoryGame.Card(id: 6, title: "Hoppe", thumbnailImage: "hoppe", videoPath: "hoppe"),
            MemoryGame.Card(id: 7, title: "Kumlokk", thumbnailImage: "kumlokk", videoPath: "kumlokk"),
            MemoryGame.Card(id: 8, title: "Mamma sove", thumbnailImage: "mamma-sove", videoPath: "mamma-sove"),
            MemoryGame.Card(id: 11, title: "Varme maten", thumbnailImage: "varme-maten", videoPath: "varme-maten")
        ], title: "2"),
        
        MemoryGame.MemoryGamePage(items: [
            
            MemoryGame.Card(id: 112, title: "Oma", thumbnailImage: "oma", videoPath: "oma"),
            MemoryGame.Card(id: 113, title: "Opa", thumbnailImage: "opa", videoPath: "opa"),
            MemoryGame.Card(id: 114, title: "Sand", thumbnailImage: "sand", videoPath: "sand"),
            MemoryGame.Card(id: 115, title: "Sitte", thumbnailImage: "sitte", videoPath: "sitte"),
            MemoryGame.Card(id: 116, title: "Snurre", thumbnailImage: "snurre", videoPath: "snurre"),
            MemoryGame.Card(id: 117, title: "Snyte seg", thumbnailImage: "snyte-seg", videoPath: "snyte-seg"),
            MemoryGame.Card(id: 118, title: "Sove", thumbnailImage: "sove", videoPath: "sove"),
            MemoryGame.Card(id: 119, title: "Stein", thumbnailImage: "stein", videoPath: "stein"),
            MemoryGame.Card(id: 111, title: "Trøtt", thumbnailImage: "trøtt", videoPath: "trøtt"),
            
        ], title: "3")
    ]
    
    return pages
}
