package flex.toys

import grails.converters.JSON

class PageController {

    def scaffold = true
//    def index() { }

    def preview = {
        def ret = [foo:[1,2,3]]
        render ret as JSON
    }

    def configure = {
        def page = Page.get(params.id)
        [page: page]
    }

    def addModuleLocation = { ModuleLocation loc ->

        def page = Page.get(params.id)
        loc.page = page

        def success = loc.save()

        // TODO update order of modules.
        redirect(action:'configure', id: params.id)
    }

    def deleteModuleLocation = {
        ModuleLocation loc = ModuleLocation.get(params.id)

        def page = loc.page
        loc.delete()

        redirect(action:'configure', id: page.id)
    }

    def updateModuleLocation = {
        ModuleLocation loc = ModuleLocation.get(params.id)
        loc.region = params.region
        loc.position = params.position

        loc.save()

        redirect(action:'configure', id: loc.page.id)
    }
}
