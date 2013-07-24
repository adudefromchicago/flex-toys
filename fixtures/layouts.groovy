import flex.toys.Layout

fixture {
    flexBigTop(Layout, imageUrl:'flexBigTop.png', cssUrl:'flexBigTop.css', name:'Flex Big Top', regions:['foo','bar'])
    flexEvenSplit(Layout, imageUrl:'flexEvenSplit.png',  cssUrl:'flexEvenSplit.css', name:'flexEvenSplit', regions:['main','secondary'])
    flexSplitFull(Layout, imageUrl:'flexSplitFull.png',  cssUrl:'flexSplitFull.css', name:'flexSplitFull', regions:['foo','bar'])
    norail(Layout, imageUrl:'norail.png', cssUrl:'norail.css', name:'norail', regions:['foo','bar'])
    wideRightRail(Layout, imageUrl:'wideRightRail.png', cssUrl:'wideRightRail.css', name:'wideRightRail', regions:['foo','bar'])
}