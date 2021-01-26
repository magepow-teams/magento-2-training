<?php
 
 namespace Magepow\ChangeProductName\Plugin;
  
 class ChangeProductName
 {
     /*
     *@var $result
     */
     public function afterGetName(\Magento\Catalog\Model\Product $subject, $result)
     {
         $result = "Magepow training";
         return $result;
     }
 }