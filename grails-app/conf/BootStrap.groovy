class BootStrap {

    def fixtureLoader

    def init = { servletContext ->
        fixtureLoader.load("modules", "layouts")
    }
    def destroy = {
    }
}
