(function (window) {
    let container=document.getElementById("container");
    var num = 15,noMsg=false,count=0;

    function LoadData() {  // 模拟获取数据
        count++;
        if(count<10){
            lodeImg(num,count)
        }else{
            noMsg=true;
        }
    }


    function imageLazy() {
        // 获取到窗口的高度和窗口被上滑卷曲的长度
        let $B = window.outerHeight + window.pageYOffset
        Array.from(imageBox).forEach(node => {
            // 获取到目标节点的距离顶点的距离 和元素的高度
            let $A = node.offsetTop + node.clientHeight
            // 获取图片节点
            let imgDom = node.getElementsByTagName('img')[0]

            // 获取到图片节点是否加载的信息
            let imgDomLoad = imgDom.getAttribute('load')

            // 目标节点的距离顶点的距离加上元素的高度 大于  窗口的高度和窗口被上滑卷曲的长度 并且图片未加载
            if ($A <= $B && !imgDomLoad) {
                // 获取到图片的自定义属性的url 添加到图片src中
                imgDom.src = imgDom.getAttribute('data-src')
                // 设置添加属性 标识已经加载过
                imgDom.setAttribute('load', 'true')
            }
        })

    }

    window.onload = function () {  //页面加载完成执行函数
        LoadData()
        imageLazy()
    }
    window.addEventListener('scroll', function () {  // 页面滚动是监听
        let containerH = container.clientHeight
        let $B = window.outerHeight + window.pageYOffset
        if ($B >= containerH&&!noMsg) {  // 页面触底加载数据
            LoadData()
        }
        imageLazy()
    })
})(window);