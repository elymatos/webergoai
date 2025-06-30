@php
    $id = uniqid("formEditLUCandidate");
    debug($luCandidate);
@endphp
<x-form
    id="{{$id}}"
>
    <x-slot:fields>
        <x-hidden-field id="idLUCandidate" :value="$luCandidate->idLUCandidate"></x-hidden-field>
        @if($isManager)
        <div class="field">
            <x-combobox.lexicon-lemma
                id="idLexicon"
                label="Lemma [min: 3 chars]"
                :value="$luCandidate->idLexicon"
            ></x-combobox.lexicon-lemma>
        </div>
        @else
           <x-hidden-field id="idLexicon" :value="$luCandidate->idLexicon"></x-hidden-field>
        @endif
        <div class="field">
            <x-multiline-field
                label="Sense Description"
                id="senseDescription"
                :value="$luCandidate->senseDescription ?? ''"
            ></x-multiline-field>
        </div>
        <div class="formgroup-inline">
            <div class="field mr-1">
                <x-combobox.frame
                    id="idFrame"
                    label="Suggested frame"
                    placeholder="Frame (min: 3 chars)"
                    style="width:250px"
                    class="mb-2"
                    :value="$luCandidate?->idFrame ?? 0"
                    :name="$luCandidate->frameName ?? ''"
                    :hasDescription="false"
                    onSelect="htmx.ajax('GET','/luCandidate/fes/' + result.idFrame,'#fes');"
                ></x-combobox.frame>
            </div>
            <div id="fes">
                <div class="field w-20rem mr-1">
                    <x-combobox.fe-frame
                        id="incorporatedFE"
                        name="incorporatedFE"
                        label="FE"
                        style="width:250px"
                        :value="$luCandidate?->incorporatedFE ?? 0"
                        :idFrame="$luCandidate?->idFrame ?? 0"
                        :hasNull="false"
                    ></x-combobox.fe-frame>
                </div>
            </div>
        </div>
        <div class="field">
            <x-text-field
                label="OR suggest new frame"
                id="frameCandidate"
                :value="$luCandidate->frameCandidate ?? ''"
            ></x-text-field>
        </div>
        <div class="field">
            <x-multiline-field
                label="Discussion"
                id="discussion"
                :value="$luCandidate->discussion ?? ''"
            ></x-multiline-field>
        </div>
        <div class="field">
            <label>Reference</label>
            <hr/>
        </div>
        <div class="formgroup-inline">
            <div class="field mr-1">
                <x-number-field
                    label="#idSentence"
                    id="idDocumentSentence"
                    :value="$luCandidate->idDocumentSentence"
                ></x-number-field>
            </div>
            <div class="field mr-1">
                <x-number-field
                    label="#idDocument"
                    id="idDocument"
                    :value="$luCandidate->idDocument"
                ></x-number-field>
            </div>
            <div class="field mr-1">
                <x-number-field
                    label="#idBoundingBox"
                    id="idBoundingBox"
                    :value="$luCandidate->idBoundingBox"
                ></x-number-field>
            </div>
        </div>
    </x-slot:fields>
    <x-slot:buttons>
        <x-button
            label="Update LU Candidate"
            hx-put="/luCandidate"
        ></x-button>
        @if($isManager)
        <x-button
            label="Create LU"
            hx-post="/luCandidate/createLU"
            color="secondary"
        ></x-button>
        @endif
    </x-slot:buttons>
</x-form>

