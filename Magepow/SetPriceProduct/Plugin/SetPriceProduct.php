<?php
 
 namespace Magepow\SetPriceProduct\Plugin;
  
 class SetPriceProduct
 {
     /*
     *@param \Magento\Catalog\Model\Product $subject
     *@param $result
     * @return float
     */
    
     public function afterGetPrice(\Magento\Catalog\Model\Product $subject, $result)
     {
         $result = 0;
         return $result;
     }
 }