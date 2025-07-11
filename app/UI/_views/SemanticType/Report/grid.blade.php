<div
    class="wt-box h-full"
    hx-trigger="reload-gridSemanticType from:body"
    hx-target="this"
    hx-swap="outerHTML"
    hx-get="/report/semanticType/grid"
>
    @fragment('search')
        <ul id="semanticTypeTree">
        </ul>
        <script>
            $(function() {
                $("#semanticTypeTree").treegrid({
                    url: "/report/semanticType/data",
                    queryParams: {
                        semanticType: '{{$search->semanticType}}'
                    },
                    method: "get",
                    fit: true,
                    showHeader: false,
                    rownumbers: false,
                    idField: "id",
                    treeField: "text",
                    showFooter: false,
                    border: false,
                    columns: [[
                        {
                            field: "text",
                            width: "100%"
                        }
                    ]],
                    onClickRow: (row) => {
                        if (row.type === "semanticType") {
                            htmx.ajax("GET", `/report/semanticType/${row.idSemanticType}`, "#reportArea");
                        }
                    }
                });
            });
        </script>
    @endfragment
</div>
