baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec repository: 'https://github.com/SergeStinckwich/'.
			spec
				baseline: 'Roassal2'
				with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ].
			spec
				package: 'AgentOrganizationEvaluation'
				with: [ spec requires: #('Roassal2') ].
				spec group:'default' with: #(#AgentOrganizationEvaluation)]