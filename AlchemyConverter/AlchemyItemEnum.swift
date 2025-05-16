//
//  AlchemyItemEnum.swift
//  AlchemyConverter
//
//  Created by masume çetin on 13.05.2025.
//

import SwiftUI
import Foundation

enum AlchemyItem : String, CaseIterable , Identifiable , Codable{
    var id: AlchemyItem {
        self
    }
    case uselessRock
    case finger
    case silverCoin
    case unpaidBills
    case goldCoin
    case diary
    case pileOfSalt
    case wine
    case pileOfSand
    case knife
    case bunny
    case azoth
    case algebraBook
    case oil
    case moonLight
    case exTear
    case water
    case secrets
    case catWhisker
    case spirit
    case essence
    case humanBody
    case moonLightPotion
    case bookOfWisdom
    case dropOfLife
    case creature
    case exBoyfriend
    case boyfriend
    case philosopherStone

    var image : ImageResource{
        switch self {
        case .diary : .diary
        case .moonLight : .moonLight
        case .uselessRock : .uselessRock
        case .unpaidBills : .unpaidBills
        case .knife : .knife
        case .exBoyfriend: .exBoyfriend
        case .algebraBook : .algebra
        case .dropOfLife : .drop
        case .moonLightPotion : .moonLightPotion
        case .silverCoin : .silverCoin
        case .bunny : .bunny
        case .goldCoin : .goldCoin
        case .pileOfSalt : .pileOfSalt
        case .wine : .wine
        case .pileOfSand : .pileOfSand
            case .azoth : .azoth
        case .finger : .staceysFingers
            case .oil : .oil
        case.catWhisker : .catWhisker
        case .exTear : .exCrushTortureTear
        case .water : .water
        case .secrets : .secrets
        case .bookOfWisdom : .bookOfWisdom
        case .spirit : .spirit
        case .essence : .essenceOfSpirit
        case .humanBody : .humanBody
        case .creature : .creature
        case .boyfriend : .boyfriend
        case .philosopherStone : .philosopherStone
            
        }
    }
    var name : String{
        switch self{
        case .diary : "Book Of The Dead"
case .uselessRock : "Useless Rock"
        case .exBoyfriend : "Ex Boyfriend"
        case .moonLight : "Captured Moon Light"
        case .silverCoin : "Silver Coin"
        case .dropOfLife  : "Drop Of Life"
        case .knife : "Knife"
        case .finger : "Staceys's Fingers"
        case .goldCoin : "Gold Coin"
        case .algebraBook : "Algebra 101"
        case .moonLightPotion : "Moon Light Potion"
            case .unpaidBills : "Unpaid Bills"
        case .pileOfSalt : "Pile of Salt"
        case .pileOfSand : "Pile of Sand"
        case .bunny : "Bunny"
        case .essence : "Essence"
        case .azoth : "Azoth"
        case .oil : "Oil"
            case .wine : "Wine"
        case .bookOfWisdom : "Book Of Wisdom"
        case .water : "Water"
        case .secrets : "Box Of Secrets"
        case .exTear : "Ex Crush's Torture Tear "
            case .spirit : "Spirit"
            case .humanBody : "Human Body"
            case .creature : "Creature"
            case .boyfriend : "Boyfriend"
        case .catWhisker : "Cat Whisker"
            case .philosopherStone : "Philosopher Stone"
        
        }
    }
    var defaultQuantity: Int {
        switch self {
        case .diary: return 1
        case .uselessRock: return 10
        case .silverCoin: return 3
        case .goldCoin: return 1
        case .moonLight: return 50
        case .pileOfSalt: return 5
        case .water: return 5
        case .algebraBook : return 5
        case .finger : return 10
        case .dropOfLife : return 0
        case .bunny : return 1
        case .knife : return 100
        case .unpaidBills : return 100
        case .catWhisker : return 3
        case .exTear : return 10
        case .moonLightPotion : return 1
        case .azoth : return 3
        case .pileOfSand : return 30
        case .essence : return 0
        case .secrets : return 1
        case .exBoyfriend : return 0
        case .bookOfWisdom : return 0
        case .oil : return 10
        case .wine : return 5
        case .spirit, .humanBody, .creature, .boyfriend, .philosopherStone:
            return 0
        }
    }
    var rarity: Rarity {
        switch self {
        case .boyfriend, .philosopherStone:
            return .epic
        case .azoth, .bunny, .spirit, .humanBody, .moonLightPotion, .catWhisker, .exTear , .essence , .bookOfWisdom , .dropOfLife:
            return .rare
        case .finger, .goldCoin, .silverCoin, .oil, .wine, .pileOfSalt , .algebraBook, .secrets , .exBoyfriend , .knife,.moonLight:
            return .common
        default:
            return .junk
        }
    }

}
extension AlchemyItem {
    static var allFormulas: [AlchemyFormula] {
        return [
            AlchemyFormula(
                ingredients: [.pileOfSalt, .water,.oil],
                result: .azoth,
                baseChance: 0.3,
                luckModifiers: [.oil: 0.05]
            ),
            AlchemyFormula(
                ingredients: [.pileOfSalt, .water,.oil,.goldCoin],
                result: .azoth,
                baseChance: 0.3,
                luckModifiers: [.oil: 0.05,.goldCoin:0.2]
            ),
            AlchemyFormula(
                ingredients: [.uselessRock, .water,.oil,.silverCoin],
                result: .goldCoin,
                baseChance: 0.3,
                luckModifiers: [.oil: 0.1 , .silverCoin:0.2]
            ),
            AlchemyFormula(
                ingredients: [.uselessRock, .exTear,.oil],
                result: .goldCoin,
                baseChance: 0.3,
                luckModifiers: [.oil: 0.1 ]
            ),
            AlchemyFormula(
                ingredients: [.uselessRock,.water,.oil],
                result: .silverCoin,
                baseChance: 0.3,
                luckModifiers: [.oil: 0.1]
            ),
            AlchemyFormula(
                ingredients: [.uselessRock,.water,.oil,.pileOfSalt],
                result: .silverCoin,
                baseChance: 0.3,
                luckModifiers: [.oil: 0.1 , .pileOfSalt : 0.1]
            ),
            AlchemyFormula(
                ingredients: [.goldCoin, .moonLightPotion,.dropOfLife,.azoth],
                result: .philosopherStone,
                baseChance: 0.3,
                luckModifiers: [.moonLightPotion: 0.1 , .dropOfLife : 0.3]
            ),
            AlchemyFormula(
                ingredients: [.goldCoin, .moonLightPotion,.silverCoin,.azoth],
                result: .philosopherStone,
                baseChance: 0.3,
                luckModifiers: [.moonLightPotion: 0.1]
            ),
            AlchemyFormula(
                ingredients: [.unpaidBills, .algebraBook,.secrets,.moonLightPotion],
                result: .bookOfWisdom,
                baseChance: 0.3,
                luckModifiers: [.secrets : 0.1,.moonLightPotion : 0.2]
            ),
            AlchemyFormula(
                ingredients: [.diary, .algebraBook,.secrets,.moonLightPotion],
                result: .bookOfWisdom,
                baseChance: 0.3,
                luckModifiers: [.secrets : 0.1,.moonLightPotion : 0.2,.diary : 0.2]
            ),
            AlchemyFormula(
                ingredients: [.unpaidBills, .algebraBook,.secrets],
                result: .bookOfWisdom,
                baseChance: 0.3,
                luckModifiers: [.secrets : 0.1]
            ),
            AlchemyFormula(
                ingredients: [.unpaidBills, .algebraBook,.secrets,.diary],
                result: .bookOfWisdom,
                baseChance: 0.3,
                luckModifiers: [.secrets : 0.1,.diary : 0.2]
            ),
            AlchemyFormula(
                ingredients: [.knife,.wine],
                result: .secrets,
                baseChance: 0.3,
                luckModifiers: [.knife : 0.1 , .wine : 0.1]
            ),
            AlchemyFormula(
                ingredients: [.knife,.wine,.unpaidBills],
                result: .secrets,
                baseChance: 0.3,
                luckModifiers: [.knife : 0.1 , .wine : 0.1 , .unpaidBills : 0.1]
            ),
            AlchemyFormula(
                ingredients: [.knife,.wine,.exBoyfriend],
                result: .dropOfLife,
                baseChance: 0.3,
                luckModifiers: [.exBoyfriend : 0.1]
            ),
            AlchemyFormula(
                ingredients: [.knife,.exBoyfriend],
                result: .exTear,
                baseChance: 0.3,
                luckModifiers: [.exBoyfriend : 0.1]
            ),
            AlchemyFormula(
                ingredients: [.knife,.wine,.exBoyfriend,.azoth],
                result: .dropOfLife,
                baseChance: 0.3,
                luckModifiers: [.exBoyfriend : 0.1 , .azoth : 0.1]
            ),
            AlchemyFormula(
                ingredients: [.water,.oil,.moonLight],
                result: .moonLightPotion,
                baseChance: 0.3,
                luckModifiers: [.oil : 0.1 , .water : 0.1]
            ),
            AlchemyFormula(
                ingredients: [.exTear,.water,.moonLight],
                result: .moonLightPotion,
                baseChance: 0.3,
                luckModifiers: [.exTear : 0.2 , .water : 0.1]
            ),
            AlchemyFormula(
                ingredients: [.exTear,.moonLight],
                result: .moonLightPotion,
                baseChance: 0.3,
                luckModifiers: [.exTear : 0.2 ]
            ),
            AlchemyFormula(
                ingredients: [.moonLightPotion,.azoth,.diary,.bunny],
                result: .essence,
                baseChance: 0.3,
                luckModifiers: [.bunny:0.2,.moonLightPotion:0.1,.azoth:0.1]
            ),
            AlchemyFormula(
                ingredients: [.moonLightPotion,.water,.diary,.bunny],
                result: .essence,
                baseChance: 0.3,
                luckModifiers: [.bunny:0.2,.moonLightPotion:0.1]
            ),
            AlchemyFormula(
                ingredients: [.moonLightPotion,.water,.diary,.pileOfSalt],
                result: .essence,
                baseChance: 0.3,
                luckModifiers: [.moonLightPotion:0.1,.azoth:0.1]
            ),
            AlchemyFormula(
                ingredients: [.moonLightPotion,.bookOfWisdom,.essence],
                result: .spirit,
                baseChance: 0.3,
                luckModifiers: [.moonLightPotion:0.1]
            ),
            AlchemyFormula(
                ingredients: [.moonLightPotion,.bookOfWisdom,.essence,.bunny],
                result: .spirit,
                baseChance: 0.3,
                luckModifiers: [.bunny:0.2,.moonLightPotion:0.1]
            ),
            AlchemyFormula(
                ingredients: [.moonLightPotion,.bookOfWisdom,.essence],
                result: .spirit,
                baseChance: 0.3,
                luckModifiers: [.bunny:0.2,.moonLightPotion:0.1]
            ),
            AlchemyFormula(
                ingredients: [.uselessRock, .water,.oil , .pileOfSalt],
                result: .philosopherStone,
                baseChance: 0.01,
                luckModifiers: [.oil : 0.001]
            ),
            AlchemyFormula(
                ingredients: [.uselessRock, .oil, .spirit , .exTear],
                result: .creature,
                baseChance: 0.5,
                luckModifiers: [.spirit: 0.2, .oil: 0.05]
            ),
            AlchemyFormula(
                ingredients: [.humanBody, .spirit, .philosopherStone, .catWhisker],
                result: .boyfriend,
                baseChance: 0.1,
                luckModifiers: [.spirit: 0.2,.philosopherStone: 0.3, .catWhisker: 0.5]
            ),
            AlchemyFormula(
                ingredients: [.humanBody, .spirit, .philosopherStone, .finger],
                result: .creature,
                baseChance: 0.6,
                luckModifiers: [.philosopherStone: 0.3]
            ),
            AlchemyFormula(
                ingredients: [.finger, .spirit, .dropOfLife],
                result: .creature,
                baseChance: 0.6,
                luckModifiers: [.spirit:0.1,.dropOfLife:0.1]
            ),
            AlchemyFormula(
                ingredients: [.creature,.moonLightPotion],
                result: .bunny,
                baseChance: 0.6,
                luckModifiers: [.moonLightPotion : 0.2]
            ),
            AlchemyFormula(
                ingredients: [.creature,.essence],
                result: .bunny,
                baseChance: 0.6,
                luckModifiers: [.essence : 0.1]
            )
        ]
    }
}
