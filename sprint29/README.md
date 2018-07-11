# SQL-exercise
Schemas, Questions &amp; Solutions for SQL Exercising

SQLのトレーニング(SQLite)

## Introduction
The schemas and questions are

[1] from Wikibook **SQL Exercises** [https://en.wikibooks.org/wiki/SQL_Exercises]. Solutions are from both this Wikibook and me (exercise 1-8). I also added some questions by myself.

or

[2] given by me using some practical examples I encountered (exercise 9-10).

## Repository Structure
The repo structure is like below:
```
SQL-exercise
└───SQL_exercise_1
└───......
└───SQL_exercise_*
    │   *_schema_figure.png
    │   *_build_schema.sql
    │   *_questions_and_solutions.sql

└───......

```

## Getting Started

たとえば、exercise_01を行う場合

```commandline
cd SQL_exercise_01
sqlite3
```

フォルダに移動して、sqlite3コマンドを実行します。(インタプリタモード)
その後、`.read`コマンドを使用して、テーブル作成とデータ挿入を行います。


```commandline
.read 1_build_schema.sql
```

## License
Please note this repostory is under the Creative Commons Attribution-ShareAlike License[https://creativecommons.org/licenses/by-sa/3.0/].
