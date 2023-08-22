//
//  File.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 21/08/23.
//

import Foundation

enum GhostModel {
    case kuyang, tuyul, pocong, kuntilanak, genderuwo
    
    var imageName: String {
        switch self {
        case .kuyang: return "Kuyang"
        case .tuyul: return "Tuyul"
        case .pocong: return "Pocong"
        case .kuntilanak: return "Kuntilanak"
        case .genderuwo: return "Genderuwo"
        }
    }
    
    var name: String {
        switch self {
        case .kuyang: return "Kuyang"
        case .tuyul: return "Tuyul"
        case .pocong: return "Pocong"
        case .kuntilanak: return "Kuntilanak"
        case .genderuwo: return "Genderuwo"
        }
    }
    
    var originPlace: String {
        switch self {
        case .kuyang: return "Kalimantan"
        case .tuyul: return "Jawa"
        case .pocong: return "Jawa & Sumatera"
        case .kuntilanak: return "Kalimantan & Jawa"
        case .genderuwo: return "Yogyakarta"
        }
    }
    
    var story: String {
        switch self {
        case .kuyang: return "Kuyang is a folklore about a demon in the form of a human head with body contents attached without skin and limbs that can fly to find the blood of a baby or a woman's blood after giving birth. This creature is known to the people in Kalimantan. Kuyang is told as a human (woman) who demands the teachings of black magic to achieve eternal life.y"
            
        case .tuyul: return "Tuyul in the mythology of the island of Java and its surroundings, is a spirit in the form of a dwarf or a small child with a shaved head, who is believed to be able to steal money for his master. The myth about the money-stealing bald devil has existed since the 1890s, but the term tuyul only appeared around 1929 after the economic crisis of the Great Depression. Tuyul is a myth that has been studied by many historians because it is still believed by modern society to this day. Historians argue that initially tuyul arose due to the social gap between agrarian society and landlords and traders, and the help of spirits was considered the easiest way to explain all the increasingly complicated commercial affairs for people in villages that were still traditional."
            
        case .pocong: return "Pocongs come in all shapes and sizes, depending on not only the physical appearance of the deceased at the time of death, but also on the state of the corpse's decomposition as well. The pocong of a person who has been dead for years would be more skeletal in appearance, whereas the pocong of a recently deceased person would retain a fair resemblance to his or her former self, save for some minor decomposition. Typically, a 'fresh' pocong is described as having a pale face and wide open eyes. Multiple sources mentioned a pocong with dark face and glowing red eyes, a decayed pocong with white featureless eye, and a flat-faced pocong with empty eye sockets. Although popular culture often depicts pocongs hopping like rabbits due to the tie under their feet rendering the ghosts unable to walk, genuine pocongs are said to move around by floating above the ground"
            
        case .kuntilanak: return "Generally, kuntilanak is described as a beautiful woman with long hair and a long white dress. In Malay folklore, the figure of kuntilanak is depicted in the form of a beautiful woman with a hollow back. Kuntilanak is portrayed as delighting to terrorize the villagers for retaliation. When the Kuntilanak appears on the full moon, it always rhymes with the smell of frangipani flowers. It is said that men who are not careful can be killed after the kuntilanak changes into a blood-sucking petty that has intercourse with the kuntilanak. Therefore, this story may be aimed at avoiding women's groups rather than being harassed by youths who are afraid of kuntilanak when walking alone on a quiet street."
            
        case .genderuwo: return "Genderuwo is a Javanese myth about a kind of jinn or spirits in the form of human beings similar to apes, who have large and muscular bodies with reddish-black skin, their bodies covered with dense hair that grows all over their bodies. Genderuwo is known most widely in the community on the island of Java, Indonesia. The Sundanese call it gandaruwa and the Javanese generally call it gendruwo. His favorite residential habitat is watery stones, old buildings, large shady trees or damp, lonely and dark corners. According to the myth, the center of this creature's domicile is believed to be in forest areas such as the Teak Forest of the Danalaya Nature Reserve, Slogohimo sub-district, about 60 km east of Wonogiri, and in the Lemah Putih area, Purwosari, Girimulyo in Kulon Progo, about 60 km to the west of Yogyakarta, and also Mount Ratu Lamongan."
        }
    }
}
