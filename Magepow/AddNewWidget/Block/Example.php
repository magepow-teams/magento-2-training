<?php
 
 namespace Magepow\AddNewWidget\Block;
  
 use Magento\Framework\View\Element\Template;
 use Magento\Widget\Block\BlockInterface;
  
 class Example extends Template implements BlockInterface
 {
    /*
    * @var $_template
    */
    protected $_template = "widget/example.phtml";
 }