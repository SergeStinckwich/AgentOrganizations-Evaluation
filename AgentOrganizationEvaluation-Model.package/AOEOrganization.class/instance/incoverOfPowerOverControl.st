metrics-power
incoverOfPowerOverControl
	"Count the number of InCover in power over control"
	| nbINAbove nbINBelow |
	
	nbINBelow := self numberOfControlIN.
	
	nbINAbove := 0.
	
	self powerRoles do: [ :aRole |						
		((self dictionaryOfPowerIndegree at: aRole) < 2) ifTrue: [ 
			(self controlRoles includes: aRole) ifTrue: [ 
				((self dictionaryOfControlIndegree at: aRole) < 2) ifTrue: [ 
					nbINAbove := nbINAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbINAbove asString, ' Below : ', nbINBelow asString); cr.
	
	^ (nbINAbove / nbINBelow).