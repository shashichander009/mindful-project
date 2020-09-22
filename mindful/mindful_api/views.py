from django.http import JsonResponse
from django.contrib.auth import (
    login as django_login,
    logout as django_logout
)
from django.shortcuts import get_object_or_404

from rest_framework import status
from rest_framework.views import APIView
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated, BasePermission
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from elasticsearch_dsl import Q

from .serializers import (
    LoginSerializer,
    UserSerializer,
    PostSerializer,
    LikeSerializer,
    BookmarkSerializer,
    ReportSerializer,
    FollowingsSerializer,
    UserSearchSerializer,
    PostSearchSerializer,
    TimelineSerializer,
)
from .models import (
    User,
    Post,
    Likes,
    Bookmarks,
    ReportPost,
    Followings,
)
from .documents import UserDocument, PostDocument


class LoginView(APIView):

    def post(self, request):
        serializer = LoginSerializer(data=request.data)

        if serializer.is_valid():
            user = serializer.validated_data.get('user', '')
            django_login(request, user)

            jwt = TokenObtainPairSerializer.get_token(user=user)
            token = {
                'refresh': str(jwt),
                'access': str(jwt.access_token)
            }

            return JsonResponse(token, status=status.HTTP_200_OK)
        return JsonResponse({"detail": "Login Failed"},
                            status=status.HTTP_401_UNAUTHORIZED)


class LogoutView(APIView):

    permission_classes = (IsAuthenticated, )

    def post(self, request):
        django_logout(request)
        return JsonResponse({"detail": "Logout Successful"},
                            status=status.HTTP_200_OK)


class UserViewPermission(BasePermission):
    """Set permission for UserView"""

    SAFE_METHODS = ['GET', 'POST']

    def has_permission(self, request, view):
        return request.method in self.SAFE_METHODS


class UserView(APIView):
    """API for create, delete, update and get User"""

    permission_classes = [IsAuthenticated | UserViewPermission]

    def get(self, request):
        request_data = request.GET

        if 'username' in request_data:
            user = User.objects.filter(
                username=request_data.get('username', ''))

        if 'email' in request_data:
            user = User.objects.filter(email=request_data.get('email', ''))

        if user:
            return JsonResponse({"detail": "Already Used"},
                                status=status.HTTP_226_IM_USED)
        return JsonResponse({"detail": "Available"},
                            status=status.HTTP_200_OK)

    def post(self, request):
        user_serializer = UserSerializer(data=request.data)
        if user_serializer.is_valid():
            user_serializer.save()
            return JsonResponse({"detail": "User Created"},
                                status=status.HTTP_201_CREATED)
        return JsonResponse({"detail": "User Not Created"},
                            status=status.HTTP_417_EXPECTATION_FAILED)

    def patch(self, request):
        user = request.user
        user_serializer = UserSerializer(user, data=request.data, partial=True)
        if user_serializer.is_valid():
            user_serializer.save()
            return JsonResponse({"detail": "User Updated"},
                                status=status.HTTP_200_OK)
        return JsonResponse({"detail": "User Not Updated"},
                            status=status.HTTP_417_EXPECTATION_FAILED)

    def delete(self, request):
        user = request.user
        user.delete()
        return JsonResponse({"detail": "User Deleted"},
                            status=status.HTTP_200_OK)


def convert_has_media_to_boolean(has_media):
    """Convert incoming has_media from string to boolean"""

    true_values = ['true', 'yes', 't', 'y']
    if has_media.lower() in true_values:
        return True
    return False


class PostView(APIView):
    """API for fetching all post and creating new post"""

    permission_classes = (IsAuthenticated, )

    def get(self, request):
        posts = Post.objects.all().order_by('-created_at')
        post_serializer = PostSerializer(posts, many=True)
        return JsonResponse(post_serializer.data,
                            status=status.HTTP_200_OK,
                            safe=False)

    def post(self, request):
        request.data._mutable = True

        request.data['user_id'] = request.user.user_id

        has_media = request.data.get('has_media', '')
        request.data['has_media'] = convert_has_media_to_boolean(has_media)
        request.data['tags'] = {}

        post_serializer = PostSerializer(data=request.data)
        if post_serializer.is_valid():
            post_serializer.save()
            return JsonResponse({"detail": "Post Created"},
                                status=status.HTTP_201_CREATED)
        return JsonResponse({"detail": "Post Not Created"},
                            status=status.HTTP_417_EXPECTATION_FAILED)


