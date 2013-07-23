

<h1> flexEvenSplit </h1>
<!-- layout pg with regions, render modules inline -->

${modulesByRegion}

<div class="left">

<g:each in="${modulesByRegion.left.sort{ it.position }}" var="moduleLocation">

 ${moduleLocation.position} => <g:img dir="moduleStore" file="${moduleLocation.module.imageUrl}"/>


</g:each>

</div>

<hr/>

<g:each in="${modulesByRegion}" var="rmp">
            <div id="${rmp.key}">
                <h2>${rmp.key}</h2>
                <ul>
                    <g:each in="${rmp.value}" var="moduleLocation">
                    <li>
                        ${moduleLocation.position}:
                        <g:img dir="moduleStore" file="${moduleLocation.module.imageUrl}"/>

                        xXX${createLink(action:'deleteModuleLocation', id: moduleLocation.id)}xx

                        <g:link action="" id="${moduleLocation.id}">Remove Module</g:link>
                    </li>
                    </g:each>
                </ul>
            </div>
            </g:each>