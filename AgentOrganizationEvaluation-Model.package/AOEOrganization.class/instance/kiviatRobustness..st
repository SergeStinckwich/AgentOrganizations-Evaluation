visualization
kiviatRobustness: aoeOrg 
	"For Robustness Criteria"
	
	| 	builder nbColor
		nbMetrics	"xLabel"
		dStandardMetrics dOrgMetrics |			
				
	"Prepare data"
	nbMetrics := 12.
	
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
	
	"xLabel := OrderedCollection new.
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
	xLabel add: 'OutCover of Power over Coordination'."
	
	"Build radar chart"
	builder := RTKiviatBuilder new.
	
	builder objects: {dOrgMetrics. dStandardMetrics.}.
	
	nbColor := RTMultiLinearColorForIdentity new objects: (builder objects).
	builder shape circle color: [ :value | nbColor rtValue: value kiviatNode named]; size: 10.
	
	(1 to: nbMetrics) do:[ :posMetric |
		builder addMetric: [ :metric | (metric asOrderedCollection) at: posMetric ifAbsent: 0 ].
	].

	"builder addMetric: [ :metric | (metric asOrderedCollection) at: 1 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 8 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 9 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 10 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 11 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 12 ifAbsent: 0 ]."
																		
	builder build.
	builder view open.
	