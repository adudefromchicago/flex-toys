
<div id="contentContainer">

    <img src="/flex-toys/static/moduleStore/header.png" width="100%">

    <g:each in="${page.layout.regions}" var="region">
        <g:set var="region" value="${region}"/>
        <g:render template="region"/>
    </g:each>

    <img src="/flex-toys/static/moduleStore/footer.png" width="100%">

</div>

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

