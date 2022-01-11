//
//  ViewController.swift
//  HelloEarth
//
//  Created by Jae Lee on 1/9/22.
//

import UIKit

class ViewController: UIViewController {

    var mbTilesFetcher : MaplyMBTileFetcher? = nil
    var imageLoader : MaplyQuadImageLoader? = nil

    private var theViewC : WhirlyGlobeViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        theViewC = WhirlyGlobeViewController()
        self.view.addSubview(theViewC!.view)
        theViewC!.view.frame = self.view.bounds
        addChild(theViewC!)

        theViewC!.clearColor = UIColor.black
        theViewC!.frameInterval = 2

        mbTilesFetcher = MaplyMBTileFetcher(mbTiles: "geography-class_medres")

        let sampleParams = MaplySamplingParams()
        sampleParams.coordSys = mbTilesFetcher!.coordSys()
        sampleParams.coverPoles = true
        sampleParams.edgeMatching = true
        sampleParams.minZoom = mbTilesFetcher!.minZoom()
        sampleParams.maxZoom = mbTilesFetcher!.maxZoom()
        sampleParams.singleLevel = true

        imageLoader = MaplyQuadImageLoader(params: sampleParams,
            tileInfo: mbTilesFetcher!.tileInfo(),
            viewC: theViewC!)
        imageLoader!.setTileFetcher(mbTilesFetcher!)
        imageLoader!.baseDrawPriority = kMaplyImageLayerDrawPriorityDefault

        if let theViewC = theViewC {
            theViewC.height = 0.8
            theViewC.animate(toPosition: MaplyCoordinateMakeWithDegrees(-3.6704, 40.5023),
            time: 1.0)
        }
    }
}
