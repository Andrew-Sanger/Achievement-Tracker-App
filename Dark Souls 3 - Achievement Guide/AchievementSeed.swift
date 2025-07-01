//
// AchievementSeed
//
// iPhone Software Engineering - SP2 2016
// --------------------------------------
// Assignment 2
// Dark Souls 3 - Achievement Guide
//
// Created by Andrew Sanger on 21/08/2016.
// Copyright © 2016 Andrew Sanger. All rights reserved.
//

import Foundation

// WARNING: PLEASE DO NOT ALTER THIS CLASS
//
// This class contains all info which is to be put in CoreData. Ths class is
// only initiated once when the app is first started. After info has been
// places in CoreData it is never accessed again, unless requested.
//
// NOTE:
// I looked for hours trying to find the best way to do this, and this seemed
// like the best way. It took me DAYS to write out all this information.
// I severely miscalculated the sheer amount of info needed for this app to
// work. This is not hard coded info, but i could find no way to ensure info
// remained in CoreData when changing between simulation environments etc.
// Could also find no tutorials to help.
//
// I hope this is acceptable.
class AchievementSeed {
    private var achievementInfo: [AchievementSeed] = [AchievementSeed]()
    private var mastOfInfusionCollection: [ItemSeed] = [ItemSeed]()
    private var mastOfSorceriesCollection: [ItemSeed] = [ItemSeed]()
    private var mastOfPyromanciesCollection: [ItemSeed] = [ItemSeed]()
    private var mastOfMiraclesCollection: [ItemSeed] = [ItemSeed]()
    private var mastOfRingsCollection: [ItemSeed] = [ItemSeed]()
    private var mastOfExpressionCollection: [ItemSeed] = [ItemSeed]()
    
    // Struct to help with Achievement layout
    struct AchievementSeed {
        var number: Int16
        var name: String
        var score: Int16
        var description: String
        var guide: String
        var isCollection: Bool
        var isObtained: Bool
        var iconLocation: String
    }
    
    // Struct to help with Item layout
    struct ItemSeed {
        var belongsTo: Int16
        var name: String
        var description: String
        var location: String
        var acquiredFrom: String
        var guide: String
        var isCollected: Bool
        var iconLocation: String
    }
    
    init() {
        self.createAchievementInfo()
        self.createInfusionInfo()
        self.createSorceriesInfo()
        self.createPyromanciesInfo()
        self.createMiraclesInfo()
        self.createRingInfo()
        self.createExpressionInfo()
    }
    
    // Getters for all info.
    func getAchInfo() -> [AchievementSeed] {
        return self.achievementInfo
    }
    
    func getInfColl() -> [ItemSeed] {
        return self.mastOfInfusionCollection
    }
    
    func getSorColl() -> [ItemSeed] {
        return self.mastOfSorceriesCollection
    }
    
    func getPyrColl() -> [ItemSeed] {
        return self.mastOfPyromanciesCollection
    }
    
    func getMirColl() -> [ItemSeed] {
        return self.mastOfMiraclesCollection
    }
    
    func getRinColl() -> [ItemSeed] {
        return self.mastOfRingsCollection
    }
    
    func getExpColl() -> [ItemSeed] {
        return self.mastOfExpressionCollection
    }
    
    // The following functions contain all info to be created into CoreData.
    //
    // DO NOT ALTER ANYTHING BELOW THIS POINT.. please
    private func createAchievementInfo() {
        achievementInfo.append(AchievementSeed(number: 1, name: "The Dark Soul", score: 70,
            description: "Complete all achievements", guide: "Complete all other achievements in " +
            "the game to get this achievement.", isCollection: false, isObtained: false,
            iconLocation: "001_the_dark_soul"))
        achievementInfo.append(AchievementSeed(number: 2, name: "To Link the First Flame", score: 50,
            description: "Reach To Link the First Flame ending.", guide: "Finish the game, beat " +
            "the final boss, and interact with the bonfire that appears.", isCollection: false,
            isObtained: false, iconLocation: "002_to_link_the_first_flame"))
        achievementInfo.append(AchievementSeed(number: 3, name: "The End of Fire", score: 50,
            description: "Reach The End of Fire ending.", guide: "Go through the untended graves " +
            "to reach an alternate, dark version of Firelink Shrine. Go to where Irina of Carim would " +
            "usually be and break an illusory wall to obtain the Eyes of a Fire Keeper. \n\nGive this " +
            "item to the Firekeeper at normal Firelink Shrine. Once you defeat the final boss, do not " +
            "touch the bonfire, instead use the summon sign that appears, resulting in this ending.",
            isCollection: false, isObtained: false, iconLocation: "003_the_end_of_fire"))
        achievementInfo.append(AchievementSeed(number: 4, name: "The Usurpation of Fire", score: 50,
            description: "Reach The Usurpation of Fire ending.", guide: "First, talk to Yoel of Londor " +
            "to get him to relocate to Firelink. Then level up five times with him. Talk to Yuria in " +
            "Firelink, then Anri and Horus at the Halfway Keep bonfire. Defeat the Deacon of the Deep, " +
            "and then talk to Anri and Horus again. Talk to Anri again in the 3 places she is in at " +
            "the Catacombs. Drop down to where she is near the bridge and attack it to make it collapse, " +
            "then climb down, work your way through Smouldering Lake, and kill Horace. Talk to Anri again " +
            "about the Smouldering Lake, and then again at the Church of Yorshka bonfire. Defeat Pontiff " +
            "Sulyvhan, then talk to Yuria at Firelink again. Go to the Darkmoon tomb and talk to the pilgrim " +
            "to receive a quest related item. Interact with Anri on the altar. Talk to Yuria in Firelink " +
            "again. And finaly, proceed through the rest of the game, defeat the final boss, and interact " +
            "with the bonfire to get this achievement.", isCollection: false, isObtained: false,
            iconLocation: "004_the_usurpation_of_fire"))
        achievementInfo.append(AchievementSeed(number: 5, name: "Lords of Cinder: Abyss Watchers",
            score: 30, description: "Defeat the Abyss Watchers, Lords of Cinder.", guide: "Defeat the Abyss " +
            "Watchers, Lords of Cinder.", isCollection: false, isObtained: false,
            iconLocation: "005_lords_of_cinder_abyss_watchers"))
        achievementInfo.append(AchievementSeed(number: 6, name: "Lord of Cinder: Yhorm the Giant",
            score: 30, description: "Defeat Yhorm the Giant, Lord of Cinder.", guide: "Defeat Yhorm the Giant " +
            ", Lord of Cinder.", isCollection: false, isObtained: false,
            iconLocation: "006_lord_of_cinder_yhorm_the_giant"))
        achievementInfo.append(AchievementSeed(number: 7, name: "Lord of Cinder: Aldritch, Devourer of Gods",
            score: 30, description: "Defeat Aldritch, Devourer of Gods.", guide: "Defeat Aldritch, Devourer of " +
            "Gods.", isCollection: false, isObtained: false,
            iconLocation: "007_lord_of_cinder_aldritch_devourer_of_gods"))
        achievementInfo.append(AchievementSeed(number: 8, name: "Lord of Cinder: Lothric, Younger Prince",
            score: 30, description: "Defeat Lothric, Younger Prince, Lord of Cinder.", guide: "Defeat Lothric, " +
            " Younger Prince, Lord of Cinder.", isCollection: false, isObtained: false,
            iconLocation: "008_lord_of_cinder_lothric_younger_prince"))
        achievementInfo.append(AchievementSeed(number: 9, name: "Supreme Weapon Reinforcement", score: 30,
            description: "Reinforce any weapon to the highest level.", guide: "This achievement requires you " +
            "to get Blacksmith Andre to upgrade a weapon to +10. This requires 12 Titanite shards, 12 Large " +
            "Titanite Shards, 12 Titanite Chunks and 1 Titanite Slab.", isCollection: false, isObtained: false,
            iconLocation: "009_supreme_weapon_reinforcement"))
        achievementInfo.append(AchievementSeed(number: 10, name: "Master of Infusion", score: 30,
            description: "Perform all forms of infusion.", guide: "This requires you to infuse weapons with " +
            "all 15 different infusion gems.", isCollection: true, isObtained: false,
            iconLocation: "010_master_of_infusion"))
        achievementInfo.append(AchievementSeed(number: 11, name: "Master of Sorceries", score: 30,
            description: "Acquire all sorceries.", guide: "There are 34 Sorceries in the game, most can be " +
            "bought from vendors, some can be found in different locations, some are traded and one is a " +
            "covenant reward.", isCollection: true, isObtained: false,
            iconLocation: "011_master_of_sorceries"))
        achievementInfo.append(AchievementSeed(number: 12, name: "Master of Pyromancies", score: 30,
            description: "Acquire all pyromancies.", guide: "There are 27 Pyromancies in the game, most can be " +
            "bought from vendors, some can be found in different locations, some are traded and one is a " +
            "covenant reward.", isCollection: true, isObtained: false,
            iconLocation: "012_master_of_pyromancies"))
        achievementInfo.append(AchievementSeed(number: 13, name: "Master of Miracles", score: 30,
            description: "Acquire all miracles.", guide: "There are 35 Miracles in the game, most can be " +
            "bought from vendors, some can be found in different locations, some are traded and three are " +
            "covenant rewards.", isCollection: true, isObtained: false,
            iconLocation: "013_master_of_miracles"))
        achievementInfo.append(AchievementSeed(number: 14, name: "Master of Rings", score: 30,
            description: "Acquire all rings.", guide: "This requires you to collect all 107 rings. " +
            "There are 70 basic rings, and the rest are +1, +2 and +3 versions.", isCollection: true,
            isObtained: false, iconLocation: "014_master_of_rings"))
        achievementInfo.append(AchievementSeed(number: 15, name: "Master of Expression", score: 30,
            description: "Learn all gestures.", guide: "There are 33 gestures in the game, you start with " +
            "7 and must find the other 26.", isCollection: true, isObtained: false,
            iconLocation: "015_master_of_expression"))
        achievementInfo.append(AchievementSeed(number: 16, name: "Ultimate Bonfire", score: 30,
            description: "Reinforce a bonfire to the highest level.", guide: "To get this achievement, " +
            "you must upgrade the Firelink Shrine bonfire 10 times using Undead Bone Shards.", isCollection: false,
            isObtained: false, iconLocation: "016_ultimate_bonfire"))
        achievementInfo.append(AchievementSeed(number: 17, name: "Ultimate Estus", score: 30,
            description: "Reinforce the Estus Flask to the highest level.", guide: "To get this achievement, " +
            "you must get Andre the Blacksmith to upgrade your Estus flask 11 times using Estus Shards.",
            isCollection: false, isObtained: false, iconLocation: "017_ultimate_estus"))
        achievementInfo.append(AchievementSeed(number: 18, name: "Covenant: Warriors of Sunlight",
            score: 15, description: "Discover Warrior of Sunlight covenant.", guide: "This covenant is discovered " +
            "in the Undead Settlement. From the bonfire, go through the building until you are outside near a " +
            "burning tree. near this tree is a building. Enter the building, drop through the floor, and examine " +
            "the table to discover this covenant.", isCollection: false, isObtained: false,
            iconLocation: "018_covenant_warrior_of_sunlight"))
        achievementInfo.append(AchievementSeed(number: 19, name: "Covenant: Way of Blue", score: 15,
            description: "Discover Way of Blue covenant.", guide: "The Way of Blue covenant is located in the " +
            "High Wall of Lothric area. Find the church up the stairs from the boss room, talk to Emma 2-3 " +
            "times and she will give you the covenant item.", isCollection: false, isObtained: false,
            iconLocation: "019_covenant_way_of_blue"))
        achievementInfo.append(AchievementSeed(number: 20, name: "Covenant: Blue Sentinels", score: 15,
            description: "Discover Blue Sentinels covenant.", guide: "Near the Halfway Fortress bonfire " +
            "you will find Anri and Horace. Talk to them both to discover this covenant.", isCollection: false,
            isObtained: false, iconLocation: "020_covenant_blue_sentinels"))
        achievementInfo.append(AchievementSeed(number: 21, name: "Covenant: Blade of Darkmoon", score: 15,
            description: "Discover Blade of the Darkmoon covenant.", guide: "To discover this covenant you must " +
            "talk to Company Captain Yorshka in Anor Londo.", isCollection: false, isObtained: false,
            iconLocation: "021_covenant_blade_of_the_darkmoon"))
        achievementInfo.append(AchievementSeed(number: 22, name: "Covenant: Rosaria's Fingers", score: 15,
            description: "Discover Rosarias Fingers covenant.", guide: "This covenant is found in the Cathedral " +
            "of the Deep. Talk to Rosaria to discover it.", isCollection: false, isObtained: false,
            iconLocation: "022_covenant_rosarias_finger"))
        achievementInfo.append(AchievementSeed(number: 23, name: "Covenant: Mound-makers", score: 15,
            description: "Discover Mound-Makers covenant.", guide: "This covenant can be discovered in the " +
            "Undead Settlement. Talk to Holy Knight Hodrick to discover it.", isCollection: false,
            isObtained: false, iconLocation: "023_covenant_mound_makers"))
        achievementInfo.append(AchievementSeed(number: 24, name: "Covenant: Watchdogs of Farron",
            score: 15, description: "Discover Watchdogs of Farron covenant.", guide: "In Farron Keep, talk " +
            "to the Old Wolf of Farron to discover this covenant.", isCollection: false, isObtained: false,
            iconLocation: "024_covenant_watchdogs_of_farrom"))
        achievementInfo.append(AchievementSeed(number: 25, name: "Covenant: Aldritch Faithful",
            score: 15, description: "Discover Aldritch Faithful covenant.", guide: "This covenant is discovered " +
            "just before Anor Londo, you must interact with Archdeacon McDonnell to discover it.",
            isCollection: false, isObtained: false, iconLocation: "025_covenant_aldritch_faithful"))
        achievementInfo.append(AchievementSeed(number: 26, name: "Untended Graves", score: 15,
            description: "Reach the Untended Graves.", guide: "After defeating Ocerios, the Consumed King, " +
            "proceed to a dead-end room, there is an illusory wall. Attack it to open the way to the Untended " +
            "Graves", isCollection: false, isObtained: false, iconLocation: "026_untended_graves"))
        achievementInfo.append(AchievementSeed(number: 27, name: "Archdragon Peak", score: 15,
            description: "Reach Archdragon Peak.", guide: "To get to Archdragon Peak, defeat Oceiros and get " +
            "the Path of the Dragon gesture. Then go to Irithyll Dungeon, find the Dragon like creature " +
            "admiring the view, do the gesture to his left and you will be teleported.", isCollection: false,
            isObtained: false, iconLocation: "027_archdragon_peak"))
        achievementInfo.append(AchievementSeed(number: 28, name: "Iudex Gundyr", score: 15,
            description: "Defeat Iudex Gundyr.", guide: "Defeat Iudex Gundyr.", isCollection: false,
            isObtained: false, iconLocation: "028_iudex_gundry_trophy"))
        achievementInfo.append(AchievementSeed(number: 29, name: "Vordt of the Boreal Valley", score: 15,
            description: "Defeat Vordt of the Boreal Valley.", guide: "Defeat Vordt of the Boreal Valley.",
            isCollection: false, isObtained: false, iconLocation: "029_vordt_of_the_boreal_valley_trophy"))
        achievementInfo.append(AchievementSeed(number: 30, name: "Curse-rotted Greatwood", score: 15,
            description: "Defeat the Curse-rotted Greatwood.", guide: "Defeat the Curse-rotted Greatwood.",
            isCollection: false, isObtained: false, iconLocation: "030_curse-rotted_greatwood_trophy"))
        achievementInfo.append(AchievementSeed(number: 31, name: "Crystal Sage", score: 15,
            description: "Defeat Crystal Sage.", guide: "Defeat Crystal Sage.", isCollection: false,
            isObtained: false, iconLocation: "031_crystal_sage_trophy"))
        achievementInfo.append(AchievementSeed(number: 32, name: "Deacons of the Deep", score: 15,
            description: "Defeat the Deacons of the Deep.", guide: "Defeat the Deacons of the Deep.",
            isCollection: false, isObtained: false, iconLocation: "032_deacons_of_the_deep_trophy"))
        achievementInfo.append(AchievementSeed(number: 33, name: "High Lord Wolnir", score: 15,
            description: "Defeat High Lord Wolnir.", guide: "Defeat High Lord Wolnir.",
            isCollection: false, isObtained: false, iconLocation: "033_high_lord_wolnir_trophy"))
        achievementInfo.append(AchievementSeed(number: 34, name: "Pontiff Sulyvahn", score: 15,
            description: "Defeat Pontiff Sulyvahn.", guide: "Defeat Pontiff Sulyvahn.",
            isCollection: false, isObtained: false, iconLocation: "034_pontiff_sulyvahn_trophy"))
        achievementInfo.append(AchievementSeed(number: 35, name: "Dancer of the Boreal Valley", score: 15,
            description: "Defeat Dancer of the Boreal Valley.", guide: "Defeat Dancer of the Boreal Valley.",
            isCollection: false, isObtained: false, iconLocation: "035_dancer_of_the_boreal_valley_trophy"))
        achievementInfo.append(AchievementSeed(number: 36, name: "Dragonslayer Armour", score: 15,
            description: "Defeat Dragonslayer Armour.", guide: "Defeat Dragonslayer Armour.",
            isCollection: false, isObtained: false, iconLocation: "036_dragonslayer_armour_trophy"))
        achievementInfo.append(AchievementSeed(number: 37, name: "Old Demon King", score: 15,
            description: "Defeat Old Demon King.", guide: "Defeat Old Demon King.", isCollection: false,
            isObtained: false, iconLocation: "037_old_demon_king_trophy"))
        achievementInfo.append(AchievementSeed(number: 38, name: "Oceiros, the Consumed King", score: 15,
            description: "Defeat Oceiros, the Consumed King.", guide: "Defeat Oceiros, the Consumed King.",
            isCollection: false, isObtained: false, iconLocation: "038_oceiros_the_consumed_king_trophy"))
        achievementInfo.append(AchievementSeed(number: 39, name: "Champion Gundyr", score: 15,
            description: "Defeat Champion Gundyr.", guide: "Defeat Champion Gundyr.", isCollection: false,
            isObtained: false, iconLocation: "039_champion_gundyr_trophy"))
        achievementInfo.append(AchievementSeed(number: 40, name: "Ancient Wyvern", score: 15,
            description: "Defeat Ancient Wyvern.", guide: "Defeat Ancient Wyvern.", isCollection: false,
            isObtained: false, iconLocation: "040_ancient_wyvern_trophy"))
        achievementInfo.append(AchievementSeed(number: 41, name: "The Nameless King", score: 15,
            description: "Defeat Nameless King.", guide: "Defeat Nameless King.", isCollection: false,
            isObtained: false, iconLocation: "041_the_nameless_king_trophy"))
        achievementInfo.append(AchievementSeed(number: 42, name: "Enkindle", score: 15,
            description: "Light a bonfire flame for the first time.", guide: "Light a bonfire.",
            isCollection: false, isObtained: false, iconLocation: "042_enkindle"))
        achievementInfo.append(AchievementSeed(number: 43, name: "Embrace the Flame", score: 15,
            description: "Become a Host of Embers for the first time.", guide: "This achievement will " +
            "be complete after you defeat the first boss.", isCollection: false, isObtained: false,
            iconLocation: "043_embrace_the_flame"))
    }
    
