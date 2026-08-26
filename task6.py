# -- 6 Задание. Python
# -- дан df содержащий количество авторизаций сотрудников по неделям.
# -- необходимо посчитать количество авторизаций по каждому сотруднику за каждую неделю и суммарное количество с начала периода.
# -- результат отразить в полях cnt и sum
# df = pd.DataFrame({'w':[1,1,2,2,2,3,3,3,4,4,4],
#                    'user':['User2', 'User3','User1','User1','User2','User2','User2','User3','User1','User1','User3'],
#                    'c':[7,2,3,1,2,5,4,6,9,8,7]})

# поле c считать за cnt

import pandas as pd
import itertools

df = pd.DataFrame({
    'w': [1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4],
    'user': ['User2', 'User3', 'User1', 'User1', 'User2', 'User2', 'User2', 'User3', 'User1', 'User1', 'User3'],
    'c': [7, 2, 3, 1, 2, 5, 4, 6, 9, 8, 7]
})

# Убираем дубли юзеров в одной неделе
agg_df = df.groupby(['w', 'user'])['c'].sum().reset_index(name='c')

weeks = df['w'].unique()
users = df['user'].unique()

# Составляем комбинации (номер недели - пользователь)
grid = pd.DataFrame(
    list(
        itertools.product(weeks, users)
    ), columns = ['w', 'user']
)

# merge (LEFT JOIN) все записи из grid остаются, присоединяем agg_df
# в котором уже подсчитаны часы каждого юзера за неделю
# пустые значения заполняем 0 (int)
result = grid.merge(agg_df, on=['w', 'user'], how='left')
result['c'] = result['c'].fillna(0).astype(int)

# для удобства просмотра сортируем по юзерам
result = result.sort_values(by=['w', 'user']).reset_index(drop=True)

# подсчитаем нарастающий итог
result['sum'] = result.groupby('user')['c'].cumsum()

print(result)