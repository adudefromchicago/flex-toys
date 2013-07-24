<!DOCTYPE html>
<html>
	<head>
		<title>Configure Your Cool Flex Page</title>
		<meta name="layout" content="main">
		<g:if env="development"><link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css"></g:if>
        <style type="text/css" media="screen">
        #status {
            background-color: #eee;
            border: .2em solid #fff;
            margin: 2em 2em 1em;
            padding: 1em;
            width: 12em;
            float: left;
            -moz-box-shadow: 0px 0px 1.25em #ccc;
            -webkit-box-shadow: 0px 0px 1.25em #ccc;
            box-shadow: 0px 0px 1.25em #ccc;
            -moz-border-radius: 0.6em;
            -webkit-border-radius: 0.6em;
            border-radius: 0.6em;
        }

        .ie6 #status {
            display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
        }

        #status ul {
            font-size: 0.9em;
            list-style-type: none;
            margin-bottom: 0.6em;
            padding: 0;
        }

        #status li {
            line-height: 1.3;
        }

        #status h1 {
            text-transform: uppercase;
            font-size: 1.1em;
            margin: 0 0 0.3em;
        }

        #page-body {
            margin: 2em 1em 1.25em 18em;
        }

        h2 {
            margin-top: 1em;
            margin-bottom: 0.3em;
            font-size: 1em;
        }

        p {
            line-height: 1.5;
            margin: 0.25em 0;
        }

        #controller-list ul {
            list-style-position: inside;
        }

        #controller-list li {
            line-height: 1.3;
            list-style-position: inside;
            margin: 0.25em 0;
        }

        @media screen and (max-width: 480px) {
            #status {
                display: none;
            }

            #page-body {
                margin: 0 1em 1em;
            }

            #page-body h1 {
                margin-top: 0;
            }
        }
        </style>
	</head>
	<body>
        <div id="status" role="complementary">
            <ul>
            <g:each in="${flex.toys.Module.findAll()}" var="module">
                <li><g:img dir="moduleStore" file="${module.imageUrl}" width="160" class="draggable" data-moduleid="${module.id}"/></li>
            </g:each>
            </ul>
        </div>

 %{--
        <xmp>${createLink(action:'addModuleLocation', id: page.id, params:['module.id': 2, region:'left', position:2])}</xmp>--}%

        %{--<div id="page-body" role="main">--}%
            <h1>Flex Page Configuration for page ... ${page}</h1>
                %{--<label for="layout.id">Layout</label>--}%
                %{--<g:select name="layout.id" from="${flex.toys.Layout.findAll()}"/>--}%
                %{--</div>--}%
               <g:form action="addModuleLocation" id="${page.id}">

                   <label for="module.id">Module</label>
                   <g:select name="module.id" from="${flex.toys.Module.findAll()}" optionKey="id" optionValue="imageUrl"/>
                   <g:select name="region" from="${page.layout.regions}"/>
                   <g:select name="position" from="${1..10}"/>
                   <g:submitButton name="Add Module"/>
               </g:form>

            <hr/>

            <g:set var="modulesByRegion" value="${page.moduleLocations.groupBy{ it.region}}"/>
            

            <g:render template="flexEvenSplit" bean="${modulesByRegion}"/>


    </body>
</html>
