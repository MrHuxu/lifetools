$(document).ready(function(){
	$('.ui.dropdown').dropdown();
	$('#SideBtn').click(function(){
		$('.ui.sidebar').sidebar('toggle');
	});
	$('#WeaSearch').click(function(){
		location.href = '/wea/' + $('#WeaName').val();
	});
	$('#StSearch').click(function(){
	location.href = '/expresult/st/' + $('#ExpCode').val();
	});
	$('#YdSearch').click(function(){
	location.href = '/expresult/yd/' + $('#ExpCode').val();
	});
  /*
	$('#ExpForm').popup({
		position: 'right center',
		target: '#ExpForm',
		title: '很抱歉，这个功能目前无法使用',
		content: '因为个人技术原因，目前后台有一个关键部件无法部署到heroku上，所以无法获得快递数据，请自行上ckd.cn查询'
	});
  */
	$('#ExpBtn').click(function(){
		$('#WeaMenu').hide();
		$('#ExpMenu').fadeIn();
	});
	$('#WeaBtn').click(function(){
		$('#ExpMenu').hide();
		$('#WeaMenu').fadeIn();
	});
});
