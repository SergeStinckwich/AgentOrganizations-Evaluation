visualization
radarChartView: view withNbMetrics: nbMetrics withLabel: xLabel withStandardMetrics: dStandardMetrics withOrgMetrics: dOrgMetrics
	
	| 	ellipseSize 
		colorEllipse colorLine colorStandard colorOrg	
		radarNbStages radarStageDegree radarCirleRadius 
		viewCenterPos 		  
		 		
		colPoints	   
		colEdges
		pointCenter
		aLine
		pos posValue posX posY |
	
	"*** Parameters"				
	ellipseSize := 5.	
	
	colorEllipse 	:= Color black alpha: 0.8.
	colorLine 		:= Color black alpha: 0.4.
	colorStandard 	:= Color red alpha: 0.8.
	colorOrg 			:= Color green alpha: 0.8.
	
	radarCirleRadius 	:= 50.	
	radarNbStages 		:= 4. 
	radarStageDegree 	:= 0.25.
	
	viewCenterPos := 0 @ 0.	
	
	colEdges := OrderedCollection new.	
		
	"colPoints do: [ :aPoint | view removeElement: aPoint ].
	colEdges do: [ :aEdge | view removeEdge: aEdge ].
	view elements do: #remove.
	view edges do: #remove."
		
	"*** Create elements"				
	pointCenter := (RTEllipse new size: ellipseSize; color: colorEllipse) element.
	pointCenter translateTo: viewCenterPos.	
	view add: pointCenter.				
		
	"Radar view"
	(1 to: radarNbStages) do:[ :i |
		
		colPoints := (RTEllipse new size: ellipseSize; color: colorEllipse) elementsOn: (1 to: nbMetrics). 						
		view addAll: colPoints.
	
		RTCircleLayout new initialRadius: (i * radarCirleRadius); on: colPoints.
		colPoints translateTo: viewCenterPos.
		
		pos := 0.
		colPoints do: [ :aPoint |
			pos := pos + 1.									
			
			(i = radarNbStages) ifTrue: [					
				"aPoint @ (RTLabelled new text: (xLabel at: pos ifAbsent: ''))."
				colEdges add: (RTLine edgeFrom: aPoint to: pointCenter). "connect to center element"
			] ifFalse: [
				(i = 1) ifTrue: [ 
					(pos = 1) ifTrue: [ 
						"connect to center element with degree"
						aLine := RTEdge from: aPoint to: pointCenter.
						aLine + (RTLine new color: colorLine).														
						view addAll: (Array with: aPoint with: pointCenter with: aLine).
						aLine @ (RTLabelled new text: (radarStageDegree asString)).
					]						
				]
			].	
			
			aPoint @ (RTPopup new text: (xLabel at: pos ifAbsent: '')).
			
			"Connect to beside element"
			colEdges add: (RTLine edgeFrom: aPoint to: (colPoints at: ((pos %  nbMetrics) + 1 ) ifAbsent: pointCenter)).
		].		
	].					
		
	"Create standard line"		
	colPoints := (RTEllipse new size: (2 * ellipseSize); color: colorStandard) elementsOn: (1 to: nbMetrics). 
	view addAll: colPoints.				
	
	pos := 0.	
	colPoints do: [ :aPoint |			
		pos := pos + 1.
		
		posValue := radarCirleRadius * ((dStandardMetrics at: pos ifAbsent: 0) / radarStageDegree).
		posX := ((pos-1) * (2 * Float pi) / nbMetrics) cos * posValue.
		posY := ((pos-1) * (2 * Float pi) / nbMetrics) sin * posValue.
		
		aPoint translateTo: posX @ posY.
		
		aPoint @ RTLabelled.
			
		"Connect to beside element"
		colEdges add: (RTLine new color: colorStandard; edgeFrom: aPoint to: (colPoints at: ((pos %  nbMetrics) + 1 ) ifAbsent: pointCenter)).
	].
	
	"Create organization line"		
	colPoints := (RTEllipse new size: (2 * ellipseSize); color: colorOrg) elementsOn: (1 to: nbMetrics). 
	view addAll: colPoints.				
		
	pos := 0.	
	colPoints do: [ :aPoint |			
		pos := pos + 1.
		
		posValue := radarCirleRadius * ((dOrgMetrics at: pos ifAbsent: 0) / radarStageDegree).
		posX := ((pos-1) * (2 * Float pi) / nbMetrics) cos * posValue.
		posY := ((pos-1) * (2 * Float pi) / nbMetrics) sin * posValue.
		
		aPoint translateTo: posX @ posY.
		
		aPoint @ (RTPopup new text: ((dOrgMetrics at: pos ifAbsent: 0) asString)).
			
		"Connect to beside element"
		colEdges add: (RTLine new color: colorOrg; edgeFrom: aPoint to: (colPoints at: ((pos %  nbMetrics) + 1 ) ifAbsent: pointCenter)).
	].
	
	view addAll: colEdges.	
																				
	^ view.