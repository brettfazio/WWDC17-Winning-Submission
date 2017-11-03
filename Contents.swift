//: Playground - noun: a place where people can play

// TODO: Mabye add a timer?
// TODO: Center text, center answer animation

// BUGS: Move the circle animation block into the completion block of the movement of the number
// BUGS: ANIMATE CIRCLE
// BUGS: WRONG ANSWER ANIMATIONS

// DOES NOt WOrK

import UIKit
import PlaygroundSupport
import GameplayKit
import SceneKit
import SpriteKit
import MapKit

var canTouch : Bool = true;

class Tile : UIView {
    
    var view : UILabel = UILabel(frame: .zero)
    var value : Int
    var touching : Bool
    
    public init(number : Int, x: Int, y : Int) {
        value = number
        touching = false
        super.init(frame:CGRect(x: Int(x), y: y, width: 50, height: 50))
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor.black.cgColor
        view = UILabel(frame:CGRect(x: 0, y: 0, width: 50, height: 50))
        view.textAlignment = .center
        view.font = UIFont.boldSystemFont(ofSize: 40)
        view.text = valueText()
        view.textColor = UIColor.black
        self.addSubview(view)
        
    }
    
    func valueText() -> String? {
        return "\(value)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //let date = Date()
        //print("touched button \(date)")
        if (canTouch) {
            
            
            // perform animation
            canTouch = false
            touching = true
            // set canTouch to true after the animation thing is done
            
            super.touchesBegan(touches, with: event)
        }
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}

class BrettLabel : UIView {
    
    var label : UILabel = UILabel(frame: .zero)
    
    var touching : Bool = false
    
    public init(f : CGRect, data : String) {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: f.width, height: f.height))
        super.init(frame: f)
        
        label.text = data
        label.numberOfLines = 3
        label.contentScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        self.addSubview(label)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        touching = true
        //print("touched BrettLabel")
        superview?.touchesBegan(touches, with: event)
    }
    
    
}

class MiniView : UIView {
    
    var tapped : Bool
    
    public init(f : CGRect, dummy : String, mod1 : Double, mod2 : Double) {
        tapped = false
        super.init(frame: f)
        
        let imagev : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        imagev.image = UIImage(named: "x_in_circle.png")
        
        self.addSubview(imagev)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("MiniView tapped")
        
        tapped = true
        super.touchesBegan(touches, with: event)
    }
}

