/**
 * colume:['','','']//template
 * dataList:[{},{},{}]
 * $el:''
 */
/**
 * 任务列表页面模板
 */
var orderTaskList_colume = [
                            '<div><a href="#{id}">{name}</a><p>{introduce}</p></div>',
                            '<div>{status}</div>',
                            '<div>{money}</div>',
                            '<div>{create_date}</div>',
                            ],
    $el = $("#order_task_list");


var Table = function(option){
	this.dataList = option.dataList;
	this.$el = option.$el;
	this.colume = option.colume;
	this.initTable();
}

Table.prototype = {
	initTable:function(){
		this.$table = $('<table class="ui-inf-table"></table>');
		this.renderDataList();
		this.$el.append(this.$table);
	},
	renderData:function(data,index){
		var $tr = $("<tr data-index='"+index+"'></tr>");
		for(var i=0,length=this.colume.length;i<length;i++){
			var $td = $("<td></td>"),
				template = this.colume[i],
				regExp = new RegExp("\{[a-zA-Z0-9-_]+\}","g");
				result = template.match(regExp),
				html = template;
			for(var j=0,rlen=result.length;j<rlen;j++){
				var type = result[j],
					key = type.replace(/[{}]/g,""),
					value = (data && data[key]) || "",
					valueReg = new RegExp(type,'g');
				html = html.replace(valueReg,value);
			}
			$td.append(html);
			$tr.append($td);
		}
		this.$table.append($tr);
	},
	renderDataList:function(){
		for(var i=0,length=this.dataList.length;i<length;i++){
			var data = this.dataList[i];
			this.renderData(data,i);
		}
	}
};