# Mock-App

![Swift](https://github.com/MrSmart00/Mock-App/workflows/Swift/badge.svg)

## Usage

1. `$ ./scripts/setup.sh`
2. `$ ./scripts/bootstrap.sh`

## Create Scene

`$ ./scripts/scene.sh YOUR_SCENE_NAME`

ex) $ ./scripts/scene.sh Dummy

## Scene Structure
| layer | protocol | implementation |
|:--:|:--:|:--:|
| View | { name }View | { name }ViewController |
| Interactor | { name }Usecase | { name }Interactor |
| Presenter | { name }Presentation | { name }Presenter |
| Entity | - | - |
| Router | | FlowController |
