create or replace table test_cheyoung_board2.tb_branch
(
    SEQ                 varchar(26)                            not null comment '브랜치_SEQ'
        primary key,
    GROUP_SEQ           varchar(26)                            not null comment '그룹_SEQ',
    GROUP_NAME          varchar(50)                            not null comment '그룹_이름',
    PROJECT_SEQ         varchar(26)                            not null comment '프로젝트_SEQ',
    PROJECT_NAME        varchar(50)                            not null comment '프로젝트_이름',
    BRANCH_NAME         varchar(50)                            not null comment '브랜치_이름',
    IS_DEFAULT          varchar(1) default 'N'                 null comment '기본_브랜치_여부',
    LAST_COMMIT_SEQ     varchar(26)                            null comment '최근_커밋_SEQ',
    LAST_COMMIT_MESSAGE varchar(500)                           null comment '최근_커밋_메시지',
    LAST_COMMIT_YMD     char(8)                                null comment '최근_커밋_일자',
    LAST_COMMIT_HM      char(4)                                null comment '최근_커밋_시간',
    COMMIT_COUNT        int        default 0                   null comment '전체_커밋_수',
    DEL_YN              varchar(1) default 'N'                 null,
    CREATE_ID           varchar(30)                            null,
    CREATE_NAME         varchar(30)                            null,
    CREATE_DATE         datetime   default current_timestamp() null,
    UPDATE_ID           varchar(30)                            null,
    UPDATE_NAME         varchar(30)                            null,
    UPDATE_DATE         datetime   default current_timestamp() null,
    DELETE_ID           varchar(30)                            null comment '삭제ID',
    DELETE_NAME         varchar(30)                            null comment '삭제명',
    DELETE_DATE         datetime                               null comment '삭제일시'
)
    comment '브랜치';

create or replace table test_cheyoung_board2.tb_commit
(
    SEQ                   varchar(26)                          not null comment '커밋_SEQ'
        primary key,
    BRANCH_SEQ            varchar(26)                          not null comment '브랜치_SEQ',
    PARENT_COMMIT_SEQ     varchar(26)                          null comment '이전 커밋_SEQ',
    COMMIT_MESSAGE        varchar(500)                         not null,
    COMMITTER_ID          varchar(30)                          not null,
    COMMIT_YMD            char(8)                              not null,
    COMMIT_HM             char(4)                              not null,
    MERGE_FROM_COMMIT_SEQ varchar(26)                          null comment 'Merge_커밋_SEQ',
    REBASE_ORIGIN_SEQ     varchar(26)                          null comment 'Rebase_전_SEQ',
    CREATE_DATE           datetime default current_timestamp() null,
    DEL_YN                char     default 'N'                 null comment '삭제_여부'
)
    comment '커밋';

create or replace table test_cheyoung_board2.tb_group
(
    SEQ               varchar(26)                             not null comment '그룹_SEQ'
        primary key,
    GROUP_NAME        varchar(50)                             not null comment '그룹_이름',
    GROUP_DESCRIPTION varchar(500)                            null comment '그룹_설명',
    GROUP_OWNER       varchar(30)                             null comment '그룹_소유자(멤버_ID)',
    VISIBILITY        varchar(10) default 'Public'            null comment '공개_여부',
    DEL_YN            varchar(1)  default 'N'                 null comment '삭제여부',
    CREATE_ID         varchar(30)                             null comment '등록ID',
    CREATE_NAME       varchar(30)                             null comment '등록명',
    CREATE_DATE       datetime    default current_timestamp() null comment '등록일시',
    UPDATE_ID         varchar(30)                             null comment '수정ID',
    UPDATE_NAME       varchar(30)                             null comment '수정명',
    UPDATE_DATE       datetime    default current_timestamp() null comment '수정일시',
    DELETE_ID         varchar(30)                             null comment '삭제ID',
    DELETE_NAME       varchar(30)                             null comment '삭제명',
    DELETE_DATE       datetime                                null comment '삭제일시',
    constraint GROUP_NAME
        unique (GROUP_NAME)
)
    comment '그룹';

