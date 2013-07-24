<%@ page import="flex.toys.Page" %>



<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'layout', 'error')} required">
	<label for="layout">
		<g:message code="page.layout.label" default="Layout" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="layout" name="layout.id" from="${flex.toys.Layout.list()}" optionKey="id" required="" value="${pageInstance?.layout?.id}" class="many-to-one"/>
</div>

%{--<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'moduleLocations', 'error')} ">--}%
	%{--<label for="moduleLocations">--}%
		%{--<g:message code="page.moduleLocations.label" default="Module Locations" />--}%
		%{----}%
	%{--</label>--}%
	%{----}%
%{--<ul class="one-to-many">--}%
%{--<g:each in="${pageInstance?.moduleLocations?}" var="m">--}%
    %{--<li><g:link controller="moduleLocation" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--<li class="add">--}%
%{--<g:link controller="moduleLocation" action="create" params="['page.id': pageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'moduleLocation.label', default: 'ModuleLocation')])}</g:link>--}%
%{--</li>--}%
%{--</ul>--}%

</div>

