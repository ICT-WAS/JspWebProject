import pandas as pd
import glob
import os

import plotly.graph_objects as go


def get_counts(counts_list, _keyword):
    file_pattern = f'./{_keyword}/crawling/{_keyword}.*.*.csv'

    # 파일 리스트 가져오기
    file_list = glob.glob(file_pattern)

    for file in file_list:
        # 파일 이름에서 월을 추출
        file_name = file.split('/')[-1]  # 경로 제거
        month = int(file_name.split('.')[-2])  # '2023.01.csv' -> 1
        year = int(file_name.split('.')[-3]) # '2023.01.csv' -> 2023

        # CSV 파일 읽기
        df = pd.read_csv(file)

        # 행 수 계산
        row_count = len(df)

        counts_list[(month - 1) + ((year - start_year) * 12)] = row_count



# 시작과 끝 년도 및 월
start_year, start_month = 2023, 1
end_year, end_month = 2024, 6

# 결과 리스트 생성
months = [f"{year}/{month:02}"
             for year in range(start_year, end_year + 1)
             for month in range(1, 13)
             if (year > start_year or month >= start_month) and (year < end_year or month <= end_month)]

counts = dict()

# Base Figure 생성
fig = go.Figure()

# 마약 차트 추가
drugs = [0] * len(months)
keyword = '마약'
get_counts(drugs, keyword)
fig.add_trace(go.Scatter(x=months, y=drugs,
                    mode='lines+markers',
                    name=keyword))

# 방화 차트 추가
arson = [0] * len(months)
keyword = '방화'
get_counts(arson, keyword)
fig.add_trace(go.Scatter(x=months, y=arson,
                    mode='lines+markers',
                    name=keyword))

# 보이스피싱 차트 추가
voice_fishing = [0] * len(months)
keyword = '보이스피싱'
get_counts(voice_fishing, keyword)
fig.add_trace(go.Scatter(x=months, y=voice_fishing,
                    mode='lines+markers',
                    name=keyword))

# 전세사기 차트 추가
jeonse_fraud = [0] * len(months)
keyword = '전세사기'
get_counts(jeonse_fraud, keyword)
fig.add_trace(go.Scatter(x=months, y=jeonse_fraud,
                    mode='lines+markers',
                    name=keyword))

# 횡령 차트 추가
embezzlement = [0] * len(months)
keyword = '횡령'
get_counts(embezzlement, keyword)
fig.add_trace(go.Scatter(x=months, y=embezzlement,
                    mode='lines+markers',
                    name=keyword))

# 제목 추가
fig.update_layout(
    title='범죄 기사 추세',  # 원하는 제목으로 변경
    xaxis_title='시기',        # x축 제목
    yaxis_title='건수',    # y축 제목
    legend_title='범죄 유형', # 범례 제목
    width=1000,              # 차트의 너비 (픽셀 단위)
    height=400              # 차트의 높이 (픽셀 단위)
)

# fig.show()

# HTML 파일로 저장
html_str = fig.to_html(full_html=False)

path_to_save = os.path.join('../static/html/', 'monthly_graph.html')

begin_text = '''
<div width="1000" height="500">
'''

end_text = '''
</div>
'''

# HTML 문자열을 파일로 저장 (이 예제에서는 파일로 저장)
with open(path_to_save, 'w', encoding='utf-8') as f:
    f.write(html_str)