class SinglePostView(APIView):
    """API to fetch, update and delete a specific post"""

    permission_classes = (IsAuthenticated, )

    def get(self, request, post_id):
        post = get_object_or_404(Post, post_id=post_id)
        post_serializer = PostSerializer(post)
        return JsonResponse(post_serializer.data, status=status.HTTP_200_OK)

    def patch(self, request, post_id):
        post = get_object_or_404(Post, post_id=post_id)

        request_user = request.user
        if not post.user_id == request_user:
            return JsonResponse({"detail": "Unauthorized"},
                                status=status.HTTP_401_UNAUTHORIZED)

        request.data._mutable = True

        has_media = request.data.get('has_media', '')
        request.data['has_media'] = convert_has_media_to_boolean(has_media)

        post_serializer = PostSerializer(post,
                                         data=request.data,
                                         partial=True)

        if post_serializer.is_valid():
            post_serializer.save()
            return JsonResponse({"detail": "Post Updated"},
                                status=status.HTTP_200_OK)
        return JsonResponse({"detail": "Post Not Updated"},
                            status=status.HTTP_417_EXPECTATION_FAILED)

    def delete(self, request, post_id):
        post = get_object_or_404(Post, post_id=post_id)

        request_user = request.user
        if not post.user_id == request_user:
            return JsonResponse({"detail": "Unauthorized"},
                                status=status.HTTP_401_UNAUTHORIZED)

        post.delete()
        return JsonResponse({"detail": "Post Deleted"},
                            status=status.HTTP_200_OK)


class LikePostView(APIView):
    """API to Like/Unlike a specific post"""

    permission_classes = (IsAuthenticated, )

    def post(self, request, post_id):
        request_user = request.user
        request.data['post_id'] = post_id
        request.data['user_id'] = request_user.user_id

        get_object_or_404(Post, post_id=post_id)

        like = Likes.objects.filter(post_id=post_id,
                                    user_id=request_user.user_id)

        if not like:
            like_serializer = LikeSerializer(data=request.data)
            if like_serializer.is_valid():
                like_serializer.save()
                return JsonResponse({"detail": "Like Added"},
                                    status=status.HTTP_200_OK)
            return JsonResponse({"detail": "Invalid Data"},
                                status=status.HTTP_400_BAD_REQUEST)
        like.delete()
        return JsonResponse({"detail": "Like Removed"},
                            status=status.HTTP_200_OK)


class BookmarkPostView(APIView):
    """API to Bookmark/Remove bookmark a specific post"""

    permission_classes = (IsAuthenticated, )

    def post(self, request, post_id):
        request_user = request.user
        request.data['post_id'] = post_id
        request.data['user_id'] = request_user.user_id

        get_object_or_404(Post, post_id=post_id)

        bookmark = Bookmarks.objects.filter(post_id=post_id,
                                            user_id=request_user.user_id)

        if not bookmark:
            bookmark_serializer = BookmarkSerializer(data=request.data)
            if bookmark_serializer.is_valid():
                bookmark_serializer.save()
                return JsonResponse({"detail": "Bookmark Added"},
                                    status=status.HTTP_200_OK)
            return JsonResponse({"detail": "Invalid Data"},
                                status=status.HTTP_400_BAD_REQUEST)
        bookmark.delete()
        return JsonResponse({"detail": "Bookmark Removed"},
                            status=status.HTTP_200_OK)


class ReportPostView(APIView):
    """API to Report/Remove report a specific post"""

    permission_classes = (IsAuthenticated, )

    def post(self, request, post_id):

        post = get_object_or_404(Post, post_id=post_id)

        request_user = request.user
        request.data['post_id'] = post_id
        request.data['user_id'] = request_user.user_id

        post_user_id = post.user_id.user_id
        request_user_id = request_user.user_id

        if post_user_id is not request_user_id:

            report = ReportPost.objects.filter(post_id=post_id,
                                               user_id=request_user_id)

            if not report:
                report_serializer = ReportSerializer(data=request.data)
                if report_serializer.is_valid():
                    report_serializer.save()
                    return JsonResponse({"detail": "Report Added"},
                                        status=status.HTTP_200_OK)
                return JsonResponse({"detail": "Invalid Data"},
                                    status=status.HTTP_400_BAD_REQUEST)
            report.delete()
            return JsonResponse({"detail": "Report Removed"},
                                status=status.HTTP_200_OK)

        return JsonResponse({"detail": "You can't report your own post"},
                            status=status.HTTP_401_UNAUTHORIZED)


