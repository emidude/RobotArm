︠c9b1d4e2-0b5b-4e53-8e19-1ec77749d097︠
%md defining numbers and quaternions:
︡f240488d-43e5-4cab-aded-13cecf417ba7︡{"md":"defining numbers and quaternions"}︡{"done":true}
︠b488245f-77ad-47fa-bf0b-5692684835c8s︠
N.<c,d,a1,a2,a3,a4,b1,b2,b3,b4,s,c1,c2,c3, cos1, cos2, cos3, sin1, sin2, sin3, q1,q2,q3,q, a, b, n, m, cosA, sinA, y> = QQbar[]
H.<i,j,k> = QuaternionAlgebra(Frac(N),-1,-1)
︡809bb613-48f5-401d-8fb5-042ee3d6a5f9︡{"done":true}
︠5be27a05-800a-4183-bfd5-8e5fbdc71930s︠
%md example to explain goal:
%md if $i, k = 0$ then we are just rotating around j
%md In general we want a unit pure quaternion $v$, where $Q = \text{real}*\cos(t) + v * \sin(t)$ which does not change the vectorToBeRotated in that direction $v$
%md In this case below $v = j, m = sin(t)$
︡9ffe2fee-b846-4db1-9321-762647cb0506︡{"md":"example to explain goal:"}︡{"md":"if $i, k = 0$ then we are just rotating around j"}︡{"md":"In general we want a unit pure quaternion $v$, where $Q = \\text{real}*\\cos(t) + v * \\sin(t)$ which does not change the vectorToBeRotated in that direction $v$ "}︡{"md":"In this case below $v = j, m = sin(t)$"}︡{"done":true}
︠018755ff-8c17-47ad-90ab-1eca3e3d8a4es︠
Q = n + m * j
Qbar = n - m * j

vectorToBeRotated = a * i + b * j + c * k

Q * vectorToBeRotated * Qbar

︡138370a7-9504-4026-84f7-52e071dd6093︡{"stdout":"(a*n^2 + 2*c*n*m - a*m^2)*i + (b*n^2 + b*m^2)*j + (c*n^2 + (-2)*a*n*m - c*m^2)*k"}︡{"stdout":"\n"}︡{"done":true}
︠e921f448-4995-4264-87f0-5a48f258fffbs︠
%md alpha1, alpha2, alpha3 are vars we want to solve for:

︡17983bd7-8453-49ee-9022-1f58ced17b55︡{"md":"alpha1, alpha2, alpha3 are vars we want to solve for:"}︡{"done":true}
︠536c1fc2-253d-43e1-90dd-5d7d70a5a32e︠
var('alpha1,alpha2,alpha3')

v1 = i
v2 = j
v3 = k

#q1 = cos(alpha1/2) + v1 * sin(alpha1/2)
#q2 = cos(alpha2/2) + v2 * sin(alpha2/2)
#q3 = cos(alpha3/2) + v3 * sin(alpha3/2)

q1 = cos1 + v1 * sin1
q2 = cos2 + v2 * sin2
q3 = cos3 + v3 * sin3

q = q1 * q2 * q3



︡c2132af2-7a9a-47c3-a161-01ca83d0ad3a︡{"stdout":"(alpha1, alpha2, alpha3)\n"}︡{"done":true}
︠546d3c9f-908c-477c-9da6-6321f25463dds︠
cos1*cos2*cos3 - sin1*sin2*sin3 + (cos2*cos3*sin1 + cos1*sin2*sin3)*i + (cos1*cos3*sin2 - cos2*sin1*sin3)*j + (cos3*sin1*sin2 + cos1*cos2*sin3)*k = n + m*j

︡24562734-7ef8-49f8-8336-51097e842c11︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1191, in execute\n    flags=compile_flags), namespace, locals)\n  File \"<string>\", line 1\nSyntaxError: can't assign to operator\n"}︡{"done":true}
︠ceaedcbf-60d4-43f7-b9cc-d7b6b91ff78a︠

︡4c8a51ff-a248-459f-a008-d2ea18e5da6c︡
︠c6b5b392-6beb-420a-87cc-7c8dc0b75c2es︠
var('alpha1,alpha2,alpha3')
︡a06f2685-3194-4158-8d9d-7bcab05a04e0︡{"stdout":"(alpha1, alpha2, alpha3)\n"}︡{"done":true}
︠42f4f78b-2688-432d-a6dd-85dd594da50b︠

I = sin(alpha1/2) * cos(alpha2/2) * cos(alpha3/2) +  cos(alpha1/2) * sin(alpha2/2) *sin(alpha3/2) == 0
J = cos(alpha1/2)*cos(alpha3/2)*sin(alpha2/2) - cos(alpha2/2)*sin(alpha1/2)*sin(alpha3/2) == 0
K = sin(alpha1/2) * sin(alpha2/2) * cos(alpha3/2) + cos(alpha1/2) * sin(alpha2/2) * sin(alpha3/2) ==0

L = I^2 <= 1


implicit_plot3d(L, (alpha1,0,6.3),(alpha2,0,6.3),(alpha3,0,6.3))

implicit_plot3d(I, (alpha1,0,6.3),(alpha2,0,6.3),(alpha3,0,6.3))
implicit_plot3d(J, (alpha1,0,6.3),(alpha2,0,6.3),(alpha3,0,6.3))
implicit_plot3d(K, (alpha1,0,6.3),(alpha2,0,6.3),(alpha3,0,6.3))

R = cos(alpha1/2)*cos(alpha2/2)*cos(alpha3/2) - sin(alpha1/2)*sin(alpha2/2)*sin(alpha3/2)
Jr =  cos(alpha1/2)*cos(alpha3/2)*sin(alpha2/2) - cos(alpha2/2)*sin(alpha1/2)*sin(alpha3/2)



