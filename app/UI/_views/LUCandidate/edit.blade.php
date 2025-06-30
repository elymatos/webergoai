@php use Carbon\Carbon; @endphp
<x-layout.object>
    <x-slot:name>
        <span>{{$luCandidate->name}}</span>
    </x-slot:name>
    <x-slot:detail>
        <div class="ui label tag wt-tag-id">
            #{{$luCandidate->idLUCandidate}}
        </div>
        @if($isManager)
        <x-button
            label="Delete"
            color="danger"
            onclick="manager.confirmDelete(`Removing LU candidate '{{$luCandidate->name}}'.`, '/luCandidate/{{$luCandidate->idLUCandidate}}')"
        ></x-button>
        @endif
    </x-slot:detail>
    <x-slot:description>
        Created by {{$luCandidate->userName}} [{{$luCandidate->email}}] at {!! $luCandidate->createdAt ? Carbon::parse($luCandidate->createdAt)->format("d/m/Y") : '-' !!}
    </x-slot:description>
    <x-slot:main>
        @include("LUCandidate.menu")
    </x-slot:main>
</x-layout.object>