@api_view(['POST'])
def update_password(request):

    if request.method == 'POST':
        email = request.data.get('email', '')
        dob = request.data.get('date_of_birth', '')
        que = request.data.get('security_que', '').lower()
        ans = request.data.get('security_ans', '').lower()
        new_passwd = request.data.get('new_password', '')

        user = get_object_or_404(User, email=email)

        conditions_to_reset_password = [
            str(user.date_of_birth) == dob,
            user.security_que == que,
            user.security_ans == ans
        ]

        if all(conditions_to_reset_password):
            user.set_password(new_passwd)
            user.save()
            return JsonResponse({"detail": "Password Updated"},
                                status=status.HTTP_200_OK)
        return JsonResponse({"detail": "Details not matched"},
                            status=status.HTTP_417_EXPECTATION_FAILED)


class FollowView(APIView):
    """API to follow/unfollow users"""

    permission_classes = (IsAuthenticated, )

    def post(self, request, user_id):

        user_to_be_followed = get_object_or_404(User, user_id=user_id)

        user_to_be_followed_user_id = user_to_be_followed.user_id
        request_user_id = request.user.user_id

        request.data['follower_id'] = user_id
        request.data['followed_by_id'] = request_user_id

        if user_to_be_followed_user_id is not request_user_id:

            print(user_to_be_followed_user_id)
            print(request_user_id)
            following = Followings.objects.filter(
                follower_id=user_to_be_followed_user_id,
                followed_by_id=request_user_id)

            if not following:
                follow_serializer = FollowingsSerializer(data=request.data)
                if follow_serializer.is_valid():
                    print("start following")
                    follow_serializer.save()
                    return JsonResponse({"detail": "Started Following"},
                                        status=status.HTTP_200_OK)

                return JsonResponse({"detail": "Invalid Data"},
                                    status=status.HTTP_400_BAD_REQUEST)
            following.delete()
            return JsonResponse({"detail": "Unfollowed"},
                                status=status.HTTP_200_OK)

        return JsonResponse({"detail": "You can't follow yourself"},
                            status=status.HTTP_401_UNAUTHORIZED)


class FollowersView(APIView):
    """API to get followers"""

    def get(self, request, user_id):

        followersresponse = {
            "followers": []
        }

        user = get_object_or_404(User, user_id=user_id)

        followers = Followings.objects.filter(follower_id=user.user_id)

        for follower in followers:
            followerdict = {}
            follower_user_id = follower.followed_by_id.user_id
            followerobj = get_object_or_404(User, user_id=follower_user_id)
            followerdict['name'] = followerobj.name
            followerdict['id'] = follower_user_id
            followerdict['username'] = followerobj.username
            followersresponse["followers"].append(followerdict)

        if followers:
            return JsonResponse(followersresponse,
                                status=status.HTTP_200_OK)
        return JsonResponse({"detail": "no followers"},
                            status=status.HTTP_200_OK)


class FollowingsView(APIView):
    """API to get who the user is following"""

    def get(self, request, user_id):

        followingsresponse = {
            "followings": []
        }

        user = get_object_or_404(User, user_id=user_id)

        followings = Followings.objects.filter(followed_by_id=user.user_id)

        for following in followings:
            followingdict = {}
            following_user_id = following.follower_id.user_id
            followingobj = get_object_or_404(User, user_id=following_user_id)
            followingdict['name'] = followingobj.name
            followingdict['id'] = following_user_id
            followingdict['username'] = followingobj.username
            followingsresponse["followings"].append(followingdict)

        if followings:
            return JsonResponse(followingsresponse,
                                status=status.HTTP_200_OK)
        return JsonResponse({"detail": "no followings"},
                            status=status.HTTP_200_OK)


