<?php
 
namespace Magepow\AddFieldToFilter\Model\ResourceModel\Form;
 
class Collection extends \Magento\Framework\Model\ResourceModel\Db\Collection\AbstractCollection
{
    /*
    * @var $_idFieldName
    */
    protected $_idFieldName = 'id';
 
    protected function _construct()
    {
        $this->_init('Magepow\AddFieldToFilter\Model\Form', 'Magepow\AddFieldToFilter\Model\ResourceModel\Form');
    }
}