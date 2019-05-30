An AOEOrganization is a set of roles. Some metrics defined on graph proposed by Grossi :

(1) Completeness : measure if the graph is a complete graph or not (0 if completely disconnected, 1 if complete). How much does the given structure approximate the structure where all directed links are present ?

(2) Connectedness : measure if the graph is connected or not. How much is given structure split in fragment ?
DISCON : set of disconnected ordered pairs of each structural dimension <Roles, R>

(3) Economy: denote the balance between: keeping the structure connected and minimizing the number of links (minimizing completeness)
Economy (OS) > 1 => Connectedness(OS) < 1

(4) Unilaterality: Tendency to display an orientation in its links (number of symmetric links)
SIM: set of links (x,y) in R_k s.t (y,x) is also in R_k => |SIM| = 2 * number_of_symmetric_links

(5) Univocity: Tendency to display the absence of redundant links ending up (measure non ambiguous)
IN: set of roles x s.t. id_k(x) = 1 or = 0 (set of roles which either have indegree equal to 1 or they are a source of k or of some subgraph of k)

(6) Flatness: Measures the relative amount of points which are not intermediate point in a k-path, 
CUT: set of roles x s.t. id_k(x) >=1 and od_k(x) >=1 (set of roles which are at the same time addresser and addressee of k links)

(7) Detour: regards the degree to which a structural dimension j 'follows' a structural dimension k
PATH(j,k): set of ordered pairs (x,y) s.t. (x,y) in Rk and there exists a Rj-path from x to y (it means x also connects y in j)

(8) Overlap: a special case of Detour, with the length in Rj-path is equal 1

(9) InCover: concerns the extent to which all the incident roles of k are also incidents of j
IN: set of all elements x in Roles_k s.t id_k(x) <= 1.

								-----------------------------------------------
								
+ Robustness: measure of how stable in face of anticipated risks. Adding robustness thus adds complexity

+ Flexiblity: measure the looser cooperative association than classic hierarchical organizations.

+ Efficiency: mesure the amount of resources used by the organization to perform its tasks

   							           -----------------------------------------------
							                               Visualization
+ Add Rada Chart



  
