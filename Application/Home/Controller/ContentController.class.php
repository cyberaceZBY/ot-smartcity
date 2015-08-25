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
class ContentController extends HomeController {

    public function content(){
        $docId = I('get.Id','');
        $cateId = I('get.subId','');
        $docs = M('document_news')->where('id='.$docId)->select();
        $doc = $docs[0];
        $tmpDocs = M('document')->where('id='.$docId)->select();
        if ($cateId != null) {
            $tmpCates = M('category')->where('id='.$cateId)->select();
            $relates = M('category')->where('pid='.$tmpCates[0]['pid'])->order('`sort` ASC,`id` ASC')->select();
            $this->assign('lists',$relates);//列表
            $this->assign('cateId',$cateId);
        } else {
            $relates = M('document')->where('category_id=' . $tmpDocs[0]['category_id'])->order('`level` ASC,`id` ASC')->select();
            $this->assign('lists',$relates);//列表
        }
        $this->assign('title',$tmpDocs[0]['title']);
        $this->assign('content',$doc);
        $this->display();
    }

    public function sub(){
        $cateId = I('get.Id','');
        $subs = M('document')->where('category_id='.$cateId)->select();
        $tmpCates = M('category')->where('id='.$cateId)->select();
        $relates = M('category')->where('pid='.$tmpCates[0]['pid'])->order('`sort` ASC,`id` ASC')->select();
        $this->assign('lists',$relates);//列表
        $this->assign('title',$tmpCates[0]['title']);
        $this->assign('content',$subs);
        $this->assign('cateId',$cateId);
        $this->display();
    }
}