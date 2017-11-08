%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Estructuras de datos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 	Arboles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%programa P
p(a). % #1 */
p(X) :- q(X), !, r(X1). % #2 */
p(X) :- !, u(X2). % #3 */
q(X) :- s(X3), !. % #4 */
r(a). % #5 */
r(b). % #6 */
s(a). % #7 */
s(b). % #8 */
s(c). % #9 */
u(d). % #10*/ 