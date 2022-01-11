//
//  ViewController.swift
//  HelloEarth
//
//  Created by Jae Lee on 1/9/22.
//

import UIKit

class ViewController: UIViewController {

    var imageLoader : MaplyQuadImageLoader? = nil

    private var theViewC : WhirlyGlobeViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        theViewC = WhirlyGlobeViewController()
        self.view.addSubview(theViewC!.view)
        theViewC!.view.frame = self.view.bounds
        addChild(theViewC!)

        /* Black background for globe */
        theViewC!.clearColor = UIColor.black
        /* 60 FPS */
        theViewC!.frameInterval = 1

        let cacheDir = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
        let thisCacheDir = "\(cacheDir)/stamentiles/"
        let maxZoom = Int32(16)
        let tileInfo = MaplyRemoteTileInfoNew(baseURL: "http://tile.stamen.com/watercolor/{z}/{x}/{y}.png",
                                              minZoom: Int32(0),
                                              maxZoom: Int32(maxZoom))
        tileInfo.cacheDir = thisCacheDir

        let sampleParams = MaplySamplingParams()
        sampleParams.coordSys = MaplySphericalMercator(webStandard: ())
        sampleParams.coverPoles = true
        sampleParams.edgeMatching = true
        sampleParams.minZoom = tileInfo.minZoom
        sampleParams.maxZoom = tileInfo.maxZoom
        sampleParams.singleLevel = true

        imageLoader = MaplyQuadImageLoader(params: sampleParams, tileInfo: tileInfo, viewC: theViewC!)
        imageLoader!.baseDrawPriority = kMaplyImageLayerDrawPriorityDefault

        if let theViewC = theViewC {
            theViewC.height = 0.8
            theViewC.animate(toPosition: MaplyCoordinateMakeWithDegrees(-3.6704, 40.5023),
            time: 1.0)
        }
    }
}
