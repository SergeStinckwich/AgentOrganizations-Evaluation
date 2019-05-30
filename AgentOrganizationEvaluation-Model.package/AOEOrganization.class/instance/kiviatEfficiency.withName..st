visualization
kiviatEfficiency: aoeOrg withName: aoeOrgName
	"For Efficiency Criteria"
	
	| 	builder nbColor
		nbMetrics	
		dStandardMetrics dOrgMetrics |			
				
	"Prepare data"
	nbMetrics := 10.
					
	dStandardMetrics := #(1 1 1 1 1 1 1 1 1 1).	
	
	dOrgMetrics := OrderedCollection new.	
	dOrgMetrics add: aoeOrg connectednessOfPowerStructure.
	dOrgMetrics add: aoeOrg economyOfPowerStructure.	
	dOrgMetrics add: aoeOrg economyOfCoordinationStructure.	
	dOrgMetrics add: aoeOrg overlapOfCoordinationOverPower.
	dOrgMetrics add: aoeOrg overlapOfPowerOverCoordination.	
	
	dOrgMetrics add: aoeOrg unilateralityOfPowerStructure.	
	dOrgMetrics add: aoeOrg univocityOfPowerStructure.	
	dOrgMetrics add: aoeOrg economyOfControlStructure.		
	dOrgMetrics add: aoeOrg overlapOfControlOverPower.	
	dOrgMetrics add: aoeOrg overlapOfPowerOverControl.	
		
	"Build radar chart"
	builder := RTKiviatBuilder new.
	
	builder objects: {dOrgMetrics. dStandardMetrics.}.
	
	nbColor := RTMultiLinearColorForIdentity new objects: (builder objects).
	builder shape circle color: [ :value | nbColor rtValue: value kiviatNode named]; size: 10.
	
	(1 to: nbMetrics) do:[ :posMetric |
		builder addMetric: [ :metric | (metric asOrderedCollection) at: posMetric ifAbsent: 0 ].
	].
																		
	builder build.
	builder view open.
	