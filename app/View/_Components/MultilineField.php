<?php

namespace App\View\_Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class MultilineField extends Component
{
    /**
     * Create a new component instance.
     */
    public function __construct(
        public string $id,
        public string $label,
        public string $value,
        public int $rows = 5,
        public string $placeholder = ''
    )
    {
        if (is_null($this->value)) {
            $this->value = '';
        }
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.multiline-field');
    }
}
