Map = {};

Map.Search = {};
Map.Search.SearchCurrent = "正在获取当前位置信息...";

Map.StyleJson = {};
Map.StyleJson.Blue = [
    {
        "featureType": "all",
        "elementType": "geometry",
        "stylers": {
            "hue": "#007fff",
            "saturation": 100
        }
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": {
            "color": "#ffffff"
        }
    }
];
Map.Style = {};
Map.Style.Night = 'midnight';

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
RSH.Common.UploadFileFailed = "文件上传失败";

RSH.Login = {};
RSH.Login.LoginFail = "登录失败";
RSH.Login.PleaseLogin = "登录状态失效，请先登录";

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
RSH.Search.SearchNow = "正在获取数据...";
RSH.Search.CheckCurrentPosition = "请设置指定位置"; 
RSH.Search.CurrentPositionFailed = "指定位置解析失败，请重新设定";

RSH.House = {};
RSH.House.AddHouseSuccess = "您的房子添加成功";

RSH.Demand = {};
RSH.Demand.PleaseChoose = "请选择一个房子";
RSH.Demand.PleaseSetName = "请输入需求标题";
RSH.Demand.PublishSuccess = "发布成功";
RSH.Demand.PublishFailed = "发布失败";

HeatMap = {};
HeatMap.Count = [];
HeatMap.Marker = [];


//初始化地图
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

function setDarkStyle(map) {
    map.setMapStyle({ style: Map.Style.Night, styleJson: [] });
}

function setBlueStyle(map) {
    map.setMapStyle({ style: '', styleJson: Map.StyleJson.Blue });
}

//设置默认起始点
function SetDefaultPoint(point) {
    var marker = new BMap.Marker(point);
    map.centerAndZoom(point, 15);
    map.addOverlay(marker);
    var infoWindow = new BMap.InfoWindow(RSH.Common.NEFU_Address, { width: RSH.Control.InfoWindowWidth, height: RSH.Control.InfoWindowHeight, title: RSH.Common.NEFU_Name });
    marker.addEventListener("click", function () { this.openInfoWindow(infoWindow); });
}


//设置点标记
function SetPoint(mapPoint, map) {
    var iconUrl;
    switch (mapPoint.Type) {
        case RSH.Common.UserType2:
            iconUrl = "/Content/images/bullet-green.png"; break;
        case RSH.Common.UserType3:
            iconUrl = "/Content/images/bullet-red.png"; break;
        case RSH.Common.UserType4:
            iconUrl = "/Content/images/bullet-yellow.png"; break;
        default:
            iconUrl = "";
    }
    var myIcon = new BMap.Icon(iconUrl, new BMap.Size(30, 30));
    var marker = new BMap.Marker(new BMap.Point(mapPoint.Longitude, mapPoint.Latitude), { icon: myIcon });
    var searchInfoWindow = new BMapLib.SearchInfoWindow(map, mapPoint.Description, {
        title: mapPoint.Title,
        //height: RSH.Control.InfoWindowHeight,
        width: RSH.Control.InfoWindowWidth,
        panel: "panel",
        searchType: [
            BMAPLIB_TAB_TO_HERE,
            BMAPLIB_TAB_FROM_HERE,
            BMAPLIB_TAB_SEARCH
        ]
    });
    marker.addEventListener("click", function () {
        searchInfoWindow.open(marker);
    });
    map.addOverlay(marker);
    HeatMap.Marker.push(marker);
    marker.addEventListener("mousedown", function () {
        $("#" + mapPoint.Id).css("background-color", "#eee8aa");
    });
    marker.addEventListener("mouseup", function () {
        $("#" + mapPoint.Id).css("background-color", "#c0c0c0");
    });
}


//面板中填充搜索内容
function SearchPanel(mapPoint) {
    var htmlText = "<b>" + mapPoint.Title + "</b><br/>" + mapPoint.Description;
    $("#r-result").append("<div id=" + mapPoint.Id + " class='searchPanelItem'>" + htmlText + "</div>");
    $("#" + mapPoint.Id).bind("click", function () {
        map.centerAndZoom(new BMap.Point(mapPoint.Longitude, mapPoint.Latitude), 15);
        $("#" + mapPoint.Id).css("background-color", "#c0c0c0");
    });
}


//网络搜索
function doSearch(value, name) {
    var local = new BMap.LocalSearch(map, { renderOptions: { map: map, panel: "r-result" } });
    local.search(value);
}

var markerClusterer = null;

function clearMarkerClusterer() {
    console.log(markerClusterer);
    if (markerClusterer) {
        markerClusterer.clearMarkers();
        markerClusterer = null;
    }
}

