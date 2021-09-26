CREATE TABLE "user"
(
    id         bigserial PRIMARY KEY,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    username   VARCHAR(50)  NOT NULL,
    password   VARCHAR(256) NOT NULL,
    birth_date date,
    gender     boolean,
    user_pic   VARCHAR(256)
);

CREATE TABLE tweet
(
    id         bigserial PRIMARY KEY,
    user_id    bigint REFERENCES "user" (id),
    text       VARCHAR(240),
    photo      VARCHAR(256),
    pub_date   date,
    replies_to bigint REFERENCES tweet (id),
    retweets   bigint REFERENCES tweet (id)
);

CREATE TABLE mention
(
    id       BIGSERIAL PRIMARY KEY,
    tweet_id bigint REFERENCES tweet (id),
    user_id  bigint REFERENCES "user" (id)
);

CREATE TABLE hashtag
(
    id   BIGSERIAL PRIMARY KEY,
    text VARCHAR(239)
);

CREATE TABLE tweetHashtag
(
    id         SERIAL PRIMARY KEY,
    tweet_id   bigint REFERENCES tweet (id),
    hashtag_id bigint REFERENCES hashtag (id)
);

CREATE TABLE userLike
(
    id       serial PRIMARY KEY,
    user_id  bigint REFERENCES "user" (id),
    tweet_id bigint REFERENCES tweet (id)
);

create table subscribers
(
    id            serial primary key,
    user_id       bigint references "user" (id),
    subscriber_id bigint references "user" (id)
);

create table subscriptions
(
    id              serial primary key,
    user_id         bigint references "user" (id),
    subscription_id bigint references "user" (id)
);

INSERT INTO "user" (first_name, last_name, username, password, birth_date, gender, user_pic)
VALUES ('Александр', 'Кузнецов', 'wumBach', '362536jhk51j3gg34', '2002-01-01', TRUE, ''),
       ('Мансур', 'Миникаев', 'mans', '8be8bb8er8b88', '2002-02-02', TRUE, '');

INSERT INTO subscribers (user_id, subscriber_id)
VALUES (1, 2);

INSERT INTO subscriptions (user_id, subscription_id)
VALUES (2, 1);

INSERT INTO tweet (user_id, text, photo, pub_date, replies_to, retweets)
VALUES (1, 'Hello! This is my first tweet!', '', '2021-09-21', Null, NULL);

insert into hashtag(text)
values ('firstTweet');

insert into tweetHashtag(tweet_id, hashtag_id)
VALUES (1, 1);

insert into userLike(user_id, tweet_id)
VALUES (2, 1);