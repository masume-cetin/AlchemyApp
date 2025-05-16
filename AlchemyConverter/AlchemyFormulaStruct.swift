//
//  AlchemyFormulaEnum.swift
//  AlchemyConverter
//
//  Created by masume çetin on 13.05.2025.
//

struct AlchemyFormula {
    let ingredients: [AlchemyItem]
    let result: AlchemyItem
    let baseChance: Double // base chance like 0.5 for 50%
    let luckModifiers: [AlchemyItem: Double] // individual item chance boosts
}
struct AlchemyResult {
    let success: Bool
    let result: AlchemyItem?
    let chance: Double
}

func tryCrafting(with ingredients: [AlchemyItem]) -> AlchemyResult {
    // Normalize: ignore order
    let inputSet = Set(ingredients)

    for formula in AlchemyItem.allFormulas {
        let formulaSet = Set(formula.ingredients)
        if formulaSet == inputSet {
            var totalChance = formula.baseChance
            for item in ingredients {
                totalChance += formula.luckModifiers[item] ?? 0
            }
            totalChance = min(totalChance, 1.0) // cap at 100%
            let success = Double.random(in: 0...1) < totalChance
            let fallback = randomRareDrop()
            return AlchemyResult(success: success, result: success ? formula.result : fallback, chance: totalChance)

        }
    }

    return AlchemyResult(success: false, result: nil, chance: 0.0)
}

func randomRareDrop(excluding: Set<AlchemyItem> = [.boyfriend]) -> AlchemyItem? {
    let itemPool = AlchemyItem.allCases.filter { !excluding.contains($0) }

    // Assign chances by rarity
    let chances: [(AlchemyItem, Double)] = itemPool.map { item in
        let chance: Double
        switch item.rarity {
        case .epic: chance = 0.001      // Ultra rare
        case .rare: chance = 0.01       // Rare
        case .common: chance = 0.05     // Occasionally dropped
        case .junk: chance = 0.2        // Most likely fallback
        }
        return (item, chance)
    }

    // Create weighted list
    let weighted = chances.flatMap { item, weight in
        Array(repeating: item, count: Int(weight * 100_000)) // resolution scale
    }

    return weighted.randomElement()
}