class ModifierView : UIView {
    public init(f : CGRect, dummy : String, mod1 : Double, mod2 : Double) {
        
        super.init(frame: f)
        
        let split = dummy.characters.split(separator: ",").map(String.init)
        
        let first : String = split[0]
        let second : String = split[1]
        
        //print("In modifierView, first = \(first) second = \(second)")
        
        self.layer.cornerRadius = 15
        if (first == "maphome") {
            let mapview : MKMapView = MKMapView(frame: CGRect(x: 0, y: 0, width: 198, height: 178))
            self.addSubview(mapview)
            mapview.layer.cornerRadius = 15
            let annotation : MKPointAnnotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: mod1, longitude: mod2)
            mapview.addAnnotation(annotation)
        }else if (first == "showimage") {
            let imageview : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 198, height: 178))
            imageview.image = UIImage(named: second)
            imageview.contentMode = .scaleAspectFit
            self.addSubview(imageview)
            imageview.layer.cornerRadius = 15
        }else if (first == "mapcontests") {
            let mapview : MKMapView = MKMapView(frame: CGRect(x: 0, y: 0, width: 198, height: 178))
            self.addSubview(mapview)
            mapview.layer.cornerRadius = 15
            // timber creek
            let annotation : MKPointAnnotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: 28.52680, longitude: -81.147960)
            
            // ucf
            let a2 : MKPointAnnotation = MKPointAnnotation()
            a2.coordinate = CLLocationCoordinate2D(latitude: 28.602207, longitude: -81.200195)
            // fiu
            let a3 : MKPointAnnotation = MKPointAnnotation()
            a3.coordinate = CLLocationCoordinate2D(latitude: 25.756257, longitude: -80.374035)
            // uf
            let a4 : MKPointAnnotation = MKPointAnnotation()
            a4.coordinate = CLLocationCoordinate2D(latitude: 29.649563, longitude: -82.349534)
            
            // lockheed martin
            let a5 : MKPointAnnotation = MKPointAnnotation()
            a5.coordinate = CLLocationCoordinate2D(latitude: 28.444074, longitude: -81.459811)
            
            // stetson
            let a6 : MKPointAnnotation = MKPointAnnotation()
            a6.coordinate = CLLocationCoordinate2D(latitude: 29.035711, longitude: -81.302213)
            
            // cypress bay
            let a7 : MKPointAnnotation = MKPointAnnotation()
            a7.coordinate = CLLocationCoordinate2D(latitude: 26.065112, longitude: -80.397234)
            
            mapview.addAnnotation(annotation)
            mapview.addAnnotation(a2)
            mapview.addAnnotation(a3)
            mapview.addAnnotation(a4)
            mapview.addAnnotation(a5)
            mapview.addAnnotation(a6)
            mapview.addAnnotation(a7)
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PopUpView : UIView {
    
    var button : MiniView
    var label : UILabel
    var modview : ModifierView
    
    var close : Bool
    
    public init(data : String) {
        close = false
        label = UILabel(frame: CGRect(x: 0, y: 20, width: 200, height: 180))
        //label.layer.backgroundColor = UIColor.red.cgColor
        label.text = data
        
        let split = data.characters.split(separator: ",").map(String.init)
        
        let first : String = split[0]
        let second : String = split[1]
        button = MiniView(f: CGRect(x: 175, y: 0, width: 30, height: 30), dummy : "_,_", mod1: 0.0, mod2: 0.0)
        
        label.text = second
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.layer.cornerRadius = 15
        
        
        modview = ModifierView(f: CGRect(x: 0, y: 20, width: 200, height: 180), dummy : "_,_", mod1: 0.0, mod2: 0.0)
        //print("In PopUpView about to check what first is ")
        if (first == "maphome") {
            label.text = ""
            modview = ModifierView(f: CGRect(x: 1, y: 21, width: 198, height: 178), dummy: ("maphome,_"), mod1: 28.517050, mod2: -81.168784)
        }else if (first == "showimage") {
            label.text = ""
            modview = ModifierView(f: CGRect(x: 1, y: 21, width: 198, height: 178), dummy: (data), mod1: 0.0, mod2: 0.0)
        }else if (first == "mapcontests") {
            label.text = ""
            modview = ModifierView(f: CGRect(x: 1, y: 21, width: 198, height: 178), dummy: ("mapcontests,_"), mod1: 0.0, mod2: 0.0)
        }else if (first == "text") {
            label.layer.backgroundColor = UIColor.white.cgColor
            modview = ModifierView(f: CGRect(x: 1, y: 21, width: 198, height: 178), dummy: (data), mod1: 0.0, mod2: 0.0)
        }
        
        
        //button.layer.backgroundColor = UIColor.purple.cgColor
        
        super.init(frame: CGRect(x: 55, y: -200, width: 200, height: 200))
        self.layer.cornerRadius = 15
        self.layer.backgroundColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0).cgColor
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        
        self.addSubview(label)
        self.addSubview(button)
        self.addSubview(modview)
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("PopUpView tapped button.tapped = \(button.tapped)")
        if (button.tapped) {
            close = true
        }
        super.touchesBegan(touches, with: event)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class PhysicsScene: SKScene {
    var sprite: SKSpriteNode!
    var touchPoint: CGPoint = CGPoint()
    
    var touching: Bool = false
    
    var hits : Int = 0
    
    var check : Bool = false
    
    override func didMove(to: SKView) {
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        //sprite = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 50))
        sprite = SKSpriteNode(imageNamed: "grayball65.png")
        sprite.physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        sprite.position = CGPoint(x: self.size.width/2.0, y: self.size.height/2.0)
        sprite.physicsBody?.usesPreciseCollisionDetection = false
        //        sprite.speed = 0.5
        self.addChild(sprite)
    }
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        if sprite.frame.contains(location) {
            touchPoint = location
            touching = true
        }
    }
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        touchPoint = location
        sprite.position = location
    }
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touching = false
        
        //print("touches ended")
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        if touching && ((Int)(currentTime.binade))%2 == 0 {
            //let dt:CGFloat = 1.0/60.0
            //let distance = CGVector(dx: touchPoint.x-sprite.position.x, dy: touchPoint.y-sprite.position.y)
            let zerov = CGVector(dx: 0, dy: 0)
            sprite.physicsBody!.velocity = zerov
            //            let velocity = CGVector(dx: distance.dx/dt, dy: distance.dy/dt)
            //            sprite.physicsBody!.velocity=velocity
            //            sprite.physicsBody?.affectedByGravity = false
            check = true
            
        }
        
        if !touching && check {
            //            sprite.physicsBody?.affectedByGravity = true
            check = false
            hits += 1
        }
        
        
    }
}