function newMarkerClusterer() {
    if (!markerClusterer)
        markerClusterer = new BMapLib.MarkerClusterer(map, { markers: HeatMap.Marker, maxZoom: 12, girdSize: 40 });
}

function doSearchFromDBByPosition(map, url, currentPoint, searchText) {
    $("#r-result").empty();
    map.clearOverlays();
    if (markerClusterer)
        markerClusterer.clearMarkers();
    HeatMap.Count = [];
    HeatMap.Marker = [];
    $("#alertDiv").text(Map.Search.SearchCurrent);
    $("#alertDiv").fadeToggle(1000);
    var lon, lat, city;
    lon = currentPoint.point.lng;
    lat = currentPoint.point.lat;
    city = currentPoint.hasOwnProperty('city') ? currentPoint.city : "未知";

    $("#alertDiv").text("当前城市：" + city);
    //设置当前位置点
    var mk = new BMap.Marker(currentPoint.point);
    map.addOverlay(mk);
    var infoWindow = new BMap.InfoWindow("<b>当前设定位置</b>");
    mk.addEventListener("click", function () {
        this.openInfoWindow(infoWindow);
    });
    map.centerAndZoom(currentPoint.point, 12);

    var para = { Longitude: lon, Latitude: lat, City: city, SearchText: searchText };
    $.post(url, para, function (data) {
        if (data && data.length) {
            for (var i in data) {
                SetPoint(data[i], map);
                SearchPanel(data[i]);
                var apoint = { "lng": data[i].Longitude, "lat": data[i].Latitude, "count": data[i].HeatMapCount };
                HeatMap.Count.push(apoint);
            }

        } else {
            $.messager.show({
                title: RSH.Common.AlertTitle,
                msg: RSH.Search.OnlySearchEmpty,
                timeout: 3000,
                showType: 'show'
            });
        }
        //最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。
        markerClusterer = new BMapLib.MarkerClusterer(map, { markers: HeatMap.Marker, maxZoom: 12,girdSize:40 });
    });
    $("#alertDiv").fadeToggle(3000);
}


//同城市搜索
function doSearchFromDBInSameCity(map, url, searchText) {
    $("#r-result").empty();
    map.clearOverlays();
    if (markerClusterer)
        markerClusterer.clearMarkers();
    HeatMap.Count = [];
    HeatMap.Marker = [];
    $("#alertDiv").text(Map.Search.SearchCurrent);
    $("#alertDiv").fadeToggle(1000);
    var geolocation = new BMap.Geolocation();
    var lon, lat, city;
    geolocation.getCurrentPosition(function (r) {
        if (this.getStatus() == BMAP_STATUS_SUCCESS) {
            var currentPoint = r.point;
            lon = r.longitude;
            lat = r.latitude;
            city = r.address.hasOwnProperty('city') ? r.address.city : "未知";

            $("#alertDiv").text("当前城市：" + city);

            //设置当前位置点
            var mk = new BMap.Marker(currentPoint);
            map.addOverlay(mk);
            var infoWindow = new BMap.InfoWindow("<b>当前位置</b>");
            mk.addEventListener("click", function () {
                this.openInfoWindow(infoWindow);
            });
            map.centerAndZoom(r.point, 12);
            
            var para = { Longitude: lon, Latitude: lat, City: city, SearchText: searchText };
            $.post(url, para, function (data) {
                if (data && data.length) {
                    for (var i in data) {
                        SetPoint(data[i], map);
                        SearchPanel(data[i]);
                        var apoint = { "lng": data[i].Longitude, "lat": data[i].Latitude, "count": data[i].HeatMapCount };
                        HeatMap.Count.push(apoint);
                    }
                    //最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。
                    markerClusterer = new BMapLib.MarkerClusterer(map, { markers: HeatMap.Marker, maxZoom: 12, girdSize: 40 });
                } else {
                    $.messager.show({
                        title: RSH.Common.AlertTitle,
                        msg: RSH.Search.OnlySearchEmpty,
                        timeout: 3000,
                        showType: 'show'
                    });
                }
            });
        } else {
            $.messager.alert(RSH.Common.AlertTitle, RSH.Search.GetCurrentPositionFailed + "<br/>" + this.getStatus());
            return;
        }
        $("#alertDiv").fadeToggle(3000);
    }, { enableHighAccuracy: true });
}



//**************热力图*************

//判断浏览区是否支持canvas
function isSupportCanvas() {
    var elem = document.createElement('canvas');
    return !!(elem.getContext && elem.getContext('2d'));
}

