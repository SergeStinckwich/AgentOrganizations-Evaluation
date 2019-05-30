Class {
	#name : #BaselineOfAgentOrganizationsEvaluation,
	#superclass : #BaselineOf,
	#category : 'AgentOrganizationsEvaluation-Baseline'
}

{ #category : #baselines }
BaselineOfAgentOrganizationsEvaluation >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec
				repository:
					'https://github.com/SergeStinckwich/AgentOrganizations-Evaluation
'.		spec
				package: 'AgentOrganizationsEvaluation'
				with: [ spec requires: #('Roassal2') ].
			spec
				baseline: 'Roassal2'
				with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ].
	
			spec group: 'default' with: #(#AgentOrganizationsEvaluation) ]
]
