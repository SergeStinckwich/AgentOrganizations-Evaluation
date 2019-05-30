visualization
tsunamiBPDGraphRepresentationV2
	"Present the Tsunami Response plan under a BPD-Graph Representation"
	| associations view labels |

	associations := OrderedCollection new.
	associations
		add: 'O^{E}_{S}[1]' 		-> 'O^{A}_{At}[1]';
		add: 'O^{A}_{At}[1]' 		-> 'O^{A}_{At}[2]';
		add: 'O^{A}_{At}[2]'		-> 'O^{E}_{I,Me}[1]';
		add: 'O^{E}_{I,Me}[1]'  	-> 'O^{E}_{I,T}[1]';
		add: 'O^{E}_{I,Me}[1]'  	-> 'O^{E}_{S}[2]';
		add: 'O^{E}_{I,T}[1]'  	-> 'O^{A}_{At}[3]';
		add: 'O^{A}_{At}[3]' 		-> 'O^{A}_{At}[4]';
		add: 'O^{A}_{At}[4]'		-> 'O^{E}_{I,Me}[2]';
		add: 'O^{E}_{I,Me}[2]'  	-> 'O^{E}_{I,Me}[3]';
		add: 'O^{E}_{I,Me}[2]'  	-> 'O^{E}_{E}[1]';
		add: 'O^{E}_{S}[2]' 		-> 'O^{A}_{At}[5]';
		add: 'O^{A}_{At}[5]' 		-> 'O^{G}_{A}[1]';
		add: 'O^{G}_{A}[1]' 		-> 'O^{A}_{At}[6]';	
		add: 'O^{G}_{A}[1]' 		-> 'O^{A}_{At}[7]';
		add: 'O^{A}_{At}[6]' 		-> 'O^{G}_{A}[2]';															
		add: 'O^{A}_{At}[7]' 		-> 'O^{G}_{A}[2]';
		add: 'O^{A}_{At}[7]' 		-> 'O^{G}_{A}[3]';
		add: 'O^{G}_{A}[2]' 		-> 'O^{E}_{I,Me}[3]';	
		add: 'O^{E}_{I,Me}[3]' 	-> 'O^{A}_{At}[8]';
		add: 'O^{A}_{At}[8]' 		-> 'O^{A}_{At}[9]';	
		add: 'O^{A}_{At}[9]' 		-> 'O^{G}_{A}[4]';	
		add: 'O^{A}_{At}[9]' 		-> 'O^{G}_{A}[5]';
		add: 'O^{G}_{A}[5]' 		-> 'O^{A}_{At}[10]';
		add: 'O^{A}_{At}[10]' 	-> 'O^{E}_{E}[2]';	
		add: 'O^{G}_{A}[3]' 		-> 'O^{A}_{At}[11]';
		add: 'O^{A}_{At}[11]' 	-> 'O^{G}_{A}[2]';
		add: 'O^{G}_{A}[3]' 		-> 'O^{A}_{At}[12]';
		add: 'O^{A}_{At}[12]' 	-> 'O^{G}_{A}[2]';
					
		add: 'O^{G}_{A}[3]' 		-> 'O^{G}_{A}[6]';
		add: 'O^{G}_{A}[6]' 		-> 'O^{A}_{At}[13]';
		add: 'O^{G}_{A}[6]' 		-> 'O^{A}_{At}[14]';
		add: 'O^{G}_{A}[6]' 		-> 'O^{A}_{At}[15]';
		add: 'O^{A}_{At}[13]' 	-> 'O^{G}_{A}[7]';	
		add: 'O^{A}_{At}[14]' 	-> 'O^{G}_{A}[7]';
		add: 'O^{A}_{At}[15]' 	-> 'O^{G}_{A}[7]';	
		add: 'O^{G}_{A}[7]' 		-> 'O^{G}_{A}[2]';								
		add: 'O^{G}_{A}[4]' 		-> 'O^{G}_{A}[8]';
		add: 'O^{G}_{A}[8]' 		-> 'O^{A}_{At}[16]';
		add: 'O^{G}_{A}[8]' 		-> 'O^{A}_{At}[17]';
		add: 'O^{A}_{At}[16]' 	-> 'O^{G}_{A}[9]';	
		add: 'O^{A}_{At}[17]' 	-> 'O^{G}_{A}[9]';
		add: 'O^{G}_{A}[9]' 		-> 'O^{G}_{A}[5]';		
						
		
		add: 'O^{G}_{A}[3]' 		-> 'O^{G}_{A}[10]';
		add: 'O^{G}_{A}[10]' 		-> 'O^{A}_{At}[18]';
		add: 'O^{G}_{A}[10]' 		-> 'O^{A}_{At}[19]';
		add: 'O^{G}_{A}[10]' 		-> 'O^{A}_{At}[20]';
		add: 'O^{A}_{At}[18]' 	-> 'O^{G}_{A}[11]';	
		add: 'O^{A}_{At}[19]' 	-> 'O^{G}_{A}[11]';
		add: 'O^{A}_{At}[20]' 	-> 'O^{G}_{A}[11]';	
		add: 'O^{G}_{A}[11]' 		-> 'O^{G}_{A}[2]';								
		add: 'O^{G}_{A}[4]' 		-> 'O^{G}_{A}[12]';
		add: 'O^{G}_{A}[12]' 		-> 'O^{A}_{At}[21]';
		add: 'O^{G}_{A}[12]' 		-> 'O^{A}_{At}[22]';
		add: 'O^{A}_{At}[21]' 	-> 'O^{G}_{A}[13]';	
		add: 'O^{A}_{At}[22]' 	-> 'O^{G}_{A}[13]';
		add: 'O^{G}_{A}[13]' 		-> 'O^{G}_{A}[5]';	
					
		add: 'O^{G}_{A}[3]' 		-> 'O^{G}_{X}[1]';
		add: 'O^{G}_{X}[1]' 		-> 'O^{A}_{At}[23]';
		add: 'O^{G}_{X}[1]' 		-> 'O^{A}_{At}[24]';
		add: 'O^{A}_{At}[23]' 	-> 'O^{G}_{X}[2]';	
		add: 'O^{A}_{At}[24]' 	-> 'O^{G}_{X}[2]';
		add: 'O^{G}_{X}[2]' 		-> 'O^{G}_{A}[2]';
		
		add: 'O^{P}[1]' 		-> 'O^{P}[1]';
		add: 'O^{P}[2]' 		-> 'O^{P}[2]';		
		add: 'O^{L}[1]' 		-> 'O^{L}[1]';
		add: 'O^{L}[2]' 		-> 'O^{L}[2]';
		add: 'O^{L}[3]' 		-> 'O^{L}[3]';	
		add: 'O^{L}[4]' 		-> 'O^{L}[4]';	
		add: 'O^{L}[5]' 		-> 'O^{L}[5]';	
		add: 'O^{L}[6]' 		-> 'O^{L}[6]'.


	"We create the nodes"
	view := RTView new.
	view @ RTDraggableView.
	labels := Set new.
	associations do: [ :assoc | labels add: assoc key; add: assoc value ].
	
	labels do: [ :aLabel |
		| n |
		n := view elementFromModel: aLabel.
		n ifNil: [ n := (RTBox new + RTLabel) elementOn: aLabel. n @ RTDraggable ].
		view add: n.
	].

	"We add the links"
	RTEdge buildEdgesFromObjects: associations 
		from: #key 
		to: #value 
		using: ((RTLine new attachPoint: RTShorterDistanceAttachPoint new; color: Color veryDarkGray) + (RTSimpleArrowHead new attachPoint: RTShorterDistanceAttachPoint new; color: Color veryDarkGray)) 
		inView: view.
	

	"We do a layout"
	"RTForceBasedLayout new 
		charge: -500;
		on: view elements."
	RTHorizontalTreeLayout on: view elements.	

	view open.	