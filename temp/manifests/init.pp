class temp{
   file{"/etc/temp":
     ensure=>present,
     content=>template('temp/temp.erb')
     }
}

