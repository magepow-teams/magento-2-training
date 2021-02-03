<?php
 
namespace Magepow\AddFieldToFilter\Model;
 
class Form extends \Magento\Framework\Model\AbstractModel
{
    protected function _construct()
    {
        $this->_init('Magepow\AddFieldToFilter\Model\ResourceModel\Form');
    }
}