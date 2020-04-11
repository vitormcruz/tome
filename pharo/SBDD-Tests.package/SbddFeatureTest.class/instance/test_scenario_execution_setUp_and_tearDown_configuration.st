tests - scenarios execution
test_scenario_execution_setUp_and_tearDown_configuration

	| executed sbddFeature |

	sbddFeature := SbddFeatureTestSetupTearDown new.

    (sbddFeature scenario: 'scenario_test' 
					  def: 'Step with one parameter "parameter1" ' 
					  run: [ 
						    self assert: sbddFeature setupVar isNotNil.
						    sbddFeature tearDownBlock: [ executed := true].
					  ]) run.
					
    self assert: executed.