@api_view(['GET'])
def get_profile(request):
    request_data = request.GET

    if 'userid' in request_data:
        try:
            user_id = int(request_data.get('userid', ''))
        except ValueError:
            return JsonResponse({"detail": "Invalid User ID"},
                                status=status.HTTP_400_BAD_REQUEST)

        user = get_object_or_404(User,
                                 user_id=user_id)
    else:
        if request.auth:
            user = request.user
        else:
            return JsonResponse({"detail": "No User ID Given"},
                                status=status.HTTP_400_BAD_REQUEST)

    user_serializer = UserSerializer(user)
    return JsonResponse(user_serializer.data,
                        status=status.HTTP_200_OK)


@api_view(['GET'])
def search(request):
    if request.method == 'GET':
        param = request.GET.get('param', '')

        if param:
            param = '.*{}.*'.format(param).lower()

            user_query = Q('regexp', name=param) | Q('regexp', username=param)
            user_search = UserDocument.search().query(user_query)

            post_search = PostDocument.search().query('regexp', content=param)

            user_search_data = UserSearchSerializer(user_search,
                                                    many=True).data
            post_search_data = PostSearchSerializer(post_search,
                                                    many=True).data

            response = {
                'user_search_data': user_search_data if user_search_data else None,
                'post_search_data': post_search_data if post_search_data else None
            }
            return JsonResponse(response, status=status.HTTP_200_OK)
        return JsonResponse({"detail": "No parameter given to search"},
                            status=status.HTTP_400_BAD_REQUEST)


class SuggestionView(APIView):
    """API for Suggest User Profiles to follow"""

    permission_classes = [IsAuthenticated]

    def get(self, request):
        request_data = request.GET

        if 'items' in request_data:
            items = int(request_data.get('items', 0))

            user_id = request.user.user_id

            followings = list(
                Followings.objects.filter(followed_by_id=user_id).
                values('follower_id'))

            followinglist = []
            for following in followings:
                followinglist.append(following['follower_id'])

            followinglist.append(user_id)

            suggestions = User.objects.exclude(user_id__in=followinglist)

            suggestionsresponse = {
                "suggestions": []
            }

            for suggestion in suggestions:
                if len(suggestionsresponse["suggestions"]) < items:
                    suggestiondict = {}
                    suggestion_user_id = suggestion.user_id
                    suggestiondict['name'] = suggestion.name
                    suggestiondict['id'] = suggestion_user_id
                    suggestiondict['username'] = suggestion.username
                    suggestionsresponse["suggestions"].append(suggestiondict)

            return JsonResponse(suggestionsresponse,
                                status=status.HTTP_200_OK)

        return JsonResponse({"detail": "No items parameter given to search"},
                            status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
@permission_classes((IsAuthenticated, ))
def timeline(request):
    if request.method == 'GET':
        request_user_id = request.user.user_id

        followings = Followings.objects.filter(followed_by_id=request_user_id)
        following_ids = [f.follower_id.user_id for f in followings]

        users_to_show_in_timeline = following_ids.copy()
        users_to_show_in_timeline.append(request_user_id)

        timeline = []

        posts = Post.objects.filter(user_id__in=users_to_show_in_timeline)\
                            .order_by('-created_at')\
                            .select_related('user_id')

        for post in posts:
            liked_by_me = Likes.objects.filter(post_id=post.post_id,
                                               user_id=request_user_id)
            is_liked = False
            if liked_by_me:
                is_liked = True

            bookmarked_by_me = Bookmarks.objects.filter(post_id=post.post_id,
                                                        user_id=request_user_id)
            is_bookmarked = False
            if bookmarked_by_me:
                is_bookmarked = True

            timeline_obj = {
                'name': post.user_id.name,
                'username': post.user_id.username,
                'profile_picture': post.user_id.profile_picture,
                'post_id': post.post_id,
                'content': post.content,
                'has_media': post.has_media,
                'image': post.image,
                'created_at': post.created_at,
                'likes_count': Likes.objects.filter(post_id=post.post_id).count(),
                'is_liked': is_liked,
                'is_bookmarked': is_bookmarked,
            }

            timeline.append(timeline_obj)

        response = TimelineSerializer(timeline, many=True).data
        return JsonResponse({'posts': response}, status=status.HTTP_200_OK)
