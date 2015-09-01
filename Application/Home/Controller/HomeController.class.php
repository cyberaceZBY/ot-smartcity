<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Think\Controller;

/**
 * 前台公共控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用分组名称
 */
class HomeController extends Controller {

    public function getModelEnum($string){
        if ('document_news'==$string)
            return 1200;
        if ('people'==$string)
            return 1300;
    }


	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}


    protected function _initialize(){
        self::initNav();
        /* 读取站点配置 */
        $config = api('Config/lists');
        C($config); //添加配置

        if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }
    }

	/* 用户登录检测 */
	protected function login(){
		/* 用户登录检测 */
		is_login() || $this->error('您还没有登录，请先登录！', U('User/login'));
	}


    protected function initNav(){

        $cateList = M('category')->order('sort DESC,id ASC')->select();
        $navMenu = [];
        foreach($cateList as $cate) {
            if ($cate['pid'] == 0 && $cate['id']!='100'){
                $menuItem = array();
                $menuItem['id'] = "menu_".$cate['id'];
                $menuItem['title'] = $cate['title'];
                $menuItem['list'] = M('document')->where('category_id='.$cate['id'].' AND status=1')->order('level DESC,id ASC')->select();
                foreach($cateList as $sub_cate) {
                    if ($sub_cate['pid'] == $cate['id']){
                        $subMenuItem = $sub_cate;
                        if ($sub_cate['model']==self::getModelEnum('people')) {
                            $subMenuItem['type'] = -2; //people page
                        } else {
                            $subMenuItem['type'] = -1; //doc sub menu
                        }
                        $menuItem['list'][] = $subMenuItem;
                    }
                }
                $navMenu[] = $menuItem;
            }
        }

        $cateList = M('category')->order('sort DESC,id ASC')->select();

        $this->assign('navMenu',$navMenu);//列表
//        foreach($navMenu as $menuItem) {
//            $this->assign($menuItem['id'], $menuItem['list']);
//        }
    }

}
