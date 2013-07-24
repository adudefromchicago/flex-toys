
<div id="${region}" class="droppable region">
    <g:if test="${modulesByRegion[region]}">
        <g:each in="${modulesByRegion[region].sort{ it.position }}" var="moduleLocation">
            <g:set var="moduleLocation" value="${moduleLocation}"/>
            <g:render template="moduleLocation"/>
        </g:each>
    </g:if>
</div>