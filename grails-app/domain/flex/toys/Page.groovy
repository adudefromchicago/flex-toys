package flex.toys

class Page {

    Layout layout
    Date createDate = new Date()
    static hasMany = [moduleLocations:ModuleLocation]

    static constraints = {
    }
}
