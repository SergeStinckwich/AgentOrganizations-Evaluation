visualization
threeCriteriaRadarChart: aoeOrg withName: aoeOrgName
	
	| 	view		
		nbMetrics		
		dStandardMetrics dOrgMetrics xLabel |	

	view := RTView new @ RTDraggableView.
	
	"*** Robustness Criteria"
	view addMenu: 'Robustness' callback: [				
		nbMetrics := 12.
				
		"Prepare data"
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
		
		view := self radarChartView: view withNbMetrics: nbMetrics withLabel: xLabel withStandardMetrics: dStandardMetrics withOrgMetrics: dOrgMetrics.
																		
		view signalUpdate.		
	].
	
	"*** Flexibility Criteria"	
	view addMenu: 'Flexibility' callback: [		
		nbMetrics := 6.
		
		"Prepare data"
		dStandardMetrics := #(0 0 1 1 1 1).	
	
		dOrgMetrics := OrderedCollection new.	
		dOrgMetrics add: aoeOrg completenessOfPowerStructure.
		dOrgMetrics add: aoeOrg connectednessOfPowerStructure.	
		dOrgMetrics add: aoeOrg chainOfControlOverPower.	
		dOrgMetrics add: aoeOrg completenessOfCoordinationStructure.
		dOrgMetrics add: aoeOrg connectednessOfCoordinationStructure.	
		dOrgMetrics add: aoeOrg outcoverOfPowerOverControl.	
				
	
		xLabel := OrderedCollection new.
		xLabel add: 'Completeness of Power'.
		xLabel add: 'Connectedness of Power'.
		xLabel add: 'Chain of Control over Power'.
		xLabel add: 'Completeness Of Coordination'.
		xLabel add: 'Connectedness of Coordination'.
		xLabel add: 'OutCover of Power over Control'.
		
		view := self radarChartView: view withNbMetrics: nbMetrics withLabel: xLabel withStandardMetrics: dStandardMetrics withOrgMetrics: dOrgMetrics.
																							
		view signalUpdate.
	].
	
	"*** Efficiency Criteria"
	view addMenu: 'Efficiency' callback: [		
		nbMetrics := 10.
			
		"Prepare data"
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
	
		xLabel := OrderedCollection new.
		xLabel add: 'Completeness of Power'.
		xLabel add: 'Economy of Power'.
		xLabel add: 'Economy of Coordination'.
		xLabel add: 'Overlap Of Coordination over Power'.
		xLabel add: 'Overlap Of Power over Coordination'.
	
		xLabel add: 'Unilaterality of Power'.
		xLabel add: 'Univocity of Power'.
		xLabel add: 'Economy of Control'.
		xLabel add: 'Overlap of Control over Power'.
		xLabel add: 'Overlap of Power over Control'.				
		
		view := self radarChartView: view withNbMetrics: nbMetrics withLabel: xLabel withStandardMetrics: dStandardMetrics withOrgMetrics: dOrgMetrics.
																		
		view signalUpdate.
	].			

	view open.
	