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
class ReviewController extends HomeController {
    static private $LIST_ROW = 4;
    static private $INDEX_COUNT = '3';

    public function index($p = 1){

        $types    = M('Type')->order('level DESC,id DESC')->select();
        $recommends = M('Review')->limit(self::$INDEX_COUNT)->where(array('recommend'=>1))->order('level DESC,id DESC')->select();
        if($p == 1){
            $reviews = M('Review')->limit(self::$LIST_ROW)->where(array('recommend'=>0))->order('level DESC,id DESC')->select();
        }else {
            $reviews = M('Review')->page($p, self::$LIST_ROW)->order('level DESC,id DESC')->select();
        }
        $total = M('Review')->count('id');
        $pages = trim((new Page($total, self::$LIST_ROW))->show(),' ');

        $this->assign('recommends',$recommends);
        $this->assign('types',$types);
        $this->assign('reviews',$reviews);
        $this->assign('pages',$pages);

        $this->display();
    }

    public function type($p = 1){

        $type = I('get.id','');
        $types    = M('Type')->order('level DESC,id DESC')->select();
        $reviews = M('Review')->where(array('type'=>$type))->page($p, self::$LIST_ROW)->order('level DESC,id DESC')->select();
        $name = self::getName($type, $types);
        $total = M('Review')->where(array('type'=>$type))->count('id');
        $pages = trim((new Page($total, self::$LIST_ROW))->show(),' ');
        $this->assign('name',$name);
        $this->assign('types',$types);
        $this->assign('reviews',$reviews);
        $this->assign('pages',$pages);

        $this->display();
    }

    public function detail($id = 0){

        if(!($id && is_numeric($id))){
            $this->error('评测ID错误！');
        }
        $review = M('Review')->where(array('id'=>$id))->select();
        $this->assign('review',$review[0]);

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

}