-- cleaning Data in SQL Queries
select * from nashvillehousing
ALTER TABLE nashvillehousing
ALTER COLUMN SoldAsVacant varchar(25);

-- Populate Property Address data
select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.propertyaddress, b.PropertyAddress)
from NashvilleHousing a
join NashvilleHousing b
on a.ParcelID = b.ParcelID and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

update a 
set PropertyAddress = ISNULL(a.propertyaddress, b.PropertyAddress)
from NashvilleHousing a
join NashvilleHousing b
on a.ParcelID = b.ParcelID and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

-- Breaking out Address into Individual Columns (Address, City, State) using substring
select PropertyAddress
from NashvilleHousing

	select SUBSTRING(PropertyAddress, 1, charindex(',', PropertyAddress) -1) as Address
	, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, len(PropertyAddress)) as Address
	from nashvillehousing

alter table nashvillehousing
add PropertySplitAddress Nvarchar(255);

update NashvilleHousing
set PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1)

alter table nashvillehousing
add PropertySplitCity Nvarchar(255);

update NashvilleHousing
set PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress))

--Populating Owner Address using PRSENAME

select 
PARSENAME(replace(OwnerAddress, ',','.'),3) ,
PARSENAME(replace(OwnerAddress, ',','.'),2) ,
PARSENAME(replace(OwnerAddress, ',','.'),1) 

from NashvilleHousing

alter table nashvillehousing
add OwnerSplitAddress Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitAddress = PARSENAME(replace(OwnerAddress, ',','.'),3)

alter table nashvillehousing
add OwnerSplitCity Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitCity = PARSENAME(replace(OwnerAddress, ',','.'),3)

alter table nashvillehousing
add OwnerSplitState Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitState = PARSENAME(replace(OwnerAddress, ',','.'),3)

--Change 1 and 0 to Yes and No in "Sold as Vacant" Field
select distinct(SoldAsVacant), COUNT(SoldAsVacant)
from NashvilleHousing
group by SoldAsVacant
order by 2

select SoldAsVacant, Case when SoldAsVacant = '1' then 'Yes'
						  when SoldAsVacant = '0' then 'No'
						  else SoldAsVacant
						  End
from NashvilleHousing

update NashvilleHousing
set SoldAsVacant = Case when SoldAsVacant = '1' then 'Yes'
						  when SoldAsVacant = '0' then 'No'
						  else SoldAsVacant
						  End

-- Remove Duplicates
With RowNumCTE AS(

	select *, ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
				  UniqueID ) row_num
	from NashvilleHousing )
	delete
	from RowNumCTE where row_num > 1

-- Deleting Unused Columns
	alter table nashvillehousing
	drop column OwnerAddress, TaxDistrict, PropertyAddress


	select propertysplitaddress
	from NashvilleHousing