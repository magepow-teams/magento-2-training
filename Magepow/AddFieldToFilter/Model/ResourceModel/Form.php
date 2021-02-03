<?php
 
namespace Magepow\AddFieldToFilter\Model\ResourceModel;
 
class Form extends \Magento\Framework\Model\ResourceModel\Db\AbstractDb
{
    protected function _construct()
    {
        $this->_init('form', 'id');
    }
}