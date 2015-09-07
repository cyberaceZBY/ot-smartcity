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

    private function relatedCategories(){
        $getCateId = I('get.cateId','');
        $pid = $getCateId;
        $cateId = $getCateId;
        while(1) {
            $temp = M('category')->where('id=' . $pid)->select();
            if ($temp[0]['pid']==0) {
                $cateId = $temp[0]['id'];
                break;
            } else {
                $pid = $temp[0]['pid'];
            }
        }
        if ($cateId != null) {
            $relateCategories = M('category')->where('pid=' . $cateId)->order('`sort` DESC,`id` ASC')->select();
            $normalCategories = array();
            $peopleList = array();
            foreach($relateCategories as $category){
                if ($category['model'] == self::getModelEnum('people')){
                    $peopleList[] = $category;
                } else {
                    $normalCategories[] = $category;
                }
            }
            $this->assign('clists', $normalCategories); //列表
            $this->assign('plists', $peopleList); //列表
        }
        if ($cateId != null) {
            $relateDocs = M('document')->where('category_id=' . $cateId. ' AND status=1')->order('`level` DESC,`id` ASC')->select();
            $this->assign('dlists', $relateDocs); //列表
        }

    }

    public function content(){
        self::relatedCategories();

        $docId = I('get.Id','');
        $docs = M('document_news')->where('id='.$docId)->select();
        $doc = $docs[0];
        $tmpDocs = M('document')->where('id='.$docId)->select();
        if ($tmpDocs[0]['status']=1) {
            $this->assign('title', $tmpDocs[0]['title']);
            $this->assign('content', $doc);
        }
        $getCateId = I('get.cateId','');
        $this->assign('cateId', $getCateId);
        $this->display();
    }

    public function sub(){
        self::relatedCategories();

        $Id = I('get.Id','');
        $subs = M('document')->where('category_id='.$Id. ' AND status=1')->order('level DESC,id ASC')->select();
        $tmpCates = M('category')->where('id='.$Id)->select();
        $this->assign('title',$tmpCates[0]['title']);
        $this->assign('content',$subs);
        $this->assign('cateId',$Id);
        $this->display();
    }

    public function peopleList(){
        self::relatedCategories();

        $Id = I('get.Id','');
        $people = M('people')->where('category_id='.$Id)->order('`level` DESC,`id` ASC')->select();
        $formedPeople = array();
        foreach ($people as $p) {
            if ($formedPeople[$p['school']]==null)
                $formedPeople[$p['school']] = array();
            $formedPeople[$p['school']][] = $p;
        }
        $tmpCates = M('category')->where('id='.$Id)->select();
        $this->assign('title',$tmpCates[0]['title']);
        $this->assign('content',$formedPeople);
        $this->assign('cateId',$Id);
        $this->display('peopleList');
    }
}