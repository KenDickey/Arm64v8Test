'From Cuis 5.0 of 7 November 2016 [latest update: #3589] on 7 February 2019 at 3:07:23 am'!

!FFITestLibrary class methodsFor: 'primitives' stamp: 'KenD 2/7/2019 02:52:17'!
ffiTestBiggerStruct: pt1 with: pt2
	<cdecl: FFITestBiggerStruct 'ffiTestStructBigger' (FFITestPoint4 FFITestPoint4) module:'SqueakFFIPrims'>
	^self externalCallFailed! !
