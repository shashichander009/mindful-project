from django_elasticsearch_dsl import Document
from django_elasticsearch_dsl.registries import registry

from .models import User, Post


SETTINGS = {
    'number_of_shards': 1,
    'number_of_replicas': 0
}


@registry.register_document
class UserDocument(Document):
    class Index:
        name = 'user'
        settings = SETTINGS

    class Django:
        model = User
        fields = ['user_id', 'username', 'name']


@registry.register_document
class PostDocument(Document):
    class Index:
        name = 'post'
        settings = SETTINGS

    class Django:
        model = Post
        fields = ['post_id', 'content']
