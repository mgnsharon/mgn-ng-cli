# mgn-ng-cli
Docker image for building/generating angular apps using Angular CLI

## Usage examples

This image has the same usage as Angular CLI (https://cli.angular.io/)

### Generate a project named some project
```
docker run -v $(pwd):/app mgnshrn/mgn-ng-cli ng new some-project
```

### Generate one of the following items

Component, Directive, Pipe, Service, Class, Guard, Interface, Enum, Module

```
docker run -v $(pwd):/app mgnshrn/mgn-ng-cli ng generate component component-name
```

### Start the development server
```
docker run -u $(id -u) --rm -p 4200:4200 -v /etc/passwd:/etc/passwd -v "$PWD":/app mgnshrn/mgn-ng-cli ng serve -host 0.0.0.0
```

### Run Unit tests
```
docker run -v "$PWD":/app mgnshrn/mgn-ng-cli ng test
```

## Credits

All credits for the CLI go for [the Angular CLI team](https://github.com/angular/angular-cli).