solve(
    [sin(alpha1/2) * cos(alpha2/2) * cos(alpha3/2) +  cos(alpha1/2) * sin(alpha2/2) *sin(alpha3/2) == 0,
     sin(alpha1/2) * sin(alpha2/2) * cos(alpha3/2) + cos(alpha1/2) * sin(alpha2/2) * sin(alpha3/2) ==0],
    alpha1, alpha2,alpha3)



#Q = R + Jr*j
#Qbar = R - Jr*j
#v = a * i + b * j + c * k
#Q * v * Qbar

︡5bcf1579-95df-4771-989d-61cc9d04b461︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1191, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\nNameError: name 'alpha1' is not defined\n"}
︠2f134528-4321-48f5-976b-59588a8a6aa7︠
#q1 - how make not attribute bool when writing equation so can use subs
#q2 - why cant i put in j values?
#q3 - why does the subs work for 

var('x,y, alpha1, alpha2, alpha3')

eqn = cos1*cos2*cos3 - sin1*sin2*sin3 + (cos2*cos3*sin1 + cos1*sin2*sin3)*i + (cos1*cos3*sin2 - cos2*sin1*sin3)*j + (cos3*sin1*sin2 + cos1*cos2*sin3)*k #== x #+ y*j

eqn.subs(cos1 = cos(alpha1/2), cos2 = cos(alpha2/2), cos3 = cos(alpha3/2),
          sin1 = sin(alpha1/2), sin2 = sin(alpha2/2), sin3 = sin(alpha3/2))

#solve([cos1*cos2*cos3 - sin1*sin2*sin3 + (cos2*cos3*sin1 + cos1*sin2*sin3)*i + (cos1*cos3*sin2 - cos2*sin1*sin3)*j + (cos3*sin1*sin2 + cos1*cos2*sin3)*k == x + y*j], x, y)
︡363a92f1-260f-407e-9ae2-eaab274eeabf︡{"stdout":"(x, y, alpha1, alpha2, alpha3)\n"}︡{"stdout":"cos1*cos2*cos3 - sin1*sin2*sin3 + (cos2*cos3*sin1 + cos1*sin2*sin3)*i + (cos1*cos3*sin2 - cos2*sin1*sin3)*j + (cos3*sin1*sin2 + cos1*cos2*sin3)*k"}︡{"stdout":"\n"}︡{"done":true}
︠28a8999d-fee0-47eb-b041-c758be3abd67s︠
y.parent()
︡ac659d17-3c93-4223-a662-f8b78529f6e1︡{"stdout":"Multivariate Polynomial Ring in c, d, a1, a2, a3, a4, b1, b2, b3, b4, s, c1, c2, c3, cos1, cos2, cos3, sin1, sin2, sin3, q1, q2, q3, q, a, b, n, m, cosA, sinA, y over Algebraic Field\n"}︡{"done":true}
︠0020b951-a0ed-457a-87b9-d9bd56e741a0s︠
j.parent()

︡762b2fea-a300-4107-b243-a23fc39120d4︡{"stdout":"Quaternion Algebra (-1, -1) with base ring Fraction Field of Multivariate Polynomial Ring in c, d, a1, a2, a3, a4, b1, b2, b3, b4, s, c1, c2, c3, cos1, cos2, cos3, sin1, sin2, sin3, q1, q2, q3, q, a, b, n, m, cosA, sinA, y over Algebraic Field\n"}︡{"done":true}
︠486db35b-71ec-4871-87e9-b1e3ae023371s︠
yj = SR(y*j)
yj.parent()
︡e33f6ad2-9787-41fa-b1f2-3f4a304c9dd8︡{"stdout":"Symbolic Ring\n"}︡{"done":true}
︠41c5872d-400c-4351-bb62-59bca04efa24s︠
yj
︡339b52c5-a33b-4e40-80c3-a20a2fc980c8︡{"stdout":"y*j"}︡{"stdout":"\n"}︡{"done":true}
︠15293445-29cb-4c82-b5ba-0d13cdf43f30s︠
cosA.parent()
︡454f0a1e-9444-42e3-b5ee-fa7ea8b34bce︡{"stdout":"Multivariate Polynomial Ring in c, d, a1, a2, a3, a4, b1, b2, b3, b4, s, c1, c2, c3, cos1, cos2, cos3, sin1, sin2, sin3, q1, q2, q3, q, a, b, n, m, cosA, sinA, y over Algebraic Field\n"}︡{"done":true}
︠77c96374-9cfc-4610-b7ee-3e05e9c36c66s︠
var('alpha')
︡ac12d570-e345-44ef-a9ac-a4c0de9e19e9︡
︠ae5e2a95-6ec0-43c6-8781-e1d9400b8eaas︠
cosA + sinA*cosA == y*j
︡caa588f6-5c33-41b9-aed8-9628529c73a6︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1191, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\n  File \"/ext/sage/sage-8.9_1804/local/lib/python2.7/site-packages/sage/rings/polynomial/multi_polynomial_element.py\", line 1473, in __eq__\n    if not right:\n  File \"sage/algebras/quatalg/quaternion_algebra_element.pyx\", line 360, in sage.algebras.quatalg.quaternion_algebra_element.QuaternionAlgebraElement_abstract.__nonzero__ (build/cythonized/sage/algebras/quatalg/quaternion_algebra_element.cpp:6044)\n    return self[0] or self[1] or self[2] or self[3]\n  File \"sage/rings/fraction_field_element.pyx\", line 734, in sage.rings.fraction_field_element.FractionFieldElement.__int__ (build/cythonized/sage/rings/fraction_field_element.c:8717)\n    return int(self.__numerator)\n  File \"sage/rings/polynomial/multi_polynomial.pyx\", line 60, in sage.rings.polynomial.multi_polynomial.MPolynomial.__int__ (build/cythonized/sage/rings/polynomial/multi_polynomial.c:4405)\n    raise TypeError(f\"unable to convert non-constant polynomial {self} to an integer\")\nTypeError: unable to convert non-constant polynomial y to an integer\n"}︡{"done":true}
︠47d529c6-bc63-46d8-af21-421da13ac281s︠
y*j == cosA + sinA*cosA
︡497da1e5-af5a-4643-926f-a2f1c197c831︡{"stdout":"False"}︡{"stdout":"\n"}︡{"done":true}
︠b1a2d9ee-8566-45e4-a6f4-ee82e266939bs︠

