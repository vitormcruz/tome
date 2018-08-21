accessing
observers

	^ Set newFrom: ((localAnnouncerFechBlock value value subscriptions subscriptions) collect: #subscriber).