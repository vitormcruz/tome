tests
test_chain_calling_proxy

	self assert: (ChainProxyTester chain proxy: 'An object')
		  equals: 'An object proxied'.