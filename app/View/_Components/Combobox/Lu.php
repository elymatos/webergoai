<?php

namespace App\View\_Components\Combobox;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class Lu extends Component
{
    /**
     * Create a new component instance.
     */
    public function __construct(
        public string $id,
        public string $label,
        public string $placeholder = '',
        public string $pos = '',
        public string $name = '',
        public ?int $value = null,
    )
    {
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.combobox.lu');
    }
}
