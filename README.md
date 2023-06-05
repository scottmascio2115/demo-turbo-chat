### How this project was created
rails new demo-turbo-chat --css=bootstrap --javascript=esbuild --database=postgresql

### Ruby Version
3.1.2

### Rails Version
7.0.5

### Turbo Rails Version
1.4.0

### How To Set Up Project
Bundle Install
bin/setup to install dependencies
bin/dev to start rails server, precompile CSS and JS
Visit http://localhost:3000

### Models
Message
    - body

### Not out of the box Rails Gems
gem "simple_form", "~> 5.1.0"
bin/rails generate simple_form:install
gem "devise", "~> 4.8.1"
