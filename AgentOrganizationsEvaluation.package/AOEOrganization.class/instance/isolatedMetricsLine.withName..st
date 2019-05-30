visualization
isolatedMetricsLine: aoeOrg withName: aoeOrgName
	| dPowerMetrics dCoordMetrics dContrMetrics xLabel builder bLegend |
	
	"prepare data"
	dPowerMetrics := OrderedCollection new.
	dPowerMetrics add: aoeOrg completenessOfPowerStructure.
	dPowerMetrics add: aoeOrg connectednessOfPowerStructure.	
	dPowerMetrics add: aoeOrg economyOfPowerStructure.	
	dPowerMetrics add: aoeOrg unilateralityOfPowerStructure.
	dPowerMetrics add: aoeOrg univocityOfPowerStructure.	
	dPowerMetrics add: aoeOrg flatnessOfPowerStructure.
	
	dCoordMetrics := OrderedCollection new.	
	dCoordMetrics add: aoeOrg completenessOfCoordinationStructure.
	dCoordMetrics add: aoeOrg connectednessOfCoordinationStructure.	
	dCoordMetrics add: aoeOrg economyOfCoordinationStructure.	
	dCoordMetrics add: aoeOrg unilateralityOfCoordinationStructure.
	dCoordMetrics add: aoeOrg univocityOfCoordinationStructure.	
	dCoordMetrics add: aoeOrg flatnessOfCoordinationStructure.

	dContrMetrics := OrderedCollection new.	
	dContrMetrics add: aoeOrg completenessOfControlStructure.
	dContrMetrics add: aoeOrg connectednessOfControlStructure.	
	dContrMetrics add: aoeOrg economyOfControlStructure.	
	dContrMetrics add: aoeOrg unilateralityOfControlStructure.
	dContrMetrics add: aoeOrg univocityOfControlStructure.	
	dContrMetrics add: aoeOrg flatnessOfControlStructure.
	
	xLabel := OrderedCollection new.
	xLabel add: 'Completeness'.
	xLabel add: 'Connectedness'.
	xLabel add: 'Economy'.
	xLabel add: 'Unilaterality'.
	xLabel add: 'Univocity'.
	xLabel add: 'Flatness'.
			
	"build"
	builder := RTKiviatBuilder new.
	builder extent: 350 @ 250.	
	builder interaction popup; highlight.		
	
	builder shape ellipse color: (Color red alpha: 0.3); size: 10.
	builder points: dPowerMetrics.
	builder connectDotColor: Color red.
	
	builder shape ellipse color: (Color green alpha: 0.3); size: 10.
	builder points: dCoordMetrics.
	builder connectDotColor: Color green.
	
	builder shape rectangle color: (Color black alpha: 0.3); size: 8.
	builder points: dContrMetrics.
	builder connectDotColor: Color black.	
	
	
	builder allY: #yourself.
	
	builder stackX.
	
	builder axisConfiguration 
		title: 'Value'.
	builder axisY.
	
	builder axisConfiguration 
		title: 'Metric';
		labelRotation: -30;		
		numberOfTicks: 6;
		numberOfLabels: 6;
		labelConvertion: [ :v | xLabel at: v ifAbsent: '' ].
	builder axisX.	
	
	"defining the legend"	
	bLegend := RTLegendBuilder new.
	bLegend view: builder  view.
	bLegend addText: ('Distribution of 6 isolated metrics in ', aoeOrgName asString).
	
	bLegend addColor: Color red 	text: 'Power Dimension'.
	bLegend addColor: Color green 	text: 'Coordination Dimension'.
	bLegend addColor: Color black 	text: 'Control Dimension'.
	
	bLegend build.

	builder open.
	