class GameView : UIView {
    
    var numberFirst : Int
    var numberSecond : Int
    var add : Bool
    
    var label : UILabel = UILabel(frame: .zero)
    
    var done : Int
    
    var buttons  = [Tile]()
    
    var bars = [UIView]()
    
    var information = [String]()
    
    var infoviews = [BrettLabel]()
    
    var pscene : PhysicsScene
    
    var physicsView : Bool
    
    var lastHit : Int
    
    var touchMoreInfo :Bool
    
    var popUpIsUp : Bool
    
    var skview : SKView
    
    var animatingPopUpAway : Bool
    
    var popUps = [PopUpView]()
    
    let GREEN = UIColor(red:0.34, green:0.70, blue:0.24, alpha:1.0)
    let YELLOW = UIColor(red:0.99, green:0.69, blue:0.14, alpha:1.0)
    let ORANGE = UIColor(red:0.96, green:0.46, blue:0.11, alpha:1.0)
    let RED = UIColor(red:0.86, green:0.20, blue:0.21, alpha:1.0)
    let PURPLE = UIColor(red:0.57, green:0.21, blue:0.55, alpha:1.0)
    let BLUE = UIColor(red:0.00, green:0.58, blue:0.84, alpha:1.0)
    
    public init() {
        
        // Trivial, just set them to zero
        // to avoid erroring the super.init()
        
        touchMoreInfo = false
        popUpIsUp = false
        self.numberFirst = 0
        self.numberSecond = 0
        self.add = false
        
        animatingPopUpAway = false
        
        lastHit = -1
        
        physicsView = false
        
        pscene = PhysicsScene()
        
        skview = SKView()
        
        done = 0
        
        super.init(frame: CGRect(x: 0, y: 0, width: 310, height: 480))
        
        self.randomizeExpression()
        self.fillInformation()
        self.makeInfoLabels()
        
        var tempd = 0
        for i in 0...5 {
            let temp = UIView(frame: CGRect(x: 0, y: tempd, width: 310, height: 80))
            if (i == 0) {
                temp.backgroundColor = GREEN
            }else if (i == 1) {
                temp.backgroundColor = YELLOW
            }else if (i == 2) {
                temp.backgroundColor = ORANGE
            }else if (i == 3) {
                temp.backgroundColor = RED
            }else if (i == 4) {
                temp.backgroundColor = PURPLE
            }else {
                temp.backgroundColor = BLUE
            }
            
            self.bars.append(temp)
            
            tempd += 80
        }
        
        self.backgroundColor = UIColor.white
        
        
        
        label = UILabel(frame: CGRect(x: 10, y: 200, width: 310, height: 50))
        
        label.textAlignment = .center
        
        self.setLabel()
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.textColor = UIColor.black
        self.addSubview(label)
        // COPY STUFF DELETE
        
        
        
        
        
        // let c = UILabel(frame: CGRect(x: (self.frame.width - self.label.intrinsicContentSize.width)/2+self.label.intrinsicContentSize.width+12, y: 200, width: 30, height: 50))
        
        //        let c = UILabel(frame: CGRect(x: 40, y: 340, width: 30, height: 50))
        //
        //        c.textAlignment = .center
        //
        //        c.text = "6"
        //        c.font = UIFont.boldSystemFont(ofSize: 45)
        //        c.textColor = UIColor.red
        //        self.addSubview(c)
        //
        //        UIView.animate(withDuration: 1, animations: {
        //            c.frame = CGRect(x: (self.frame.width - self.label.intrinsicContentSize.width)/2+self.label.intrinsicContentSize.width+12, y: 200, width: 30, height: 50)
        //        }, completion: { (valu: Bool) in
        //
        //            self.animateCircle(color: UIColor.red.cgColor,label: c)
        //        })
        
        
        
        // END DELETE
        
        var down:Int = 340
        var across:Int = 40
        for i in 1...3 {
            let temp = Tile(number: i, x: across, y: down)
            buttons.append(temp)
            temp.layer.zPosition = 1000
            self.addSubview(temp)
            temp.layer.zPosition = 1000
            
            across += 40+50
        }
        
        
        
        down = 410
        across = 40
        
        for i in 4...6 {
            let temp = Tile(number: i, x: across, y: down)
            buttons.append(temp)
            temp.layer.zPosition = 1000
            self.addSubview(temp)
            temp.layer.zPosition = 1000
            across += 40+50
        }
        
        // START DELETE
        //        self.transitionToPhysicsBall()
        // END
        
        // END INIT
        
    }
    
