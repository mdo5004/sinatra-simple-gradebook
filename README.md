# sinatra-simple-gradebook
A simple gradebook for the busy teacher

## Install
To install, clone this repo with `git clone` or download to a directory on your computer.

## Run
### Start server
To run **SimpleGradebook**, navigate to the `sinatra-simple-gradebook` directory in your **Terminal** and run `bundle install`, followed by `rack db:migrate`, followed by `rackup` to start a localhost server (or `shotgun` if you want to run SimpleGradebook and **edit** it at the same time). 
### Start using SimpleGradebook
With a server running, you should see something like `Listening on localhost:9393` or `Listening on 0.0.0.0:3000`. Open your browser and navigate to `localhost:` followed by the last 4 digits of the `Listening` line in your Terminal (e.g. `localhost:9393` or `localhost:3000`)

## Contribute
If you'd like to contribute to the repo, please make a pull request [here](https://github.com/mdo5004/sinatra-simple-gradebook)

### Desired Features
+ Assignments are automatically assigned to students in a class
+ Teachers can search for students and classes
