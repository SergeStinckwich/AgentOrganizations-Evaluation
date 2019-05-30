visualization
robustnessLine: aoeOrg withName: aoeOrgName
	| dStandardMetrics dOrgMetrics xLabel builder bLegend |
	
	"prepare data"
	dStandardMetrics := #(1 1 0 0 0 0 1 1 1 1 1 1).	
	
	dOrgMetrics := OrderedCollection new.	
	dOrgMetrics add: aoeOrg completenessOfCoordinationStructure.
	dOrgMetrics add: aoeOrg connectednessOfCoordinationStructure.	
	dOrgMetrics add: aoeOrg univocityOfPowerStructure.	
	dOrgMetrics add: aoeOrg unilateralityOfCoordinationStructure.
	dOrgMetrics add: aoeOrg univocityOfControlStructure.	
	dOrgMetrics add: aoeOrg flatnessOfControlStructure.	
		
	dOrgMetrics add: aoeOrg overlapOfCoordinationOverPower.	
	dOrgMetrics add: aoeOrg chainOfControlOverPower.	
	dOrgMetrics add: aoeOrg chainOfControlOverCoordination.	
	dOrgMetrics add: aoeOrg incoverOfControlOverCoordination.		
	dOrgMetrics add: aoeOrg outcoverOfPowerOverControl.	
	dOrgMetrics add: aoeOrg outcoverOfPowerOverCoordination.	
	
	xLabel := OrderedCollection new.
	xLabel add: 'Completeness of Coordination'.
	xLabel add: 'Connectedness of Coordination'.
	xLabel add: 'Univocity of Power'.
	xLabel add: 'Unilaterality Of Coordination'.
	xLabel add: 'Univocity of Control'.
	xLabel add: 'Flatness of Control'.
	
	xLabel add: 'Overlap of Coordination over Power'.
	xLabel add: 'Chain of Control over Power'.
	xLabel add: 'Chain of Control over Coordination'.
	xLabel add: 'InCover of Control over Coordination'.
	xLabel add: 'OutCover of Power over Control'.
	xLabel add: 'OutCover of Power over Coordination'.
				
	"build"
	builder := RTKiviatBuilder new.
	builder extent: 350 @ 250.	
	builder interaction popup; highlight.		
	
	builder shape ellipse color: (Color red alpha: 0.3); size: 10.
	builder points: dStandardMetrics.
	builder connectDotColor: Color red.
	
	builder shape ellipse color: (Color black alpha: 0.3); size: 10.
	builder points: dOrgMetrics.
	builder connectDotColor: Color black.		
	
	builder allY: #yourself.
	
	builder stackX.
	
	builder axisConfiguration 
		title: 'Value'.
	builder axisY.
	
	builder axisConfiguration 
		title: 'Metric';
		labelRotation: -30;		
		numberOfTicks: 12;
		numberOfLabels: 12;
		labelConvertion: [ :v | xLabel at: v ifAbsent: '' ].
	builder axisX.	
	
	"defining the legend"	
	bLegend := RTLegendBuilder new.
	bLegend view: builder  view.
	bLegend addText: ('Measure the robustness of ', aoeOrgName asString).
	
	bLegend addColor: Color red 	text: 'Standard Robustness Metrics'.
	bLegend addColor: Color black 	text: 'Organization Robustness Metrics'.
	
	bLegend build.

	builder open.
	