eq.subs(cosA = cos(alpha/2), sinA = sin(alpha/2))

︡2249b5e9-a175-4513-b495-cb4d83f36ca7︡{"stdout":"cos(1/2*alpha)*sin(1/2*alpha) + cos(1/2*alpha) == x\n"}︡{"done":true}
︠57ad4815-01e8-4fb4-b85c-e06fd1977f15s︠
v1 = a1 * i + b1 * j + c1 * k
v2 = a2 * i + b2 * j + c2 * k
v3 = a3 * i + b3 * j + c3 * k

q1 = cos1 + v1 * sin1
q2 = cos2 + v2 * sin2
q3 = cos3 + v3 * sin3

beast = q1*q2*q3
︡fa2d0b21-36fc-4e92-9f81-76735b05fb00︡{"done":true}
︠35409d61-9342-4374-9856-09b4304b3368s︠
beast
︡1fd8bf81-6a84-42b2-a153-3c15e63d8e2d︡{"stdout":"a3*b2*c1*sin1*sin2*sin3 - a2*b3*c1*sin1*sin2*sin3 - a3*b1*c2*sin1*sin2*sin3 + a1*b3*c2*sin1*sin2*sin3 + a2*b1*c3*sin1*sin2*sin3 - a1*b2*c3*sin1*sin2*sin3 - a1*a2*cos3*sin1*sin2 - b1*b2*cos3*sin1*sin2 - c1*c2*cos3*sin1*sin2 - a1*a3*cos2*sin1*sin3 - b1*b3*cos2*sin1*sin3 - c1*c3*cos2*sin1*sin3 - a2*a3*cos1*sin2*sin3 - b2*b3*cos1*sin2*sin3 - c2*c3*cos1*sin2*sin3 + cos1*cos2*cos3 + (-a1*a2*a3*sin1*sin2*sin3 - a3*b1*b2*sin1*sin2*sin3 + a2*b1*b3*sin1*sin2*sin3 - a1*b2*b3*sin1*sin2*sin3 - a3*c1*c2*sin1*sin2*sin3 + a2*c1*c3*sin1*sin2*sin3 - a1*c2*c3*sin1*sin2*sin3 - b2*c1*cos3*sin1*sin2 + b1*c2*cos3*sin1*sin2 - b3*c1*cos2*sin1*sin3 + b1*c3*cos2*sin1*sin3 - b3*c2*cos1*sin2*sin3 + b2*c3*cos1*sin2*sin3 + a1*cos2*cos3*sin1 + a2*cos1*cos3*sin2 + a3*cos1*cos2*sin3)*i + (-a2*a3*b1*sin1*sin2*sin3 + a1*a3*b2*sin1*sin2*sin3 - a1*a2*b3*sin1*sin2*sin3 - b1*b2*b3*sin1*sin2*sin3 - b3*c1*c2*sin1*sin2*sin3 + b2*c1*c3*sin1*sin2*sin3 - b1*c2*c3*sin1*sin2*sin3 + a2*c1*cos3*sin1*sin2 - a1*c2*cos3*sin1*sin2 + a3*c1*cos2*sin1*sin3 - a1*c3*cos2*sin1*sin3 + a3*c2*cos1*sin2*sin3 - a2*c3*cos1*sin2*sin3 + b1*cos2*cos3*sin1 + b2*cos1*cos3*sin2 + b3*cos1*cos2*sin3)*j + (-a2*a3*c1*sin1*sin2*sin3 - b2*b3*c1*sin1*sin2*sin3 + a1*a3*c2*sin1*sin2*sin3 + b1*b3*c2*sin1*sin2*sin3 - a1*a2*c3*sin1*sin2*sin3 - b1*b2*c3*sin1*sin2*sin3 - c1*c2*c3*sin1*sin2*sin3 - a2*b1*cos3*sin1*sin2 + a1*b2*cos3*sin1*sin2 - a3*b1*cos2*sin1*sin3 + a1*b3*cos2*sin1*sin3 - a3*b2*cos1*sin2*sin3 + a2*b3*cos1*sin2*sin3 + c1*cos2*cos3*sin1 + c2*cos1*cos3*sin2 + c3*cos1*cos2*sin3)*k"}︡{"stdout":"\n"}︡{"done":true}
︠993b8ccd-1d1d-4183-9a1c-f247b0144e48s︠
list(beast)
︡2ecabc40-558e-4281-80b6-9012d064e4d2︡{"stdout":"[a3*b2*c1*sin1*sin2*sin3 - a2*b3*c1*sin1*sin2*sin3 - a3*b1*c2*sin1*sin2*sin3 + a1*b3*c2*sin1*sin2*sin3 + a2*b1*c3*sin1*sin2*sin3 - a1*b2*c3*sin1*sin2*sin3 - a1*a2*cos3*sin1*sin2 - b1*b2*cos3*sin1*sin2 - c1*c2*cos3*sin1*sin2 - a1*a3*cos2*sin1*sin3 - b1*b3*cos2*sin1*sin3 - c1*c3*cos2*sin1*sin3 - a2*a3*cos1*sin2*sin3 - b2*b3*cos1*sin2*sin3 - c2*c3*cos1*sin2*sin3 + cos1*cos2*cos3, -a1*a2*a3*sin1*sin2*sin3 - a3*b1*b2*sin1*sin2*sin3 + a2*b1*b3*sin1*sin2*sin3 - a1*b2*b3*sin1*sin2*sin3 - a3*c1*c2*sin1*sin2*sin3 + a2*c1*c3*sin1*sin2*sin3 - a1*c2*c3*sin1*sin2*sin3 - b2*c1*cos3*sin1*sin2 + b1*c2*cos3*sin1*sin2 - b3*c1*cos2*sin1*sin3 + b1*c3*cos2*sin1*sin3 - b3*c2*cos1*sin2*sin3 + b2*c3*cos1*sin2*sin3 + a1*cos2*cos3*sin1 + a2*cos1*cos3*sin2 + a3*cos1*cos2*sin3, -a2*a3*b1*sin1*sin2*sin3 + a1*a3*b2*sin1*sin2*sin3 - a1*a2*b3*sin1*sin2*sin3 - b1*b2*b3*sin1*sin2*sin3 - b3*c1*c2*sin1*sin2*sin3 + b2*c1*c3*sin1*sin2*sin3 - b1*c2*c3*sin1*sin2*sin3 + a2*c1*cos3*sin1*sin2 - a1*c2*cos3*sin1*sin2 + a3*c1*cos2*sin1*sin3 - a1*c3*cos2*sin1*sin3 + a3*c2*cos1*sin2*sin3 - a2*c3*cos1*sin2*sin3 + b1*cos2*cos3*sin1 + b2*cos1*cos3*sin2 + b3*cos1*cos2*sin3, -a2*a3*c1*sin1*sin2*sin3 - b2*b3*c1*sin1*sin2*sin3 + a1*a3*c2*sin1*sin2*sin3 + b1*b3*c2*sin1*sin2*sin3 - a1*a2*c3*sin1*sin2*sin3 - b1*b2*c3*sin1*sin2*sin3 - c1*c2*c3*sin1*sin2*sin3 - a2*b1*cos3*sin1*sin2 + a1*b2*cos3*sin1*sin2 - a3*b1*cos2*sin1*sin3 + a1*b3*cos2*sin1*sin3 - a3*b2*cos1*sin2*sin3 + a2*b3*cos1*sin2*sin3 + c1*cos2*cos3*sin1 + c2*cos1*cos3*sin2 + c3*cos1*cos2*sin3]\n"}︡{"done":true}
︠bb84b334-e029-425d-babf-98b3971a2f9as︠
hound = [N(x) for x in beast]
︡d69e9a31-907e-4bbd-a6a6-987cc3aee6bd︡{"done":true}
︠c0e088fe-89b7-44da-8543-f290025f00fbs︠
monster = [x.subs({sin1: 1, sin2: 1, sin3: 1, }) for x in hound]
︡37c96de9-cfe2-45b8-8075-ba5d25776016︡{"done":true}
︠3da8b91e-f540-4e87-8015-20d77a6a2ec7s︠
monster
︡cc88e1fe-f2b9-487d-8373-6bd2ab597963︡{"stdout":"[a3*b2*c1 - a2*b3*c1 - a3*b1*c2 + a1*b3*c2 + a2*b1*c3 - a1*b2*c3 - a2*a3*cos1 - b2*b3*cos1 - c2*c3*cos1 - a1*a3*cos2 - b1*b3*cos2 - c1*c3*cos2 - a1*a2*cos3 - b1*b2*cos3 - c1*c2*cos3 + cos1*cos2*cos3, -a1*a2*a3 - a3*b1*b2 + a2*b1*b3 - a1*b2*b3 - a3*c1*c2 + a2*c1*c3 - a1*c2*c3 - b3*c2*cos1 + b2*c3*cos1 - b3*c1*cos2 + b1*c3*cos2 + a3*cos1*cos2 - b2*c1*cos3 + b1*c2*cos3 + a2*cos1*cos3 + a1*cos2*cos3, -a2*a3*b1 + a1*a3*b2 - a1*a2*b3 - b1*b2*b3 - b3*c1*c2 + b2*c1*c3 - b1*c2*c3 + a3*c2*cos1 - a2*c3*cos1 + a3*c1*cos2 - a1*c3*cos2 + b3*cos1*cos2 + a2*c1*cos3 - a1*c2*cos3 + b2*cos1*cos3 + b1*cos2*cos3, -a2*a3*c1 - b2*b3*c1 + a1*a3*c2 + b1*b3*c2 - a1*a2*c3 - b1*b2*c3 - c1*c2*c3 - a3*b2*cos1 + a2*b3*cos1 - a3*b1*cos2 + a1*b3*cos2 + c3*cos1*cos2 - a2*b1*cos3 + a1*b2*cos3 + c2*cos1*cos3 + c1*cos2*cos3]\n"}︡{"done":true}
︠bcc33ebd-89f9-4ad2-83ef-df2fb8e38e1f︠

