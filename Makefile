.PHONY: vendor_schema
vendor_schema:
	cue vendorgithubschema :workflows_tool

.PHONY: clean
clean:
	rm -rf cue.mod/pkg/*