create or replace table test_cheyoung_board2.tb_group_member
(
    MEMBER_SEQ  varchar(26)                             not null comment '멤버_SEQ',
    GROUP_SEQ   varchar(26)                             not null comment '그룹_SEQ',
    ROLE        varchar(20) default 'MEMBER'            null comment '그룹 내 역할 (OWNER, ADMIN, MEMBER)',
    DEL_YN      varchar(1)  default 'N'                 null comment '삭제여부',
    CREATE_ID   varchar(30)                             null comment '등록ID',
    CREATE_NAME varchar(30)                             null comment '등록명',
    CREATE_DATE datetime    default current_timestamp() null comment '등록일시',
    UPDATE_ID   varchar(30)                             null comment '수정ID',
    UPDATE_NAME varchar(30)                             null comment '수정명',
    UPDATE_DATE datetime    default current_timestamp() null comment '수정일시',
    DELETE_ID   varchar(30)                             null comment '삭제ID',
    DELETE_NAME varchar(30)                             null comment '삭제명',
    DELETE_DATE datetime                                null comment '삭제일시'
)
    comment '그룹_멤버';

create or replace table test_cheyoung_board2.tb_member
(
    SEQ             varchar(26)                          not null
        primary key,
    MEMBER_ID       varchar(30)                          not null,
    MEMBER_NAME     varchar(30)                          not null,
    MEMBER_PASSWORD varchar(60)                          not null,
    MEMBER_EMAIL    varchar(60)                          not null,
    DEL_YN          varchar(1)                           null comment '삭제여부',
    CREATE_ID       varchar(30)                          null comment '등록ID',
    CREATE_NAME     varchar(30)                          null comment '등록명',
    CREATE_DATE     datetime default current_timestamp() null comment '등록일시',
    UPDATE_ID       varchar(30)                          null comment '수정ID',
    UPDATE_NAME     varchar(30)                          null comment '수정명',
    UPDATE_DATE     datetime default current_timestamp() null comment '수정일시',
    DELETE_ID       varchar(30)                          null comment '삭제ID',
    DELETE_NAME     varchar(30)                          null comment '삭제명',
    DELETE_DATE     datetime                             null comment '삭제일시',
    constraint MEMBER_EMAIL
        unique (MEMBER_EMAIL),
    constraint MEMBER_ID
        unique (MEMBER_ID)
);

create or replace table test_cheyoung_board2.tb_project
(
    SEQ                 varchar(26)                             not null comment '프로젝트_SEQ'
        primary key,
    GROUP_SEQ           varchar(50)                             null comment '그룹_SEQ',
    GROUP_NAME          varchar(50)                             null comment '그룹_이름',
    PROJECT_NAME        varchar(50)                             null comment '프로젝트_이름',
    PROJECT_OWNER       varchar(30)                             null comment '프로젝트_소유자',
    DESCRIPTION         varchar(500)                            null comment '프로젝트_설명',
    VISIBILITY          varchar(10)                             null comment '공개_여부',
    DEFAULT_BRANCH      varchar(10) default 'main'              null comment '기본_브랜치',
    LAST_COMMIT_MESSAGE varchar(500)                            null comment '최근_커밋_메시지',
    LAST_COMMIT_YMD     char(8)                                 null comment '최근_커밋_일자',
    LAST_COMMIT_HM      char(4)                                 null comment '최근_커밋_시간',
    COMMIT_COUNT        int         default 0                   null comment '전체_커밋_수',
    DEL_YN              varchar(1)  default 'N'                 null comment '삭제여부',
    CREATE_ID           varchar(30)                             null comment '등록ID',
    CREATE_NAME         varchar(30)                             null comment '등록명',
    CREATE_DATE         datetime    default current_timestamp() null comment '등록일시',
    UPDATE_ID           varchar(30)                             null comment '수정ID',
    UPDATE_NAME         varchar(30)                             null comment '수정명',
    UPDATE_DATE         datetime    default current_timestamp() null comment '수정일시',
    DELETE_ID           varchar(30)                             null comment '삭제ID',
    DELETE_NAME         varchar(30)                             null comment '삭제명',
    DELETE_DATE         datetime                                null comment '삭제일시'
)
    comment '프로젝트';

