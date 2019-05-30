examples
grossi
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

