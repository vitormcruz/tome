tests
test_link_description_min_validation
	| validationMetaLink objectValidated error contextHolder |

	validationMetaLink := MANumberDescription new	accessor: #p1; min: 20; asGeneratedValidationMetaLink.
	contextHolder := self captureContextFrom: validationMetaLink.
	(DVM_ClassToLinkValidations >> #p1:) ast link: validationMetaLink.
	objectValidated := DVM_ClassToLinkValidations new.	
	objectValidated p1: 19.
	self assertBlock: [ validationObserver isValidationSuccessful not ].
	error := validationObserver errors rowAt: 1.
	self assertCollection: error asSet hasSameElements: { 'DVM_ClassToLinkValidations.p1.min'. objectValidated. contextHolder contents. }.
