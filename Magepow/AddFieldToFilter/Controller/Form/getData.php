<?php
 
namespace Magepow\AddFieldToFilter\Controller\Form;
 
class getData extends \Magento\Framework\App\Action\Action
{
    protected $formFactory;
 
    public function __construct(
        \Magento\Framework\App\Action\Context $context,
        \Magepow\CreateFormAdmin\Model\FormFactory $formFactory
    )
    {
        $this->formFactory = $formFactory;
        return parent::__construct($context);
    }
 
    public function execute()
    {
        $data = $this->formFactory->create()->getCollection()->addFieldToFilter('id', ['eq' => 3]);
        foreach ($data as $value) {
            echo "<pre>";
            print_r($value->getData());
            echo "</pre>";
        }
    }
}