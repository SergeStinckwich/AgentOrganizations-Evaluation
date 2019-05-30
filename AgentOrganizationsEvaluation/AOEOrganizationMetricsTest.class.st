"
grossi is the example presented in the paper ""Strucural Aspects of the Evaluation of Agent Organizations"" by D. Grossi and al.

tsunamiResponse is example given by People Committe of HCM City, implemented by daidungsi (08.10.2014)


"
Class {
	#name : #AOEOrganizationMetricsTest,
	#superclass : #TestCase,
	#category : 'AgentOrganizationsEvaluation-Tests'
}

{ #category : #examples }
AOEOrganizationMetricsTest >> grossi [
	"exemple of the paper: Structural Aspects of the Evaluation of Agent Organizations"
	|organization a b c d e f g h |
	
	organization := AOEOrganization new.

	a := AOERole new. b := AOERole new.
	c := AOERole new. d := AOERole new.
	e := AOERole new. f := AOERole new.
	g := AOERole new. h := AOERole new.

	"add the Power relations"
	a addPowerRelations: b; addPowerRelations: c.
	e addPowerRelations: d.
	f addPowerRelations: g; addPowerRelations: h.

	"add the Coordination relations"
	a addCoordinationRelations: b; addCoordinationRelations: c.
	b addCoordinationRelations: a; addCoordinationRelations: c.
	c addCoordinationRelations: a; addCoordinationRelations: b.
	e addCoordinationRelations: d.
	f addCoordinationRelations: g; addCoordinationRelations: h.

	"add the Control relations"
	d addControlRelations: b; addControlRelations:c.
	e addControlRelations: a.
	f addControlRelations: g; addControlRelations: h.

	organization addRoles:{a. b. c. d. e. f. g. h }.
	
	^organization


]

{ #category : #testing }
AOEOrganizationMetricsTest >> testAllNumberCUT [
	self assert: self tsunamiResponse numberOfPowerCUT equals: 0.
	self assert: self tsunamiResponse numberOfCoordinationCUT equals: 6.
	self assert: self tsunamiResponse numberOfControlCUT equals: 0
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testAllNumberDisconnectedPairs [
	self assert: self grossi numberOfPowerDisconnectedPairs equals: 42.
	self assert: self grossi numberOfControlDisconnectedPairs equals: 42.
	self
		assert: self grossi numberOfCoordinationDisconnectedPairs
		equals: 42.
	self
		assert: self tsunamiResponse numberOfPowerDisconnectedPairs
		equals: 0.
	self
		assert: self tsunamiResponse numberOfControlDisconnectedPairs
		equals: 0.
	self
		assert: self tsunamiResponse numberOfCoordinationDisconnectedPairs
		equals: 0
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testAllNumberIN [
	self assert: self tsunamiResponse numberOfPowerIN equals: 3.
	self assert: self tsunamiResponse numberOfCoordinationIN equals: 1.
	self assert: self tsunamiResponse numberOfControlIN equals: 6
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testAllNumberRelations [
	self assert: self grossi numberOfPowerRelations equals: 5.
	self assert: self grossi numberOfControlRelations equals: 5.
	self assert: self grossi numberOfCoordinationRelations equals: 9.
	self assert: self tsunamiResponse numberOfPowerRelations equals: 2.
	self assert: self tsunamiResponse numberOfControlRelations equals: 5.
	self
		assert: self tsunamiResponse numberOfCoordinationRelations
		equals: 25
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testAllNumberSIM [
	self assert: self tsunamiResponse numberOfPowerSIM equals: 0.
	self assert: self tsunamiResponse numberOfCoordinationSIM equals: 24.
	self assert: self tsunamiResponse numberOfControlSIM equals: 0
]

{ #category : #examples }
AOEOrganizationMetricsTest >> testBPDGraphRepresentation [
	self tsunamiResponse tsunamiBPDGraphRepresentationV2.
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testChainMetric [
	self assert: self grossi chainOfPowerOverCoordination equals: 1.
	self assert: self grossi chainOfPowerOverControl equals: 1.
	self
		assert: self tsunamiResponse chainOfPowerOverCoordination
		equals: 0.
	self
		assert: self tsunamiResponse chainOfPowerOverControl
		equals: 2 / 5.
	self
		assert: self tsunamiResponse chainOfCoordinationOverPower
		equals: 0.
	self
		assert: self tsunamiResponse chainOfCoordinationOverControl
		equals: 0.
	self assert: self tsunamiResponse chainOfControlOverPower equals: 1.
	self
		assert: self tsunamiResponse chainOfControlOverCoordination
		equals: 0
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testCompletenessMetric [
	self assert: self grossi completenessOfPowerStructure equals: 5 / 56.
	self
		assert: self grossi completenessOfControlStructure
		equals: 5 / 56.
	self
		assert: self grossi completenessOfCoordinationStructure
		equals: 9 / 56.
	self
		assert: self tsunamiResponse completenessOfPowerStructure
		equals: 1 / 3.
	self
		assert: self tsunamiResponse completenessOfControlStructure
		equals: 1 / 6.
	self
		assert: self tsunamiResponse completenessOfCoordinationStructure
		equals: 25 / 42
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testConnectednessMetric [
	self assert: self grossi connectednessOfPowerStructure equals: 1 / 4.
	self
		assert: self grossi connectednessOfControlStructure
		equals: 1 / 4.
	self
		assert: self grossi connectednessOfCoordinationStructure
		equals: 1 / 4.
	self
		assert: self tsunamiResponse connectednessOfPowerStructure
		equals: 1.
	self
		assert: self tsunamiResponse connectednessOfControlStructure
		equals: 1.
	self
		assert: self tsunamiResponse connectednessOfCoordinationStructure
		equals: 1
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testDetourMetric [
	self assert: self grossi detourOfPowerOverCoordination equals: 5 / 9.
	self assert: self grossi detourOfPowerOverControl equals: 2 / 5.
	self assert: self grossi detourOfCoordinationOverPower equals: 1.
	self
		assert: self grossi detourOfCoordinationOverControl
		equals: 2 / 5.
	self assert: self grossi detourOfControlOverPower equals: 2 / 5.
	self
		assert: self grossi detourOfControlOverCoordination
		equals: 2 / 9.
	self
		assert: self tsunamiResponse detourOfPowerOverCoordination
		equals: 2 / 25.
	self
		assert: self tsunamiResponse detourOfPowerOverControl
		equals: 2 / 5.
	self
		assert: self tsunamiResponse detourOfCoordinationOverPower
		equals: 1.
	self
		assert: self tsunamiResponse detourOfCoordinationOverControl
		equals: 1.
	self assert: self tsunamiResponse detourOfControlOverPower equals: 1.
	self
		assert: self tsunamiResponse detourOfControlOverCoordination
		equals: 1 / 5
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testEconomyMetric [
	self assert: self grossi economyOfPowerStructure equals: 51 / 49.
	self assert: self grossi economyOfControlStructure equals: 51 / 49.
	self
		assert: self grossi economyOfCoordinationStructure
		equals: 47 / 49.
	self assert: self tsunamiResponse economyOfPowerStructure equals: 1.
	self assert: self tsunamiResponse economyOfControlStructure equals: 1.
	self
		assert: self tsunamiResponse economyOfCoordinationStructure
		equals: 17 / 36
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testEfficiency [
	self assert: self tsunamiResponse efficiency > 0.19
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testFlatnessMetric [
	self assert: self grossi flatnessOfPowerStructure equals: 1.
	self
		assert: self grossi flatnessOfCoordinationStructure
		equals: 5 / 8.
	self assert: self grossi flatnessOfControlStructure equals: 1.
	self assert: self tsunamiResponse flatnessOfPowerStructure equals: 1.
	self
		assert: self tsunamiResponse flatnessOfCoordinationStructure
		equals: 1 / 7.
	self
		assert: self tsunamiResponse flatnessOfControlStructure
		equals: 1
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testFlexibility [
	self assert: self tsunamiResponse flexibility > 0.27
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testInCoverMetric [
	self assert: self grossi incoverOfPowerOverCoordination equals: 1.
	self assert: self grossi incoverOfPowerOverControl equals: 1.
	self assert: self grossi incoverOfCoordinationOverPower equals: 5 / 8.
	self
		assert: self grossi incoverOfCoordinationOverControl
		equals: 5 / 8.
	self assert: self grossi incoverOfControlOverPower equals: 1.
	self assert: self grossi incoverOfControlOverCoordination equals: 1.
	self
		assert: self tsunamiResponse incoverOfPowerOverCoordination
		equals: 0.
	self
		assert: self tsunamiResponse incoverOfPowerOverControl
		equals: 1 / 2.
	self
		assert: self tsunamiResponse incoverOfCoordinationOverPower
		equals: 0.
	self
		assert: self tsunamiResponse incoverOfCoordinationOverControl
		equals: 0.
	self assert: self tsunamiResponse incoverOfControlOverPower equals: 1.
	self
		assert: self tsunamiResponse incoverOfControlOverCoordination
		equals: 0
]

{ #category : #examples }
AOEOrganizationMetricsTest >> testInteractMetricsLine [
	self tsunamiResponse 	interactMetricsLine: self tsunamiResponse 	withName: 'Tsunami Response'.
	self grossi 				interactMetricsLine: self grossi 				withName: 'Example of Grossi'
]

{ #category : #examples }
AOEOrganizationMetricsTest >> testIsolatedMetricsLine [
	self tsunamiResponse 	isolatedMetricsLine: self tsunamiResponse 	withName: 'Tsunami Response'.
	self grossi 				isolatedMetricsLine: self grossi 				withName: 'Example of Grossi'
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testNumberOfControlRoles [
	self assert: self grossi numberOfControlRoles equals: 8.
	self assert: self tsunamiResponse numberOfControlRoles equals: 6
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testNumberOfCoordinationRoles [
	self assert: self grossi numberOfCoordinationRoles equals: 8.
	self assert: self tsunamiResponse numberOfCoordinationRoles equals: 7
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testNumberOfPowerRoles [
	self assert: self grossi numberOfPowerRoles equals: 8.
	self assert: self tsunamiResponse numberOfPowerRoles equals: 3
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testNumberOfRoles [
	self assert: self grossi roles size equals: 8.
	self assert: self grossi numberOfRoles equals: 8.
	self assert: self tsunamiResponse roles size equals: 7.
	self assert: self tsunamiResponse numberOfRoles equals: 7
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testOutCoverMetric [
	self assert: self grossi outcoverOfPowerOverCoordination equals: 1.
	self assert: self grossi outcoverOfPowerOverControl equals: 5 / 6.
	self
		assert: self tsunamiResponse outcoverOfPowerOverCoordination
		equals: 0.
	self
		assert: self tsunamiResponse outcoverOfPowerOverControl
		equals: 2 / 5.
	self
		assert: self tsunamiResponse outcoverOfCoordinationOverPower
		equals: 0.
	self
		assert: self tsunamiResponse outcoverOfCoordinationOverControl
		equals: 0.
	self
		assert: self tsunamiResponse outcoverOfControlOverPower
		equals: 1.
	self
		assert: self tsunamiResponse outcoverOfControlOverCoordination
		equals: 0
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testOverlapMetric [
	self assert: self grossi overlapOfPowerOverCoordination equals: 5 / 9.
	self
		assert: self grossi overlapOfControlOverCoordination
		equals: 2 / 9.
	self
		assert: self grossi overlapOfCoordinationOverControl
		equals: 2 / 5.
	self assert: self grossi overlapOfPowerOverControl equals: 2 / 5.
	self assert: self grossi overlapOfControlOverPower equals: 2 / 5.
	self assert: self grossi overlapOfCoordinationOverPower equals: 1.
	self
		assert: self tsunamiResponse overlapOfPowerOverCoordination
		equals: 2 / 25.
	self
		assert: self tsunamiResponse overlapOfControlOverCoordination
		equals: 1 / 5.
	self
		assert: self tsunamiResponse overlapOfCoordinationOverControl
		equals: 1.
	self
		assert: self tsunamiResponse overlapOfPowerOverControl
		equals: 2 / 5.
	self assert: self tsunamiResponse overlapOfControlOverPower equals: 1.
	self
		assert: self tsunamiResponse overlapOfCoordinationOverPower
		equals: 1
]

{ #category : #examples }
AOEOrganizationMetricsTest >> testRadarChart [
	self tsunamiResponse
		kiviatRobustness: self tsunamiResponse
		withName: 'Tsunami Response'.
	self tsunamiResponse
		kiviatFlexibility: self tsunamiResponse
		withName: 'Tsunami Response'.
	self tsunamiResponse
		kiviatEfficiency: self tsunamiResponse
		withName: 'Tsunami Response'
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testRobustness [
	
	self assert: self tsunamiResponse robustness > 0.54
]

{ #category : #examples }
AOEOrganizationMetricsTest >> testRobustnessLine [
	self tsunamiResponse
		robustnessLine: self tsunamiResponse
		withName: 'Tsunami Response'.
	self grossi robustnessLine: self grossi withName: 'Example of Grossi'
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testUnilateralityMetric [
	self assert: self grossi unilateralityOfPowerStructure equals: 1.
	self
		assert: self grossi unilateralityOfCoordinationStructure
		equals: 1 / 3.
	self assert: self grossi unilateralityOfControlStructure equals: 1.
	self
		assert: self tsunamiResponse unilateralityOfPowerStructure
		equals: 1.
	self
		assert: self tsunamiResponse unilateralityOfCoordinationStructure
		equals: 1 / 25.
	self
		assert: self tsunamiResponse unilateralityOfControlStructure
		equals: 1
]

{ #category : #testing }
AOEOrganizationMetricsTest >> testUnivocityMetric [
	self assert: self grossi univocityOfPowerStructure equals: 1.
	self
		assert: self grossi univocityOfCoordinationStructure
		equals: 5 / 8.
	self assert: self grossi univocityOfControlStructure equals: 1.
	self assert: self tsunamiResponse univocityOfPowerStructure equals: 1.
	self
		assert: self tsunamiResponse univocityOfCoordinationStructure
		equals: 1 / 7.
	self
		assert: self tsunamiResponse univocityOfControlStructure
		equals: 1
]

{ #category : #examples }
AOEOrganizationMetricsTest >> tsunamiResponse [
	"exemple of tsunami reponse given by People Committee of Ho Chi Minh City in Vietnam, 2012
	"
	|org ig la LCDF CU M P HR |
	org := AOEOrganization new.

	ig := (AOERole new) addRoleName: 'IG'.
	la := (AOERole new) addRoleName: 'LA'.
	LCDF := AOERole new. LCDF addRoleName: 'LCDF'.
	CU := AOERole new. CU addRoleName: 'CU'.
	M := AOERole new. M addRoleName: 'M'. 		
	P := AOERole new. P addRoleName: 'P'.
	HR := AOERole new. HR addRoleName: 'HR'.
	
	"add the Power relations"
	la addPowerRelations: P; addPowerRelations: M.	
	"P addPowerRelations: la.	
	CU addPowerRelations: HR; addPowerRelations: LCDF.
	ig addPowerRelations: P."

	"add the Coordination relations"
	ig addCoordinationRelations: la.
	la addCoordinationRelations: P; addCoordinationRelations: M; addCoordinationRelations: LCDF; addCoordinationRelations: HR; addCoordinationRelations: CU.
	P addCoordinationRelations: la; addCoordinationRelations: M; addCoordinationRelations: CU; addCoordinationRelations: HR.
	M addCoordinationRelations: la; addCoordinationRelations: P; addCoordinationRelations: LCDF; addCoordinationRelations: CU; addCoordinationRelations: HR.
	LCDF addCoordinationRelations: la; addCoordinationRelations: M.
	HR addCoordinationRelations: P; addCoordinationRelations: M; addCoordinationRelations: la; addCoordinationRelations: CU.
	CU addCoordinationRelations: P; addCoordinationRelations: M; addCoordinationRelations: HR; addCoordinationRelations: la.

	"add the Control relations"
	la addControlRelations: P; addControlRelations:M; addControlRelations:LCDF; addControlRelations:HR; addControlRelations:CU.

	org addRoles:{ ig. la. LCDF. CU. M. P. HR }.
	
	^ org

]
