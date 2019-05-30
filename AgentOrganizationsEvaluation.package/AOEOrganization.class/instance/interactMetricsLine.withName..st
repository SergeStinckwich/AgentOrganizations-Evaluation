visualization
interactMetricsLine: aoeOrg withName: aoeOrgName
	| dPowerCoord dPowerContr 
	  dCoordPower dCoordContr
	  dContrPower dContrCoord
	  xLabel builder bLegend |
	
	"prepare data"
	dPowerCoord := OrderedCollection new.
	dPowerCoord add: aoeOrg detourOfPowerOverCoordination.
	dPowerCoord add: aoeOrg overlapOfPowerOverCoordination.	
	dPowerCoord add: aoeOrg incoverOfPowerOverCoordination.	
	dPowerCoord add: aoeOrg outcoverOfPowerOverCoordination.
	dPowerCoord add: aoeOrg chainOfPowerOverCoordination.	
		
	dPowerContr := OrderedCollection new.
	dPowerContr add: aoeOrg detourOfPowerOverControl.
	dPowerContr add: aoeOrg overlapOfPowerOverControl.	
	dPowerContr add: aoeOrg incoverOfPowerOverControl.	
	dPowerContr add: aoeOrg outcoverOfPowerOverControl.
	dPowerContr add: aoeOrg chainOfPowerOverControl.		
	
	dCoordPower := OrderedCollection new.	
	dCoordPower add: aoeOrg detourOfCoordinationOverPower.
	dCoordPower add: aoeOrg overlapOfCoordinationOverPower.	
	dCoordPower add: aoeOrg incoverOfCoordinationOverPower.	
	dCoordPower add: aoeOrg outcoverOfCoordinationOverPower.
	dCoordPower add: aoeOrg chainOfCoordinationOverPower.	
		
	dCoordContr := OrderedCollection new.	
	dCoordContr add: aoeOrg detourOfCoordinationOverControl.
	dCoordContr add: aoeOrg overlapOfCoordinationOverControl.	
	dCoordContr add: aoeOrg incoverOfCoordinationOverControl.	
	dCoordContr add: aoeOrg outcoverOfCoordinationOverControl.
	dCoordContr add: aoeOrg chainOfCoordinationOverControl.

	dContrPower := OrderedCollection new.	
	dContrPower add: aoeOrg detourOfControlOverPower.
	dContrPower add: aoeOrg overlapOfControlOverPower.	
	dContrPower add: aoeOrg incoverOfControlOverPower.	
	dContrPower add: aoeOrg outcoverOfControlOverPower.
	dContrPower add: aoeOrg chainOfControlOverPower.	
		
	dContrCoord := OrderedCollection new.	
	dContrCoord add: aoeOrg detourOfControlOverCoordination.
	dContrCoord add: aoeOrg overlapOfControlOverCoordination.	
	dContrCoord add: aoeOrg incoverOfControlOverCoordination.	
	dContrCoord add: aoeOrg outcoverOfControlOverCoordination.
	dContrCoord add: aoeOrg chainOfControlOverCoordination.		
	
	xLabel := OrderedCollection new.
	xLabel add: 'Detour'.
	xLabel add: 'Overlap'.
	xLabel add: 'InCover'.
	xLabel add: 'OutCover'.
	xLabel add: 'Chain'.
			
	"build"		
	builder := RTKiviatBuilder new.
	builder extent: 350 @ 250.	
	builder interaction popup; highlight.		
	
	builder shape ellipse color: (Color red alpha: 0.3); size: 10.
	builder points: dPowerCoord.
	builder connectDotColor: Color red.
	
	builder shape ellipse color: (Color pink alpha: 0.3); size: 10.
	builder points: dPowerContr.
	builder connectDotColor: Color pink.
	
	builder shape rectangle color: (Color green alpha: 0.3); size: 8.
	builder points: dCoordPower.
	builder connectDotColor: Color green.	
		
	builder shape ellipse color: (Color blue alpha: 0.3); size: 10.
	builder points: dCoordContr.
	builder connectDotColor: Color blue.
	
	builder shape ellipse color: (Color black alpha: 0.3); size: 10.
	builder points: dContrPower.
	builder connectDotColor: Color black.
	
	builder shape rectangle color: (Color yellow alpha: 0.3); size: 8.
	builder points: dContrCoord.
	builder connectDotColor: Color yellow.	
	
	
	builder allY: #yourself.
	
	builder stackX.
	
	builder axisConfiguration 
		title: 'Value'.
	builder axisY.
	
	builder axisConfiguration 
		title: 'Metric';
		labelRotation: -30;		
		numberOfTicks: 5;
		numberOfLabels: 5;
		labelConvertion: [ :v | xLabel at: v ifAbsent: '' ].
	builder axisX.
	
	
	"defining the legend"	
	bLegend := RTLegendBuilder new.
	bLegend view: builder  view.
	bLegend addText: ('Distribution of 5 interactive metrics in ', aoeOrgName asString).
	
	bLegend addColor: Color red 	text: 'Power over Coordination'.
	bLegend addColor: Color pink 	text: 'Power over Control'.
	bLegend addColor: Color green 	text: 'Coordination over Power'.
	bLegend addColor: Color blue 	text: 'Coordination over Control'.
	bLegend addColor: Color black 	text: 'Control over Power'.
	bLegend addColor: Color yellow text: 'Control over Coordination'.
	
	bLegend build.

	builder open.
	