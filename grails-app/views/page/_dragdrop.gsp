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




                $.get("/flex-toys/page/addModuleLocation/${page.id}?module.id="+ moduleId +"&region="+ region +"&position=" + position, function() {
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