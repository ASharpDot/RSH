function doSearchWithPoint(value,name) {
        map.clearOverlays();
        var localSearch = new BMap.LocalSearch(map);
        localSearch.enableAutoViewport();
        localSearch.setSearchCompleteCallback(function (searchResult) {
            var poi = searchResult.getPoi(0);
            map.centerAndZoom(poi.point, 16);
            var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 创建标注，为要查询的地址对应的经纬度
            map.addOverlay(marker);
        });
        localSearch.search(value);
    }