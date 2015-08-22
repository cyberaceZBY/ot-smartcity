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
class StoreController extends HomeController {

    public function index(){
        $lists    = M('Store')->order('`level` DESC,`id` DESC')->select();
        $this->assign('lists',$lists);//列表
        $this->display();;
    }
}