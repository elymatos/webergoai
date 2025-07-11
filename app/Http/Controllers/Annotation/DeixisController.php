<?php

namespace App\Http\Controllers\Annotation;

use App\Data\Annotation\Deixis\CreateObjectData;
use App\Data\Annotation\Deixis\DeleteBBoxData;
use App\Data\Annotation\Deixis\DocumentData;
use App\Data\Annotation\Deixis\ObjectAnnotationData;
use App\Data\Annotation\Deixis\ObjectData;
use App\Data\Annotation\Deixis\ObjectFrameData;
use App\Data\Annotation\Deixis\SearchData;
use App\Data\Comment\CommentData;
use App\Database\Criteria;
use App\Http\Controllers\Controller;
use App\Repositories\Corpus;
use App\Repositories\Document;
use App\Repositories\Video;
use App\Services\AnnotationDeixisService;
use App\Services\AppService;
use App\Services\CommentService;
use Collective\Annotations\Routing\Attributes\Attributes\Delete;
use Collective\Annotations\Routing\Attributes\Attributes\Get;
use Collective\Annotations\Routing\Attributes\Attributes\Middleware;
use Collective\Annotations\Routing\Attributes\Attributes\Post;


#[Middleware(name: 'auth')]
class DeixisController extends Controller
{
    #[Get(path: '/annotation/deixis')]
    public function browse()
    {
        $search = session('searchCorpus') ?? SearchData::from();
        return view("Annotation.Deixis.browse", [
            'search' => $search
        ]);
    }

    #[Post(path: '/annotation/deixis/grid')]
    public function grid(SearchData $search)
    {
        return view("Annotation.Deixis.grid", [
            'search' => $search
        ]);
    }

    private function getData(int $idDocument): DocumentData
    {
        $document = Document::byId($idDocument);
        $corpus = Corpus::byId($document->idCorpus);
        $documentVideo = Criteria::table("view_document_video")
            ->where("idDocument", $idDocument)
            ->first();
        $video = Video::byId($documentVideo->idVideo);
        return DocumentData::from([
            'idDocument' => $idDocument,
            'document' => $document,
            'corpus' => $corpus,
            'video' => $video,
            'fragment' => 'fe'
        ]);
    }

    #[Post(path: '/annotation/deixis/createNewObjectAtLayer')]
    public function createNewObjectAtLayer(CreateObjectData $data)
    {
        try {
            return AnnotationDeixisService::createNewObjectAtLayer($data);
        } catch (\Exception $e) {
            debug($e->getMessage());
            return $this->renderNotify("error", $e->getMessage());
        }
    }
    #[Post(path: '/annotation/deixis/formAnnotation')]
    public function formAnnotation(ObjectData $data)
    {
        $object = AnnotationDeixisService::getObject($data->idDynamicObject ?? 0);
        return view("Annotation.Deixis.Panes.formPane", [
            'order' => $data->order,
            'object' => $object
        ]);
    }

    #[Get(path: '/annotation/deixis/formAnnotation/{idDynamicObject}')]
    public function getFormAnnotation(int $idDynamicObject)
    {
        $object = AnnotationDeixisService::getObject($idDynamicObject ?? 0);
        return view("Annotation.Deixis.Panes.formAnnotation", [
            'object' => $object
        ]);
    }

    #[Get(path: '/annotation/deixis/loadLayerList/{idDocument}')]
    public function loadLayerList(int $idDocument)
    {
        return AnnotationDeixisService::getLayersByDocument($idDocument);
    }

    #[Post(path: '/annotation/deixis/updateObject')]
    public function updateObject(ObjectData $data)
    {
        try {
            $idDynamicObject = AnnotationDeixisService::updateObject($data);
            return Criteria::byId("dynamicobject", "idDynamicObject", $idDynamicObject);
        } catch (\Exception $e) {
            debug($e->getMessage());
            return $this->renderNotify("error", $e->getMessage());
        }
    }

    #[Post(path: '/annotation/deixis/updateObjectRange')]
    public function updateObjectRange(ObjectFrameData $data)
    {
        try {
            debug($data);
            return AnnotationDeixisService::updateObjectFrame($data);
        } catch (\Exception $e) {
            debug($e->getMessage());
            return $this->renderNotify("error", $e->getMessage());
        }
    }

    #[Post(path: '/annotation/deixis/updateObjectFrame')]
    public function updateObjectFrame(ObjectFrameData $data)
    {
        try {
            return AnnotationDeixisService::updateObjectFrame($data);
        } catch (\Exception $e) {
            debug($e->getMessage());
            return $this->renderNotify("error", $e->getMessage());
        }
    }

    #[Post(path: '/annotation/deixis/updateObjectAnnotation')]
    public function updateObjectAnnotation(ObjectAnnotationData $data)
    {
        try {
            return AnnotationDeixisService::updateObjectAnnotation($data);
        } catch (\Exception $e) {
            debug($e->getMessage());
            return $this->renderNotify("error", $e->getMessage());
        }
    }

    #[Delete(path: '/annotation/deixis/{idDynamicObject}')]
    public function deleteObject(int $idDynamicObject)
    {
        try {
            AnnotationDeixisService::deleteObject($idDynamicObject);
            return $this->renderNotify("success", "Object removed.");
        } catch (\Exception $e) {
            debug($e->getMessage());
            return $this->renderNotify("error", $e->getMessage());
        }
    }

    #[Get(path: '/annotation/deixis/fes/{idFrame}')]
    public function feCombobox(int $idFrame)
    {
        return view("Annotation.Deixis.Panes.fes", [
            'idFrame' => $idFrame
        ]);
    }

    /*
     * Comment
     */

    #[Get(path: '/annotation/deixis/formComment')]
    public function getFormComment(CommentData $data)
    {
        $object = CommentService::getDynamicObjectComment($data->idDynamicObject);
        return view("Annotation.Deixis.Panes.formComment", [
            'idDocument' => $data->idDocument,
            'order' => $data->order,
            'object' => $object
        ]);
    }
    #[Post(path: '/annotation/deixis/updateObjectComment')]
    public function updateObjectComment(CommentData $data)
    {
        try {
            debug($data);
            CommentService::updateDynamicObjectComment($data);
            $this->trigger('updateObjectAnnotationEvent');
            return $this->renderNotify("success", "Comment registered.");
        } catch (\Exception $e) {
            return $this->renderNotify("error", $e->getMessage());
        }
    }
    #[Delete(path: '/annotation/deixis/comment/{idDocument}/{idDynamicObject}')]
    public function deleteObjectComment(int $idDocument,int $idDynamicObject)
    {
        try {
            CommentService::deleteDynamicObjectComment($idDocument,$idDynamicObject);
            return $this->renderNotify("success", "Object comment removed.");
        } catch (\Exception $e) {
            return $this->renderNotify("error", $e->getMessage());
        }
    }

    /*
     * get Object
     */
    #[Get(path: '/annotation/deixis/{idDocument}/{idDynamicObject?}')]
    public function annotation(int|string $idDocument, int $idDynamicObject = null)
    {
        $data = $this->getData($idDocument);
        if (!is_null($idDynamicObject)) {
            $data->idDynamicObject = $idDynamicObject;
        }
        return view("Annotation.Deixis.annotation", $data->toArray());
    }

    #[Post(path: '/annotation/deixis/deleteBBox')]
    public function createBBox(DeleteBBoxData $data)
    {
        try {
            debug($data);
            return AnnotationDeixisService::deleteBBoxesFromObject($data);
        } catch (\Exception $e) {
            debug($e->getMessage());
            return $this->renderNotify("error", $e->getMessage());
        }
    }
}
