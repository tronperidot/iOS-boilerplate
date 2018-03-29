# iOS Boilerplate

Is a base template for iOS projects.

## Composition

### Package manager

Use carthage.
Please install Carthage before project open.

```bash
$ brew install carthage
```

### Design Pattern

VIPER like.

I'm dislike a storyboard!.

### Generamba support

Let's spend comfortable life using with [simple_viper](https://github.com/tronperidot/simple_viper) from [Generamba](https://github.com/rambler-digital-solutions/Generamba) :D

```bash
gem install generamba
generamba template install
generamba gen [MODULE_NAME] simple_viper
```

## Step to customise this project as your base application

### Step1

Download the project from the repository.

### Step2

1.  Rename the downloaded project with the name of your choice.
1.  Rename the Rambafile with the compay name of your choice.
1.  Update targetname with

### Step3

1.  Run:carthage bootstrap --platform ios
1.  Open:\*..xcodeproj
