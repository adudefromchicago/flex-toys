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

        redirect(action:'configure', id: params.id)
    }

    def deleteModuleLocation = {
        ModuleLocation loc = ModuleLocation.get(params.id)

        def page = loc.page
        loc.delete()

        redirect(action:'configure', id: page.id)
    }
}
