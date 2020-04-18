scenario builder
scenarioOutline: aString def: aStringDescription examples: examples run: aBlock

	^ scenarioBuildStrategy scenarioOutline: aString 
							      def: aStringDescription 
								   examples: examples run: aBlock.