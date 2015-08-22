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
class OrderController extends HomeController {
    static private $LIST_ROW = 12;

    public function index($p = 1){
        //分类信息
        $item_groups    = M('Groups')->order('level ASC,id DESC')->select();
        $this->assign('grouplist',$item_groups);//列表

        $start_page = ($p - 1) * (self::$LIST_ROW);

        $path = '/items?&type=PHYSICAL&status=PUBLIC&start='.$start_page.'&count='.self::$LIST_ROW;
        $total = 0;

        $results = get_catalog($path);
        if($results != null && $results['results'] != null){
            $total = $results['total'];
            $items = self::getItems($results['results']);
        }
        $pages = trim((new Page($total, self::$LIST_ROW))->show(),' ');
        $this->assign('lists',$items);//列表
        $this->assign('pages',$pages);//列表
        $this->display();

    }

    public function group($p = 1){
        $group = I('get.gId','');

        $item_groups    = M('Groups')->order('level ASC,id DESC')->select();
        $group_id = self::getGroupId($group, $item_groups);

        $this->assign('grouplist',$item_groups);//列表

        $start_page = ($p - 1) * (self::$LIST_ROW);
        $group_param = '';
        if ($group_id!=null) {
            $group_param = '&groupId=' . $group_id ;
        }
        $path = '/items?type=PHYSICAL&status=PUBLIC&start='.$start_page.'&count='.self::$LIST_ROW.$group_param;
        $total = 0;

        $results = get_catalog($path);
        if($results != null && $results['results'] != null){
            $total = $results['total'];
            $items = self::getItems($results['results']);
        }
        $pages = trim((new Page($total, self::$LIST_ROW))->show(),' ');
        $this->assign('lists',$items);//列表
        $this->assign('pages',$pages);//列表
        $this->display();
    }

    public function search($p = 1){
        //分类信息
        $item_groups    = M('Groups')->order('level ASC,id DESC')->select();
        $this->assign('grouplist',$item_groups);//列表

        //get query item id list
        $query = I('get.query','');
        $path = '/items/search?query='.$query.'&start='.$start_page.'&count='.self::$LIST_ROW;
        $results_ids = get_catalog($path);
        if($results_ids != null && $results_ids['results'] != null){
            $itemIds = self::getItemIds($results_ids['results']);
        }

        if (count($itemIds)) {
            //get query items
            $path = '/items?type=PHYSICAL&status=PUBLIC';
            foreach ($itemIds as $itemId) {
                $path = $path . '&itemId=' . $itemId;
            }
            $start_page = ($p - 1) * (self::$LIST_ROW);
            $path = $path . '&start=' . $start_page . '&count=' . self::$LIST_ROW;
            $total = 0;
            $results = get_catalog($path);
            if ($results != null && $results['results'] != null) {
                $total = $results['total'];
                $items = self::getItems($results['results']);
            }
            $pages = trim((new Page($total, self::$LIST_ROW))->show(), ' ');
            $this->assign('note', '‘' . $query . '’ 的搜索结果'); //结果文字
            $this->assign('lists', $items); //列表
            $this->assign('pages', $pages); //列表
        } else {
            $this->assign('note', '无 ‘' . $query . '’ 相关商品'); //结果文字
        }
        $this->display();
    }

    public function product(){
        $itemId = I('get.itemId','');
        $path = '/items/'.$itemId;
        $item = get_catalog($path);
        $this->assign('item',$item);
        $featuredImgs = $item['images']['featured'];
        $this->assign('featuredImgs',$featuredImgs);
        $this->display();
    }

    private function getItemGroups($results){
        $item_groups = array();
        if($results != null && is_array($results) && count($results) > 0 ){
            foreach($results as $result){
                $item_group = array();
                $item_group['name']=$result['name'];
                $item_group['groupId']=$result['groupId'];
                $item_groups[] = $item_group;
            }
        }
        return $item_groups;
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

    private function getItemIds($results){
        $itemIds = array();
        if($results != null && is_array($results) && count($results) > 0 ){
            foreach($results as $index=>$result){
                $itemIds[$index] = $result['id'];
            }
        }
        return $itemIds;
    }

    private function getImages($result){
        $images = array();
        if($result['images']['main']['icon'] != null){
            $images['small'] = $result['images']['main']['icon']['href'];
        }
//        if($result['images']['featured'] != null){
//            $images['big'] = $result['images']['featured'][0]['href'];
//        }
        return $images;
    }

    private function  getBrandNumber($result){
        if(isset($result['properties']['brand'])){
            return rtrim($result['properties']['brand'],'星');
        }
        return 0;
    }

    private function getGroupId($type,$types){
        $name = '';
        if(!empty($types) && is_array($types)) {
            foreach($types as $t){
                if($t['id'] == $type){
                    $name =  $t['group_id'];
                    break;
                }
                continue;
            }
        }
        return $name;
    }


}