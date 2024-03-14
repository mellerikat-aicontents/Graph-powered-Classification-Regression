# Welcome to GCR !

⚡ Graph Classification Regression(GCR)는 정형 데이터를 그래프로 변환하여 추출한 임베딩을 활용하여 분류/회귀 솔루션에 적용할 수 있는 컨텐츠입니다.⚡

[![Generic badge](https://img.shields.io/badge/release-v2.0.0-green.svg?style=for-the-badge)](http://링크)
[![Generic badge](https://img.shields.io/badge/last_update-2023.10.16-002E5F?style=for-the-badge)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Generic badge](https://img.shields.io/badge/python-3.10.12-purple.svg?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Generic badge](https://img.shields.io/badge/dependencies-up_to_date-green.svg?style=for-the-badge&logo=python&logoColor=white)](requirement링크)
[![Generic badge](https://img.shields.io/badge/collab-blue.svg?style=for-the-badge)](http://collab.lge.com/main/display/AICONTENTS)
[![Generic badge](https://img.shields.io/badge/request_clm-green.svg?style=for-the-badge)](http://collab.lge.com/main/pages/viewpage.action?pageId=2157128981)


## 데이터 준비
1. Train, Inference 두 개의 데이터셋을 준비합니다.


데이터 준비를 위한 상세한 내용은 [User Guide](http://collab.lge.com/main/pages/viewpage.action?pageId=2184972859#UserGuide(GCR)-|GCR%EC%9A%A9%EB%8D%B0%EC%9D%B4%ED%84%B0%EC%A4%80%EB%B9%84)를 참고해주세요.

샘플 데이터: [Customer 샘플](http://collab.lge.com/main/pages/viewpage.action?pageId=2184972864)
 


## 주요 기능 소개
- GCR은 거대 그래프 학습을 목적으로 FaceBook에서 개발한 pytorch-BigGraph를 기반으로 만들었습니다.
- Graph Partitioning을 활용하여 적은 리소스로도 그래프 학습이 가능합니다.
- GCR은 결측치에 강인하여 별도의 전처리 없이 model 학습이 가능합니다.
- GCR의 downstream task model은 Optuna를 이용해 HPO를 빠르게 진행합니다.
- Inductive graph embedding의 적용을 통해 graph embedding 기반이면서도 일반적인 machine learning model과 동일하게 inference 시 classification/regression 모델의 재학습이 필요 없습니다.
- GCR은 global 및 local Graph XAI를 제공합니다.

상세한 설명은 [documentation](http://collab.lge.com/main/pages/viewpage.action?pageId=2184972902)을 참고해주세요. 

## Quick Install Guide

+ ***먼저 ALO를 설치합니다.***    
<br />

이 때, 사용할 GCR version에 맞는 ALO version 설치가 필요합니다.   
GCR 2.1.0을 사용하기 위해서는 ALO version 2.3를 설치합니다.   
<br />

작업 directory를 준비합니다 (여기에서는 예를 들어 aisolution_gcr_2.1.0이라는 directory를 생성합니다).   
<br />

\$ mkdir aisolution_gcr_2.1.0   
\$ cd aisolution_gcr_2.1.0   
<br />

AI solution name (예를 들어 gcr_solution)으로 ALO를 설치합니다.   
이러면 gcr_solution이라는 directory가 생기고 그 안에 GCR을 설치하게 됩니다 (GCR 기반 AI solution 작업도 그곳에서 진행합니다).
<br />

\$ git clone http://mod.lge.com/hub/dxadvtech/aicontents-framework/alo.git -b v2.3.0 gcr_solution   
\$ cd gcr_solution   
<br />

AI solution 개발을 위한 가상환경을 만들어 줍니다 (예를 들어 gcr_solution을 가상환경 이름으로 사용).   
이미 어떤 가상환경에 진입한 상태라면, conda deactivate를 수행해 해당 환경에서 빠져나간 뒤 수행해 주십시오.   
<br />

\$ conda create -n gcr_solution python=3.10  => 3.10 필수   
\$ conda init bash   
\$ source ~/.bashrc => 이 명령은 아래 conda activate gcr_solution을 바로 수행했을 때 동작하지 않는 경우에만 수행해 주십시오.   
\$ conda activate gcr_solution   
\$ pip install -r requirements.txt   
<br />

+ ***ALO 설치가 완료되었으면, GCR 2.1.0을 설치합니다.***   
<br />

\$ git clone http://mod.lge.com/hub/dxadvtech/aicontents/gcr.git solution   
<br />

GCR version 2.1.0이 올바로 설치되었는지 확인합니다.   
<br />

\$ cd solution   
\$ git status => 결과가 'On branch release-2.1.0'이 맞는 지 확인합니다.   
<br />

만일 다른 version이 설치되었다면, release-2.1.0을 다시 설치합니다.   
<br />

\$ cd ..   
\$ \rm -rf solution   
\$ git clone -b release-2.1.0 --single-branch http://mod.lge.com/hub/dxadvtech/aicontents/gcr.git solution   
<br />

Default로 제공되는 sample data 대신 다른 data를 이용하려면 아래와 같이 experimental_plan.yaml을 수정합니다.   
<br />

\$ vi aisolution_gcr_2.1.0/gcr_solution/solution/experimental_plan.yaml   
<br />

external_path의 load_train_data_path에 아래와 같이 사용할 데이터의 경로(디렉토리)를 입력합니다.   
<br />

>```   
>external_path:   
>    - load_train_data_path: /nas001/gcr_test_data/sample/   
>    - load_inference_data_path:   
>    - save_train_artifacts_path:   
>    - save_inference_artifacts_path:   
>```   
<br />

또한 GCR의 동작 설정 변경을 원할 경우에도 experimental_plan.yaml 내의 필수 변경 parameter를 변경합니다. 나머지 parameter는 컨텐츠 yaml에 제공된 default 값을 사용해도 괜찮습니다.   
<br />

+ ***Sample Jupyter notebook인 'GCR_asset_run_template.ipynb'을 수행하기 위해, ipykernel을 설치해 줍니다.***   
<br />

\$ pip install ipykernel   
\$ python -m ipykernel install --user --name gcr_solution   
<br />


## Quick Run Guide

이상과 같이 설치한 ALO와 GCR AI content를 main.py를 이용해 batch running합니다.   
여기서 주어진 문제를 위해 input과 output asset들이 customized되어 있다면 이것이 곧 GCR 기반의 AI solution입니다.     
<br />

\$ cd aisolution_gcr_2.1.0/gcr_solution   
\$ python main.py                    -> train/inference pipeline 일괄 수행   
\$ python main.py --mode train       -> train pipeline 수행    
\$ python main.py --mode inference   -> inference pipeline 수행   
<br />


***NOTE!***
만일 python main.py 결과, pip의 wheel 문제로 아래와 같은 에러가 발생한다면, \rm -rf ~/.cache/pip 를 수행해 cached된 wheel 정보를 지우고 다시 python main.py를 수행하면 되니 참고 부탁 드립니다.

```
Collecting nvidia-cusolver-cu11==11.4.0.1 (from torch==2.0.0)
  Using cached nvidia_cusolver_cu11-11.4.0.1-2-py3-none-manylinux1_x86_64.whl (102.6 MB)
ERROR: THESE PACKAGES DO NOT MATCH THE HASHES FROM THE REQUIREMENTS FILE. If you have updated the package versions, pleaseupdate the hashes. Otherwise, examine the package contents carefully; someone may have tampered with them.
    nvidia-cusolver-cu11==11.4.0.1 from https://files.pythonhosted.org/packages/3e/77/66149e3153b19312fb782ea367f3f950123b93916a45538b573fe373570a/nvidia_cusolver_cu11-11.4.0.1-2-py3-none-manylinux1_x86_64.whl (from torch==2.0.0):
        Expected sha256 72fa7261d755ed55c0074960df5904b65e2326f7adce364cbe4945063c1be412
             Got        4488c7e6c8b220045a92e1ca98441adf84bfa8bc7a8a2d38e0498700a94a4a70
```
<br />


- GCR 구동을 위해서는 분석 데이터에 대한 정보 및 사용할 GCR 기능이 기록된 yaml파일이 필요합니다.  
- GCR default yaml파일인 `experimental_plan.yaml`의 argument를 변경하여 분석하고 싶은 데이터에 GCR을 적용할 수 있습니다.
- 필수적으로 수정해야하는 ***arguments***는 아래와 같습니다. 
***
external_path:  
&emsp;- *load_train_data_path*: ***./solution/sample_data/train***    # train 데이터가 들어있는 폴더 경로

&emsp;- *load_inference_data_path*: ***./solution/sample_data/test***    # inference 데이터가 들어있는 폴더 경로

user_parameters:  

&emsp;- train_pipeline:  

&emsp;&emsp;- step: input 

&emsp;&emsp;&emsp;args: 

&emsp;&emsp;&emsp;- *input_path*: ***train***    # 학습 데이터가 들어있는 폴더

&emsp;&emsp;&emsp;&ensp;*use_all_x*: ***True***              # 분석 데이터의 X컬럼은 전부 사용

&emsp;&emsp;&emsp;&ensp;*y_column*: ***target***         # 분석 데이터의 Y컬럼(Label) 명 예시

&emsp;&emsp;&emsp;&ensp;...  

***
- Graph 구조 선택, 학습 param 설정 및 GCR asset의 다양한 기능을 사용하고 싶으신 경우 [User Guide (GCR)](http://collab.lge.com/main/pages/viewpage.action?pageId=2178788969)를 참고하여 yaml파일을 수정하시면 됩니다. 



## Sample notebook
Jupyter 환경에서 Workflow 단계마다 asset을 실행하고 setting을 바꿔 실험할 수 있습니다. [Sample notebook](http://mod.lge.com/hub/dxadvtech/aicontents/gcr/-/blob/release-2.0.0/GCR_asset_run_template.ipynb)

## 관련 Collab
[AICONTENTS](http://collab.lge.com/main/display/AICONTENTS)

## 요청 및 문의
담당자: 공성우 선임 (seongwoo.kong@lge.com), 김정원 연구원 (jw0220.kim@lge.com), 김수경 책임 (sookyoung.kim@lge.com)

신규 AI Contents나 추가 기능 요청을 등록하시면 검토 후 반영합니다  
[Request CLM](http://clm.lge.com/issue/projects/DXADVTECH/)


