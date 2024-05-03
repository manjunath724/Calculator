### Development/Implementation Steps

* Clone the repository
```
git clone git@github.com:manjunath724/Calculator.git
```
* Set `ruby-3.2.2` as a default version for the current repo
```
asdf global ruby 3.2.2
```
* Run bundle to install gem
```
bundle install
```
* Initialize rspec to generate `Rspec.configure` under `spec_helper.rb` and require it in `.rspec` file
```
bundle exec rspec --init
```
