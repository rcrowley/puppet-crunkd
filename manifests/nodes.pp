import "lighty"
import "apache"
import "python"

node default {
	include lighty
	include apache
	include python
}

node 'crunkd.getcrunkd.com' inherits default {}
