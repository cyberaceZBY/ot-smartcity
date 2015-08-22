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
class SubMenuController extends HomeController {

    public function sub(){
        $docId = I('get.Id','');
        $docs = M('document_news')->where('id='.$docId)->select();
        $doc = $docs[0];
        $tmpDocs = M('document')->where('id='.$docId)->select();
        $relates = M('document')->where('category_id='.$tmpDocs[0]['category_id'])->order('`level` ASC,`id` ASC')->select();
        $this->assign('lists',$relates);//列表
        $this->assign('title',$tmpDocs[0]['title']);
        $this->assign('content',$doc);
        $this->display();
    }

}