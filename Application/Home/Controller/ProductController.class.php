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
 * 主要获取产品数据
 */
class ProductController extends HomeController {
    static private $LIST_ROW = 8;
    static private $PROMO_COUNT = '3';

    public function index(){

        $types    = M('Type')->order('level DESC,id DESC')->select();
        $promotions =M('Promotion')->limit(self::$PROMO_COUNT)->order('level DESC,id DESC')->select();
        $this->assign('types',$types);//列表
        $this->assign('promotions',$promotions);//列表

        $this->display();
    }

    public function type($p = 1){

        $type = I('get.id','');
        $types    = M('Type')->order('level DESC,id DESC')->select();
        $name = self::getName($type, $types);
        $groupId = self::getGroupId($type,$types);
        $items = array();
        $total = 0;

        $path = '/items?groupId='.$groupId.'&start='.(($p-1)*self::$LIST_ROW).'&count='.self::$LIST_ROW;
        $results = get_catalog($path);
        if($results != null && $results['results'] != null){
            $total = $results['total'];
            $items = self::getItems($results['results']);
        }
        $pages = trim((new Page($total, self::$LIST_ROW))->show(),' ');
        $this->assign('name',$name);
        $this->assign('types',$types);//列表
        $this->assign('lists',$items);//列表
        $this->assign('pages',$pages);
        $this->display();
    }

    private function getName($type,$types){
        $name = '产品';
        if(!empty($types) && is_array($types)) {
            foreach($types as $t){
                if($t['id'] == $type){
                    $name =  $t['name'];
                    break;
                }
                continue;
            }
        }
        return $name;
    }

    private function getGroupId($type,$types){
        $name = '';
        if(!empty($types) && is_array($types)) {
            foreach($types as $t){
                if($t['id'] == $type){
                    $name =  $t['type_id'];
                    break;
                }
                continue;
            }
        }
        return $name;
    }


    private function getItems($results){
        $items = array();
        if($results != null && is_array($results) && count($results) > 0 ){
            foreach($results as $result){
                $item = array();
                $item['id']=$result['id'];
                $item['name']=$result['name'];
                $item['status']=$result['status'];
                $item['price']=$result['price'];
                $item['images']=self::getImages($result);
                $item['brand']= self::getBrandNumber($result);
                $item['description'] = $result['properties']['shortDescription'];
                $item['buy_link'] = C('BUY_URL').$result['id'];
                $item['detail_link'] = C('PRODUCT_URL').$result['id'];
                $items[] = $item;
            }
        }
        return $items;
    }

    private function getImages($result){
        $images = array();
        if($result['images']['main']['icon'] != null){
            $images['big'] = $result['images']['icon'];
        }
        if($result['images']['featured'] != null){
            $images['small'] = $result['images']['featured'][0]['href'];
        }
        return $images;
    }

    private function  getBrandNumber($result){
        if(isset($result['brand'])){
            return rtrim($result['brand'],'星');
        }
        return 0;
    }


}