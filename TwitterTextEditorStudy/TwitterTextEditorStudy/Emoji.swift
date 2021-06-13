//
//  EmojiMap.swift
//  TwitterTextEditorStudy
//
//  Created by Tomoki Kobayashi on 2021/01/31.
//

import Foundation

struct Emoji {
    var shortCode: String
    var character: Character
}

extension Emoji {
    
    static func filtered(by keyword: String) -> [Emoji] {
        guard !keyword.isEmpty else { return [] }
        let lowercasedKeyword = keyword.lowercased()
        return dictionary
            .filter({ $0.key.contains(lowercasedKeyword) })
            .enumerated()
            .map { Emoji(shortCode: $1.key, character: $1.value) }
    }
    
    static func emoji(for shortCode: String) -> Character? {
        return dictionary[shortCode]
    }
    
    private static let dictionary: [String: Character] = [
        "100": "💯",
        "airplane": "✈️",
        "alien": "👽",
        "anger": "💢",
        "anguished": "😧",
        "bamboo": "🎍",
        "bangbang": "‼️",
        "baseball": "⚾",
        "basketball": "🏀",
        "beer": "🍺",
        "beginner": "🔰",
        "bell": "🔔",
        "bike": "🚲",
        "birthday": "🎂",
        "blush": "😊",
        "bow": "🙇",
        "bulb": "💡",
        "bus": "🚌",
        "cake": "🍰",
        "car": "🚗",
        "cherry_blossom": "🌸",
        "clap": "👏",
        "cloud": "☁️",
        "coffee": "☕",
        "confetti_ball": "🎊",
        "congratulations": "㊗️",
        "cry": "😢",
        "cyclone": "🌀",
        "fearful": "😨",
        "fire": "🔥",
        "flushed": "😳",
        "four_leaf_clover": "🍀",
        "ghost": "👻",
        "gift": "🎁",
        "golf": "⛳",
        "grin": "😁",
        "hamburger": "🍔",
        "heart": "❤️",
        "heart_eyes": "😍",
        "hotsprings": "♨️",
        "icecream": "🍦",
        "imp": "👿",
        "interrobang": "⁉️",
        "jack_o_lantern": "🎃",
        "joy": "😂",
        "jp": "🇯🇵",
        "laughing": "😆",
        "mask": "😷",
        "meat_on_bone": "🍖",
        "metal": "🤘",
        "muscle": "💪",
        "musical_note": "🎵",
        "no_good": "🙅",
        "o": "⭕",
        "ok_hand": "👌",
        "ok_woman": "🙆‍♀️",
        "persevere": "😣",
        "pill": "💊",
        "poop": "💩",
        "punch": "👊",
        "rage": "😡",
        "raised_hands": "🙌",
        "raising_hand": "🙋",
        "ramen": "🍜",
        "relieved": "😌",
        "rice_ball": "🍙",
        "rocket": "🚀",
        "runner": "🏃",
        "santa": "🎅",
        "scream": "😱",
        "secret": "㊙️",
        "sleeping": "😴",
        "smile": "😄",
        "smoking": "🚬",
        "snowboarder": "🏂",
        "snowman": "⛄",
        "sob": "😭",
        "soccer": "⚽",
        "sos": "🆘",
        "star": "⭐",
        "stuck_out_tongue_closed_eyes": "😝",
        "sunglasses": "😎",
        "sunny": "☀️",
        "sushi": "🍣",
        "sweat": "😓",
        "sweat_drops": "💦",
        "sweat_smile": "😅",
        "tada": "🎉",
        "thumbsdown": "👎",
        "thumbsup": "👍",
        "train": "🚋",
        "u7981": "🈲",
        "umbrella": "☔",
        "v": "✌️",
        "weary": "😩",
        "white_flower": "💮",
        "x": "❌",
        "yum": "😋",
        "zap": "⚡"
    ]
}
