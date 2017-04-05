function doSearchWithPoint(value,name) {
        map.clearOverlays();
        var localSearch = new BMap.LocalSearch(map);
        localSearch.enableAutoViewport();
        localSearch.setSearchCompleteCallback(function (searchResult) {
            var poi = searchResult.getPoi(0);
            map.centerAndZoom(poi.point, 16);
            var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // ������ע��ΪҪ��ѯ�ĵ�ַ��Ӧ�ľ�γ��
            map.addOverlay(marker);
        });
        localSearch.search(value);
    }