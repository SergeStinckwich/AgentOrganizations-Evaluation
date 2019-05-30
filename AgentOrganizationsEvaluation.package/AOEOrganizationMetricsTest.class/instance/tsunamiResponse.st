examples
tsunamiResponse
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
