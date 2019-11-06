'From Cuis 5.0 of 7 November 2016 [latest update: #3589] on 7 February 2019 at 3:07:51 am'!

!FFIPluginTests methodsFor: 'structure tests' stamp: 'KenD 2/4/2019 15:36:17'!
testBiggerStruct
	"Test passing and returning up of structures > 64 bit"
	| pt1 pt2 pt3 |
	pt1 := FFITestPoint4 new.
	pt1 x: 1. pt1 y: 2. pt1 z: 3. pt1 w: 4.
	pt2 := FFITestPoint4 new.
	pt2 x: 5. pt2 y: 6. pt2 z: 7. pt2 w: 8.
	pt3 := FFITestLibrary ffiTestBiggerStruct: pt1 with: pt2.
	self assert: pt3 x = 1.
	self assert: pt3 y = 2.
	self assert: pt3 z = 3.
	self assert: pt3 w = 4.
	self assert: pt3 r = 5.
	self assert: pt3 s = 6.
	self assert: pt3 t = 7.
	self assert: pt3 u = 8.! !
