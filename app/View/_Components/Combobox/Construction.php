<?php

namespace App\View\_Components\Combobox;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;
use App\Repositories\Construction as ConstructionRepository;
use App\Repositories\Language;

class Construction extends Component
{
    /**
     * Create a new component instance.
     */
    public ?string $description = '';
    public function __construct(
        public string $id,
        public string $label,
        public ?int $value = null,
        public string $placeholder = '',
        public string $name = '',
        public string $idName = '',
        public ?string $onChange = '',
        public ?string $onSelect = '',
        public ?bool $hasDescription = true,
    )
    {
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        if (($this->value != '') && ($this->value != 0)) {
            $cxn = ConstructionRepository::byId($this->value);
            $cxn->language = Language::byId($cxn->cxIdLanguage);
            $this->placeholder = $cxn->name;
        } else {
            $this->placeholder = "Search Construction";
        }
        if ($this->idName == '') {
            $this->idName = $this->id;
        }
        $this->description = $this->hasDescription ? 'description' : '';
        return view('components.combobox.construction');
    }
}
