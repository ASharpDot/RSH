using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace ConsoleApplication1
{
    class RSHDesign
    {
    }

    public enum enumTrueOrFalse
    {
        True = 1, False = 0
        //1为真，同意，允许等，男
        //0为假，不同意，不允许等，女
    }

    class RSHUser
    {
        public int UserID { get; set; }//用户ID：唯一标识，主键
        public byte UserType { get; set; }//用户类型：1为普通用户，2为设计师，3为家装公司，4为商户，不为空
        public string UserName { get; set; }//用户名：不为空
        public string LoginEmail { get; set; }//登录邮箱：唯一不为空
        public string LoginPassword { get; set; }//登录密码：不为空
        public string Photo { get; set; }//用户头像存放路径：可为空，需上传

        public enum enumUserType
        {
            普通用户 = 1, 设计师 = 2, 家装公司 = 3, 商户 = 4
        }
        public const string PHONE_REGULAR_EXPRESSION = @"(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}";//包括移动和固定
        public const string EMAIL_REGULAR_EXPRESSION = @"([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,5})+";//邮箱
        public const string PASSWORD_REGULAR_EXPRESSION = @"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$";//密码包含大小写和数字8到20位
        public enum enumHouseStyle
        {
            地中海 = 1, 田园 = 2, 美式 = 3, 欧式 = 4, 东南亚 = 5, 日式 = 6, 中式 = 7, 古典 = 8, 简约 = 9, 现代 = 10, 混搭 = 11
        }
    }

    class NormalUser:RSHUser
    {
        public int UserID { get; set; }//foreign key references RSHUser(UserID)，不可为空
        //一个主人可拥有多套房子，一套房子只有一个主人
        //public int HouseID { get; set; }//foreign key references House(HouseID)，可为空
        public int CollectedUserID { get; set; }//foreign references RSHUser(UserID),可为空，我的收藏
        public bool Sex { get; set; }//用户性别：
        public string Phone { get; set; }//用户联系电话：可为空
        public string EnjoyStyle { get; set; }//用户偏爱家居风格：值类型可按此标准，1为地中海，2为中式……可多选。最终入库为：{1,2}逗号分隔
    }

    class DesignerUser : RSHUser
    {
        public int UserID { get; set; }//foreign key references RSHUser(UserID)，不可为空
        public int OwnedCompanyID { get; set; }//所属公司，可为空，为空默认个体
        public bool Sex { get; set; }//用户性别： 
        public byte WorkingAge { get; set; }//工作年限：不可为空
        public string Phone { get; set; }//联系电话：不可为空
        public string Address { get; set; }//办公地点，不可为空，地图获取
        public string DesignConcept { get; set; }//设计理念，不可为空30字以内
        public string SkilledStyle { get; set; }//擅长风格：值类型可按此标准，1为地中海，2为中式……可多选。最终入库为：{1,2}逗号分隔
        public string Works { get; set; }//我的作品：（包括图片与文字）待考虑数据格式，网络说法利用json格式，还是建立作品表，或是xml文件
        public int FansQuantity { get; set; }//粉丝数量，可用点赞表示
    }

    class DesignCompanyUser : RSHUser
    {
        public int UserID { get; set; }//foreign key references RSHUser(UserID)，不可为空
        //public int SignedDesignerID { get; set; }//foreign key references RSHUser(UserID)，签约设计师，可为空
        public string Phone { get; set; }//联系电话：不可为空
        public string Address { get; set; }//公司地址：不可为空，地图获取
        public string Description { get; set; }//详细信息：不可为空,大于20字，小于500
        public int FansQuantity { get; set; }//粉丝数量，可用点赞表示
    }

    class SellerUser : RSHUser
    {
        public int UserID { get; set; }//foreign key references RSHUser(UserID)，不可为空
        public string Phone { get; set; }//联系电话：不可为空
        public string Address { get; set; }//商家地点：不可为空，地图获取
        public string Description { get; set; }//详细信息：不可为空,大于20字，小于500
        public byte ProductType { get; set; }//产品类型：家具，主材，灯饰。。。。，不可为空
        public string ProductInfo { get; set; }//产品信息：图片，文字待考虑格式
        public int FansQuantity { get; set; }//粉丝数量，可用点赞表示
        public enum enumProductType
        {
            灯饰照明 = 1, 卫浴用品 = 2, 厨房用品 = 3, 家居软装 = 4, 生活电器 = 5, 墙地面 = 6, 建材五金 = 7, 全屋定制 = 8
        }
    }

    class House
    {
        public int HouseID { get; set; }
        public int OwnerID { get; set; }
        public string Address { get; set; }
        public byte Status { get; set; }//装修状态，可仿照图巴图
        public int Area { get; set; }//建筑面积，单位平方米
        public byte HouseType { get; set; }//户型：几居室
        public byte DecorationWay { get; set; }//装修方法：1.清包、2.半包、3.全包等
        public string Ichnography { get; set; }//平面图，可为空
        public string Description { get; set; }
        public enum enumHouseStatus
        {
            准备 = 1, 拆改 = 2, 水电 = 3, 泥木 = 4, 油漆 = 5, 竣工 = 6, 软装 = 7, 入住 = 8
            //准备：挑选风格找公司
            //拆改：敲敲打打改户型
            //水电：铺设电线埋水管
            //泥木：贴砖打柜做吊顶
            //油漆：刷完木漆刷墙漆
            //竣工：安装橱柜铺地板
            //软装：摆好沙发挂窗帘
            //入住：欢天喜地住新家
        }
        public enum enumHouseType
        {
            一居室 = 1, 二居室 = 2, 三居室 = 3, 四居室 = 4, 小户型 = 5, 公寓 = 6, 复式 = 7, 别墅 = 8,其他=9
        }
        public enum enumDecorationWay
        {
            清包 = 1, 半包 = 2, 全包 = 3
            //清包：预算最低，只包施工
            //半包：大众首选，包施工和辅料
            //全包：省时省力，包施工和所有材料
        }
    }
    /// <summary>
    /// 签约订单（设计师或公司发起，普通用户应答）
    /// </summary>
    class Order
    {
        public int OrderID { get; set; }
        public string OrderName { get; set; }
        public int HouseID { get; set; }
        public int DesignUserID { get; set; }
        public decimal QuotedPrice { get; set; }//报价
        public byte CurrentStage { get; set; }//装修进度
        public string Description { get; set; }
        public string Attachment { get; set; }//附件
        public bool NormalUserIsAgree { get; set; }//用户需同意才能订单生效，默认为false(houseid等于userid,usertype=普通用户），默认不同意
    }
    /// <summary>
    /// 已装修房子展示
    /// </summary>
    class DisplayHouse
    {
        public int DisplayID { get; set; }
        public int HouseID { get; set; }
        public string DisplayName { get; set; }
        public bool IsVisible { get; set; }//默认显示
        public string Photo { get; set; }
        public string Description { get; set; }
        public int FansQuantity { get; set; }//粉丝数量，可用点赞表示
    }
    /// <summary>
    /// 发布家装需求,仅普通用户，可以创建；仅设计师及设计公司可以获取；
    /// </summary>
    class Demand
    {
        public int DemandID { get; set; }
        //public int CreatorID { get; set; }
        public string DemandName { get; set; }
        public int HouseID { get; set; }//默认联系方式为用户邮箱
        public bool IsVisible { get; set; }
    }

    //需要验证登陆状态及用户身份，防止未登录状态页面访问及访问限制
    //基于位置，需结合电子地图考虑，是否需要经纬度字段

    interface IUserRepository
    {
        //默认距离升序，好评率降序
        IQueryable<DesignerUser> GetAllDesignerByStyle();//按设计风格
        IQueryable<DesignerUser> GetAllDesignerByFans();//按好评率或粉丝率
        IQueryable<DesignerUser> GetAllDesignerByDistance();//按距离，默认
        IQueryable<DesignerUser> GetDesignersBySearchText(string searchText);//搜索指定用户名的设计师(可为多个）
        IQueryable<DesignCompanyUser> GetAllDesignCompanyByFans();//按好评率或粉丝率
        IQueryable<DesignCompanyUser> GetAllDesignCompanyByDistance();//按距离，默认
        IQueryable<DesignCompanyUser> GetDesignCompanysBySearchText(string searchText);//搜索指定用户名的设计公司(可为多个）
        IQueryable<SellerUser> GetAllSellerByFansAndProductType(SellerUser.enumProductType productType);//按好评率或粉丝率，产品类型
        IQueryable<SellerUser> GetAllSellerByDistanceAndProductType(SellerUser.enumProductType productType);//按距离，默认
        IQueryable<SellerUser> GetSellersBySearchTextAndProductType(string searchText, SellerUser.enumProductType productType);//搜索指定用户名的设计公司(可为多个）
        IQueryable<SellerUser> GetSellersBySearchText(string searchText);
        IQueryable<DisplayHouse> GetAllDisplayHouseByStyle();//按设计风格
        IQueryable<DisplayHouse> GetAllDisplayHouseByFans();//按好评率或粉丝率
        IQueryable<DisplayHouse> GetAllDisplayHouseByDistance();//按距离，默认
        IQueryable<Demand> GetAllVisibleDemand();//获取所有家装需求，仅设计方面用户可用
        Order GetOrderToDesigner(DesignerUser designUser);
        Order GetOrderToDesignCompany(DesignCompanyUser designCompanyUser);
        Order GetOrderToNormalUser(NormalUser normalUser);//需要考虑该属性：NormalUserIsAgree
        void Save();//保存并提交数据库
        void AddRSHUser(RSHUser rshUser);//向RSH表中新建RSHUser记录(方法中根据type调用下面4个方法）
        void AddNormalUser(NormalUser normalUser);
        void AddDesignerUser(DesignerUser designUser);
        void AddDesignCompanyUser(DesignCompanyUser designCompanyUser);
        void AddSellerUser(SellerUser sellerUser);
        void DeleteRSHUser(RSHUser rshUser);//向RSH表中删除RSHUser记录(方法中根据type调用下面4个方法）！！！删除先删除外键的记录
        void DeleteNormalUser(NormalUser normalUser);
        void DeleteDesignerUser(DesignerUser designUser);
        void DeleteDesignCompanyUser(DesignCompanyUser designCompanyUser);
        void DeleteSellerUser(SellerUser sellerUser);

    }

    //class UserRepository : IUserRepository
    //{
    //}

    class SearchHelper
    {
        /// <summary>
        /// 输入搜索字符串，返回用于模糊查询的字符串
        /// 格式如："你好" --> "*你*好*"
        /// </summary>
        /// <param name="inputText"></param>
        /// <returns></returns>
        public static string GetSearchPattern(string inputText)
        {
            return GetSearchPattern(inputText, "*");
        }

        public static string GetSearchPattern(string inputText,string insertValue)
        {
            StringBuilder sb = new StringBuilder(inputText);
            int sbLength = sb.Length;
            for (int i = 0; i <= sbLength; i++)
            {
                sb.Insert(2 * i, insertValue);
            }
            return sb.ToString();
        }

        //注意使用checked，防止溢出，单位为
        public double GetDistance(string region1, string region2);
        public double GetDistance(MapPoint mapPoint1, MapPoint mapPoint2);
        public double GetDistance(double longitude1, double latitude1, double longitude2, double latitude2);
    }

    /// <summary>
    /// 地图点
    /// </summary>
    class MapPoint
    {
    }
}