    func fillInformation() {
        information.append("My name is Brett Fazio and I am a 16 year old student from Orlando, FL.")
        information.append("I started programming in my freshman year of high school in Java.")
        information.append("My sophmore year I got a Mac and began to teach my self Objective-C.")
        information.append("I have published two apps to the Apple App Store (Todogorithm and Quoter) with plans to launch a third come summer.")
        information.append("Besides development, I also am a member of my schools programming team (click on this label to see where I have competed).")
        information.append("In addition to programming I also love math and international relations. Tap on any label to learn more!")
        
    }
    
    func makeInfoLabels() {
        var x = 310
        var y =  0
        for var i in 0..<6 {
            let temp = BrettLabel(f: CGRect(x: x, y: y, width: 310, height: 80), data: information[i])
            y += 80
            infoviews.append(temp)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func equationText() -> String? {
        var makeString = "";
        
        makeString = "\(numberFirst) "
        
        if (add) {
            makeString += "+ "
        }else {
            makeString += "- "
        }
        
        makeString += "\(numberSecond) = "
        
        return makeString
    }
    
    func setLabel() {
        self.label.text =  equationText()
    }
    
    func randomizeExpression() {
        self.numberFirst = Int(arc4random_uniform(21))+1
        self.numberSecond = Int(arc4random_uniform(21))+1
        let addorsub = Int(arc4random_uniform(2))
        
        if (addorsub == 1) {
            self.add = true
        }else {
            self.add = false
        }
        
        if (self.add) {
            var diff = self.numberFirst + self.numberSecond
            while ((diff) < 1 || (diff) > 6) {
                self.numberFirst = Int(arc4random_uniform(21))+1
                self.numberSecond = Int(arc4random_uniform(21))+1
                diff = self.numberFirst + self.numberSecond
            }
        }else if (!self.add) { // sub
            var diff = self.numberFirst - self.numberSecond
            while ((diff) < 1 || (diff) > 6) {
                self.numberFirst = Int(arc4random_uniform(21))+1
                self.numberSecond = Int(arc4random_uniform(21))+1
                diff = self.numberFirst - self.numberSecond
            }
        }
    }
    
    func animateToNextBar(cir : CAShapeLayer, lab : UILabel) {
        CATransaction.begin()
        
        
        CATransaction.setCompletionBlock {
            cir.removeFromSuperlayer()
        }
        
        let x : Int = 140
        let y : Int = 80*done + 10
        
        let animation = CABasicAnimation(keyPath: "position")
        //        animation.isRemovedOnCompletion = true
        //        animation.fillMode = kCAFillModeForwards
        animation.duration = 1
        
        let point = CGPoint(x: x, y: y)
        
        animation.fromValue = layer.value(forKey: "position")
        animation.toValue = point
        
        cir.position = point
        cir.removeAllAnimations()
        cir.add(animation, forKey: "animateCircleMovement")
        
        
        CATransaction.commit()
        
        UIView.animate(withDuration: 1, animations: {
            lab.frame = CGRect(x: x, y: y, width: 30, height: 50)
        }, completion: { (value: Bool) in
            lab.removeFromSuperview()
            canTouch = true
            self.bars[self.done].layer.opacity = 0.0
            
            UIView.animate(withDuration: 1, animations: {
                self.bars[self.done].layer.opacity = 1.0
            })
            
            self.addSubview(self.bars[self.done])
            self.sendSubview(toBack: self.bars[self.done])
            self.bars[self.done].layer.zPosition = -10
            self.done += 1
            
            if (self.done == 6) {
                // TODO: DONE ALL SIX BARS
                self.physicsView = true
                self.transitionToPhysicsBall()
                self.done = 0
            }else {
                // give the user a new equation
                self.randomizeExpression()
                self.setLabel()
            }
            
        })
    }
    
    func transitionToPhysicsBall() {
        for var i in 0..<buttons.count {
            buttons[i].removeFromSuperview()
        }
        self.label.removeFromSuperview()
        
        //        let scene : SKScene = SKScene(size: CGSize(width: 310, height: 480))
        //        let ball : SKSpriteNode = SKSpriteNode(color: UIColor.gray, size: CGSize(width: 30, height: 30))
        //        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
        //        ball.physicsBody!.isDynamic = false
        //        ball.position = CGPoint(x: 150, y: 240)
        //        scene.addChild(ball)
        //
        //        let floor = SKSpriteNode(color: UIColor.cyan, size: CGSize(width: self.frame.size.width, height: 20))
        //
        //        floor.anchorPoint = CGPoint(x: 0, y: 0)
        //        floor.name = "floor"
        //        floor.physicsBody = SKPhysicsBody(edgeLoopFrom: floor.frame)
        //        floor.physicsBody?.isDynamic = false
        //
        //        scene.addChild(floor)
        //
        //        let worldBorder = SKPhysicsBody(edgeLoopFrom: self.frame)
        //        scene.physicsBody = worldBorder
        
        
        let templab = UILabel(frame: bars[0].frame)
        templab.text = "Pick up and drop the ball for more!"
        templab.textAlignment = .center
        bars[0].addSubview(templab)
        
        pscene = PhysicsScene(size: self.frame.size)
        pscene.backgroundColor = UIColor.clear
        skview = SKView(frame: self.frame)
        skview.backgroundColor = UIColor.clear
        skview.presentScene(pscene)
        self.addSubview(skview)
    }
    
    func animateCircle(color : CGColor, label : UILabel) {
        CATransaction.begin()
        let circle: CAShapeLayer!
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: (self.frame.width - self.label.intrinsicContentSize.width)/2+self.label.intrinsicContentSize.width+12+17, y:225), radius: 25, startAngle: 0.0, endAngle: CGFloat(Double.pi * 2.0 + 2), clockwise: true)
        
        circle = CAShapeLayer()
        circle.path = circlePath.cgPath
        circle.fillColor = UIColor.clear.cgColor
        circle.strokeColor = color
        circle.lineWidth = 5.0
        circle.strokeEnd = 0.0
        self.layer.addSublayer(circle)
        
        CATransaction.setCompletionBlock {
            self.animateToNextBar(cir : circle, lab: label)
        }
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.isRemovedOnCompletion = true
        animation.fillMode = kCAFillModeForwards
        animation.duration = 1.3
        animation.fromValue = 0
        animation.toValue = 1
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        circle.strokeEnd = 1.0
        circle.add(animation, forKey: "animateCircle")
        
        
        CATransaction.commit()
        
        
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //let currentDate = Date()
        //print("touches \(currentDate)")
        //print("GameView touchesBegin")
        
        if animatingPopUpAway {
            return
        }
        
        if (touchMoreInfo) {
            //print("in touchMoreInfo popUps.count = \(popUps.count)")
            var cnt : Int = 0
            var rem : Bool = false
            for pu in popUps {
                //print("In popUps, pu.close = \(pu.close)")
                if (pu.close) {
                    

                    animatingPopUpAway = true
                    UIView.animate(withDuration: 0.6, animations: {
                        pu.frame = CGRect(x: 55, y: 600, width: 200, height: 200)

                    }, completion: { (value : Bool) in
                        self.animatingPopUpAway = false
                        pu.removeFromSuperview()
                        self.popUps.remove(at: 0)
                    })
                    
                    rem = true
                    cnt -= 1
                }
                cnt+=1
            }
            
            if (cnt > 0 || rem) {
                return
            }
            //print("completed popUps loop")
            var infoViewTapped : Int =  0
            cnt = 0
            for brettl in infoviews {
                //print("infoviews loop \(cnt)")
                if brettl.touching {
                    brettl.touching = false
                    infoViewTapped = cnt
                    break
                }
                cnt += 1
            }
            
            //print("after infoviews loop infoViewTapped = \(infoViewTapped)")
            
            var datasend : String = "_,_"
            
            if (infoViewTapped == 0) {
                datasend = "maphome,_"
            }else if (infoViewTapped == 1) {
                datasend = "showimage,helloworld.png"
            }else if (infoViewTapped == 2) {
                datasend = "showimage,obj_c_nslog.png"
            }else if (infoViewTapped == 3) {
                datasend = "showimage,combined_quoter_todogorithm.png"
            }else if (infoViewTapped == 4) {
                datasend = "mapcontests,_"
            }else if (infoViewTapped == 5) {
                datasend = "text,My like for the subject of math is shown in the interative game at the beginning. For international relations I have a love for history and science of politics."
            }
            
            //print("datasend after statements  = \(datasend)")
            
            let temp : PopUpView = PopUpView(data: datasend)
            
            UIView.animate(withDuration: 1, animations: {
                temp.frame = CGRect(x: 55, y: 120, width: 200, height: 200)
            })
            
            //print("made temp")
            
            self.addSubview(temp)
            
            //print("added temp to subview")
            
            popUps.append(temp)
            
            //print("at end")
            
            return
        }
        
        for tile in buttons {
            if (tile.touching) {
                tile.touching = false
                var neededValue = 0
                
                if (add) {
                    neededValue = numberFirst + numberSecond
                }else {
                    neededValue = numberFirst - numberSecond
                }
                
                
                let copy = UILabel(frame: tile.frame)
                copy.textAlignment = .center
                copy.font = UIFont.boldSystemFont(ofSize: 45)
                copy.text = tile.view.text
                copy.textColor = UIColor.black
                
                UIView .animate(withDuration: 0.4, animations: {
                    //tile.layer.backgroundColor = UIColor(red:0.00, green:0.11, blue:0.36, alpha:1.0).cgColor
                    if (neededValue == tile.value) {
                        tile.layer.backgroundColor = UIColor.green.cgColor
                    }else {
                        tile.layer.backgroundColor = UIColor.red.cgColor
                    }
                }, completion: { (value: Bool) in
                    
                    UIView .animate(withDuration: 0.4, animations: {
                        tile.layer.backgroundColor = UIColor.clear.cgColor
                    })
                })
                
                
                
                self.addSubview(copy)
                
                if (neededValue == tile.value) {
                    // I GOT THE CORRECT ANSWER
                    
                    UIView.animate(withDuration: 1, animations: {
                        copy.frame = CGRect(x: (self.frame.width - self.label.intrinsicContentSize.width)/2+self.label.intrinsicContentSize.width+12, y: 200, width: 30, height: 50)
                    }, completion: { (value: Bool) in
                        
                        self.animateCircle(color: UIColor.green.cgColor,label: copy)
                    })
                    
                    
                }else {
                    // I GOT IT WRONG :(
                    UIView.animate(withDuration: 1, animations: {
                        copy.frame = CGRect(x: (self.frame.width - self.label.intrinsicContentSize.width)/2+self.label.intrinsicContentSize.width+12, y: 200, width: 30, height: 50)
                    }, completion: { (value: Bool) in
                        
                        self.animateIncorrectCircle(color: UIColor.red.cgColor,label: copy)
                    })
                    
                }
                
                
                
                
            }
        }
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.done == 6) {
            //print("self.done = 6, touchMoreInfo will be set to true")
            self.touchMoreInfo = true
            self.skview.removeFromSuperview()
        }
        else if (self.physicsView && self.pscene.hits != lastHit) {
            lastHit = self.pscene.hits
            
            UIView.animate(withDuration: 1, animations: {
                self.bars[self.done].frame = CGRect(x: 0, y: self.done*80, width: 0, height: 80)
            })
            
            if (self.done == 0) {
                UIView.animate(withDuration: 1, animations: {
                    self.bars[self.done].subviews[0].frame = CGRect(x: 0, y: self.done*80, width: 0, height: 80)
                })
            }
            
            let touch = touches.first!
            let location = touch.location(in: self)
            
            
            self.addSubview(self.infoviews[self.done])
            self.sendSubview(toBack: self.infoviews[self.done])
            UILabel.animate(withDuration: 1, animations: {
                self.infoviews[self.done].frame = CGRect(x: 0, y: self.done*80, width: 310, height: 80)
            })
            
            self.done += 1
            
        }
        
    }
    
    func animateIncorrectCircle(color: CGColor, label: UILabel) {
        CATransaction.begin()
        let circle: CAShapeLayer!
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: (self.frame.width - self.label.intrinsicContentSize.width)/2+self.label.intrinsicContentSize.width+12+17, y:225), radius: 25, startAngle: 0.0, endAngle: CGFloat(Double.pi * 2.0 + 2), clockwise: true)
        
        circle = CAShapeLayer()
        circle.path = circlePath.cgPath
        circle.fillColor = UIColor.clear.cgColor
        circle.strokeColor = color
        circle.lineWidth = 5.0
        circle.strokeEnd = 0.0
        self.layer.addSublayer(circle)
        
        CATransaction.setCompletionBlock {
            self.animateWrong(cir : circle, lab: label)
        }
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.isRemovedOnCompletion = true
        animation.fillMode = kCAFillModeForwards
        animation.duration = 1.3
        animation.fromValue = 0
        animation.toValue = 1
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        circle.strokeEnd = 1.0
        circle.add(animation, forKey: "animateCircle")
        
        
        CATransaction.commit()
    }
    
    func animateWrong(cir : CAShapeLayer, lab : UILabel) {
        CATransaction.begin()
        
        
        CATransaction.setCompletionBlock {
            cir.removeFromSuperlayer()
        }
        
        let x : Int = 500
        let y : Int = 200
        
        let animation = CABasicAnimation(keyPath: "position")
        //        animation.isRemovedOnCompletion = true
        //        animation.fillMode = kCAFillModeForwards
        animation.duration = 1
        
        let point = CGPoint(x: x, y: y)
        
        animation.fromValue = layer.value(forKey: "position")
        animation.toValue = point
        
        cir.position = point
        cir.removeAllAnimations()
        cir.add(animation, forKey: "animateCircleMovement")
        
        
        CATransaction.commit()
        
        UIView.animate(withDuration: 1, animations: {
            lab.frame = CGRect(x: x, y: y, width: 30, height: 50)
        }, completion: { (value: Bool) in
            lab.removeFromSuperview()
            canTouch = true
            
            
        })
        
    }
    
}

var controller = GameView()
//PlaygroundPage.current.liveView = controller
//PlaygroundPage.current.needsIndefiniteExecution = true
