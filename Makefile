PRODUCT_NAME := ManageWorkingTime

.PHONY: generate-xcodeproj
generate-xcodeproj:
	mint run xcodegen generate
	bundle exec pod install
	make open

.PHONY: open
open:
	open ./${PRODUCT_NAME}.xcworkspace
