class Owner {
  int reputation;
  int userId;
  String userType;
  String profileImage;
  String displayName;
  String link;

  Owner({
    this.reputation,
    this.userId,
    this.userType,
    this.profileImage,
    this.displayName,
    this.link
  });

  Owner.fromMap(Map<String, dynamic> map)
      : reputation = map['reputation'],
        userId = map['user_id'],
        userType = map['user_type'],
        profileImage = map['profile_image'],
        displayName = map['display_name'],
        link = map['link'];
}