︡8a11f0e4-d72e-4aab-9adf-065779556bcd︡
︠0993333a-3eb3-42d8-afaf-749a1b7e1effs︠
for x in monster:
    print(x)
    print('')
︡f743a5b5-6cac-4757-a5a8-f9e31e0d894d︡{"stdout":"a3*b2*c1 - a2*b3*c1 - a3*b1*c2 + a1*b3*c2 + a2*b1*c3 - a1*b2*c3 - a2*a3*cos1 - b2*b3*cos1 - c2*c3*cos1 - a1*a3*cos2 - b1*b3*cos2 - c1*c3*cos2 - a1*a2*cos3 - b1*b2*cos3 - c1*c2*cos3 + cos1*cos2*cos3\n\n-a1*a2*a3 - a3*b1*b2 + a2*b1*b3 - a1*b2*b3 - a3*c1*c2 + a2*c1*c3 - a1*c2*c3 - b3*c2*cos1 + b2*c3*cos1 - b3*c1*cos2 + b1*c3*cos2 + a3*cos1*cos2 - b2*c1*cos3 + b1*c2*cos3 + a2*cos1*cos3 + a1*cos2*cos3\n\n-a2*a3*b1 + a1*a3*b2 - a1*a2*b3 - b1*b2*b3 - b3*c1*c2 + b2*c1*c3 - b1*c2*c3 + a3*c2*cos1 - a2*c3*cos1 + a3*c1*cos2 - a1*c3*cos2 + b3*cos1*cos2 + a2*c1*cos3 - a1*c2*cos3 + b2*cos1*cos3 + b1*cos2*cos3\n\n-a2*a3*c1 - b2*b3*c1 + a1*a3*c2 + b1*b3*c2 - a1*a2*c3 - b1*b2*c3 - c1*c2*c3 - a3*b2*cos1 + a2*b3*cos1 - a3*b1*cos2 + a1*b3*cos2 + c3*cos1*cos2 - a2*b1*cos3 + a1*b2*cos3 + c2*cos1*cos3 + c1*cos2*cos3\n\n"}︡{"done":true}
︠71f788ac-ed2e-4f74-8522-ff84e475d6das︠
var('cos1')
solve(monster[1] == monster[2], cos1)
︡188d271e-29f8-452d-80bb-35902ef9fe31︡{"stdout":"cos1\n"}︡{"stderr":"Error in lines 2-2\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1191, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\n  File \"/ext/sage/sage-8.9_1804/local/lib/python2.7/site-packages/sage/symbolic/relation.py\", line 1047, in solve\n    raise TypeError(\"The first argument must be a symbolic expression or a list of symbolic expressions.\")\nTypeError: The first argument must be a symbolic expression or a list of symbolic expressions.\n"}︡{"done":true}
︠12b0c31e-50a8-456e-a97c-e6b1efe133fds︠
var('cos1')
f_cos1 = solve(SR(monster[1]) == SR(monster[2]), cos1)
︡f4ea6447-ced9-441d-8ba0-c27bc139e0f6︡{"stdout":"cos1\n"}︡{"done":true}
︠d136b18b-7cea-4ca1-ba97-b49055d0aebbs︠
solve(SR(monster[2]) == SR(monster[3]), cos1)
︡551c20ae-00b5-4361-b81c-f2337440e0fb︡{"stdout":"[cos1 == (a2*a3*b1 - a1*a3*b2 + (a1*a2 + b1*b2)*b3 - (a2*a3 + b2*b3)*c1 + (a1*a3 + b1*b3 + b3*c1)*c2 - (a1*a2 + b1*b2 + b2*c1 - (b1 - c1)*c2)*c3 - (a3*b1 - a1*b3 + a3*c1 - a1*c3)*cos2 - (a2*b1 - a1*b2 + a2*c1 - a1*c2 + (b1 - c1)*cos2)*cos3)/(a3*b2 - a2*b3 + a3*c2 - a2*c3 + (b3 - c3)*cos2 + (b2 - c2)*cos3)]\n"}︡{"done":true}
︠2f0f27ad-0296-4e9a-926a-06cb91f5a8ccs︠
thing = SR(-(a1*a2*a3 - a2*a3*b1 + (a3 - b3)*c1*c2 + (a1*a3 + a3*b1)*b2 - (a1*a2 + a2*b1 - (a1 - b1)*b2)*b3 - ((a2 - b2)*c1 - (a1 - b1)*c2)*c3 + ((a3 + b3)*c1 - (a1 + b1)*c3)*cos2 + ((a2 + b2)*c1 - (a1 + b1)*c2 - (a1 - b1)*cos2)*cos3)/((a3 + b3)*c2 - (a2 + b2)*c3 - (a3 - b3)*cos2 - (a2 - b2)*cos3)) == SR((a2*a3*b1 - a1*a3*b2 + (a1*a2 + b1*b2)*b3 - (a2*a3 + b2*b3)*c1 + (a1*a3 + b1*b3 + b3*c1)*c2 - (a1*a2 + b1*b2 + b2*c1 - (b1 - c1)*c2)*c3 - (a3*b1 - a1*b3 + a3*c1 - a1*c3)*cos2 - (a2*b1 - a1*b2 + a2*c1 - a1*c2 + (b1 - c1)*cos2)*cos3)/(a3*b2 - a2*b3 + a3*c2 - a2*c3 + (b3 - c3)*cos2 + (b2 - c2)*cos3))

