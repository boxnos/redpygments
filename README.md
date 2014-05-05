# RedPygments

RedPygments is a markdown converter using Slim, RedCarpet and Pygments(.rb). It improves your markdown life.


## Installation

### Clone RedPygments from github
~~~~
$ git clone https://github.com/boxnos/redpygments.git
~~~~

### Install
~~~~
$ cd redpygments
$ rake install
~~~~

### Uninstall
~~~~
$ gem uninstall redpygments
~~~~


## Usage

### Use default template

~~~~
$ redpygments -d awesome.md
~~~~

### Use your template

~~~
$ redpygments -s template.slim awesome.md
~~~

### Output to file

~~~
$ redpygments -s template.slim awesome.md -o awesome.html
~~~


## Contributing

1. Fork it ( https://github.com/boxnos/redpygments/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
