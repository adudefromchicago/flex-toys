
<%@ page import="flex.toys.Page" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-page" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-page" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

                        <th><g:message code="page.createDate.label" default="Created Date" /></th>
						<th><g:message code="page.layout.label" default="Layout" /></th>
                        <th>&nbsp;</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pageInstanceList}" status="i" var="pageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: pageInstance, field: "createDate")}</td>
                        <td>${fieldValue(bean: pageInstance, field: "layout")}</td>
						<td><g:link action="show" id="${pageInstance.id}">View</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
