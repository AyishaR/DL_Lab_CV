# assuming you are in the root of the repository
# create data folder
mkdir data

# download and extract dataset into the data folder
wget http://host.robots.ox.ac.uk/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar
tar -xf VOCtrainval_11-May-2012.tar -C data

# copy the captions into the data folder
cp -r datasets/Captions data/VOCdevkit/VOC2012

# download the DINO checkpoint for the segmentation task
mkdir ckpt
wget https://dl.fbaipublicfiles.com/dino/dino_deitsmall16_pretrain/dino_deitsmall16_pretrain.pth -P ckpt

# download the original BLIP checkpoint for the image-text tasks
wget https://storage.googleapis.com/sfr-vision-language-research/BLIP/models/model_base_capfilt_large.pth

# run the postprocessing script, this should create ckpt/blip_model_base.pth
python postprocess_ckpt.py

# optionally remove the downloaded files
rm VOCtrainval_11-May-2012.tar
rm model_base_capfilt_large.pth