︡65037da7-4f79-4518-bd93-01c2ac639a59︡{"done":true}
︠1714ed14-e2f7-4ec9-be7f-6bb7ac9560aas︠
thing
︡1ea490e8-c536-4592-a5bb-741f2f518095︡{"stdout":"-(a1*a2*a3 - a2*a3*b1 + a1*a3*b2 + a3*b1*b2 - a1*a2*b3 - a2*b1*b3 + a1*b2*b3 - b1*b2*b3 + a3*c1*c2 - b3*c1*c2 - a2*c1*c3 + b2*c1*c3 + a1*c2*c3 - b1*c2*c3 + (a3*c1 + b3*c1 - a1*c3 - b1*c3)*cos2 + (a2*c1 + b2*c1 - a1*c2 - b1*c2 - (a1 - b1)*cos2)*cos3)/(a3*c2 + b3*c2 - a2*c3 - b2*c3 - (a3 - b3)*cos2 - a2*cos3 + b2*cos3) == (a2*a3*b1 - a1*a3*b2 + a1*a2*b3 + b1*b2*b3 - a2*a3*c1 - b2*b3*c1 + a1*a3*c2 + b1*b3*c2 + b3*c1*c2 - a1*a2*c3 - b1*b2*c3 - b2*c1*c3 + b1*c2*c3 - c1*c2*c3 - (a3*b1 - a1*b3 + a3*c1 - a1*c3)*cos2 - (a2*b1 - a1*b2 + a2*c1 - a1*c2 + (b1 - c1)*cos2)*cos3)/(a3*b2 - a2*b3 + a3*c2 - a2*c3 + (b3 - c3)*cos2 + b2*cos3 - c2*cos3)\n"}︡{"done":true}
︠d20b257e-75a3-46a7-99ad-5197af210684s︠
var('cos2')
f_cos2 = solve(SR(thing), cos2)
︡07c3ed80-d842-4944-93ad-9371dab3d932︡{"stdout":"cos2\n"}︡{"done":true}
︠0e970103-85fd-4805-8264-9a8a7008ca07︠

