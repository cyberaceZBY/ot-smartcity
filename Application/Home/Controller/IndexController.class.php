<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {

	//系统首页
    public function index(){
        //中心动态
        $centerNews = M('document')->where('category_id=310 AND status=1')->order('level DESC,id ASC')->select();
        $this->assign('centerNewsList',$centerNews);//列表

        //行业资讯
        $fieldNews= M('document')->where('category_id=320 AND status=1')->order('level DESC,id ASC')->select();
        $this->assign('fieldNewsList',$fieldNews);//列表

        //通知公告
        $announcement = M('document')->where('category_id=110 AND status=1')->order('level DESC,id DESC')->select();
        $this->assign('announcementList',$announcement);//列表

        //中心简介
        $intro = M('document')->where('id=4')->select();
        $this->assign('introContent',$intro[0]['description']);//列表

        //友情链接
        $partner = M('partner')->order('level DESC,id DESC')->select();
        $this->assign('partnerList',$partner);//列表

        $this->display();
    }

}