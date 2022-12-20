CREATE TABLE member.member(
        uid BIGINT NOT NULL AUTO_INCREMENT,
        email01 VARCHAR(30) NOT NULL,
        id01 VARCHAR(15) NOT NULL,
        pwd01 VARCHAR(100) NOT NULL,
        name01 VARCHAR(20) NOT NULL,
        n_name VARCHAR(20) NOT NULL,
        addr01 VARCHAR(10) NOT NULL,
        addr02 VARCHAR(50) NOT NULL,
        addr03 VARCHAR(50) NOT NULL,
        r_date01 DATE NOT NULL,
        p_time BIGINT NOT NULL,
        enabled BIT(1) NOT NULL,
        PRIMARY KEY (uid),
        UNIQUE INDEX `id01_UNIQUE` (id01 ASC) VISIBLE
);
CREATE TABLE member.role(
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO member.role(name) VALUES ('ROLE_USER');

CREATE TABLE member.member_role(
    member_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (member_id, role_id),
    INDEX `FK_member_role_role_idx` (`role_id` ASC) VISIBLE,
        CONSTRAINT `FK_member_role_member`
            FOREIGN KEY (`member_id`)
                REFERENCES `member` (`uid`)
                ON DELETE RESTRICT
                ON UPDATE RESTRICT,
        CONSTRAINT `FK_member_role_role`
             FOREIGN KEY (`role_id`)
                REFERENCES `role` (`id`)
                ON DELETE RESTRICT
                ON UPDATE RESTRICT
);
