<?php
 
namespace Magepow\AddAttributeToFilter\Controller\Adminhtml\Product;

 
class Index extends \Magento\Framework\App\Action\Action
{

    protected $_collectionFactory;
        
    public function __construct(
        \Magento\Framework\App\Action\Context $context,        
        \Magento\Catalog\Model\ResourceModel\Product\CollectionFactory $collectionFactory
    )
    {    
        $this->_collectionFactory = $collectionFactory;    
        parent::__construct($context);
    }
    
    public function execute()
    {
        $collection = $this->_collectionFactory->create();
        //add more attribute
        $collection->addAttributeToSelect('price');
        //where
        $collection ->addAttributeToFilter('entity_id', ['gt' => 10]);
        //limit
        $collection->setPageSize(10);
        //order by
        $collection->addAttributeToSort('entity_id', 'DESC');
        //sql->string
        echo $collection->getSelect()->__toString();
        echo '<pre>';
        print_r($collection->getData());
        echo '</pre>';
    }
}