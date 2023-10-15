# Welcome to GCR !

⚡ Graph Classification Regression(GCR)는 정형 데이터를 그래프로 변환하여 추출한 임베딩을 활용하여 분류/회귀 솔루션에 적용할 수 있는 컨텐츠입니다.⚡

[![Generic badge](https://img.shields.io/badge/release-v1.0.0-green.svg?style=for-the-badge)](http://링크)
[![Generic badge](https://img.shields.io/badge/last_update-2023.10.16-002E5F?style=for-the-badge)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Generic badge](https://img.shields.io/badge/python-3.10.12-purple.svg?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Generic badge](https://img.shields.io/badge/dependencies-up_to_date-green.svg?style=for-the-badge&logo=python&logoColor=white)](requirement링크)
[![Generic badge](https://img.shields.io/badge/collab-blue.svg?style=for-the-badge)](http://collab.lge.com/main/display/AICONTENTS)
[![Generic badge](https://img.shields.io/badge/request_clm-green.svg?style=for-the-badge)](http://collab.lge.com/main/pages/viewpage.action?pageId=2157128981)


## 데이터 준비
1. Train, Inference 두 개의 데이터셋을 준비합니다.
2. 각 데이터에 FLAG_TRAIN_INFERENCE 컬럼을 추가합니다.
   - 각각 'Train', 'Inference'가 flag로 들어가야 합니다.
3. 두 데이터를 합쳐 하나의 데이터셋으로 구성합니다.


데이터 준비를 위한 상세한 내용은 [User Guide](http://collab.lge.com/main/pages/viewpage.action?pageId=2184972859#UserGuide(GCR)-|GCR%EC%9A%A9%EB%8D%B0%EC%9D%B4%ED%84%B0%EC%A4%80%EB%B9%84)를 참고해주세요.

샘플 데이터: [Customer 샘플 데이터](https://www.slingacademy.com/article/customers-sample-data-csv-json-xml-and-xlsx/#customerscsv)
샘플 데이터 예시: [예시](http://collab.lge.com/main/pages/viewpage.action?pageId=2184972864)
 


## 주요 기능 소개
- GCR은 거대 그래프 학습을 목적으로 FaceBook에서 개발한 pytorch-BigGraph를 기반으로 만들었습니다.
- Graph Partitioning을 활용하여 적은 리소스로도 그래프 학습이 가능합니다.
- GCR은 결측치에 강인하여 별도의 전처리 없이 model 학습이 가능합니다.
- TCR의 HPO를 활용하여 높은 성능을 확보할 수 있는 모델을 찾습니다.

상세한 설명은 [documentation](http://collab.lge.com/main/pages/viewpage.action?pageId=2184972902)을 참고해주세요. 

## Quick Install Guide


```
git clone http://mod.lge.com/hub/dxadvtech/aicontents/gcr.git 
cd gcr 

conda create -n gcr python=3.10
conda activate gcr 

#jupyter 사용시 ipykernel 추가 필요
#pip install ipykernel
#python -m ipykernel install --user --name gcr 

source install.sh

```

## Quick Run Guide
- 아래 코드 블럭의 `{config_path}`에 원하는 설정 파일을 지정하여 실행하면 됩니다. default: `experimental_plan.yaml`
```
cd alo
python main.py --config {config_path}
```
- GCR 구동을 위해서는 분석 데이터에 대한 정보 및 사용할 GCR 기능이 기록된 yaml파일이 필요합니다.  
- GCR default yaml파일인 `experimental_plan.yaml`의 argument를 변경하여 데이터에 GCR을 적용할 수 있습니다.
- 필수적으로 수정해야하는 ***arguments***는 아래와 같습니다. 
***
external_path:  
&emsp;- *load_train_data_path*: ***~/example/train_data_folder/***  # 학습 데이터가 들어있는 폴더 경로 입력(csv 입력 X) 
user_parameters:  
&emsp;- train_pipeline:  
&emsp;&emsp;- step: input  
&emsp;&emsp;&emsp;args:  
&emsp;&emsp;&emsp;- *input_path*: ***train_data_folder***  # 학습 데이터가 들어있는 폴더  
&emsp;&emsp;&emsp;&ensp;*x_columns*: ***[column1,column2]***  # 분석 데이터의 X컬럼 명  
&emsp;&emsp;&emsp;&ensp;*y_column*: ***label***  # 분석 데이터의 Y컬럼 명  
&emsp;&emsp;&emsp;&ensp;...  

***
- Graph 구조 선택, 학습 param 설정 및 Sampling, TCR asset의 다양한 기능을 사용하고 싶으신 경우 [User Guide (GCR)](http://collab.lge.com/main/pages/viewpage.action?pageId=2178788969)를 참고하여 yaml파일을 수정하시면 됩니다. 
- 임베딩 결과 파일 저장 경로: `alo/.train_artifacts/output/graph/`
- 추론 결과 파일 저장 경로: `alo/.inference_artifacts/output/result/`



## Sample notebook
Jupyter 환경에서 Workflow 단계마다 asset을 실행하고 setting을 바꿔 실험할 수 있습니다. [Sample notebook](http://mod.lge.com/hub/dxadvtech/aicontents/gcr/-/blob/main/GCR_asset_run_template.ipynb)

## 관련 Collab
[AICONTENTS](http://collab.lge.com/main/display/AICONTENTS)

## 요청 및 문의
담당자: seongwoo.kong@lge.com  
신규 AI Contents나 추가 기능 요청을 등록하시면 검토 후 반영합니다  
[Request CLM](http://clm.lge.com/issue/projects/AICONTENTS/summary)


