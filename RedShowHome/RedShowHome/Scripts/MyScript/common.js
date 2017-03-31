RSH = {};

RSH.Common = {};
RSH.Common.AlertTitle = "提示";
RSH.Common.NEFU_Longitude = 126.646749;
RSH.Common.NEFU_Latitude = 45.729233;
RSH.Common.NEFU_Name = "东北林业大学";
RSH.Common.NEFU_Address = "黑龙江省哈尔滨市香坊区和兴路26号";

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
    map.centerAndZoom(centerPoint, 15);
    map.setMapStyle({ style: 'midnight' });
}