# YAPM - Yet Another Pip Manager

(rather dependency tracker, but `yapm` is way better name than `yapdt`)

`yapm` is tool for installing packages from pypi, and storing installed things in `requirements/*.txt` files. 

## Why?

Because I want to track packages I install in my environment, to have quite ready files for `pip -r` commands.

## How to use it:

```
    $ yapm.sh packagename==requirements
```

or

```
    $ yapm.sh git+https://github.com/packageverndor/packagename
```

Note! when installed from git, then package will be installed in edit mode

## How to install it:

```
    make install
```

## Why not pip freeze?

Because pip freeze shows lot of dependencies, which are not important. They can also fail to install half year later. 

## Why not pipenv?

When I first run pipenv, then I thought 'wow, it's what I wanted'. But later I
realized that hides pip too much, and in fact I don't really know what is going
on. When I add --verbose, then I see lot of output from pipenv (which I don't really want to see) but I still don't see output from `pip install`. And output from `pip install` is most valuable for me, because there I can find informations why package failed to install. 

Also it's too complicated for me. Looks like it's goal is to find the optimal combination of dependencies. I want only to install package X and store information about X to appropriate requirements file. 

Also, it has only 2 environments: dev and non-dev. I need more (dev, test, prod)

## Why not pipm?

Because it doesn't handle git links. So when I install `git+https://github.com/xxx/yyy` it's not stored in requirements/base.txt nor in setup.cfg

