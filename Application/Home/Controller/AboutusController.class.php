<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.silkcloud.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: WJ <http://www.silkcloud.com>
// +----------------------------------------------------------------------

namespace Home\Controller;

/**
 * 前台首页控制器
 * 主要获取体验中心数据
 */
class AboutusController extends HomeController {

    public function index(){

        $lists    = M('Aboutus')->order('`level` DESC,`id` DESC')->select();
        $this->assign('lists',$lists);//列表
        $this->assign('content',$lists[0]);
        $this->display();;
    }

    public function sub($p = 1){
        $subId = I('get.subId','');

        $lists    = M('Aboutus')->order('`level` DESC,`id` DESC')->select();
        $this->assign('lists',$lists);//列表

        foreach ($lists as $sub){
            if ($sub['id'] == $subId){
                $this->assign('content',$sub);
            }
        }

        $this->display();
    }
}