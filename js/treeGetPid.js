function getPid(list) {
    list.forEach((item)=>{
        if(item.children&&item.children!=[]){
            item.children.forEach((chid)=>{
                chid.pid=item.uuid;
            })
            getPid(item.children)
        }
    })
}