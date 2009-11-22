import "lighty"
import "apache"

node default {
	include lighty
	include apache
}

node 'crunkd.getcrunkd.com' inherits default {}
