
@ElementCollection
@CollectionTable( name = "friend_nickname", joinColumns=@JoinColumn(name = "friend_id"))
@Column( name = "nickname")
private Collection<String> nicknames = new ArrayList<String>();
