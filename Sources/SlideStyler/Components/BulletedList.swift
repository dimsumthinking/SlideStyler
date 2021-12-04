import Foundation


public struct BulletedList: Codable, Identifiable {
  public private(set) var id = UUID()
  public private(set) var bullets = [Bullet]()
}

extension BulletedList {
  public init(bullets: [String]) {
    for bullet in bullets {
      self.bullets.append(Bullet(contents: bullet))
    }
  }
}

extension  BulletedList: CustomStringConvertible {
  public var description: String {
    bullets.reduce(""){bulletsDescription, line in
      bulletsDescription + "\n" + line.description
    }
  }
}
