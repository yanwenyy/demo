var exportXls = {
  /***
   * 参数例子
   * datastr={
            thead:'<tr>\n' +
            '<th rowspan="2">运输类型</th>\n' +
            '<th rowspan="2">物料大类</th>\n' +
            '<th rowspan="2">物料名称</th>\n' +
            '<th colspan="2">铁路</th>\n' +
            '<th colspan="2">电车</th>\n' +
            '<th colspan="2">公路（国五及以上车辆）</th>\n' +
            '<th rowspan="2">清洁运输占比(%)</th>\n' +
            '</tr>\n' +
            '<tr>\n' +
            '<th>车数</th>\n' +
            '<th>重量</th>\n' +
            '<th>车数</th>\n' +
            '<th>重量</th>\n' +
            '<th>车数</th>\n' +
            '<th>重量</th>\n' +
            '</tr>',
            jsonData:data1,
            tdstr:['measureType','materialsPname','materialsName',
                'trainNum','trainWeigh','electNum','electWeigh','carNum','carWeigh','percentage'],
            tdstrFuc:{
                measureType:function (str) {
                    return str && str == 1 ? '采购 ' : '销售';
                },
                trainWeigh:function (str) {
                    return  str == 0 || str % 1 == 0 ? str : str.toFixed(2)
                },
                electWeigh:function (str) {
                    return  str == 0 || str % 1 == 0 ? str : str.toFixed(2)
                },
                carWeigh:function (str) {
                    return  str == 0 || str % 1 == 0 ? str : str.toFixed(2)
                },
                percentage:function (str) {
                    return  str % 1 === 0 ? str * 100 + '%' : (str * 100).toFixed(2) + '%'
                },
            },
            startRow:1,
            endRow:data1.length+1,
            spanCol:[1,0]
        };
   * */
  //导出
  exportList(args) {
    /**
     * args.thead 导出的表头 (str)
     * args.jsonData 导出的数据 (json)
     * args.tdstr td里面需要显示的内容 (array)
     * args.tdstrFuc td里面内容的判断格式
     * args.startRow 合并单元格的起始行
     * args.endRow 合并单元格的结束行
     * args.spanCol 合并单元格的列数
     * **/
    var _arr = args,
      _str='',
      _tabelDom = '',
      _this=this;
    if (Object.prototype.toString.call(_arr) === '[object Object]') {
      _str = toTabelStr(_arr);
      _tabelDom = toSpanTabel(_str,_arr);
    }else if (Object.prototype.toString.call(_arr) === '[object Array]') {
      var i=0,len=_arr.length,arrTabelDom='';
      for(;i<len;i++){
        var _s=toTabelStr(_arr[i]);
        _tabelDom+= toSpanTabel(_s,_arr[i]);
      }
    } else {
      throw new Error("arguments must be array or obj");
    }

    function toTabelStr(strValue) {
      var str = strValue.thead,tdstr=strValue.tdstr;
      var list = strValue.jsonData, i = 0, len = list.length;
      // console.log(strValue.jsonData)
      for (; i < len; i++) {
        var v = list[i];

        // console.log(v);
        str += '<tr>';
        for (let item=0;item<tdstr.length;item++) {
          var _item=tdstr[item],v_value=v[_item];
          if(_item.indexOf(".")!=-1){
           var s=_item.split(".");
            // _item='['+s[0]+']'+'['+s[1]+']';
            v_value=v[s[0]]+'['+s[1]+']';
          }
          var _itemStr=strValue.tdstrFuc&&strValue.tdstrFuc[_item]!=undefined? strValue.tdstrFuc[_item](v_value):v_value;
          //增加\t为了不让表格显示科学计数法或者其他格式
          str += `<td>${ _itemStr!==null?_itemStr:''+ '\t'}</td>`;
        }
        str += '</tr>';
      }
      // console.log(str)
      return str;
    }

    function toSpanTabel(_str,_arrLis) {
      var  _tabelDomT = _this.parseDom(`<table>${_str}</table>`);
      if (_arrLis.startRow && _arrLis.endRow && _arrLis.spanCol) {
        var _spanCol = _arrLis.spanCol;
        if (Array.isArray(_spanCol)) {
          var i = 0, len = _spanCol.length;
          for (; i < len; i++) {
            _this.autoRowSpan(_tabelDomT, _arrLis.startRow, _arrLis.endRow, _spanCol[i]);
          }
        }
      }
      _tabelDomT = _this.nodeToString(_tabelDomT[0]);
      return _tabelDomT;
    }

    //Worksheet名
    let worksheet = 'Sheet1';
    let uri = 'data:application/vnd.ms-excel;base64,';
    //下载的表格模板数据
    let template = `<html xmlns:o="urn:schemas-microsoft-com:office:office" 
      xmlns:x="urn:schemas-microsoft-com:office:excel" 
      xmlns="http://www.w3.org/TR/REC-html40">
      <head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>
        <x:Name>${worksheet}</x:Name>
        <x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet>
        </x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]-->
        </head><body>${_tabelDom}</body></html>`;
    //下载模板
    // console.log(_tabelDom)
    window.location.href = uri + this.base64(template)
  },
  //输出base64编码
  base64(s) {
    return window.btoa(unescape(encodeURIComponent(s)))
  },
  nodeToString(node) {
    //createElement()返回一个Element对象
    var tmpNode = document.createElement("div");
    //appendChild()  参数Node对象   返回Node对象  Element方法
    //cloneNode()  参数布尔类型  返回Node对象   Element方法
    tmpNode.appendChild(node.cloneNode(true));
    var str = tmpNode.innerHTML;
    tmpNode = node = null; // prevent memory leaks in IE
    return str;
  },
  //合并单元格
  autoRowSpan(table1, startRow, endRow, col) {
    var tb = table1[0];
    // console.log(tb)
    if (!tb || !tb.rows || tb.rows.length <= 0) {
      return;
    }
    if (col >= tb.rows[0].cells.length || (startRow >= endRow && endRow != 0)) {
      return;
    }
    if (endRow == 0) {
      endRow = tb.rows.length - 1;
    }
    for (var i = startRow; i < endRow; i++) {

      if (tb.rows[i + 1]&&tb.rows[startRow].cells[col].innerHTML == tb.rows[i + 1].cells[col].innerHTML) { //如果相等就合并单元格,合并之后跳过下一行
        tb.rows[i + 1].removeChild(tb.rows[i + 1].cells[col]);
        tb.rows[startRow].cells[col].rowSpan = (tb.rows[startRow].cells[col].rowSpan) + 1;
      } else {
        this.autoRowSpan(table1, i + 1, endRow, col);
        break;
      }
    }
  },
  parseDom(arg) {
    var objE = document.createElement("div");
    objE.innerHTML = arg;
    return objE.childNodes;
  },
};

export default exportXls;
