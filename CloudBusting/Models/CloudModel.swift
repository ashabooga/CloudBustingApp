import Foundation
import SwiftUI

public enum CloudAltitude: String {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    case various = "Various"
    case unknown = "Unknown"
}

struct CloudModel: Identifiable {
    
    var id: UUID
    var name: String
    var images: [String]
    var aboutInfo: String
    var altitude: CloudAltitude
    var precipitation: String
    var cloudsSimilarTo: [UUID: String]
    var cloudsToLookFor: [CloudModel]
    var cloudOfTheDayImage: String

    init(id: UUID, name: String, images: [String], aboutInfo: String, altitude: CloudAltitude, precipitation: String, cloudsSimilarTo: [UUID: String], cloudsToLookFor: [CloudModel], cloudOfTheDayImage: String) {
        self.id = id
        self.name = name
        self.images = images
        self.aboutInfo = aboutInfo
        self.altitude = altitude
        self.precipitation = precipitation
        self.cloudsSimilarTo = cloudsSimilarTo
        self.cloudsToLookFor = cloudsToLookFor
        self.cloudOfTheDayImage = cloudOfTheDayImage
    }
    

    static let Cumulus: CloudModel = CloudModel(id: UUID(), name: "Cumulus", images: ["Cumulus7", "Cumulus2", "Cumulus3", "Cumulus4", "Cumulus5", "Cumulus6"], aboutInfo: "If you’ve never spotted a Cumulus cloud, then you need to get out more. This has to be one of the easiest types to add to your cloud collection (which explains why it only earns one star). Cumulus clouds are the cotton-wool puffs, with flat bases, that drift lazily across the sky on a sunny day. Generally forming a few hours after daybreak, they tend to dissipate before sundown, for they form on thermals – invisible columns of air rising from the ground as it is warmed by the sun.\nMost forms of Cumulus produce no rain or snow, and so are known as fair-weather clouds. But in unstable air, their bright, crisp cauliflower mounds can build upwards so that they develop from the small humilis species, through mediocris to the largest form, Cumulus congestus. With its ominous, shadowy base, this cloud is no longer fair-weather. Congestus can produce brief but sizeable showers, and can keep growing into fierce Cumulonimbus storm clouds.\nThe little ones, by contrast, are scary only when they take the form of David Hasselhoff.", altitude: CloudAltitude.low, precipitation: "Showers, but only when very tall (Congestus)", cloudsSimilarTo: [:], cloudsToLookFor: [], cloudOfTheDayImage: "Cumulus1")

    static let Mamma: CloudModel = CloudModel(id: UUID(), name: "Mamma", images: ["Mamma1", "Mamma2"], aboutInfo: "‘What on Earth are those?’ is the usual reaction when people see photographs of mamma clouds. Also known as ‘mammatus’, these ‘supplementary features’ hang down from a layer of cloud in smooth or rough pouches that often have the appearance of udders (which is what ‘mamma’ means in Latin).\nWith such an otherworldly appearance, mamma are a must-have for any cloud collection. They can be found on a whole range of cloud types but the most dramatic examples occur on the underside of the huge anvils, known as incus, that spread out at the top of mature Cumulonimbus storm clouds and can cover all the visible sky.\nSome claim that mamma are harbingers of stormy weather, and what with the association between these cloud pouches and Cumulonimbus, you might think they have a point. But mamma tend to form at the rear, rather than the front, of storms. Once you see mamma formations above you, the storm has usually passed over, or missed you entirely.\nEach lobe of mamma is typically one to two miles across, and appears for around ten minutes. There are several theories about why they form, but an extensive 2006 scientific review of all the studies to date concluded that no one’s really sure.", altitude: CloudAltitude.various, precipitation: "None", cloudsSimilarTo: [:], cloudsToLookFor: [], cloudOfTheDayImage: "Mamma1")
    
    static let noImage: Image = Image("Cindy-Otter")
}
