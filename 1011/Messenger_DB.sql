create table `users`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` varchar(20) not null,
    `user_password` varchar(25) not null,
    `user_nic` varchar(10) not null,
    `profile_phto_link` varchar(100) not null,
    `profile_status_message` varchar(100) not null,
    `withdrawal` tinyint(1) DEFAULT 0,
    `join_date` int(8) not null,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `channels`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `channel_name` varchar(20) not null,
    `channel_creater` int not null,
    `channel_link` varchar(100) not null,
    `max_cap` int(4) not null,
    `withdrawal` tinyint(1) DEFAULT 0,
    `create_date` int(8) not null,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`channel_creater`)
    REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `chats`(
    `chat_contents` varchar not null,
    `chat_writer` int not null,
    `chat_channel` int not null,
    `chat_create_date` int(8) not null,
    FOREIGN KEY (`chat_writer`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`chat_channel`)
    REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `follows`(
    `follower` int not null,
    `followee` int not null,
    `follow_date` int(8) not null,
    FOREIGN KEY (`follower`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee`)
    REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `blocks`(
    `blocking_users`int not null,
    `blocked_users` int not null,
    `block_date` int(8) not null,
    FOREIGN KEY (`blocking_users`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked_users`)
    REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


