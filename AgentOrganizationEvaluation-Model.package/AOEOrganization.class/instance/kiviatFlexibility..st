visualization
kiviatFlexibility: aoeOrg 
	"For Flexibility Criteria"
	
	| 	builder nbColor
		nbMetrics	
		dStandardMetrics dOrgMetrics |			
				
	"Prepare data"
	nbMetrics := 6.
		
	dStandardMetrics := #(0 0 1 1 1 1).	
	
	dOrgMetrics := OrderedCollection new.	
	dOrgMetrics add: aoeOrg completenessOfPowerStructure.
	dOrgMetrics add: aoeOrg connectednessOfPowerStructure.	
	dOrgMetrics add: aoeOrg chainOfControlOverPower.	
	dOrgMetrics add: aoeOrg completenessOfCoordinationStructure.
	dOrgMetrics add: aoeOrg connectednessOfCoordinationStructure.	
	dOrgMetrics add: aoeOrg outcoverOfPowerOverControl.	
		
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
	