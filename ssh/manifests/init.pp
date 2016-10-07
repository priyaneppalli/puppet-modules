class ssh{
  if $osfamily == 'RedHat'{
                $service_name='sshd'
		$pkg="httpd"
			}
 if $osfamily == 'Debian'{
                $service_name='ssh'
                $pkg="http"
                        }
else{
		$service_name="ssh"
	}

       package{"openssh":
            ensure=>present,
           name=>$pkg
   }
       file{"/etc/ssh/sshd_config":
            source=> "puppet:///modules/ssh/sshd_config",
	    notify=>Service["sshd"]
 	   }
	service{"sshd":
	   name=>$service_name,
           ensure=>running,
	   require=>Package["openssh"]
	}
}
