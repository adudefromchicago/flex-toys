package flex.toys

import org.springframework.dao.DataIntegrityViolationException

class PageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pageInstanceList: Page.list(params), pageInstanceTotal: Page.count()]
    }

    def create() {
        [pageInstance: new Page(params)]
    }

    def save() {
        def pageInstance = new Page(params)
        if (!pageInstance.save(flush: true)) {
            render(view: "create", model: [pageInstance: pageInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'page.label', default: 'Page'), pageInstance.id])
        redirect(action: "configure", id: pageInstance.id)
    }

    def show(Long id) {
        def pageInstance = Page.get(id)
        if (!pageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'page.label', default: 'Page'), id])
            redirect(action: "list")
            return
        }

        [pageInstance: pageInstance]
    }

    def edit(Long id) {
        def pageInstance = Page.get(id)
        if (!pageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'page.label', default: 'Page'), id])
            redirect(action: "list")
            return
        }

        [pageInstance: pageInstance]
    }

    def update(Long id, Long version) {
        def pageInstance = Page.get(id)
        if (!pageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'page.label', default: 'Page'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pageInstance.version > version) {
                pageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'page.label', default: 'Page')] as Object[],
                          "Another user has updated this Page while you were editing")
                render(view: "edit", model: [pageInstance: pageInstance])
                return
            }
        }

        pageInstance.properties = params

        if (!pageInstance.save(flush: true)) {
            render(view: "edit", model: [pageInstance: pageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'page.label', default: 'Page'), pageInstance.id])
        redirect(action: "show", id: pageInstance.id)
    }

    def delete(Long id) {
        def pageInstance = Page.get(id)
        if (!pageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'page.label', default: 'Page'), id])
            redirect(action: "list")
            return
        }

        try {
            pageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'page.label', default: 'Page'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'page.label', default: 'Page'), id])
            redirect(action: "show", id: id)
        }
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
