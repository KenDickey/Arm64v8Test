'From Cuis 5.0 of 7 November 2016 [latest update: #3589] on 7 February 2019 at 3:07:03 am'!
!classDefinition: #FFITestBiggerStruct category: #FFITests!
ExternalStructure subclass: #FFITestBiggerStruct
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FFITests'!
!FFITestBiggerStruct commentStamp: '<historical>' prior: 0!
Used in FFI unit test(s)!


!FFITestBiggerStruct methodsFor: 'accessing'!
r
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	^handle signedLongLongAt: 33! !

!FFITestBiggerStruct methodsFor: 'accessing'!
r: anObject
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	handle signedLongLongAt: 33 put: anObject! !

!FFITestBiggerStruct methodsFor: 'accessing'!
s
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	^handle signedLongLongAt: 41! !

!FFITestBiggerStruct methodsFor: 'accessing'!
s: anObject
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	handle signedLongLongAt: 41 put: anObject! !

!FFITestBiggerStruct methodsFor: 'accessing'!
t
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	^handle signedLongLongAt: 49! !

!FFITestBiggerStruct methodsFor: 'accessing'!
t: anObject
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	handle signedLongLongAt: 49 put: anObject! !

!FFITestBiggerStruct methodsFor: 'accessing'!
u
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	^handle signedLongLongAt: 57! !

!FFITestBiggerStruct methodsFor: 'accessing'!
u: anObject
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	handle signedLongLongAt: 57 put: anObject! !

!FFITestBiggerStruct methodsFor: 'accessing'!
w
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	^handle signedLongLongAt: 25! !

!FFITestBiggerStruct methodsFor: 'accessing'!
w: anObject
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	handle signedLongLongAt: 25 put: anObject! !

!FFITestBiggerStruct methodsFor: 'accessing'!
x
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	^handle signedLongLongAt: 1! !

!FFITestBiggerStruct methodsFor: 'accessing'!
x: anObject
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	handle signedLongLongAt: 1 put: anObject! !

!FFITestBiggerStruct methodsFor: 'accessing'!
y
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	^handle signedLongLongAt: 9! !

!FFITestBiggerStruct methodsFor: 'accessing'!
y: anObject
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	handle signedLongLongAt: 9 put: anObject! !

!FFITestBiggerStruct methodsFor: 'accessing'!
z
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	^handle signedLongLongAt: 17! !

!FFITestBiggerStruct methodsFor: 'accessing'!
z: anObject
	"This method was automatically generated. See FFITestBiggerStruct class>>fields."
	<generated>
	handle signedLongLongAt: 17 put: anObject! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FFITestBiggerStruct class' category: #FFITests!
FFITestBiggerStruct class
	instanceVariableNames: ''!

!FFITestBiggerStruct class methodsFor: 'field definition' stamp: 'KenD 2/7/2019 03:04:19'!
fields
	"FFITestPoint4 defineFields"
	^#(
		(x	'longlong')
		(y	'longlong')
		(z	'longlong')
		(w	'longlong')
		(r  'longlong')
		(s  'longlong')
		(t  'longlong')
		(u  'longlong')
	)! !


!FFITestBiggerStruct class methodsFor: 'class initialization' stamp: 'KenD 2/7/2019 03:04:32'!
initialize
"
	self defineFields; compileFields.
"
	self compileFields! !


FFITestBiggerStruct initialize!


FFITestBiggerStruct compileFields!
