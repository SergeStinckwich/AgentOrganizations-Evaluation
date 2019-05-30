Class {
	#name : #BaselineOfAgentOrganizationsEvaluation,
	#superclass : #BaselineOf,
	#category : #BaselineOfAgentOrganizationsEvaluation
}

{ #category : #baselines }
BaselineOfAgentOrganizationsEvaluation >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec
				repository: 'github://SergeStinckwich/AgentOrganizations-Evaluation'.
			spec
				package: 'AgentOrganizationsEvaluation'
				with: [ spec requires: #('Roassal2') ].
			spec
				baseline: 'Roassal2'
				with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ].
			spec group: 'default' with: #(#AgentOrganizationsEvaluation) ]
]