︡67dc02bd-e9f4-4419-bad7-a813fb42f2d1︡
︠4a63a01a-6cb5-416b-a4c9-78b2342f7d35s︠
len(sol)
︡f6b88d47-4d10-4325-b89b-096da3b4ec34︡{"stdout":"2\n"}︡{"done":true}
︠3467fa63-70cf-4580-82d4-44c9d8f8a16e︠

︡63b79569-04be-4778-a70a-8f0f281bad1f︡
︠b98e56d4-49f8-498a-b9d1-631b1d11adf2s︠
parametric_plot3d([f_cos1, f_cos2, cos3], (cos3, -1, 1))
︡b3654e3a-91da-4c1f-a722-631eb4764a92︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1191, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\n  File \"/ext/sage/sage-8.9_1804/local/lib/python2.7/site-packages/sage/misc/decorators.py\", line 653, in wrapper\n    return func(*args, **kwds)\n  File \"/ext/sage/sage-8.9_1804/local/lib/python2.7/site-packages/sage/plot/plot3d/parametric_plot3d.py\", line 999, in parametric_plot3d\n    return sum([parametric_plot3d(v, urange, vrange, plot_points=plot_points, **kwds) for v in f])\n  File \"/ext/sage/sage-8.9_1804/local/lib/python2.7/site-packages/sage/misc/decorators.py\", line 653, in wrapper\n    return func(*args, **kwds)\n  File \"/ext/sage/sage-8.9_1804/local/lib/python2.7/site-packages/sage/plot/plot3d/parametric_plot3d.py\", line 1002, in parametric_plot3d\n    raise ValueError(\"f must be a list, tuple, or vector of length 3\")\nValueError: f must be a list, tuple, or vector of length 3\n"}︡{"done":true}
︠41b3eccc-d06b-4c62-89ce-fdc1df6bebb6︠

SR(monster[1])
︡0245eee4-c8b6-4211-ab54-32e949f537a7︡{"stdout":"-a1*a2*a3 - a3*b1*b2 + a2*b1*b3 - a1*b2*b3 - a3*c1*c2 + a2*c1*c3 - a1*c2*c3 - b3*c2*cos1 + b2*c3*cos1 - b3*c1*cos2 + b1*c3*cos2 + a3*cos1*cos2 - b2*c1*cos3 + b1*c2*cos3 + a2*cos1*cos3 + a1*cos2*cos3\n"}︡{"done":true}
︠5b6d3de8-ced3-496b-a805-bc3ca978d17ds︠
u = SR.var('u0, u1, u2, u3')
︡90eb9fab-0e59-4268-86d4-1970490427fd︡{"done":true}
︠a0c381ae-60f1-4f65-8d68-2f754fe3b975s︠
solve([SR(monster[i]) == u[i] for i in (1 .. 3) ], SR(cos1), SR(cos2), SR(cos3), )
︡ec5cee8d-fe14-4081-bc3d-05021092ded1︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1191, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\n  File \"/ext/sage/sage-8.9_1804/local/lib/python2.7/site-packages/sage/symbolic/relation.py\", line 1113, in solve\n    s = m.to_poly_solve(variables)\n  File \"/ext/sage/sage-8.9_1804/local/lib/python2.7/site-packages/sage/interfaces/maxima_lib.py\", line 1117, in to_poly_solve\n    return self.parent()(maxima_eval(cmd))\n  File \"sage/libs/ecl.pyx\", line 806, in sage.libs.ecl.EclObject.__call__ (build/cythonized/sage/libs/ecl.c:7792)\n    return ecl_wrap(ecl_safe_apply(self.obj,(<EclObject>lispargs).obj))\n  File \"sage/libs/ecl.pyx\", line 378, in sage.libs.ecl.ecl_safe_apply (build/cythonized/sage/libs/ecl.c:5454)\n    raise RuntimeError(\"ECL says: {}\".format(\nRuntimeError: ECL says: Console interrupt.\n"}︡{"done":true}
︠aad9c73e-7ff4-41e1-905f-15a591e4b0bfs︠
solve([SR(monster[i]) == u[i] for i in (1 .. 3) ], SR(cos1), SR(cos2), SR(cos3), to_poly_solve=True)
︡a7d6108f-4d0f-4f39-b579-83d0e754f00c︡{"stdout":"[-a1*a2*a3 - a3*b1*b2 + a2*b1*b3 - a1*b2*b3 - a3*c1*c2 + a2*c1*c3 - a1*c2*c3 - b3*c2*cos1 + b2*c3*cos1 - b3*c1*cos2 + b1*c3*cos2 + a3*cos1*cos2 - b2*c1*cos3 + b1*c2*cos3 + a2*cos1*cos3 + a1*cos2*cos3 == u1, -a2*a3*b1 + a1*a3*b2 - a1*a2*b3 - b1*b2*b3 - b3*c1*c2 + b2*c1*c3 - b1*c2*c3 + a3*c2*cos1 - a2*c3*cos1 + a3*c1*cos2 - a1*c3*cos2 + b3*cos1*cos2 + a2*c1*cos3 - a1*c2*cos3 + b2*cos1*cos3 + b1*cos2*cos3 == u2, -a2*a3*c1 - b2*b3*c1 + a1*a3*c2 + b1*b3*c2 - a1*a2*c3 - b1*b2*c3 - c1*c2*c3 - a3*b2*cos1 + a2*b3*cos1 - a3*b1*cos2 + a1*b3*cos2 + c3*cos1*cos2 - a2*b1*cos3 + a1*b2*cos3 + c2*cos1*cos3 + c1*cos2*cos3 == u3]"}︡{"stdout":"\n"}︡{"done":true}
︠5eb280dd-c51c-4f3c-af1a-ff15fa672279s︠
find_root([SR(monster[i]) == u[i] for i in (1 .. 3) ], SR(cos1), SR(cos2), SR(cos3))
︡466d4993-088d-4c11-9274-100695846885︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1191, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\n  File \"sage/misc/lazy_import.pyx\", line 354, in sage.misc.lazy_import.LazyImport.__call__ (build/cythonized/sage/misc/lazy_import.c:3697)\n    return self.get_object()(*args, **kwds)\n  File \"/ext/sage/sage-8.9_1804/local/lib/python2.7/site-packages/sage/numerical/optimize.py\", line 109, in find_root\n    a = float(a); b = float(b)\n  File \"sage/symbolic/expression.pyx\", line 1428, in sage.symbolic.expression.Expression.__float__ (build/cythonized/sage/symbolic/expression.cpp:11063)\n    raise TypeError(\"unable to simplify to float approximation\")\nTypeError: unable to simplify to float approximation\n"}︡{"done":true}
︠cee8a5e4-9cfe-4494-83d4-b54db74584d4︠

