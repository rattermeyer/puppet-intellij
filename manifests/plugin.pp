define intellij::plugin (
	$name = AngularJS,
	$owner	     = dev,
	$url        = 'http://plugins.jetbrains.com/plugin/download?pr=idea\&updateId=15682',
	$extension	= 'zip'
) {
	archive { "plugin-${name}":
		ensure 	=> present,
		url 	=> "${url}",
		target 	=> "/home/${owner}/.IntelliJIdea13/config/plugins",
		timeout => 600,
		extension => $extension,
		checksum => false
	}~>
	file { "/home/${owner}/.IntelliJIdea13/config/plugins/${name}":
		ensure => 'directory',
		recurse => true,
		owner	=> "${owner}"
	}
}
