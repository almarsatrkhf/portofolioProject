
--select * from SQLPortProject..NashvilleHousing

-- Standardize Date Format
select *
from SQLPortProject..NashvilleHousing

update NashvilleHousing
set SaleDate = CONVERT(date,saledate)

alter table NashvilleHousing
add saleDateNewer date;

update NashvilleHousing
set saleDateNew = CONVERT(date,saledate)

alter table NashvilleHousing
drop column SaleDate;

-- Populate data
select PropertyAddress, ParcelID
from SQLPortProject..NashvilleHousing
order by ParcelID

select a.ParcelID ,a.PropertyAddress, b.ParcelID ,b.PropertyAddress, isnull(a.propertyaddress,b.PropertyAddress)
from SQLPortProject..NashvilleHousing a
join SQLPortProject..NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ]<> b.[UniqueID ]


update  a
set PropertyAddress = isnull(a.propertyaddress,b.PropertyAddress)
from SQLPortProject..NashvilleHousing a
join SQLPortProject..NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ]<> b.[UniqueID ]


-- breaking data to individual column
select PropertyAddress
from SQLPortProject..NashvilleHousing

select
SUBSTRING(propertyaddress,1,CHARINDEX(',',PropertyAddress)-1) as Address
, SUBSTRING(propertyaddress,CHARINDEX(',',PropertyAddress)+1, len(propertyaddress)) as Address
from SQLPortProject..NashvilleHousing

alter table NashvilleHousing
add propertyAddressSplit varchar(255);

update NashvilleHousing
set propertyAddressSplit = SUBSTRING(propertyaddress,1,CHARINDEX(',',PropertyAddress)-1) 

alter table NashvilleHousing
add propertyCity varchar(255);

update NashvilleHousing
set propertyCity = SUBSTRING(propertyaddress,CHARINDEX(',',PropertyAddress)+1, len(propertyaddress)) 

select *
from SQLPortProject..NashvilleHousing

select OwnerAddress
from SQLPortProject..NashvilleHousing

select 
PARSENAME(replace(OwnerAddress,',','.'),3),
PARSENAME(replace(OwnerAddress,',','.'),2),
PARSENAME(replace(OwnerAddress,',','.'),1)
from SQLPortProject..NashvilleHousing


alter table NashvilleHousing
add OwnerAddressNew varchar(255);

update NashvilleHousing
set OwnerAddressNew = PARSENAME(replace(OwnerAddress,',','.'),3) 


alter table NashvilleHousing
add OwnerCity varchar(255);

update NashvilleHousing
set OwnerCity = PARSENAME(replace(OwnerAddress,',','.'),2)

alter table NashvilleHousing
add OwnerStateAddress varchar(255);

update NashvilleHousing
set OwnerStateAddress = PARSENAME(replace(OwnerAddress,',','.'),1)

alter table NashvilleHousing
drop column Owner;


select *
from SQLPortProject..NashvilleHousing
-- change Y and N
select distinct(soldasvacant), count(soldasvacant)
from SQLPortProject..NashvilleHousing
group by SoldAsVacant
order by 2

select SoldAsVacant,
case when SoldAsVacant = 'Y' then 'Yes'
	 when SoldAsVacant = 'N' then 'No'
	 else SoldAsVacant
	 end
from SQLPortProject..NashvilleHousing

update NashvilleHousing
set SoldAsVacant = case when SoldAsVacant = 'Y' then 'Yes'
	 when SoldAsVacant = 'N' then 'No'
	 else SoldAsVacant
	 end
-- Remove Duplicates


-- Delete Unused Columns
