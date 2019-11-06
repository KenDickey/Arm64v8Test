'From Cuis 5.0 of 7 November 2016 [latest update: #3485] on 6 February 2019 at 1:45:03 pm'!

!FFITestLibrary methodsFor: 'primitives' stamp: 'KenD 2/4/2019 15:27:30'!
ffiTestBiggerStruct: pt1 with: pt2
	<cdecl: FFITestBiggerStruct 'ffiTestStructBigger' (FFITestPoint4 FFITestPoint4) module:'SqueakFFIPrims'>
	^self externalCallFailed! !
