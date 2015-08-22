<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.silkcloud.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: WJ <http://www.silkcloud.com>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Think\Page;
/**
 * 前台首页控制器
 * 主要获取在线订购数据
 */
class BrandController extends HomeController {

    //品牌故事
    public function index(){
        $types    = M('Type')->order('level ASC,id DESC')->select();
        $this->assign('types',$types);//列表
        $this->display();
    }
}