︡4fac8bb2-20f3-42fa-969c-1c4e2ee4269e︡
︠8382a0dc-1e1c-4ea0-b4a1-de41ba5edcc3︠

︡64cc1cd2-6f5f-43e6-8bd4-1047cb1d3261︡
︠67954aa0-611d-434c-a467-47066a3f5514︠

︡f063a4b6-ccc8-4540-8e93-66ea1649e8a9︡
︠560c2b6e-3336-4e16-bf7c-8af0c25dff5c︠
%md

# goal

## subgoal
ghjlhu hello i wanr solve $x^2 + y^2 = 1$

︡b9b65b67-f5bb-4b93-9ffc-52517e94c38e︡{"done":true,"md":"\n# goal\n\n## subgoal\nghjlhu hello i wanr solve $x^2 + y^2 = 1$"}
︠322d2fd3-154c-4ee0-8dde-ec8cf852ecc9︠
a3*b2*c1 - a2*b3*c1 - a3*b1*c2 + a1*b3*c2 + a2*b1*c3 - a1*b2*c3 - a1*a2*cotan(alpha3/2) - b1*b2*cotan(alpha3/2) - c1*c2*cotan(alpha3/2) - a1*a3*cotan(alpha2/2) - b1*b3*cotan(alpha2/2) - c1*c3*cotan(alpha2/2) - a2*a3*cotan(alpha1/2) - b2*b3* - c2*c3*cotan(alpha1/2) + cotan(alpha1/2)*cotan(alpha2/2)*cotan(alpha3/2) + (-a1*a2*a3 - a3*b1*b2 + a2*b1*b3 - a1*b2*b3 - a3*c1*c2 + a2*c1*c3 - a1*c2*c3 - b2*c1*cotan(alpha3/2) + b1*c2*cotan(alpha3/2) - b3*c1*cotan(alpha2/2) + b1*c3*cotan(alpha2/2) - b3*c2*cotan(alpha1/2) + b2*c3*cotan(alpha1/2) + a1*cotan(alpha2/2)*cotan(alpha3/2) + a2*cotan(alpha1/2)*cotan(alpha3/2) + a3*cotan(alpha1/2)*cotan(alpha2/2))*i + (-a2*a3*b1 + a1*a3*b2 - a1*a2*b3 - b1*b2*b3 - b3*c1*c2 + b2*c1*c3 - b1*c2*c3 + a2*c1*cotan(alpha3/2) - a1*c2*cotan(alpha3/2) + a3*c1*cotan(alpha2/2) - a1*c3*cotan(alpha2/2) + a3*c2*cotan(alpha1/1) - a2*c3*cotan(alpha1/1) + b1*cotan(alpha2/2)*cotan(alpha3/2) + b2*cotan(alpha1/2)*cotan(alpha3/2) + b3*cotan(alpha1/2)*cotan(alpha2/2))*j + (-a2*a3*c1 - b2*b3*c1 + a1*a3*c2 + b1*b3*c2 - a1*a2*c3 - b1*b2*c3 - c1*c2*c3 - a2*b1*cotan(alpha3/2) + a1*b2*cotan(alpha3/2) - a3*b1*cotan(alpha2/2) + a1*b3*cotan(alpha2/2) - a3*b2*cotan(alpha1/2) + a2*b3*cotan(alpha1/2) + c1*cotan(alpha2/2)*cotan(alpha3/2) + c2*cotan(alpha1/2)*cotan(alpha3/2) + c3*cotan(alpha1/2)*cotan(alpha2/2))*k == x + ()
︡4a59f33a-0816-44c2-b074-76b08e0f31fa︡
︠c507dafa-742b-4475-977f-927c6a7d7fdas︠
two = QQbar(2)

a1 = 0
a2 = 1/sqrt(two)
a3 = 1/sqrt(two)
b1 = 1/sqrt(two)
b2 = 0
b3 = 1/sqrt(two)

c1 =1/sqrt(two)
c2 =1/sqrt(two)
c3 = 0

v1 = a1 * i + b1 * j + c1 * k
v2 = a2 * i + b2 * j + c2 * k
v3 = a3 * i + b3 * j + c3 * k

q1 = cos1 + v1 * sin1
q2 = cos2 + v2 * sin2
q3 = cos3 + v3 * sin3

q1*q2*q3

I = 1/2*cos(alpha1/2)*cos(alpha3/2)*sin(alpha2/2) + 1/4*cos(alpha3/2)*sin(alpha1/2)*sin(alpha2/2) + 1/2*cos(alpha1/2)*cos(alpha2/2)*sin(alpha3/2) - 1/4*cos(alpha2/2)*sin(alpha1/2)*sin(alpha3/2) - 1/4*cos(alpha1/2)*sin(alpha2/2)*sin(alpha3/2) == 0
J = 1/2*cos(alpha2/2)*cos(alpha3/2)*sin(alpha1/2) + 1/4*cos(alpha3/2)*sin(alpha1/2)*sin(alpha2/2) + 1/2*cos(alpha1/2)*cos(alpha2/2)*sin(alpha3/2) + 1/4*cos(alpha2/2)*sin(alpha1/2)*sin(alpha3/2) + 1/4*cos(alpha1/2)*sin(alpha2/2)*sin(alpha3/2) - 1/4*sin(alpha1/2)*sin(alpha2/2)*sin(alpha3/2) ==0
K = 1/2*cos(alpha2/2)*cos(alpha3/2)*sin(alpha1/2) + 1/2*cos(alpha1/2)*cos(alpha3/2)*sin(alpha2/2) - 1/4*cos(alpha3/2)*sin(alpha1/2)*sin(alpha2/2) - 1/4*cos(alpha2/2)*sin(alpha1/2)*sin(alpha3/2) + 1/4*cos(alpha1/2)*sin(alpha2/2)*sin(alpha3/2) ==0

