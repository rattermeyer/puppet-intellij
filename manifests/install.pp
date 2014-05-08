class intellij::install (
	$owner       = dev
) {
	archive { "intellij-${intellij::version}":
		ensure 	=> present,
		url 	=> "http://download-ln.jetbrains.com/idea/ideaIU-${intellij::version}.tar.gz",
		target 	=> '/opt/intellij',
		timeout => 1800,
		checksum => false
	}

	file { '/opt/intellij/current':
		ensure => 'link',
		target => "/opt/intellij/idea-IU-${intellij::build}",
		require => Archive["intellij-${intellij::version}"]
	}
	
	file { ['/home/dev/Desktop'] :
		ensure => 'directory',
		owner => 'dev',
		group => 'dev'
	}
	file { '/home/dev/Desktop/jetbrains-idea.desktop' :
		ensure 	=> present,
		source  => 'puppet:///modules/intellij/jetbrains-idea.desktop',
 		mode    => 'a+rx,u+w',
                owner   => 'dev',
                group   => 'dev',
		require => File['/home/dev/Desktop']
	}~>
	file { ["/home/${owner}/.IntelliJIdea13","/home/${owner}/.IntelliJIdea13/system"] :
		ensure => 'directory',
		owner	=> "${owner}"
	}

}
