namespace :staticmatic do
  
  task :preview do
    sh "staticmatic preview staticmatic"
  end
  
  task :build do
    sh "staticmatic build staticmatic"
  end
  
end