    private func createInfusionInfo() {
        let monDrop: String = "Dropped from monsters."
        
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Refined Infusion",
            description: "Balances Str/Dex Scaling, -Base Damage.", location: monDrop, acquiredFrom: monDrop,
            guide: "Infuse a weapon with a Refined Gem. Requires no Coal to infuse.", isCollected: false,
            iconLocation: "001_refined_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Raw Infusion",
            description: "Removes Scaling, +Base Damage.", location: monDrop, acquiredFrom: monDrop,
            guide: "Infuse a weapon with a Raw Gem. Requires no Coal to infuse.", isCollected: false,
            iconLocation: "002_raw_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Fire Infusion",
            description: "Removes Scaling, -Base Damage, +Fire Damage.", location: monDrop, acquiredFrom: monDrop,
            guide: "Infuse a weapon with a Fire Gem. Requires no Coal to infuse.", isCollected: false,
            iconLocation: "003_fire_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Heavy Infusion",
            description: "+Strength Scaling, -Base Damage.", location: monDrop, acquiredFrom: monDrop,
            guide: "Infuse a weapon with a Heavy Gem. Requires a Farron Coal to infuse.", isCollected: false,
            iconLocation: "004_heavy_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Sharp Infusion",
            description: "+Dexterity Scaling, -Base Damage.", location: monDrop, acquiredFrom: monDrop,
            guide: "Infuse a weapon with a Sharp Gem. Requires a Farron Coal to infuse.", isCollected: false,
            iconLocation: "005_sharp_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Poison Infusion",
            description: "-Base Damage, -Str/Dex Scaling, +Poison Damage.", location: monDrop, acquiredFrom: monDrop,
            guide: "Infuse a weapon with a Poison Gem. Requires a Farron Coal to infuse.", isCollected: false,
            iconLocation: "006_poison_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Crystal Infusion",
            description: "-Base Damage, -Str/Dex Scaling, +Magic Damage, +Intelligence Scaling.",
            location: monDrop, acquiredFrom: monDrop, guide: "Infuse a weapon with a Crystal Gem. Requires a " +
            "Sages Coal to infuse.", isCollected: false, iconLocation: "007_crystal_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Blessed Infusion",
            description: "-Base Damage, -Str/Dex Scaling, +Faith Scaling, +HP Recovery.", location: monDrop,
            acquiredFrom: monDrop, guide: "Infuse a weapon with a Blessed Gem. Requires a Sages Coal to infuse.",
            isCollected: false, iconLocation: "008_blessed_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Deep Infusion",
            description: "-Base Damage, Removes Scaling, +Dark Damage", location: monDrop, acquiredFrom: monDrop,
            guide: "Infuse a weapon with a Deep Gem. Requires a Sages Coal to infuse.", isCollected: false,
            iconLocation: "009_deep_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Dark Infusion",
            description: "-Base Damage, -Dex/Str Scaling, +Dark Damage, +Faith/Int Scaling", location: monDrop,
            acquiredFrom: monDrop, guide: "Infuse a weapon with a Dark Gem. Requires a Profane Coal to infuse.",
            isCollected: false, iconLocation: "010_dark_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Blood Infusion",
            description: "-Base Damage, -Str/Dex Scaling, +Bleed Damage.", location: monDrop, acquiredFrom: monDrop,
            guide: "Infuse a weapon with a Blood Gem. Requires a Profaned Coal to infuse.", isCollected: false,
            iconLocation: "011_blood_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Hollow Infusion",
            description: "-Base Damage, -Str/Dex Scaling, +Luck Scaling, +Luck stat when hollow.", location: monDrop,
            acquiredFrom: monDrop, guide: "Infuse a weapon with a Hollow Gem. Requires a Profaned Coal to infuse.",
            isCollected: false, iconLocation: "012_hollow_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Lightning Infusion",
            description: "-Base Damage, -Dex/Str Scaling, +Lightning Damage, +Faith Scaling.", location: monDrop,
            acquiredFrom: monDrop, guide: "Infuse a weapon with a Lightning Gem. Requires a Giants Coal to infuse.",
            isCollected: false, iconLocation: "013_lightning_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Simple Infusion",
            description: "-Base Damage, -Str/Dex Scaling, +Magic Damage, +FP Recovery.", location: monDrop,
            acquiredFrom: monDrop, guide: "Infuse a weapin with a Simple Gem. Requires a Giants Coal to infuse.",
            isCollected: false, iconLocation: "014_simple_gem-icon"))
        mastOfInfusionCollection.append(ItemSeed(belongsTo: 10, name: "Chaos Infusion",
            description: "-Base Damage, -Str/Dex Scaling, +Fire Damage, +Int/Faith Scaling", location: monDrop,
            acquiredFrom: monDrop, guide: "Infuse a weapon with a Chaos Gem. Requires a Giants Coal to infuse.",
            isCollected: false, iconLocation: "015chaos_gem-icon"))
    }
    
    private func createSorceriesInfo() {
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Soul Arrow",
            description: "Fires a soul arrow.", location: "", acquiredFrom: "Sold by Yoel of Londor for 1,000 " +
            "souls\nSold by Yuria of Londor for 1,000 souls\nSold by Orbeck of Vinheim for 1,000 souls",
            guide: "FP Cost: 7, Slots: 1, Int Req: 10", isCollected: false,
            iconLocation: "001_soul_arrow-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Great Soul Arrow",
            description: "Fires a more powerful soul arrow.", location: "", acquiredFrom: "Sold by Orbeck of " +
            "Vinheim for 3,000 souls", guide: "FP Cost: 10, Slots: 1, Int Req: 15", isCollected: false,
            iconLocation: "002_great_soul_arrow-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Heavy Soul Arrow",
            description: "Fires a heavy soul arrow.", location: "", acquiredFrom: "Sold by Yoel of Londor for " +
            "2,000 souls\nSold by Yuria of Londor for 2,000 souls\nSold by Orbeck of Vinheim for 2,000 souls",
            guide: "FP Cost: 11, Slots: 1, Int Req: 13", isCollected: false,
            iconLocation: "003_heavy_soul_arrow-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Great Heavy Soul Arrow",
            description: "Fires a more powerful heavy soul arrow.", location: "", acquiredFrom: "Sold by Orbeck " +
            "of Vinheim for 4,000 souls", guide: "FP Cost: 14, Slots: 1, Int Req: 18", isCollected: false,
            iconLocation: "004_great_heavy_soul_arrow-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Farron Dart",
            description: "Fires a soul dart.", location: "", acquiredFrom: "Sold by Yoel of Londor for 1,000 " +
            "souls\nSold by Orbeck of Vinheim for 500 souls", guide: "FP Cost: 3, Slots: 1, Int Req: 8",
            isCollected: false, iconLocation: "005_farron_dart-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Great Farron Dart",
            description: "Fires a more powerful soul dart.", location: "", acquiredFrom: "Sold by Orbeck of " +
            "Vinheim for 2,000 souls\nRequires Sage's Scroll", guide: "FP Cost: 4, Slots: 1, Int Req: 23",
            isCollected: false, iconLocation: "006_great_farron_dart-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Farron Hail",
            description: "Fires a cascade of soul darts.", location: "", acquiredFrom: "Sold by Orbeck of Vinheim " +
            "for 5,000 souls\nRequires Sage's Scroll", guide: "FP Cost: 4, Slots: 1, Int Req: 28",
            isCollected: false, iconLocation: "007_farron_hail-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Homing Soulmass",
            description: "Releases a homing soulmass.", location: "", acquiredFrom: "Sold by Orbeck of Vinheim for " +
            "6,000 souls\nRequire's Logan's Scroll", guide: "FP Cost: 20, Slots: 1, Int Req: 20", isCollected: false,
            iconLocation: "008_homing_soulmass-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Homing Crystal Soulmass",
            description: "Releases a homing crystal soulmass.", location: "", acquiredFrom: "Sold by Orbeck of " +
            "Vinheim for 18,000 souls\nRequires Crystal Scroll", guide: "FP Cost: 43, Slots: 1, Int Req: 30",
            isCollected: false, iconLocation: "009_homing_crystal_soulsmass-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Crystal Hail",
            description: "Casts a cascade of small crystal soulmasses from above.", location: "",
            acquiredFrom: "Obtained by Soul of a Crystal Sage Transposition", guide: "FP Cost: 19, Slots: 1, Int " +
            "Req: 18", isCollected: false, iconLocation: "010_crystal_hail-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Soul Spear",
            description: "Fires a soul spear.", location: "", acquiredFrom: "Sold by Orbeck of Vinheim for 5,000 " +
            "souls.\nRequires Logan's Scroll", guide: "FP Cost: 32, Slots: 1, Int Req: 32", isCollected: false,
            iconLocation: "011_soul_spear-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Crystal Soul Spear",
            description: "Fires a piercing crystal soul spear.", location: "", acquiredFrom: "Sold by Orbeck of " +
            "Vinheim for 15,000 souls\nRequires Crystal Scroll", guide: "FP Cost: 46, Slots: 1, Int Req: 48",
            isCollected: false, iconLocation: "012_crystal_soul_spear-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "White Dragon Breath",
            description: "Emits crystal breath of Seath the Scaleless.", location: "", acquiredFrom: "Obtained by " +
            "Soul of Consumed Oceiros Transposition", guide: "FP Cost: 25, Slots: 1, Int Req: 50",
            isCollected: false, iconLocation: "013_white_dragon_breath-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Soul Stream",
            description: "Fires a torrential volley of souls.", location: "", acquiredFrom: "Found in Lothric " +
            "Castle in the Grand Archive behind a hidden room with a Boreal Knight.", guide: "FP Cost: 55, " +
            "Slots: 2, Int Req: 45", isCollected: false, iconLocation: "014_soul_stream-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Soul Greatsword",
            description: "Attacks with a greatsword formed from souls.", location: "", acquiredFrom: "Sold by Yoel " +
            "of Londor for 5,000 souls\nSold by Yuria of Londor for 5,000 souls\nSold by Orbeck of Vinheim for " +
            "5,000 souls", guide: "FP Cost: 23, Slots: 1, Int Req: 22", isCollected: false,
            iconLocation: "015_soul_greatsword-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Farron Flashsword",
            description: "Alteration of Soul Greatsword developed by sorcerers of the Undead Legion of Farron.",
            location: "", acquiredFrom: "Sold by Orbeck Of Vinheim for 3,000 souls", guide: "FP Cost: 4, Slots: 1" +
            ", Int Req: 23", isCollected: false, iconLocation: "016_farron_flashsword-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Magic Weapon",
            description: "Reinforce right weapon with magic.", location: "", acquiredFrom: "Sold by Yoel of Londor " +
            "for 4,500 souls\nSold by Yuria of Londor for 4,500 souls\nSold by Orbeck of Vinheim for 3,000 souls",
            guide: "FP Cost: 25, Slots: 1, Int Req: 10", isCollected: false,
            iconLocation: "017_magic_weapon-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Great Magic Weapon",
            description: "Greatly reinforces right weapon with magic.", location: "", acquiredFrom: "From the " +
            "Farron Keep Perimeter bonfire, turn around 180 and head towards the shortcut gate to Road of " +
            "Sacrifices. The spell will be on a corpse at the gate.", guide: "FP Cost: 35, Slots: 1, Int Req:15",
            isCollected: false, iconLocation: "018_great_magic_weapon-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Crystal Magic Weapon",
            description: "Reinforces right weapon with crystal.", location: "", acquiredFrom: "Sold by Orbeck " +
            "of Vinheim for 10,000 souls\nRequires Crystal Scroll", guide: "FP Cost: 45: Slots: 1, Int Req: 30",
            isCollected: false, iconLocation: "019_crystal_magic_weapon-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Magic Shield",
            description: "Reinforces left shielf with magic.", location: "", acquiredFrom: "Sold by Yoel of " +
            "Londor for 4,500 souls\nSold by Yuria of Londor for 4,500 souls\nSold by Orbeck of Vinheim for " +
            "3,000 souls", guide: "FP Cost: 30, Slots: 1, Int Req: 10", isCollected: false,
            iconLocation: "020_magic_shield-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Great Magic Shield",
            description: "Greatly reinforce left shielf with magic.", location: "", acquiredFrom: "Found in " +
            "Irithyll Dungeon", guide: "FP Cost: 45, Slots: 1, Int Req: 18", isCollected: false,
            iconLocation: "021_great_magic_shield-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Spook",
            description: "Masks noise of the caster and prevents fall damage.", location: "",
            acquiredFrom: "Sold by Orbeck Of Vinheim for 2,000 souls", guide: "FP Cost: 15, Slots: 1, Int Req: 10",
            isCollected: false, iconLocation: "022_spook-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Aural Decoy",
            description: "Distracts foes with distant sound.", location: "", acquiredFrom: "Sold by Orbeck of " +
            "Vinheim for 2,000 souls", guide: "FP Cost: 15, Slots: 1, Int Req: 18", isCollected: false,
            iconLocation: "023_aural_decoy-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Pestilent Mercury",
            description: "Releases mercury that eats away at HP.", location: "", acquiredFrom: "Sold by Orbeck " +
            "Of Vinheim for 1,000 souls", guide: "FP Cost: 13, Slots: 1, Int Req: 30", isCollected: false,
            iconLocation: "024_pestilent_mercury-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Cast Light",
            description: "Cast a light to illuminate surroundings.", location: "", acquiredFrom: "Sold by Orbeck " +
            "Of Vinheim for 1,000 souls\nRequires Golden Scroll", guide: "FP Cost: 20, Slots: 1, Int Req: 15",
            isCollected: false, iconLocation: "025_cast_light-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Repair",
            description: "Repairs equipped weapons and armour.", location: "", acquiredFrom: "Sold by Orbeck " +
            "of Vinheim for 2,000 souls\nRequires Golden Scroll", guide: "FP Cost: 20, Slots: 1, Int Req: 15",
            isCollected: false, iconLocation: "026_repair-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Hidden Weapon",
            description: "Turns right weapon invisible.", location: "", acquiredFrom: "Sold by Orbeck of " +
            "Vinheim for 1,500 souls\nRequires Golden Scroll", guide: "FP Cost: 25, Slots: 1, Int Req: 12",
            isCollected: false, iconLocation: "027_hidden_weapon-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Hidden Body",
            description: "Turns body near invisile.", location: "", acquiredFrom: "Sold by Orbeck of Vinheim " +
            "for 3,000 souls\nRequires Golden Scroll", guide: "FP Cost: 15, Slots: 1, Int Req: 15",
            isCollected: false, iconLocation: "028_hidden_body-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Chameleon",
            description: "Transforms player into something inconspicuous.", location: "", acquiredFrom: "Found " +
            "at the Church of Yorshka bonfire in Irithyll of the Boreal Valley during Anri of Astora's " +
            "questline. The spell will drop from an assassin disguised as a statue.\nFound in Darkmoon Tomb " +
            "from Anri's corpse.", guide: "FP Cost: 20, Slots: 1, Int Req: 12", isCollected: false,
            iconLocation: "029_chameleon-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Twisted Wall of Light",
            description: "Distorts light in order to deflect magic.", location: "", acquiredFrom: "Sold by Orbeck " +
            "of Vinheim for 6,000 souls\nRequires Golden Scroll", guide: "FP Cost: 10, Slots: 1, Int Req: 27",
            isCollected: false, iconLocation: "030_twisted_wall_of_light-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Deep Soul",
            description: "Fires dark soul dregs.", location: "", acquiredFrom: "Obtained by Soul of Deacons " +
            "of the Deep Transposition", guide: "FP Cost: 6, Slots: 1, Int Req: 12", isCollected: false,
            iconLocation: "031_deep_soul-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Great Deep Soul",
            description: "Firest powerful darkened soul sediment.", location: "", acquiredFrom: "Reward for " +
            "reaching rank 1 in the covenant Aldrich Faithful.", guide: "FP Cost: 9, Slots: 1, Int Req: 20",
            isCollected: false, iconLocation: "032_great_deep_soul-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Affinity",
            description: "Casts a dark manifestation of humanity.", location: "", acquiredFrom: "Sold by Karla " +
            "for 15,000 souls", guide: "FP Cost: 40, Slots: 1, Int Req: 32", isCollected: false,
            iconLocation: "033_affinity-icon"))
        mastOfSorceriesCollection.append(ItemSeed(belongsTo: 11, name: "Dark Edge",
            description: "Strikes the blade formed of humanitys darkness.", location: "",
            acquiredFrom: "Sold by Karla for 8,000 souls", guide: "FP Cost: 26, Slots: 1, Int Req: 30",
            isCollected: false, iconLocation: "034_dark_edge-icon"))
    }
    
    private func createPyromanciesInfo() {
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Fireball",
            description: "Hurls a fireball.", location: "", acquiredFrom: "Pyromancer class starting spell\n" +
            "Purchased from Cornyx of the Great Swamp for 1000 souls", guide: "FP Cost: 10, Slots: 1, Int Req: " +
            "6, Faith Req: 6", isCollected: false, iconLocation: "001_fireball-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Fire Orb",
            description: "Hurls a giant fire orb.", location: "", acquiredFrom: "Purchased from Cornyx of the " +
            "Great Swamp for 3000 souls\nRequires Great Swamp Pyromancy Tome", guide: "FP Cost: 14, Slots: 1, " +
            "Int Req: 8, Faith Req: 8", isCollected: false, iconLocation: "002_fire_orb-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Bursting Fireball",
            description: "Hurls an exploding fireball.", location: "", acquiredFrom: "Purchased from Cornyx of " +
            "the Great Swamp for 5000 souls\nRequires Great Swamp Pyromancy Tome", guide: "FP Cost: 14, " +
            "Slots: 1, Int Req: 18, Faith Req: 12", isCollected: false, iconLocation: "003_bursting_fireball-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Great Chaos Fire Orb",
            description: "Hurls a great chaos fire orb.", location: "", acquiredFrom: "Purchased from Cornyx " +
            "of the Great Swamp for 10000 souls\nRequires Izalith Pyromancy Tome", guide: "FP Cost: 32, " +
            "Slots: 2, Int Req: 0, Faith Req: 0", isCollected: false, iconLocation: "004_great_chaos_fire_orb-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Chaos Bed Vestiges",
            description: "Hurls chaos flame that scorches vicinity.", location: "",
            acquiredFrom: "Transposed from Soul of the Old Demon King for 5000 souls", guide: "FP Cost: 35, " +
            "Slots: 2, Int Req: 20, Faith Req: 10", isCollected: false,
            iconLocation: "005_chaos_bed_vestiges-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Fire Surge",
            description: "Emits a constant stream of fire.", location: "", acquiredFrom: "Purchased from Cornyx " +
            "of the Great Swamp for 1000 souls", guide: "FP Cost: 2, Slots: 1, Int Req: 6, Faith Req: 0",
            isCollected: false, iconLocation: "006_fire_surge-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Fire Whip",
            description: "The caster manipulates the flames at will, making this an extremely difficult spell to " +
            "use", location: "", acquiredFrom: "Purchased from Karla for 10000 souls\nRequires Quelana Pyromancy " +
            "Tome", guide: "FP Cost: 2, Slots: 1, Int Req: 13, Faith Req: 8", isCollected: false,
            iconLocation: "007_fire_whip-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Firestorm",
            description: "Surrounds the caster with multiple pillars of flame.", location: "",
            acquiredFrom: "Purchased from Karla for 15000 souls\nRequires Quelana Pyromancy Tome",
            guide: "FP Cost: 2, Slots: 1, Int Req: 18, Faith Req: 0", isCollected: false,
            iconLocation: "008_fire_storm-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Chaos Storm",
            description: "Chaotic flame melts even great boulders, and creates a brief surge of molten lava " +
            "on impact.", location: "", acquiredFrom: "Purchased from Cornyx of the Great Swamp for 12000 souls\n" +
            "Requires Izalith Pyromancy Tome", guide: "FP Cost: 3, Slots: 2, Int Req: 0, Faith: 0",
            isCollected: false, iconLocation: "009_chaos_storm-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Great Combustion",
            description: "Creates a powerful, giant flame in hand.", location: "",
            acquiredFrom: "Purchased from Cornyx of the Great Swamp for 3000 souls", guide: "FP Cost: 17, " +
            "Slots: 1, Int Req: 10, Faith Req: 10", isCollected: false,
            iconLocation: "010_great_combustion-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Sacred Flame",
            description: "Flame burrows inside foes and ignites.", location: "", acquiredFrom: "Found within " +
            "the lava area of Smouldering Lake where you fight Knight Slayer Tsorig", guide: "FP Cost: 25, " +
            "Slots: 1, Int Req: 8, Faith Req: 8", isCollected: false,
            iconLocation: "011_sacred_flame-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Profaned Flame",
            description: "Engulfs foes at range and burns them to ashes.", location: "",
            acquiredFrom: "Found at the foot of the Giant in Irythyll Dungeon.", guide: "FP Cost: 30, " +
            "Slots: 1, Int Req: 25, Faith Req: 0", isCollected: false,
            iconLocation: "012_profaned_flame-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Poison Mist",
            description: "Creates a poison mist.", location: "", acquiredFrom: "Purchased from Cornyx of the " +
            "Great Swamp for 2000 souls\nRequires Great Swamp Pyromancy Tome", guide: "FP Cost: 18, " +
            "Slots: 1, Int Req: 0, Faith Req: 10", isCollected: false,
            iconLocation: "013_poison_mist-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Toxic Mist",
            description: "Creates an intense poison mist.", location: "", acquiredFrom: "Found on corpse in " +
            "lava area of the Smouldering Lake", guide: "FP Cost: 24, Slots: 1, Int Req: 0, Faith Req: 15",
            isCollected: false, iconLocation: "014_toxic_mist-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Acid Surge",
            description: "Emits an acid which corrodes weapons and armor.", location: "",
            acquiredFrom: "Purchased from Cornyx of the Great Swamp for 6000 souls\nRequires Carthus " +
            "Pyromancy Tome", guide: "FP Cost: 24, Slots: 1, Int Req: 0, Faith Req: 13", isCollected: false,
            iconLocation: "015_acid_surge-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Flash Sweat",
            description: "Intense sweating increases fire damage absorption.", location: "",
            acquiredFrom: "Purchased from Cornyx of the Great Swamp for 1500 souls", guide: "FP Cost: 20, " +
            "Slots: 1, Int Req: 6, Faith Req: 6", isCollected: false,
            iconLocation: "016_flash_sweat-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Profuse Sweat",
            description: "Profuse sweating temporarily boosts resistance to bleeding, poison, frost and curses.",
            location: "", acquiredFrom: "Purchased from Cornyx of the Great Swamp for 2000 souls\nRequires " +
            "Great Swamp Pyromancy Tome", guide: "FP Cost: 20, Slots: 1, Int Req: 6, Faith Req: 6",
            isCollected: false, iconLocation: "017_profuse_sweat-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Iron Flesh",
            description: "Iron flesh boosts damage absorption and resistance, but significantly increases weight.",
            location: "", acquiredFrom: "Found in the Farron Keep swamp", guide: "FP Cost: 40, Slots: 1, " +
            "Int Req: 8, Faith Req: 0", isCollected: false, iconLocation: "018_iron_flesh-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Power Within",
            description: "Temporarily boosts attack, but gradually lose HP.", location: "",
            acquiredFrom: "Found on a corpse behind a hidden wall in Grand Archives.", guide: "FP Cost: 30, " +
            "Slots: 1, Int Req: 10, Faith Req: 10", isCollected: false, iconLocation: "019_power_within-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Carthus Beacon",
            description: "Damage increases with consecutive attacks.", location: "",
            acquiredFrom: "Purchased from Cornyx of the Great Swamp for 8000 souls\nRequires Carthus Pyromancy " +
            "Tome", guide: "FP Cost: 35, Slots: 1, Int Req: 12, Faith Req: 12", isCollected: false,
            iconLocation: "020_carthus_beacon-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Carthus Flame Arc",
            description: "Reinforces right weapon with flame.", location: "",
            acquiredFrom: "Purchased from Cornyx of the Great Swamp for 10000 souls\nRequires Carthus Pyromancy " +
            "Tome", guide: "FP Cost: 30, Slots: 1, Int Req: 10, Faith Req: 10", isCollected: false,
            iconLocation: "021_carthus_flame_arc-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Warmth",
            description: "Creates a gentle, warm flame that heals those who touch it.", location: "",
            acquiredFrom: "Mound Makers Rank 2 reward", guide: "FP Cost: 50, Slots: 2, Int Req: 0, Faith Req: 25",
            isCollected: false, iconLocation: "022_warmth"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Rapport",
            description: "Charms the enemy, making them a temporary ally.", location: "",
            acquiredFrom: "Purchased from Karla for 7000 souls\nRequires Quelana Pyromancy Tome",
            guide: "FP Cost: 30, Slots: 1, Int Req: 15, Faith Req: 0", isCollected: false,
            iconLocation: "023_rapport-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Boulder Heave",
            description: "Spews a boulder from ones mouth.", location: "", acquiredFrom: "Soul of a Stray Demon",
            guide: "FP Cost: 17, Slots: 1, Int Req: 8, Faith Req: 12", isCollected: false,
            iconLocation: "024_boulder_heave-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Black Flame",
            description: "Creates a giant, black flame in hand.", location: "", acquiredFrom: "Purchased from " +
            "Karla for 10000 souls\nRequires Grave Warden Pyromancy Tome", guide: "FP Cost: 25, Slots: 1, " +
            "Int Req: 15, Faith Req: 15", isCollected: false, iconLocation: "025_black_flame-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Black Fire Orb",
            description: "Hurls a black fireball.", location: "", acquiredFrom: "Purchased from Karla for " +
            "10000 souls\nRequires Grave Warden Pyromancy Tome", guide: "FP Cost: 22, Slots: 1, Int Req: 20, " +
            "Faith Req: 20", isCollected: false, iconLocation: "026_black_fire_orb-icon"))
        mastOfPyromanciesCollection.append(ItemSeed(belongsTo: 12, name: "Black Serpent",
            description: "Releases undulating black glames that trace the ground.", location: "",
            acquiredFrom: "Soul of High Lord Wolnir", guide: "FP Cost: 19, Slots: 1, Int Req: 15, Faith Req: 15",
            isCollected: false, iconLocation: "027_black_serpent-icon"))
    }
    
    private func createMiraclesInfo() {
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Heal Aid",
            description: "Slightly restore HP", location: "", acquiredFrom: "Starting spell for Herald\n" +
            "Purchased from Shrine Handmaid for 500 souls", guide: "FP Cost: 27, Slots: 1, Faith Cost: 8",
            isCollected: false, iconLocation: "001_heal_aid-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Heal",
            description: "Restores HP for self and those in the vicinity.", location: "",
            acquiredFrom: "Starting spell for Cleric\nPurchased from Irina of Carim for 1000 souls",
            guide: "FP Cost: 45, Slots: 1, Faith Req: 12", isCollected: false,
            iconLocation: "002_heal-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Med Heal",
            description: "Restores moderate HP for self and those in the vicinity.", location: "",
            acquiredFrom: "Purchased from Irina of Carim for 3500 souls\nRequires Braille Divine Tome of Carim",
            guide: "FP Cost: 55, Slots: 1, Faith Req: 15", isCollected: false,
            iconLocation: "003_med_heal-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Great Heal",
            description: "Restores a large amount of HP for self and those in the vicinity.", location: "",
            acquiredFrom: "Found at corpse in the Irithyll of the Boreal Valley", guide: "FP Cost: 65, " +
            "Slots: 1, Faith Req: 25", isCollected: false, iconLocation: "004_great_heal-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Soothing Sunlight",
            description: "Restores a large amount of HP for self and those in the general area.", location: "",
            acquiredFrom: "Acquired by Soul of the Dancer Transposition", guide: "FP Cost: 80, Slots: 1, " +
            "Faith Req: 45", isCollected: false, iconLocation: "005_soothing_sunlight-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Replenishment",
            description: "Gradually restores HP.", location: "", acquiredFrom: "Purchased from Irina of Carim " +
            "for 1000 souls", guide: "FP Cost: 30, Slots: 1, Faith Req: 15", isCollected: false,
            iconLocation: "006_replenishment-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Bountiful Light",
            description: "Gradually restores a large amount of HP.", location: "",
            acquiredFrom: "Purchased from Irina of Carim for 5000 souls\nRequires Braille Divine Tome of Lothric",
            guide: "FP Cost: 45, Slots: 1, Faith Req: 25", isCollected: false,
            iconLocation: "007_bountiful_light-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Bountiful Sunlight",
            description: "Gradually restores a large amount of HP for self and those in the vicinity.",
            location: "", acquiredFrom: "Acquired by Soul of Rosaria Transposition", guide: "FP Cost 70, " +
            "Slots: 2, Faith Req: 35", isCollected: false, iconLocation: "008_bountiful_sunlight-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Caressing Tears",
            description: "Cures bleeding, poison and frost for self and those in the vicinity.", location: "",
            acquiredFrom: "Purchased from Irina of Carim for 1500 souls", guide: "FP Cost: 14, Slots: 1, " +
            "Faith Req: 12", isCollected: false, iconLocation: "009_caressing_tears-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Tears of Denial",
            description: "Grants one chance to endure when HP reaches 0.", location: "",
            acquiredFrom: "Purchased from Irina of Carim for 10000 souls\nRequires Braille Divine Tome " +
            "of Carim", guide: "FP Cost: 100, Slots: 2, Faith Req: 15", isCollected: false,
            iconLocation: "010_tears_of_denial-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Homeward",
            description: "Returns caster to the last bonfire used for resting, or to the bonfire in the shrine",
            location: "", acquiredFrom: "Purchased from Irina of Carim for 3000 souls", guide: "FP Cost: 30, " +
            "Slots: 1, Faith Req: 18", isCollected: false, iconLocation: "011_homeward-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Seek Guidance",
            description: "Displays more help from other worlds and reveals summon signs without using an ember.",
            location: "", acquiredFrom: "Looted from a corpse in Cathedral of the Deep. Just past the first giant " +
            "and down the stairs to the left. It's a sort of dark ish room above the Cathedral Knight with the mace",
            guide: "FP Cost: 15, Slots: 1, Faith Req: 12", isCollected: false,
            iconLocation: "012_seek_guidance-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Sacred Oath",
            description: "10 percent physical AR buff, 10 percent damage absorption buff for 60 seconds.",
            location: "", acquiredFrom: "Warriors of Sunlight Rank 1 reward", guide: "FP Cost: 65, Slots: 2, " +
            "Faith Req: 28", isCollected: false, iconLocation: "013_SacredOath"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Force",
            description: "Creates a shockwave.", location: "", acquiredFrom: "Starting spell for Cleric\n" +
            "Purchased from Irina of Carim for 1000 souls\nRequires Braille Divine Tome of Carim",
            guide: "FP Cost: 26, Slots: 1, Faith Req: 12", isCollected: false,
            iconLocation: "014_force-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Emit Force",
            description: "Releases a shockwave in front.", location: "", acquiredFrom: "Acquired by Siegward " +
            "of Catarina during third encounter. Below Irithyll of the Boreal Valley in a kitchen just after " +
            "a sewer area.", guide: "FP Cost: 20, Slots: 1, Faith Req: 18", isCollected: false,
            iconLocation: "015_emit_force-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Wrath of the Gods",
            description: "Create a powerful shockwave.", location: "", acquiredFrom: "Aquired by dropping " +
            "from the ledge near the spellcaster on the roof in Profaned Capital.", guide: "FP Cost: 40, " +
            "Slots: 2, Faith Req: 30", isCollected: false, iconLocation: "016_wrath_of_the_gods-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Lightning Spear",
            description: "Hurl lightning spear.", location: "", acquiredFrom: "Use the elevator near the Old " +
            "Wolf of Farron and take the stairs up. Turn to the right and run to the closed gate. On the " +
            "right side of the gate drop down and follow the path, one of the items there is Lightning Spear",
            guide: "FP Cost: 23, Slots: 1, Faith Req: 20", isCollected: false,
            iconLocation: "017_lightning_spear-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Great Lightning Spear",
            description: "Hurl giant lightning spear.", location: "", acquiredFrom: "Warriors of Sunlight " +
            "Rank 2 reward", guide: "FP Cost: 32, Slots: 1, Faith Req: 30", isCollected: false,
            iconLocation: "018_Great_lightning_spear2"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Sunlight Spear",
            description: "Hurls a Sunlight Spear.", location: "", acquiredFrom: "Acquired by Soul of the " +
            "Lords Transposition", guide: "FP Cost: 48, Slots: 1, Faith Req: 40", isCollected: false,
            iconLocation: "019_sunlight_spear-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Lightning Stake",
            description: "Strikes with a stake of lightning.", location: "", acquiredFrom: "Dropped by the " +
            "giant worm just before the Old Demon King boss fight", guide: "FP Cost: 34, Slots: 1, Faith " +
            "Req: 35", isCollected: false, iconLocation: "020_lightning_stake-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Lightning Storm",
            description: "Calls forth furious bolts of lightning.", location: "", acquiredFrom: "Acquired by " +
            "Soul of the Nameless King Transposition", guide: "FP Cost: 35, Slots: 2, Faith Req: 45",
            isCollected: false, iconLocation: "021_lightning_storm-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Divine Pillars of Light",
            description: "Bring down multiple pillars of light in vicinity.", location: "",
            acquiredFrom: "Found at the top of the Grand Archives in a room after defeating three Ascended " +
            "Wing Knights on the rooftops before the stairs leading to the boss encounter",
            guide: "FP Cost: 3, Slots: 1, Faith Req: 30", isCollected: false,
            iconLocation: "022_divine_pillars_of_light-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Blessed Weapon",
            description: "Blesses right weapon, increasing attack power, as well as gradually restoring HP.",
            location: "", acquiredFrom: "Sold by Irina of Carim for 8000 souls\nRequires Braille Divine Tome " +
            "of Lothric", guide: "FP Cost: 35, Slots: 1, Faith Req: 15", isCollected: false,
            iconLocation: "023_blessed_weapon-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Lightning Blade",
            description: "Reinforces right weapon with lightning.", location: "", acquiredFrom: "Located in " +
            "Irithyll Dungeon. Can be found in the area near the broken dragon statue used to reach the " +
            "Archdragon Peak", guide: "FP Cost: 50, Slots: 1, Faith Req: 30", isCollected: false,
            iconLocation: "024_lightning_blade-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Darkmoon Blade",
            description: "Reinforces right weapon with magic Darkmoon Light", location: "",
            acquiredFrom: "Blades of the Darkmoon Covenant Rank 2 reward", guide: "FP Cost: 50, Slots: 1, " +
            "Faith Req: 30", isCollected: false, iconLocation: "025_Darkmoon_blade3"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Magic Barrier",
            description: "Increases magic damage absorption by covering the body in a white protective coating",
            location: "", acquiredFrom: "Sold by Irina of Carim for 5000 souls\nRequires Braille Divine Tome " +
            "of Lothric", guide: "FP Cost: 30, Slots: 1, Faith Req: 15", isCollected: false,
            iconLocation: "026_magic_barrier-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Great Magic Barrier",
            description: "Greatly increases magic damage absorption with coating.", location: "",
            acquiredFrom: "Archdragon Peak found off a ledge where you find Havel and a dead dragon",
            guide: "FP Cost: 45, Slots: 2, Faith Req: 25", isCollected: false,
            iconLocation: "027_great_magic_barrier-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Dark Blade",
            description: "Reinforces right with dark.", location: "", acquiredFrom: "Purchased from Irina of " +
            "Carim or Karla for 10000 souls\nRequires Londor Braille Divine Tome", guide: "FP Cost: 35, " +
            "Slots: 1, Faith Req: 25", isCollected: false, iconLocation: "028_dark_blade-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Vow of Silence",
            description: "Prevents the use of magic in the area.", location: "",
            acquiredFrom: "Purchased from Irina of Carim or Karla for 15000 souls\nRequires Londor Braille " +
            "Divine Tome", guide: "FP Cost: 35, Slots: 2, Faith Req: 30", isCollected: false,
            iconLocation: "029_vow_of_silence-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Dead Again",
            description: "Bless corpses, transforming them into traps.", location: "",
            acquiredFrom: "Purchased from Irina of Carim or Karla for 5000 souls\nRequires Londor Braille " +
            "Divine Tome", guide: "FP Cost: 45, Slots: 1, Faith Req: 23", isCollected: false,
            iconLocation: "030_dead_again-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Atonement",
            description: "Attracts more attention from foes.", location: "", acquiredFrom: "Farron Keep " +
            "Perimeter bonfire. Turn around 180 degrees and follow the path until you reach a hole in the " +
            "wall on your right. Drop down on the ledge below. The spell will be on a corpse",
            guide: "FP Cost: 15, Slots: 1, Faith Req: 18", isCollected: false,
            iconLocation: "031_attonement-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Deep Protection",
            description: "Slightly boosts attack, damage absorption and resistance, while also increasing stamina " +
            "recovery speed.", location: "", acquiredFrom: "Purchased from Irina of Carim or Karla for 4000 souls",
            guide: "FP Cost: 25, Slots: 1, Faith Req: 20", isCollected: false,
            iconLocation: "032_deep_protection-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Gnaw",
            description: "Summons insect swarm to feast on foes.", location: "", acquiredFrom: "Purchased from " +
            "Irina of Carim or Karla for 2000 souls", guide: "FP Cost: 15, Slots: 1, Faith Req: 18",
            isCollected: false, iconLocation: "033_gnaw-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Dorhys Gnawing",
            description: "Summon great insect swarm to feast on foes.", location: "", acquiredFrom: "Guaranteed " +
            "kill reward for the screaming Evangelist in Irithyll of the Boreal Valley, found behind an " +
            "illusionary fence", guide: "FP Cost: 20, Slots: 1, Faith Req: 25", isCollected: false,
            iconLocation: "034_dorhys_gnawing-icon"))
        mastOfMiraclesCollection.append(ItemSeed(belongsTo: 13, name: "Lifehunt Scythe",
            description: "Steals HP of foes using an illusory scythe.", location: "", acquiredFrom: "Aquired " +
            "from Soul of Aldrich Transposition", guide: "FP Cost: 20, Slots: 1, Faith Req: 22",
            isCollected: false, iconLocation: "035_lifehunt_scythe-icon"))
    }
    
    private func createRingInfo() {
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Life Ring",
            description: "Increases HP by 7 percent.", location: "", acquiredFrom: "Can be selected as a Burial " +
            "Gift during character creation. Can be bought from the Shrine Handmaid in the Firelink Shrine for " +
            "1500 souls after aquiring the Dreamchaser's Ashes.", guide: "", isCollected: false,
            iconLocation: "001_life_ring-icon_+1+2+3"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Life Ring +1",
            description: "Increases HP by 8 percent.", location: "", acquiredFrom: "(NG+): Located in the " +
            "Undead Settlement. Behind Siegward while he is waiting to battle the fire demon.", guide: "",
            isCollected: false, iconLocation: "001_life_ring-icon_+1+2+3"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Life Ring +2",
            description: "Increases HP by 9 percent.", location: "", acquiredFrom: "(NG+): Lothric Castle. " +
            "From the dark room where you fight the pus of man in the wyvern's hand, head outside from the back " +
            "exit. Turn right and drop down off the ledge. The ring is on a corpse. This version can be picked " +
            "up here starting in NG+.", guide: "", isCollected: false, iconLocation: "001_life_ring-icon_+1+2+3"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Life Ring +3",
            description: "Increases HP by 10 percent.", location: "", acquiredFrom: "+3 Version (NG++): In " +
            "Untended Graves behind Holy King Lothric's throne.", guide: "", isCollected: false,
            iconLocation: "001_life_ring-icon_+1+2+3"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Sun Princess Ring",
            description: "Gradually restore HP.", location: "", acquiredFrom: "Found in Gwynevere's chamber " +
            "after Aldrich's boss room.", guide: "", isCollected: false, iconLocation: "005_sun_princess_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Estus Ring",
            description: "Increases HP restores with Estus Flask by 20 percent.", location: "",
            acquiredFrom: "Found at the bottom of the Tower on the left side of the Firelink Shrine. Requires " +
            "the Tower Key, sold by the Shrine Handmaid in Firelink Shrine for 20,000 Souls.", guide: "",
            isCollected: false, iconLocation: "006_estus_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Ashen Estus Ring",
            description: "Increases FP restored with Ashen Estus Flask by 20 percent.", location: "",
            acquiredFrom: "Located in the Untended Graves. From the first bonfire head to the left most path. " +
            "The ring is in the coffin surrounded by Corvians.", guide: "", isCollected: false,
            iconLocation: "007_ashen_estus_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Chloranthy Ring",
            description: "Raises stamina recovery speed +7 per second.", location: "",
            acquiredFrom: "Found in Undead Settlement. After defeating the Demon alongside Siegward of Catarina, " +
            "scale the nearby building and exit onto the adjacent tower by jumping from the roof. Maneuvering " +
            "down the tower, the ring will be located under several wooden boxes near the Mirrah Armor Set.",
            guide: "", isCollected: false, iconLocation: "008_chloranty_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Chloranthy Ring +1",
            description: "Raises stamina recovery speed +8 per second.", location: "",
            acquiredFrom: "(NG+) Irithyll of the Boreal Valley. Behind the pedestal with the Ring of the Sun's " +
            "First Born on top of it. Easily accessible by falling from the ledge near Pontiff Sulyvhan's fog " +
            "gate or walking from the Church of Yorshka.", guide: "", isCollected: false,
            iconLocation: "008_chloranty_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Chloranthy Ring +2",
            description: "Raises stamina recovery speed +9 per second.", location: "",
            acquiredFrom: "(NG++) From the first Road of Sacrifices bonfire, head to the wagon with the two " +
            "Corvians. To the left is a crow mage. To the left of him there's a ledge that you can drop down " +
            "to that has the ring.", guide: "", isCollected: false,
            iconLocation: "008_chloranty_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Havels Ring",
            description: "Increases maximum equip load by 15 percent.", location: "",
            acquiredFrom: "Created with the Soul of a Stray Demon", guide: "", isCollected: false,
            iconLocation: "011_havels_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Havels Ring +1",
            description: "Increases maximum equip load by 17 percent.", location: "",
            acquiredFrom: "(NG+): Archdragon Peak. From the altar that gives you the Twinkling Dragon Torso " +
            "Stone, go back down the steps. The ring is to the right of the doorway.", guide: "",
            isCollected: false, iconLocation: "011_havels_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Havels Ring +2",
            description: "Increases maximum equip load by 18 percent.", location: "",
            acquiredFrom: "(NG++): On a wooden beam below the Prison Tower bonfire in Irithyll of the Boreal " +
            "Valley/Anor Londo, after Painting Guardian Curved Sword and the Painting Guardian Set.", guide: "",
            isCollected: false, iconLocation: "011_havels_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Ring of Favor",
            description: "Increases max HP by 3 percent, stamina by 8.5 percent and equip load by 5 percent.",
            location: "", acquiredFrom: "Defeat Sulyvhan's Beasts near Archdeacon McDonnel", guide: "",
            isCollected: false, iconLocation: "014_ring_of_favor-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Rings of Favor +1",
            description: "Increases max HP by 4.5 percent, stamina by 9.5 percent and equip load by 6 percent.",
            location: "", acquiredFrom: "(NG+): Can be found in the room of Pontiff Sulyvahn's bonfire, but is " +
            "located upstairs. It can be either accessed by the shortcut in the room or taking the path around.",
            guide: "", isCollected: false, iconLocation: "014_ring_of_favor-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Rings of Favor +2",
            description: "Increases max HP by 5 percent, stamina by 10.5 percent and equip load by 7 percent.",
            location: "", acquiredFrom: "(NG++): Located in the Cathedral of the Deep. From the Cleansing " +
            "chapel bonfire, while facing the bonfire. go through the left shortcut, head up the elevator, " +
            "climb the ladder behind the tower, drop down to the ledge, and follow the path to the top part " +
            "of the chapel. To the left there is a hollow with a giant axe. behind him is this ring.", guide: "",
            isCollected: false, iconLocation: "014_ring_of_favor-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Prisoners Chain",
            description: "Increases VGR, END and VIT by 5, but damage taken is increased by 10 percent.",
            location: "", acquiredFrom: "Soul Transposition using Soul of Champion Gundyr", guide: "",
            isCollected: false, iconLocation: "017_prisoners_chain-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Ring of Steel Protection",
            description: "Decrease incoming physical damage by 10 percent.", location: "",
            acquiredFrom: "Found in the boss arena where you fight the Ancient Wyvern. After entering through " +
            "the fog gate, head up the stairs until you locate the bell. Then proceed to the right, downstairs. " +
            "There are three items lying on the ground. Next to the items is a thin ledge that players can walk " +
            "along. At the end of the path is the ring.", guide: "", isCollected: false,
            iconLocation: "018_ring_of_steel_protection-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Ring of Steel Protection +1",
            description: "Decrease incoming physical damage by 13 percent.", location: "",
            acquiredFrom: "(NG+): Untended Graves behind the tower that is unlocked by the Tower Key",
            guide: "", isCollected: false, iconLocation: "018_ring_of_steel_protection-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Ring of Steel Protection +2",
            description: "Decrease incoming physical damage by 15 percent.", location: "",
            acquiredFrom: "(NG++): Located in the Catacombs of Carthus. From the Abyss Watchers Bonfire go " +
            "down and head left until you find a bridge to your right. The bridge will be defended by a large " +
            "skeleton carrying a sword and shield. Look down to the left and you will notice an item on a pillar. " +
            "Drop down from the bridge onto the pillar to obtain this ring. Turn around to find the Carthus " +
            "Pyromancy Tome.", guide: "", isCollected: false, iconLocation: "018_ring_of_steel_protection-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Magic Stoneplate Ring",
            description: "Increases Magic Absorption by 13 percent.", location: "",
            acquiredFrom: "Dropped from the greatsword-wielding Consumed King's Knight guarding Oceiros, the " +
            "Consumed King", guide: "", isCollected: false, iconLocation: "021_magic_stoneplate_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Magic Stoneplate Ring +1",
            description: "Increases Magic Absorption by 17 percent.", location: "",
            acquiredFrom: "(NG+): Farron Keep bonfire before the swamp. From that bonfire, make a right " +
            "and proceed to where the Basilisks are. The ring will be in this area.", guide: "",
            isCollected: false, iconLocation: "021_magic_stoneplate_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Magic Stoneplate Ring +2",
            description: "Increases Magic Absorption by 20 percent.", location: "",
            acquiredFrom: "(NG++): Start from the Profaned Capital Bonfire.  Take the ladder down into the " +
            "tower and head through the hole in the wall. From there, turn right and go down the stairs. The " +
            "ring is at the end of the stairs, on the edge of a cliff.", guide: "", isCollected: false,
            iconLocation: "021_magic_stoneplate_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Flame Stoneplate Ring",
            description: "Increases Fire Absorption by 13 percent.", location: "",
            acquiredFrom: "Found on a corpse hanging at a tree overlooking the entrance of the tower with the " +
            "giant in it at Undead Settlement (the same area where you enter the cage to join the Mound Makers).",
            guide: "", isCollected: false, iconLocation: "024_flame_stoneplate_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Flame Stoneplate Ring +1",
            description: "Increases Fire Absorption by 17 percent.", location: "",
            acquiredFrom: "(NG+): Located in the Profaned Capital. In the area with the toxic swamp, climb " +
            "up the building's ladder and walk along the curved part of roof until you see a hole in the wall " +
            "to your right.  Look down, directly across from the broken section of wall is a small ledge to " +
            "drop onto and the ring will be on a corpse.", guide: "", isCollected: false,
            iconLocation: "024_flame_stoneplate_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Flame Stoneplate Ring +2",
            description: "Increases Fire Absorption by 20 percent.", location: "",
            acquiredFrom: "(NG++): Located in the Demon Ruins. From the Old King's Antechamber bonfire, go " +
            "down the immediate stairs and follow the path until you come to a fork in the path. Left will " +
            "be an illusory wall where there will be a Black Knight fighting a Ghru. The ring will be on a " +
            "corpse near a wall, along with a Black Knight Sword.", guide: "", isCollected: false,
            iconLocation: "024_flame_stoneplate_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Thunder Stoneplate Ring",
            description: "Increases Lightning Absorption by 13 percent.", location: "",
            acquiredFrom: "Archdragon Peak: From the second bonfire, proceed through the area until you get " +
            "outside, then near the wooden scaffold there is a ladder which leads to the ring", guide: "",
            isCollected: false, iconLocation: "027_thunder_stoneplate_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Thunder Stoneplate Ring +1",
            description: "Increases Lightning Absorption by 17 percent.", location: "",
            acquiredFrom: "(NG+) Can be found near the Carthus Milkring, among the many pots in the Catacombs " +
            "of Carthus", guide: "", isCollected: false, iconLocation: "027_thunder_stoneplate_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Thunder Stoneplate Ring +2",
            description: "Increases Lightning Absorption by 20 percent.", location: "",
            acquiredFrom: "(NG++): Can be found before the Dragonslayer Armour Boss in Lothric Castle. Before " +
            "the boss fight there's a door lit by torches. Proceed trough the door and up the stairs. Turn left " +
            "trough another door then left again to find a hole in the stone railing. Drop down to the ledge " +
            "below and turn right. Follow the ledge to find this ring. The ring is on the same small rooftop " +
            "that you would drop down to get Caitha's Chime, it's just on the opposite end.", guide: "",
            isCollected: false, iconLocation: "027_thunder_stoneplate_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Dark Stoneplate Ring",
            description: "Increases Dark Absorption by 13 percent.", location: "",
            acquiredFrom: "In Anor Londo, following the Pontiff Sulyvahn bonfire. The ring will be guarded " +
            "by Irithyllian Slaves in an area beneath the Deacons casting Fireball.", guide: "",
            isCollected: false, iconLocation: "030_dark_stoneplate_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Dark Stoneplate Ring +1",
            description: "Increases Dark Absorption by 17 percent.", location: "",
            acquiredFrom: "(NG+) : Lothric Castle Before entering the fog gate for the Dragonslayer Armour, " +
            "head left and drop down to fight the Pus of Man on the white Wyvern. Next to the Wyvern is a " +
            "room with a mimic and a doorway out to a balcony. This ring is located on right side the balcony.",
            guide: "", isCollected: false, iconLocation: "030_dark_stoneplate_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Dark Stoneplate Ring +2",
            description: "Increases Dark Absorption by 20 percent.", location: "",
            acquiredFrom: "(NG++): Farron Keep, the Keep Ruins bonfire. Leave the room where you find 3 Ghru " +
            "enemies on a bridge. Cross the bridge, you can find a dilapidated wall to your left. In front of " +
            "the wall is a flame you need to extinguish to reach the Abyss Watchers. The ring is behind " +
            "this wall, you'll need to roll through some crucifixes to reach it.", guide: "",
            isCollected: false, iconLocation: "030_dark_stoneplate_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Speckled Stoneplate Ring",
            description: "Increases Magic, Fire, Lightning and Dark Absorption by 5 percent.", location: "",
            acquiredFrom: "Found on a corpse in Smouldering Lake, behind a destructible wall on the other " +
            "side from which you enter. Lure a ballista shot to break the wall apart.", guide: "",
            isCollected: false, iconLocation: "033_speckled_stoneplate_ring_+1"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Speckled Stoneplate Ring +1",
            description: "Increases Magic, Fire, Lightning and Dark Absorption by 7 percent.", location: "",
            acquiredFrom: "(NG+) Cemetery of Ash. In the arena where you find the first Ravenous Crystal Lizard.",
            guide: "", isCollected: false, iconLocation: "033_speckled_stoneplate_ring_+1"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Bloodbite Ring",
            description: "Increases Bleed Resistance by 90 points.", location: "",
            acquiredFrom: "Undead Settlement, in the sewers below Cliff Underside bonfire or beside the " +
            "Dilapidated Bridge bonfire. The Large Hound-Rat will drop the ring.", guide: "", isCollected: false,
            iconLocation: "035_bloodbite_ring-icon_+1"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Bloodbite Ring +1",
            description: "Increases Bleed Resistance by 140 points.", location: "",
            acquiredFrom: "(NG+): Smouldering Lake, make your way through the Demon Ruins to find it in front " +
            "of the ballista.", guide: "", isCollected: false, iconLocation: "035_bloodbite_ring-icon_+1"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Poisonbite Ring",
            description: "Increases Poison Resistance by 90 points.", location: "",
            acquiredFrom: "Near the first short cut at Cathedral of the Deep behind the Ravenous Crystal Lizard.",
            guide: "", isCollected: false, iconLocation: "037_poisonbite_ring-icon_+1"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Poisonbite Ring +1",
            description: "Increases Poison Resistance by 140 points.", location: "",
            acquiredFrom: "(NG+): Undead Settlement In the graveyard beside the white birch tree (Where the " +
            "giant is throwing spears at you/enemies nearby) you'll find a well hidden in a corner. The " +
            "ring is on a corpse behind the well.", guide: "", isCollected: false,
            iconLocation: "037_poisonbite_ring-icon_+1"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Cursebite Ring",
            description: "Increases Curse Resistance by 150 points.", location: "",
            acquiredFrom: "Profaned Capital, toxic swamp in the cave under the wooden bridge", guide: "",
            isCollected: false, iconLocation: "039_cursebite_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Fleshbite Ring",
            description: "Raises Poison, Bleed, Frost and Curse resist by 40 points.", location: "",
            acquiredFrom: "Grand Archives, near the top floor of building just beyond the area with a " +
            "balcony overhead and multiple Scholars, there will be a set of bookcases to the right of the " +
            "stairs which lead you to the room. The ring will be located in the corner past the Clawed Curses.",
            guide: "", isCollected: false, iconLocation: "040_fleshbite_ring-icon_+1"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Fleshbite Ring +1",
            description: "Raises Poison, Bleed, Frost and Curse resist by 60 points.", location: "",
            acquiredFrom: "(NG+): From the Tower on the Wall bonfire, head down to the roof with the " +
            "transforming undead on it. Before descending the ladder to progress further, look to the " +
            "nearby rooftop with fencing. Jumping will allow you access the rooftop and the ring will be on " +
            "a corpse. (The item should be visible before jumping to the rooftop if you need confirmation)",
            guide: "", isCollected: false, iconLocation: "040_fleshbite_ring-icon_+1"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Knights Ring",
            description: "Increases Strength by 5 points.", location: "",
            acquiredFrom: "Lothric Castle, near the Sunlight Shrine.", guide: "", isCollected: false,
            iconLocation: "042_knights_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Hunters Ring",
            description: "Increases Dexterity by 5 points", location: "",
            acquiredFrom: "Grand Archives- Found at the top of a tower surrounded by three golden Winged " +
            "Knights before the stairs to Prince Lothric.", guide: "", isCollected: false,
            iconLocation: "043_hunters_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Scholars Ring",
            description: "Increases Intelligence by 5 points.", location: "",
            acquiredFrom: "Grand Archives - Get to the wooded bridge in the middle of the room where the crystal " +
            "sage/mage mini boss ends up after attacking it, and on the side where you drop down onto the bridge " +
            "there is a lever beside it where the brige starts that opens a shortcut + Ring.",
            guide: "", isCollected: false, iconLocation: "044_scholar_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Priestess Ring",
            description: "Increases Faith by 5 points.", location: "",
            acquiredFrom: "Sold by the Shrine Handmaid in Untended Graves.\nDropped by the Shrine Handmaid in " +
            "Untended Graves, even if you've already purchased it from her.", guide: "", isCollected: false,
            iconLocation: "045_priestess_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Covetous Gold Serpent Ring",
            description: "Increases Item Discovery by 50 points.", location: "",
            acquiredFrom: "Found next to Siegward of Catarina when he is trapped in Irithyll Dungeon.",
            guide: "", isCollected: false, iconLocation: "046_covetous_gold_serpent_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Covetous Gold Serpent Ring +1",
            description: "Increases Item Discovery by 75 points.", location: "",
            acquiredFrom: "(NG+): From the Church of Yorshka bonfire in Irithyll of the Boreal Valley, proceed " +
            "beyond the graveyard to the dark room with the Irithyllian Slaves. As you're exiting the room " +
            "through the wide arched doorway, scan the right side for a broken section of railing where you " +
            "can drop down. The ring will be on a corpse wedged in the corner of the ledge.", guide: "",
            isCollected: false, iconLocation: "046_covetous_gold_serpent_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Covetous Gold Serpent Ring +2",
            description: "Increases Item Discovery by 100 points.", location: "",
            acquiredFrom: "(NG++): Archdragon Peak, in a large area that appears on defeating the Nameless " +
            "King. You can also find the Dragonslayer Set and a Titanite Slab in this area.", guide: "",
            isCollected: false, iconLocation: "046_covetous_gold_serpent_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Covetous Silver Serpent Ring",
            description: "Fallen foes yield 10 percent more souls.", location: "",
            acquiredFrom: "In a chest behind an illusory wall at the top of Firelink Shrine. Located " +
            "behind Picklepum's indoor nest.", guide: "", isCollected: false,
            iconLocation: "049_covetous_silver_serpent_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Covetous Silver Serpent Ring +1",
            description: "Fallen foes yield 20 percent more souls.", location: "",
            acquiredFrom: "(NG+): While progressing through Irithyll Dungeon, you'll find an elevator " +
            "shortcut that heads to the first bonfire of the area. This ring is located in the elevator's " +
            "room.", guide: "", isCollected: false, iconLocation: "049_covetous_silver_serpent_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Covetous Silver Serpent Ring +2",
            description: "Fallen foes yield 30 percent more souls.", location: "",
            acquiredFrom: "(NG++): Undead Settlement. In the area after meeting Siegward with the Fire Demon, " +
            "located on the roof of a shack in the far back of the area. Drop off the wooden ledge outside " +
            "the room with two Cathedral Evangelists to access it.", guide: "", isCollected: false,
            iconLocation: "049_covetous_silver_serpent_ring_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Saints Ring",
            description: "Allows attunement of additional spells.", location: "",
            acquiredFrom: "Sold by Irina of Carim for 300 souls.", guide: "", isCollected: false,
            iconLocation: "052_saints_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Deep Ring",
            description: "Allows attunement of additional spells.", location: "",
            acquiredFrom: "Drops from a Deacon in a tower outside the Cathedral of the Deep.", guide: "",
            isCollected: false, iconLocation: "053_deep_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Darkmoon Ring",
            description: "Gives 2 extra attunment slots.", location: "",
            acquiredFrom: "Rank 1 covenant reward: Blade of the Darkmoon.", guide: "", isCollected: false,
            iconLocation: "054_Darkmoon_Ring"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Young Dragon Ring",
            description: "Boosts sorcery damage by 15 percent.", location: "",
            acquiredFrom: "Starting equipment for the Sorcerer.\nGiven by Orbeck of Vinheim after purchasing " +
            "several spells.", guide: "", isCollected: false, iconLocation: "055_young_dragon_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Bellowing Dragoncrest Ring",
            description: "Boosts sorcery damage by 25 percent.", location: "",
            acquiredFrom: "From the Irithyll Dungeon bonfire, head straight into the large room and then turn " +
            "right, proceed until the end of the corridor and open the gate with the Jailbreaker's Key. The " +
            "ring is on the rocks below.", guide: "", isCollected: false,
            iconLocation: "056_bellowing_dragoncrest_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Great Swamp Ring",
            description: "Boosts pyromancy damage by 12 percent.", location: "",
            acquiredFrom: "Starting equipment for the Pyromancer\nDropped by the Great Crab, up the ladder " +
            "near the Farron Keep bonfire in the Road of Sacrifices.", guide: "", isCollected: false,
            iconLocation: "057_great_swamp_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Witchs Ring",
            description: "Boosts pyromancy damage by 20 percent.", location: "",
            acquiredFrom: "Catacombs of Carthus after destroying the rope bridge and climbing down the far end " +
            "of the broken bridge and continue to the left of the bonfire, the ring is on a corpse at the end " +
            "of the hall", guide: "", isCollected: false, iconLocation: "058_witch_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Mornes Ring",
            description: "Boosts miracle damage by 12 percent.", location: "",
            acquiredFrom: "Under the bridge between the 1st and 2nd bonfires of Road of Sacrifices. There is " +
            "an area to the right of the bridge's beginning where players may drop down into the cave.",
            guide: "", isCollected: false, iconLocation: "059_mornes_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Ring of the Suns First Born",
            description: "Boosts miracle damage by 20 percent.", location: "",
            acquiredFrom: "In Irithyll of the Boreal Valley. From Pontiff Sulyvahn's room, head back out " +
            "towards the railing and fall straight onto the altar below.", guide: "", isCollected: false,
            iconLocation: "060_ring_of_the_suns_first_born-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Lingering Dragoncrest Ring",
            description: "Extends length of spell effect by 30 percent.", location: "",
            acquiredFrom: "Farron Keep, Keep Ruins bonfire. Drops from the Great Crab patrolling a white birch " +
            "tree.", guide: "", isCollected: false, iconLocation: "061_Lingering_dragon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Lingering Dragoncrest Ring +1",
            description: "Extends length of spell effect by 35 percent.", location: "",
            acquiredFrom: "(NG+): Found next to the giant crab just below the Crucifixion Woods bonfire in " +
            "the Road of Sacrifices.", guide: "", isCollected: false, iconLocation: "061_Lingering_dragon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Lingering Dragoncrest Ring +2",
            description: "Extends length of spell effect by 40 percent.", location: "",
            acquiredFrom: "(NG++): Located in Lothric Castle. Before the Lothric Prince Boss fight, there " +
            "is a dome shaped roof with three golden Winged Knights. Go up the spiral staircase at the center " +
            "of the dome shaped roof. You'll encounter a ladder, don't go up the ladder, instead go around the " +
            "ledge to find this ring on a corpse hidden in an alcove.", guide: "", isCollected: false,
            iconLocation: "061_Lingering_dragon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Sage Ring",
            description: "Spell casting speed increased as if you had 30 higher dexterity.", location: "",
            acquiredFrom: "Found to the left of the swamp area of Road of Sacrifices inside a room with an enemy. ",
            guide: "", isCollected: false, iconLocation: "064_sage_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Sage Ring +1",
            description: "Spell casting speed increased as if you had 35 higher dexterity.", location: "",
            acquiredFrom: "(NG+): found in the rafters above the Archives. Drop down from the roof where the " +
            "golden winged knights are located.", guide: "", isCollected: false,
            iconLocation: "064_sage_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Sage Ring +2",
            description: "Spell casting speed increased as if you had 40 higher dexterity.", location: "",
            acquiredFrom: "(NG++): Located in the Consumed King's garden. When initially taking the elevator " +
            "down, get off halfway to a ledge. Turn left and drop down onto some broken stairs. Pick up the " +
            "item here and look to the left to find the ring on another set of broken stairs. You can get " +
            "over there with a well timed roll.", guide: "", isCollected: false,
            iconLocation: "064_sage_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Dusk Crown Ring",
            description: "Reduces consumption of FP by 25 percent at the cost of 20 percent less max HP.",
            location: "", acquiredFrom: "Located in the Irithyll Dungeon. The ring is in a cell beside the " +
            "open area with six patrolling Jailers.", guide: "", isCollected: false,
            iconLocation: "067_dusk_crown_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Leo Ring",
            description: "Strengthens thrust weapon counter attack by 15 percent.", location: "",
            acquiredFrom: "Found in a chest on the second floor of the room with Gwynevere's painting in " +
            "Irithyll of the Boreal Valley. Just beyond where either Siegward of Catarina is located during " +
            "his questline or, more commonly notable, the Estus Soup is placed.", guide: "", isCollected: false,
            iconLocation: "068_leo_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Wolf Ring",
            description: "Increases poise by 12.5.", location: "",
            acquiredFrom: "Rank 2 covenant reward: Watchdogs of Farron.", guide: "", isCollected: false,
            iconLocation: "069_Wolf_Ring2_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Wolf Ring +1",
            description: "Increases poise by 17.5.", location: "",
            acquiredFrom: "(NG+) Can be found on a corpse immediately outside the Keep Ruins bonfire building.",
            guide: "", isCollected: false, iconLocation: "069_Wolf_Ring2_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Wolf Ring +2",
            description: "Increases poise by 20.", location: "",
            acquiredFrom: "(NG++): Can be found in Cemetery of Ash, after the Iudex Gundyr boss fight. It's " +
            "lying behind the golden door, on the left.", guide: "", isCollected: false,
            iconLocation: "069_Wolf_Ring2_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Hawk Ring",
            description: "Extends the range of arrows.", location: "",
            acquiredFrom: "Dropped from the Giant of the Undead Settlement in Undead Settlement.",
            guide: "", isCollected: false, iconLocation: "072_hawk_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Hornet Ring",
            description: "Increases Critical Damage by 30 percent.", location: "",
            acquiredFrom: "Found in Untended Graves, behind a Black Knight standing guard where the Starved " +
            "Hound is found when at the Firelink Shrine.", guide: "", isCollected: false,
            iconLocation: "073_hornet_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Knight Slayers Ring",
            description: "Enemies lose 10 percent more stamina when guarding attacks.", location: "",
            acquiredFrom: "Defeating the dark phantom of  Knight Slayer Tsorig at Catacomb of Carthus. Location " +
            "to summon him is in a barred area beside the Skeleton Ball's path or the Hound-Rats.\n\nOR if the " +
            "invasion was skipped,\n\ngained from killing Knight Slayer Tsorig at Smouldering Lake.  After the " +
            "basilisks, turn left at the bottom of the stairs.", guide: "", isCollected: false,
            iconLocation: "074_knight_slayers_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Ring of the Evil Eye",
            description: "Absorbs 30 HP from each defeated foe.", location: "",
            acquiredFrom: "Quest Reward: Anri of Astora. Obtained when Anri relocates to the Church of Yorshka.",
            guide: "", isCollected: false, iconLocation: "075_ring_of_the_evil_eye-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Ring of the Evil Eye +1",
            description: "Absorbs 33 HP from each defeated foe.", location: "",
            acquiredFrom: "(NG+): Can be found just before Deacons of the Deep fight, at the back of the altar.",
            guide: "", isCollected: false, iconLocation: "075_ring_of_the_evil_eye-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Ring of the Evil Eye +2",
            description: "Absorbs 36 HP from each defeated foe.", location: "",
            acquiredFrom: "(NG++): Located in the High Wall of Lothric. From the second bonfire, head down " +
            "to the roof with the first crystal lizard and the enemy that morphs. Climb the ladder down. Run " +
            "past the spear wielding Lothric knight. Head down into the room with the estus shard on the " +
            "mantle. The ring will be on the wall to the left, hidden behind a barrel.", guide: "",
            isCollected: false, iconLocation: "075_ring_of_the_evil_eye-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Farron Ring",
            description: "Reduces skill FP consumption by 30 percent.", location: "",
            acquiredFrom: "Acquired by talking to Hawkwood after defeating the Abyss Watchers ", guide: "",
            isCollected: false, iconLocation: "078_farron_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Dragonscale Ring",
            description: "Reduced damage taken from backstabs by 30 percent.", location: "",
            acquiredFrom: "Found in the Consumed King's Garden. When taking the second elevator in the area " +
            "which grants a shortcut, get off early to reach a ledge with a Lothric Priest. The ring will be " +
            "beside him.", guide: "", isCollected: false, iconLocation: "079_dragonscale_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Horsehoof Ring",
            description: "Enemies lose 30 percent more Stamina when guarding against your kicks.", location: "",
            acquiredFrom: "Sold by Unbreakable Patches after you open the main door to Cathedral of the Deep. " +
            "(also drops on death)", guide: "", isCollected: false, iconLocation: "080_horsehoof_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Wood Grain Ring",
            description: "Increases weapon durability by 20 percent.", location: "",
            acquiredFrom: "Purchased from the Shrine Handmaid after Easterner's Ashes is turned in.",
            guide: "", isCollected: false, iconLocation: "081_wood_grain_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Wood Grain Ring +1",
            description: "Increases weapon durability by 30 percent.", location: "",
            acquiredFrom: "(NG+): Behind the first elevator in the Consumed King's Garden, at the bottom.",
            guide: "", isCollected: false, iconLocation: "081_wood_grain_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Wood Grain Ring +2",
            description: "Increases weapon durability by 40 percent.", location: "",
            acquiredFrom: "(NG++): Irithyll of the Boreal Valley- Run past the room with the three Silver " +
            "knights (room that contains Gwynevere's painting and Smough's hammer in a chest), go outside, " +
            "turn right and the ring is located in an alcove", guide: "", isCollected: false,
            iconLocation: "081_wood_grain_ring-icon_+1+2"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Flynns Ring",
            description: "Lowering equip load increases attack power up to 15 percent.", location: "",
            acquiredFrom: "Looted from a corpse on the top of a roof at Undead Settlement: In the area where " +
            "you fight the Fire Demon with Siegward of Catarina", guide: "", isCollected: false,
            iconLocation: "084_flynn_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Magic Clutch Ring",
            description: "Increases magic attack by 15 percent, increases incoming physical damage by 10 percent",
            location: "", acquiredFrom: "Irythyl of the Boreal Valley- From the 3rd bonfire, go back the way you " +
            "came from. In the semi circular hall, there is a illusory wall to the right. The ring is behind it",
            guide: "", isCollected: false, iconLocation: "085_magic_clutch_ring"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Lightning Clutch Ring",
            description: "Increases lightning attack by 15 percent, increases incoming physical damage by 10 percent",
            location: "", acquiredFrom: "On a corpse in Archdragon Peak, to the left of the gate that leads to " +
            "the Ancient Wyvern.", guide: "", isCollected: false, iconLocation: "086_lightning_clutch_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Fire Clutch Ring",
            description: "Increases fire attack by 15 percent, increases incoming physical damage by 10 percent",
            location: "", acquiredFrom: "On a corpse in the Undead Settlement. Behind the gallows and on a " +
            "deadend wooden bridge, an area directly above the Cliff Underside Bonfire.", guide: "",
            isCollected: false, iconLocation: "087_fire_clutch_ring"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Dark Clutch Ring",
            description: "Increases dark attack by 15 percent, increases incoming physical damage by 10 percent",
            location: "", acquiredFrom: "Dropped by a mimic in the Profaned Capital. After passing the giant " +
            "there is a hallway with rats. The mimic is at the end of the hallway on the left side.", guide: "",
            isCollected: false, iconLocation: "088_dark_clutch_ring"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Red Tearstone Ring",
            description: "Increases attack by 20 percent when HP is below 20 percent.", location: "",
            acquiredFrom: "Lothric Castle- Facing away from the Dragonslayer Armour Boss, to the left there " +
            "is an elevator. Beside the elevator is a door to the balcony. Follow the balcony to the right to " +
            "find this ring", guide: "", isCollected: false, iconLocation: "089_red_tearstone_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Blue Tearstone Ring",
            description: "Decreases incoming damage by 20 percent when HP is below 20 percent.", location: "",
            acquiredFrom: "Given by Greirat of the Undead Settlement", guide: "", isCollected: false,
            iconLocation: "090_blue_tearstone_ring"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Lloyds Sword Ring",
            description: "Boosts attack by 10 percent when HP is full.", location: "",
            acquiredFrom: "On a corpse inside Cathedral of the Deep, near the entrance on a ledge next to " +
            "the Giant who attacks you when running by.", guide: "", isCollected: false,
            iconLocation: "091_lloyds_sword_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Lloyds Shield Ring",
            description: "Boosts Damage Absorption by 25 percent when HP is full", location: "",
            acquiredFrom: "Can be bought from the Shrine Handmaid, after Paladin's Ashes are given to her.",
            guide: "", isCollected: false, iconLocation: "092_lloyds_shield_ring"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Carthus Milkring",
            description: "Grants 3 points of Dexterity and obscures the wearer while rolling.", location: "",
            acquiredFrom: "Found within the Catacombs of Carthus just after the first bonfire in a room with " +
            "many vases.", guide: "", isCollected: false, iconLocation: "093_carthus_milkring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Carthus Bloodring",
            description: "Boosts rolling invincibility, at the cost of defense.", location: "",
            acquiredFrom: "Found at Catacombs of Carthus, from the second bonfie past the wheel skeletons.",
            guide: "", isCollected: false, iconLocation: "094_carthus_bloodring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Pontiffs Right Eye",
            description: "Boosts attacks to a maximum of 15 percent, as long as attacking persists.",
            location: "", acquiredFrom: "Located in the Irithyll of the Boreal Valley. The giant " +
            "crocodile/dragon enemy you face the first time. Defeating this enemy rewards you this ring.",
            guide: "", isCollected: false, iconLocation: "095_pontiffs_right_eye-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Pontiffs Left Eye",
            description: "Restores 50 HP after a certain amount of successive attacks.", location: "",
            acquiredFrom: "Soul Transposition using Soul of Boreal Valley Vordt", guide: "", isCollected: false,
            iconLocation: "096_pontiffs_left_eye-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Aldrichs Ruby",
            description: "Recovers 85 HP from critical attacks.", location: "",
            acquiredFrom: "Dropped by the Deep Accursed in Anor Londo.", guide: "", isCollected: false,
            iconLocation: "097_aldrichs_ruby-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Aldrichs Sapphire",
            description: "Recovers 15 FP from critical attacks", location: "",
            acquiredFrom: "Dropped by the Deep Accursed in the Cathedral of the Deep.",
            guide: "", isCollected: false, iconLocation: "098_aldrichs_sapphire_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Silvercat Ring",
            description: "Removes fall damage, but falling lethal distance still kills you.", location: "",
            acquiredFrom: "Given by Sirris of the Sunless Realms after helping her defeat Creighton in Irithyll " +
            "of the Boreal Valley.", guide: "", isCollected: false, iconLocation: "099_silver_cat_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Slumbering Dragoncrest Ring",
            description: "Movement and rolling make no sound.", location: "",
            acquiredFrom: "Given by Orbeck of Vinheim after you have purchased 15 Sorceries, along with " +
            "the Silent Ally gesture.", guide: "", isCollected: false,
            iconLocation: "100_slumbering_dragoncrest_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Obscuring Ring",
            description: "Enemies need to be closer to notice you with sight, and you are invisible to other " +
            "players beyond a certain distance.", location: "",
            acquiredFrom: "Rank 1 covenant reward: Rosaria's Fingers.", guide: "", isCollected: false,
            iconLocation: "101_Obscuring_Ring"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Untrue Dark Ring",
            description: "Retain human appearnce while hollow and disguise as a host in other worlds.",
            location: "", acquiredFrom: "Purchased from Yuria of Londor", guide: "", isCollected: false,
            iconLocation: "102_untrue_dark_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Untrue White Ring",
            description: "Take the appearance of a white phantom at all times.", location: "",
            acquiredFrom: "Purchased from Yuria of Londor", guide: "", isCollected: false,
            iconLocation: "103_untrue_white_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Reversal Ring",
            description: "Use the animations of the opposite gender.", location: "",
            acquiredFrom: "Found in the Darkmoon Tomb in Anor Londo to the right of the altar. For " +
            "references, the Darkmoon Tomb is hidden behind an illusory wall in the circular room before " +
            "the lever which controls the platform leading to the Anor Londo bonfire.", guide: "",
            isCollected: false, iconLocation: "104_reversal_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Skull Ring",
            description: "Easier to be detected by enemies.", location: "",
            acquiredFrom: "Dropped from Ludleth of Courland when killed or can be obtained by visiting " +
            "his throne before beginning the next Journey.", guide: "", isCollected: false,
            iconLocation: "105_skull_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Calamity Ring",
            description: "Causes the wearer to take double damage.", location: "",
            acquiredFrom: "Archdragon Peak. Use the 'Path of the Dragon' gesture at the altar near the " +
            "Dragon-Kin Mausoleum bonfire. The Drakeblood Knight spawns just next to this altar.", guide: "",
            isCollected: false, iconLocation: "106_calamity_ring-icon"))
        mastOfRingsCollection.append(ItemSeed(belongsTo: 14, name: "Ring of Sacrifice",
            description: "Its wearer will lose nothing upon death, but the ring breaks.", location: "",
            acquiredFrom: "High Wall of Lothric: On an awning reachable by a minor jump in the courtyard. This " +
            "area is patrolled by a Winged Knight and the stairs that lead to the platform which players must " +
            "jump from is guarded by a Hollow Soldier.\n\nThree of them can be bought from Yuria of Londor, " +
            "for 3000 souls each.\n\nOne can be found on a corpse hanging on a ledge overlooking the " +
            "cruxification woods", guide: "", isCollected: false, iconLocation: "107_ring_of_sacrifice-icon"))
    }
    
    private func createExpressionInfo() {
        let autRec: String = "Automatically received."
        
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Point Forward",
            description: "", location: "", acquiredFrom: autRec, guide: "", isCollected: true,
            iconLocation: "001-pointforward"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Point Up",
            description: "", location: "", acquiredFrom: autRec, guide: "", isCollected: true,
            iconLocation: "002-pointup"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Point Down",
            description: "", location: "", acquiredFrom: autRec, guide: "", isCollected: true,
            iconLocation: "003-pointdown"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Wave",
            description: "", location: "", acquiredFrom: autRec, guide: "", isCollected: true,
            iconLocation: "004-wave"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Beckon", description: "", location: "",
            acquiredFrom: "Talk to Yoel of Londor not far from the Foot of the High Wall bonfire and take him " +
            "into your service. Talk to him again at Firelink Shrine to get the gesture.", guide: "",
            isCollected: false, iconLocation: "005-beckon"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Call Over", description: "", location: "",
            acquiredFrom: "Received after you trade a Homeward Bone (or any other Pickle pee item) for the first " +
            "time with Pickle Pee, Pump-a-Rum Crow.", guide: "", isCollected: false,
            iconLocation: "006-callover"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Welcome", description: "", location: "",
            acquiredFrom: "Talk to the Cornyx in the Undead Settlement, and accept his services. Talk to " +
            "him at Firelink Shrine twice to get the gesture.", guide: "", isCollected: false,
            iconLocation: "007-welcome"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Applause", description: "", location: "",
            acquiredFrom: "Talk to Leonhard once he appears in Firelink Shrine. He will be leaning against " +
            "Younger Prince Lothric's throne. He will give you five Cracked Red Eye Orbs, and leave. Talk to " +
            "him again after you've obtained a Pale Tongue, and he will give you a key to a locked door " +
            "beneath the Tower on the Wall bonfire in the High Wall of Lothric that leads to an imprisoned " +
            "Darkwraith. Kill the Darkwraith to receive the full Red Eye Orb, then talk to Leonhard again " +
            "to receive the gesture.", guide: "", isCollected: false,
            iconLocation: "008-applause"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Quiet Resolve", description: "",
            location: "", acquiredFrom: "Follow Anri's questline up to Irithyll of the Boreal Valley. They " +
            "will grant you the gesture when speaking to them at the Church of Yorshka Bonfire.", guide: "",
            isCollected: false, iconLocation: "009-quietresolve"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Jump For Joy", description: "",
            location: "", acquiredFrom: autRec, guide: "", isCollected: true,
            iconLocation: "010-jumpingforjoy"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Joy", description: "", location: "",
            acquiredFrom: autRec, guide: "", isCollected: true, iconLocation: "011-joy"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Rejoice", description: "", location: "",
            acquiredFrom: "Give Siegward his armor in Cathedral of the Deep.", guide: "", isCollected: false,
            iconLocation: "012-rejoice"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Hurrah!", description: "", location: "",
            acquiredFrom: "Talk to Blacksmith Andre.", guide: "", isCollected: false,
            iconLocation: "013-hurrah"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Praise the Sun", description: "",
            location: "", acquiredFrom: "Received from praying at the Altar of Sunlight in Lothric Castle, near " +
            "the Dragonslayer Armour boss fight.", guide: "", isCollected: false,
            iconLocation: "014-praisethesun"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "My Thanks!", description: "",
            location: "", acquiredFrom: "Obtained from Knight Slayer Tsorig deep in the Demon Ruins, in " +
            "Smouldering Lake regardless of who wins the fight. ", guide: "", isCollected: false,
            iconLocation: "015-mythanks"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Bow", description: "", location: "",
            acquiredFrom: autRec, guide: "", isCollected: true, iconLocation: "016-bow"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Proper Bow", description: "",
            location: "", acquiredFrom: "Received when summoning Yellowfinger Heysel in Farron Keep.", guide: "",
            isCollected: false, iconLocation: "017-politebow"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Dignified Bow", description: "",
            location: "", acquiredFrom: "Received from meeting Yuria of Londor.", guide: "", isCollected: false,
            iconLocation: "018-dignifiedbow"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Duel Bow", description: "",
            location: "", acquiredFrom: "Received upon summoning the Londor Pale Shade that appears in " +
            "various locations when you have five Dark Sigils (by leveling up with Yoel). Some locations " +
            "include: The Farron Keep Perimeter and before the Abyss Watchers fight. Note that while Pale " +
            "Shade can be summoned for the Soul of Cinder fight, it will not perform the gesture.", guide: "",
            isCollected: false, iconLocation: "019-duelbow"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Legion Ettiquette", description: "",
            location: "", acquiredFrom: "Pray to the Old Wolf of Farron in the Farron Swamp.", guide: "",
            isCollected: false, iconLocation: "020-legionetiquette"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Darkmoon Loyalty", description: "",
            location: "", acquiredFrom: "Received from speaking with Sirris in Firelink Shrine after " +
            "giving Dreamchaser's Ashes to the Shirine Handmaid.", guide: "", isCollected: false,
            iconLocation: "021-darkmoon"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "By My Sword", description: "",
            location: "", acquiredFrom: "Received from summoning Black Hand Gotthard. He will perform the " +
            "gesture as he is summoned.", guide: "", isCollected: false,
            iconLocation: "022-bymysword"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Prayer", description: "", location: "",
            acquiredFrom: "Received from meeting Irina of Carim.", guide: "", isCollected: false,
            iconLocation: "023-prayer"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Silent Ally", description: "",
            location: "", acquiredFrom: "Given by Orbeck of Vinheim after you've purchased fifteen spells " +
            "and speak to him. Note : if Firelink Shrine is reloaded while all spells from Orbeck are " +
            "purchased, he will leave and the player will not be able to get the gesture until the next New Game.",
            guide: "", isCollected: false, iconLocation: "024-silentally"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Rest", description: "", location: "",
            acquiredFrom: "Received after resting at a bonfire for the first time.", guide: "",
            isCollected: false, iconLocation: "025-rest"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Collapse", description: "", location: "",
            acquiredFrom: "Received from meeting Hawkwood.", guide: "", isCollected: false,
            iconLocation: "026-collapse"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Patches Squat", description: "",
            location: "", acquiredFrom: "Talk to Patches while he's squatting in Firelink Shrine.", guide: "",
            isCollected: false, iconLocation: "027-patchessquat"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Prostration", description: "",
            location: "", acquiredFrom: "Recieved from Patches after replying No when he asks for forgiveness " +
            "in Firelink Shrine, or after confronting him in the Cathedral of the Deep after he lowers the " +
            "bridge with You know who I am.", guide: "", isCollected: false,
            iconLocation: "028-prostation"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Toast", description: "", location: "",
            acquiredFrom: "Recieved by talking to Siegward of Catarina after assisting him in defeating the " +
            "Demon on the way to the Road of Sacrifices. Can similarly be received in the kitchen near the " +
            "Distant Manor in Irithyll of the Boreal Valley if previously missed.", guide: "", isCollected: false,
            iconLocation: "029-toast"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Sleep", description: "", location: "",
            acquiredFrom: "After receiving the Toast gesture from Siegward of Catarina, wait for him to go to " +
            "sleep. Then attempt to talk to him again. If missed the first time you meet Siegward, it is " +
            "possible to get it from him in the kitchen in Irythyll.", guide: "", isCollected: false,
            iconLocation: "030-sleep"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Curl Up", description: "", location: "",
            acquiredFrom: "Recieved from Greirat of the Undead Settlement after giving him Loretta's bone. " +
            "At some point upon returning to Firelink, he will be in this pose, mourning Loretta. Attempt to " +
            "talk to him to receive the gesture.", guide: "", isCollected: false,
            iconLocation: "031-curlup"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Stretch Out", description: "",
            location: "", acquiredFrom: "Found in the Profaned Capital on corpse which looks like Laddersmith " +
            "Gilligan from Dark Souls 2, next to the first bonfire.", guide: "", isCollected: false,
            iconLocation: "032-stretch"))
        mastOfExpressionCollection.append(ItemSeed(belongsTo: 15, name: "Path of the Dragon", description: "",
            location: "", acquiredFrom: "Received from corpse after Oceiros, the Consumed King. This is " +
            "necessary to access Archdragon Peak.", guide: "", isCollected: false,
            iconLocation: "033-dragon"))
    }
}
