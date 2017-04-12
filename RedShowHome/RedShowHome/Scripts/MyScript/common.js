RSH = {};

RSH.Common = {};
RSH.Common.AlertTitle = "提示";
RSH.Common.NEFU_Longitude = 126.646749;
RSH.Common.NEFU_Latitude = 45.729233;
RSH.Common.NEFU_Name = "东北林业大学";
RSH.Common.NEFU_Address = "黑龙江省哈尔滨市香坊区和兴路26号<br/><p style='color:red;font-size:30px'>地理信息科学专业：<br/>一个神奇的专业</p>";
RSH.Common.UserType1 = 1;
RSH.Common.UserType2 = 2;
RSH.Common.UserType3 = 3;
RSH.Common.UserType4 = 4;
RSH.Common.zh_CN_UserType1 = "普通用户";
RSH.Common.zh_CN_UserType2 = "设计师";
RSH.Common.zh_CN_UserType3 = "家装公司";
RSH.Common.zh_CN_UserType4 = "商户";

RSH.Login = {};
RSH.Login.LoginFail = "登录失败";

RSH.Register = {};
RSH.Register.RegisterSuccess = "注册成功";
RSH.Register.RegisterFail = "注册失败";

RSH.SetInfo = {};
RSH.SetInfo.SetSuccess = "设置成功";
RSH.SetInfo.SetFail = "设置失败";

RSH.Control = {};
RSH.Control.All = "All";
RSH.Control.zh_CN_All = "全部";
RSH.Control.Designer = "Designer";
RSH.Control.zh_CN_Designer = "设计师";
RSH.Control.DesignCompany = "DesignCompany";
RSH.Control.zh_CN_DesignCompany = "家装公司";
RSH.Control.Seller = "Seller";
RSH.Control.zh_CN_Seller = "商家";
RSH.Control.InfoWindowWidth = 350;
RSH.Control.InfoWindowHeight = 150;


RSH.Search = {};
RSH.Search.SearchEmpty = "未检索出数据，已为您从网络中筛选";
RSH.Search.OnlySearchEmpty = "未检索出数据";
RSH.Search.EmptyValue = "请输入要检索的内容";
RSH.Search.GetCurrentPositionFailed = "当前位置获取失败，无法进行自动定位";

function InitMap(map, centerPoint) {
    window.map = map;
    map.addControl(new BMap.NavigationControl());
    // 添加平移缩放控件
    map.addControl(new BMap.ScaleControl());
    // 添加比例尺控件
    map.addControl(new BMap.OverviewMapControl());
    //添加缩略地图控件
    map.enableScrollWheelZoom();
    //启用滚轮放大缩小
    map.addControl(new BMap.MapTypeControl());
    //添加地图类型控件
    map.disable3DBuilding();
    SetDefaultPoint(centerPoint);
    map.setMapStyle({ style: 'midnight' });
}


//设置默认起始点
function SetDefaultPoint(point) {
    var marker = new BMap.Marker(point);
    map.centerAndZoom(point, 15);
    map.addOverlay(marker);
    var infoWindow = new BMap.InfoWindow(RSH.Common.NEFU_Address, { width: RSH.Control.InfoWindowWidth, height: RSH.Control.InfoWindowHeight, title: RSH.Common.NEFU_Name });
    marker.addEventListener("click", function () { this.openInfoWindow(infoWindow); });

}