implicit_plot3d(I, (alpha1,0,6.3),(alpha2,0,6.3),(alpha3,0,6.3))
implicit_plot3d(J, (alpha1,0,6.3),(alpha2,0,6.3),(alpha3,0,6.3))
implicit_plot3d(K, (alpha1,0,6.3),(alpha2,0,6.3),(alpha3,0,6.3))
︡a7d2f92a-309c-40c0-9c1c-6fe73e97a0fd︡{"stdout":"cos1*cos2*cos3 + (-1/2)*cos3*sin1*sin2 + (-1/2)*cos2*sin1*sin3 + (-1/2)*cos1*sin2*sin3 + (-0.7071067811865475?)*sin1*sin2*sin3 + (0.7071067811865475?*cos1*cos3*sin2 + 1/2*cos3*sin1*sin2 + 0.7071067811865475?*cos1*cos2*sin3 + (-1/2)*cos2*sin1*sin3 + (-1/2)*cos1*sin2*sin3)*i + (0.7071067811865475?*cos2*cos3*sin1 + 1/2*cos3*sin1*sin2 + 0.7071067811865475?*cos1*cos2*sin3 + 1/2*cos2*sin1*sin3 + 1/2*cos1*sin2*sin3 + (-0.7071067811865475?)*sin1*sin2*sin3)*j + (0.7071067811865475?*cos2*cos3*sin1 + 0.7071067811865475?*cos1*cos3*sin2 + (-1/2)*cos3*sin1*sin2 + (-1/2)*cos2*sin1*sin3 + 1/2*cos1*sin2*sin3)*k"}︡{"stdout":"\n"}︡{"file":{"filename":"509a743c-6ae3-49bc-b907-cc464cbefe50.sage3d","uuid":"509a743c-6ae3-49bc-b907-cc464cbefe50"}}︡{"file":{"filename":"3a955a2b-3ef4-4252-a9f5-c84ced243d40.sage3d","uuid":"3a955a2b-3ef4-4252-a9f5-c84ced243d40"}}︡{"file":{"filename":"bfcf9ad7-e4da-4a08-8f2f-797edd63e9e4.sage3d","uuid":"bfcf9ad7-e4da-4a08-8f2f-797edd63e9e4"}}︡{"done":true}
︠1ce55e61-5ea7-4126-beaa-df6b5b966bd0s︠
var('x,y,z')
P = x^2 + y^2+z^2 <1
implicit_plot3d(P, (x, -1.5,1.5), (y, -1.5,1.5), (z, -1.5,1.5))
︡16c648fb-f8ce-4ee9-b808-bf6935936500︡{"stdout":"(x, y, z)\n"}︡{"stderr":"Error in lines 3-3\nTraceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1191, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\n  File \"sage/misc/lazy_import.pyx\", line 354, in sage.misc.lazy_import.LazyImport.__call__ (build/cythonized/sage/misc/lazy_import.c:3690)\n    return self.get_object()(*args, **kwds)\n  File \"/ext/sage/sage-8.8_1804/local/lib/python2.7/site-packages/sage/plot/plot3d/implicit_plot3d.py\", line 627, in implicit_plot3d\n    G = ImplicitSurface(f, xrange, yrange, zrange, **kwds)\n  File \"sage/plot/plot3d/implicit_surface.pyx\", line 984, in sage.plot.plot3d.implicit_surface.ImplicitSurface.__init__ (build/cythonized/sage/plot/plot3d/implicit_surface.c:14437)\n    self.f, ranges, self.vars = setup_for_eval_on_grid(f, [xrange, yrange, zrange], return_vars=True)\n  File \"/ext/sage/sage-8.8_1804/local/lib/python2.7/site-packages/sage/plot/misc.py\", line 146, in setup_for_eval_on_grid\n    return (fast_float(funcs, *vars, **options),\n  File \"sage/ext/fast_eval.pyx\", line 1403, in sage.ext.fast_eval.fast_float (build/cythonized/sage/ext/fast_eval.c:11017)\n    return fast_callable(f, vars=vars, domain=float, _autocompute_vars_for_backward_compatibility_with_deprecated_fast_float_functionality=True, expect_one_var=expect_one_var)\n  File \"sage/ext/fast_callable.pyx\", line 496, in sage.ext.fast_callable.fast_callable (build/cythonized/sage/ext/fast_callable.c:4732)\n    et = x._fast_callable_(etb)\n  File \"sage/symbolic/expression.pyx\", line 11947, in sage.symbolic.expression.Expression._fast_callable_ (build/cythonized/sage/symbolic/expression.cpp:62131)\n    return fast_callable(self, etb)\n  File \"/ext/sage/sage-8.8_1804/local/lib/python2.7/site-packages/sage/symbolic/expression_conversions.py\", line 1889, in fast_callable\n    return FastCallableConverter(ex, etb)()\n  File \"/ext/sage/sage-8.8_1804/local/lib/python2.7/site-packages/sage/symbolic/expression_conversions.py\", line 220, in __call__\n    return self.relation(ex, operator)\n  File \"/ext/sage/sage-8.8_1804/local/lib/python2.7/site-packages/sage/symbolic/expression_conversions.py\", line 1764, in relation\n    raise NotImplementedError\nNotImplementedError\n"}︡{"done":true}

a + b*s + c* t +









