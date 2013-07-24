
<%@ page import="flex.toys.Page" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-page" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-page" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list page">
			
				<g:if test="${pageInstance?.layout}">
				<li class="fieldcontain">
					<span id="layout-label" class="property-label"><g:message code="page.layout.label" default="Layout" /></span>
					
						<span class="property-value" aria-labelledby="layout-label"><g:link controller="layout" action="show" id="${pageInstance?.layout?.id}">${pageInstance?.layout?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pageInstance?.moduleLocations}">
				<li class="fieldcontain">
					<span id="moduleLocations-label" class="property-label"><g:message code="page.moduleLocations.label" default="Modules Used" /></span>
					
						<g:each in="${pageInstance.moduleLocations}" var="m">
						<span class="property-value" aria-labelledby="moduleLocations-label"><g:link controller="moduleLocation" action="show" id="${m.id}">${m.module.name.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

                <p/>

                <g:set var="page" value="${pageInstance}"/>

                <g:set var="modulesByRegion" value="${page.moduleLocations.groupBy{ it.region}}"/>


                <g:render template="flexEvenSplit" bean="${modulesByRegion}"/>


            </ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pageInstance?.id}" />
					<g:link class="edit" action="configure" id="${pageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
