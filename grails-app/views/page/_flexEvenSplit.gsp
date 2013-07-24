


<script>


var draggableArguments={
     helper:'clone',
     appendTo: 'body',
     containment: 'document',
     zIndex: 1500,
     opacity: 0.6,
     addClasses: false
}

$(document).ready(function() {


    $(".draggable" ).draggable(draggableArguments);
    $(".droppable" ).droppable({
        over: function( event, ui ) { $(this).addClass("highlight");},
        out: function( event, ui ) { $(this).removeClass("highlight");},
        drop: function(event, ui) {
            //alert("drop");

            var droppable;
            var position = $(this).context.children.length+1;

                if ($(this).hasClass("region")) {

                        droppable = $(this);
                        position = $(this).context.children.length+1;

                } else {
                        droppable = $(this).parent();
                        position = $(this).attr("data-position");
                }

                    var imgElement = ui.draggable.clone();
                    var moduleId = ui.draggable.attr("data-moduleid")
                    var region = droppable.attr("id");

                    var moduleContainer = $(document.createElement("DIV"));
                    var removeButton = $(document.createElement("A")).addClass("removeButton").attr("href", "#");

                    moduleContainer.addClass("flexModule droppable").attr("data-position", position);
                    moduleContainer.attr("data-moduleid", moduleId);
                    moduleContainer.attr("data-region", region);

                    moduleContainer.append(imgElement);
                    moduleContainer.append(removeButton);

                    if ($(this).hasClass("region")) {
                        $(this).append(moduleContainer);
                    } else {
                        $(this).before(moduleContainer);
                    }




                  $.get("/flex-toys/page/addModuleLocation/1?module.id="+ moduleId +"&region="+ region +"&position=" + position, function() {
                     //alert("success");
                     return true;
                  });


                }
    });


$("#testAdd").on("click", function(event){
    alert(1);
    event.preventDefault();
    $.get("/flex-toys/page/addModuleLocation/1?module.id=2&region=main&position=2", function() {
        alert("success");
    });
});

$(".removeButton").on("click", function(event){
    event.preventDefault();
    var moduleId = $(this).parent().attr("data-moduleid");
    $.get("/flex-toys/page/deleteModuleLocation/" + moduleId, function() {
//        alert("success");

        // TODO single page dom manipulation.
        location.reload();
    });
});



});


</script>

<div id="flexEvenSplit">

<div id="contentContainer">

    <img src="/flex-toys/static/moduleStore/header.png" width="100%">

    <div id="main" class="droppable region">
        <g:if test="${modulesByRegion.main}">
            <g:each in="${modulesByRegion.main.sort{ it.position }}" var="moduleLocation">
            <div class="flexModule droppable" data-position="${moduleLocation.position}" data-region="main"  data-moduleid="${moduleLocation.id}">
               <g:img dir="moduleStore" file="${moduleLocation.module.imageUrl}" />
               <a href="#" class="removeButton"></a>
            </div>
            </g:each>
        </g:if>
    </div>

    <div id="secondary" class="droppable region">
        <g:if test="${modulesByRegion.secondary}">
            <g:each in="${modulesByRegion.secondary.sort{ it.position }}" var="moduleLocation">
                <div class="flexModule droppable" data-position="${moduleLocation.position}" data-region="secondary" data-moduleid="${moduleLocation.id}">

                <g:img dir="moduleStore" file="${moduleLocation.module.imageUrl}" class="flexModule"/>
                <a href="#" class="removeButton"></a>
                            </div>

            </g:each>

        </g:if>
    </div>

    <img src="/flex-toys/static/moduleStore/footer.png" width="100%">

</div>

</div>

<hr/>

%{-- 

${modulesByRegion}

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
--}%


<style>
#flexEvenSplit {
    margin-top: 20px;
}

/*Flex: ==flexEvenSplit */
#flexEvenSplit #contentContainer {
    position:relative;
    background-color: white;
    width:480px;
    overflow:hidden;
    border: 1px solid green;
}
#flexEvenSplit #main {
    clear: left;
    float: left;
    position: static;
    width: 220px;
    min-height:400px;
}
#flexEvenSplit #secondary {
    float: right;
    margin-top: -1px;
    min-height: 397px;
    width: 257px;
}
#flexEvenSplit #external {
    top:0;
    .flexAdMod {
        margin:0;
        .ad {
            display:block;
            margin:12px 0;
        }
    }
}

.highlight {
    border: 1px solid pink;
}

.flexModule {
    position: relative;
}

.flexModule img { 
    width: 100%;
}

.removeButton {
  display: none;
  position:absolute;
  top:0;
  right:0;
  width:15px;
  height:15px;
  background-image:url(/flex-toys/static/images/remove3.png);
}

.flexModule:hover .removeButton {
  display:block;
}


</style>

