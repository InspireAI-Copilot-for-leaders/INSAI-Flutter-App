// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PostsStruct extends FFFirebaseStruct {
  PostsStruct({
    String? finalPost,
    String? postLength,
    String? topic,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _finalPost = finalPost,
        _postLength = postLength,
        _topic = topic,
        super(firestoreUtilData);

  // "final_post" field.
  String? _finalPost;
  String get finalPost => _finalPost ?? '';
  set finalPost(String? val) => _finalPost = val;

  bool hasFinalPost() => _finalPost != null;

  // "post_length" field.
  String? _postLength;
  String get postLength => _postLength ?? '';
  set postLength(String? val) => _postLength = val;

  bool hasPostLength() => _postLength != null;

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  set topic(String? val) => _topic = val;

  bool hasTopic() => _topic != null;

  static PostsStruct fromMap(Map<String, dynamic> data) => PostsStruct(
        finalPost: data['final_post'] as String?,
        postLength: data['post_length'] as String?,
        topic: data['topic'] as String?,
      );

  static PostsStruct? maybeFromMap(dynamic data) =>
      data is Map ? PostsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'final_post': _finalPost,
        'post_length': _postLength,
        'topic': _topic,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'final_post': serializeParam(
          _finalPost,
          ParamType.String,
        ),
        'post_length': serializeParam(
          _postLength,
          ParamType.String,
        ),
        'topic': serializeParam(
          _topic,
          ParamType.String,
        ),
      }.withoutNulls;

  static PostsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostsStruct(
        finalPost: deserializeParam(
          data['final_post'],
          ParamType.String,
          false,
        ),
        postLength: deserializeParam(
          data['post_length'],
          ParamType.String,
          false,
        ),
        topic: deserializeParam(
          data['topic'],
          ParamType.String,
          false,
        ),
      );

  static PostsStruct fromAlgoliaData(Map<String, dynamic> data) => PostsStruct(
        finalPost: convertAlgoliaParam(
          data['final_post'],
          ParamType.String,
          false,
        ),
        postLength: convertAlgoliaParam(
          data['post_length'],
          ParamType.String,
          false,
        ),
        topic: convertAlgoliaParam(
          data['topic'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PostsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PostsStruct &&
        finalPost == other.finalPost &&
        postLength == other.postLength &&
        topic == other.topic;
  }

  @override
  int get hashCode => const ListEquality().hash([finalPost, postLength, topic]);
}

PostsStruct createPostsStruct({
  String? finalPost,
  String? postLength,
  String? topic,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostsStruct(
      finalPost: finalPost,
      postLength: postLength,
      topic: topic,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostsStruct? updatePostsStruct(
  PostsStruct? posts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    posts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostsStructData(
  Map<String, dynamic> firestoreData,
  PostsStruct? posts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (posts == null) {
    return;
  }
  if (posts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && posts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postsData = getPostsFirestoreData(posts, forFieldValue);
  final nestedData = postsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = posts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostsFirestoreData(
  PostsStruct? posts, [
  bool forFieldValue = false,
]) {
  if (posts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(posts.toMap());

  // Add any Firestore field values
  posts.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostsListFirestoreData(
  List<PostsStruct>? postss,
) =>
    postss?.map((e) => getPostsFirestoreData(e, true)).toList() ?? [];
