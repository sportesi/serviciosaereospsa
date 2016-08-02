!function (document,window,$){
    "use strict";
    
    function getExampleTreeview(){
        return [{
                text: "Parent 1",
                href: "#parent1",
                tags: ["4"],
                nodes: [{
                        text: "Child 1",
                        href: "#child1",
                        tags: ["2"],
                        nodes: [{
                                text: "Grandchild 1",
                                href: "#grandchild1",
                                tags: ["0"]
                            },{
                                text: "Grandchild 2",
                                href: "#grandchild2",
                                tags: ["0"]
                            }]
                    },{
                        text: "Child 2",
                        href: "#child2",
                        tags: ["0"]
                    }]
            },{
                text: "Parent 2",
                href: "#parent2",
                tags: ["0"]
            },{
                text: "Parent 3",
                href: "#parent3",
                tags: ["0"]
            },{
                text: "Parent 4",
                href: "#parent4",
                tags: ["0"]
            },{
                text: "Parent 5",
                href: "#parent5",
                tags: ["0"]
            }];
    }

    var expand_icon="fa fa-chevron-right"; //expand-icon
    var collapse_icon="fa fa-chevron-down"; //collapse-icon
    var node_icon="fa fa-file-text-o"; //node-icon

    $("#exampleCustomIcons").treeview({data: getExampleTreeview(),expandIcon: expand_icon,
        collapseIcon: collapse_icon,nodeIcon: node_icon});

    $("#exampleTagsAsBadges").treeview({data: getExampleTreeview(),expandIcon: 'fa fa-minus',
        collapseIcon: 'fa fa-plus',nodeIcon: 'fa fa-user',showTags: true});

    $("#exampleBasic").treeview({data: getExampleTreeview()});
    $("#exampleCollapsed").treeview({data: getExampleTreeview(),levels: 1});
    $("#exampleExpanded").treeview({data: getExampleTreeview(),levels: 99});

    var json='[{"text": "Parent 1","nodes": [{"text": "Child 1","nodes": [{"text": "Grandchild 1"},{"text": "Grandchild 2"}]},{"text": "Child 2"}]},{"text": "Parent 2"},{"text": "Parent 3"},{"text": "Parent 4"},{"text": "Parent 5"}]';
    $("#exampleJsonData").treeview({data: json});

    var $searchableTree=$("#exampleSearchableTree").treeview({data: getExampleTreeview()});
    $("#inputSearchable").on("keyup",function (e){
        var pattern=$(e.target).val();
        $searchableTree.treeview("search",[pattern,{
                ignoreCase: !0,
                exactMatch: !1
            }])
    });

    var $expandibleTree=$("#exampleExpandibleTree").treeview({data: getExampleTreeview()});
    $("#exampleExpandAll").on("click",function (e){
        $expandibleTree.treeview("expandAll",{
            levels: "99"
        })
    });
    $("#exampleCollapseAll").on("click",function (e){
        $expandibleTree.treeview("collapseAll")
    });

    var options={
        data: getExampleTreeview(),
        onNodeCollapsed: function (event,node){
            //events_toastr(node.text+" was collapsed")
        },
        onNodeExpanded: function (event,node){
            //events_toastr(node.text+" was expanded")
        },
        onNodeSelected: function (event,node){
            //events_toastr(node.text+" was selected")
        },
        onNodeUnselected: function (event,node){
            //events_toastr(node.text+" was unselected")
        }
    };
    $("#exampleEvents").treeview(options);

}(document,window,jQuery);
