class apache{
              package{"httpd":
                       ensure=>present,
                     }
              file{"/var/www/html/index.html":
                      source=>"puppet:///modules/apache/index.html",
                  }
              service{"httpd":
                      ensure=>running,
                     }
             }

