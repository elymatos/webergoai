<?php

namespace App\Repositories;

use App\Database\Criteria;

class LayerType
{
    public static function byId(int $id): object
    {
        return Criteria::byFilterLanguage("view_layertype", ["idLayerType","=", $id])->first();
    }
    public static function listToLU(object $lu): array
    {
        $array = ['lty_fe', 'lty_gf', 'lty_pt', 'lty_other', 'lty_target', 'lty_sent'];
        $lPOS = ['V' => 'lty_verb', 'N' => 'lty_noun', 'A' => 'lty_adj', 'ADV' => 'lty_adv', 'PREP' => 'lty_prep'];
        $pos = Criteria::byId("pos", "idPOS", $lu->idPOS);
        if (isset($lPOS[$pos->POS])) {
            $array[] = $lPOS[$pos->POS];
        }
        $criteria = Criteria::table("layertype")
            ->select('idLayerType','entry')
            ->where('entry', 'IN', $array);
        return $criteria->all();
    }

}

