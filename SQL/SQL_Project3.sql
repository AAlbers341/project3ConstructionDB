-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Shapes" (
    "ShapeID" int   NOT NULL,
    "Shape" varchar(255)   NOT NULL,
    "Description" varchar(1024)   NOT NULL,
    "DimensionTabIndex" int   NOT NULL,
    "PriceFormat" varchar(50)   NOT NULL,
    "PriceFormatDisplay" varchar(255)   NOT NULL,
    "WeightFormat" varchar(50)   NOT NULL,
    "SurfaceAreaFormat" varchar(50)   NOT NULL,
    "PropertyFormat" varchar(50)   NOT NULL,
    "MaterialGroupID" int   NOT NULL,
    "StandardClip" boolean   NOT NULL,
    "Combining" boolean   NOT NULL,
    "PDCPieceMarkRequired" boolean   NOT NULL,
    "ShowShape" boolean   NOT NULL,
    "ERPDesignation" varchar(255)   NOT NULL,
    "ExcludeFromInstanceTracking" boolean   NOT NULL,
    "AllowSplit" boolean   NOT NULL,
    "CostCodeID" int   NOT NULL,
    "CostTypeID" int   NOT NULL,
    CONSTRAINT "pk_Shapes" PRIMARY KEY (
        "ShapeID"
     )
);

CREATE TABLE "Sizes" (
    "SizeID" int   NOT NULL,
    "ShapeID" int   NOT NULL,
    "DimDepth" decimal(18,9)   NOT NULL,
    "DimDepthImperial" decimal(18,9)   NOT NULL,
    "DimDepthMetric" decimal(18,9)   NOT NULL,
    "DimWidth" decimal(18,9)   NOT NULL,
    "DimWidthImperial" decimal(18,9)   NOT NULL,
    "DimWidthMetric" decimal(18,9)   NOT NULL,
    "DimWeight" decimal(18,9)   NOT NULL,
    "DimWeightImperial" decimal(18,9)   NOT NULL,
    "DimWeightMetric" decimal(18,9)   NOT NULL,
    "DimThickness" decimal(18,9)   NOT NULL,
    "DimThicknessImperial" decimal(18,9)   NOT NULL,
    "DimThicknessMetric" decimal(18,9)   NOT NULL,
    "DimGage" varchar(255)   NOT NULL,
    "DimGageImperial" varchar(255)   NOT NULL,
    "DimGageMetric" varchar(255)   NOT NULL,
    "DimDiameter" decimal(18,9)   NOT NULL,
    "DimDiameterImperial" decimal(18,9)   NOT NULL,
    "DimDiameterMetric" decimal(18,9)   NOT NULL,
    "DimComment" varchar(1024)   NOT NULL,
    "SizeUnits" varchar(50)   NOT NULL,
    "BaseWeight" decimal(18,9)   NOT NULL,
    "UnitWeight" decimal(18,9)   NOT NULL,
    "XSectionalArea" decimal(18,9)   NOT NULL,
    "Depth" decimal(18,9)   NOT NULL,
    "FlangeWidth" decimal(18,9)   NOT NULL,
    "FlangeThickness" decimal(18,9)   NOT NULL,
    "WebThickness" decimal(18,9)   NOT NULL,
    "KDistance" decimal(18,9)   NOT NULL,
    "AdjustedK" decimal(18,9)   NOT NULL,
    "UsualGage" varchar(255)   NOT NULL,
    "SecondaryGage" varchar(255)   NOT NULL,
    "AxisXXS" decimal(18,9)   NOT NULL,
    "InsideDiameter" decimal(18,9)   NOT NULL,
    "OutsideDiameter" decimal(18,9)   NOT NULL,
    "WallThickness" decimal(18,9)   NOT NULL,
    "CalcRevaluation" boolean   NOT NULL,
    "RevaluationLength1" decimal(18,9)   NOT NULL,
    "RevaluationLength2" decimal(18,9)   NOT NULL,
    "RevaluationLength3" decimal(18,9)   NOT NULL,
    "RevaluationPrice1" decimal(18,9)   NOT NULL,
    "RevaluationPrice2" decimal(18,9)   NOT NULL,
    "RevaluationPrice3" decimal(18,9)   NOT NULL,
    "ChargeLength" decimal(18,9)   NOT NULL,
    "CalcScrap" boolean   NOT NULL,
    "ScrapWidth" decimal(18,9)   NOT NULL,
    "ScrapLength" decimal(18,9)   NOT NULL,
    "ScrapPrice" decimal(18,9)   NOT NULL,
    "Kerf" decimal(18,9)   NOT NULL,
    "KerfRipCut" decimal(18,9)   NOT NULL,
    "KerfCrossCut" decimal(18,9)   NOT NULL,
    "KerfInternalCut" decimal(18,9)   NOT NULL,
    "TrimLeadingWidth" decimal(18,9)   NOT NULL,
    "TrimLeadingLength" decimal(18,9)   NOT NULL,
    "TrimTrailingWidth" decimal(18,9)   NOT NULL,
    "TrimTrailingLength" decimal(18,9)   NOT NULL,
    "ClampAllowanceFromPart" decimal(18,9)   NOT NULL,
    "ValidCombiningScrapPercentage" decimal(18,9)   NOT NULL,
    "FirstCutCost" decimal(18,9)   NOT NULL,
    "FirstCutCharge" decimal(18,9)   NOT NULL,
    "AdditionalCutCost" decimal(18,9)   NOT NULL,
    "AdditionalCutCharge" decimal(18,9)   NOT NULL,
    "DimensionSizesImperial" varchar(255)   NOT NULL,
    "DimensionSizesImperial_Reverse" varchar(255)   NOT NULL,
    "DimensionSizesImperial_EDI" varchar(255)   NOT NULL,
    "DimensionSizesMetric" varchar(255)   NOT NULL,
    "DimensionSizesMetric_Reverse" varchar(255)   NOT NULL,
    "DimensionSizesMetric_EDI" varchar(255)   NOT NULL,
    "Dim1Imperial" decimal(18,9)   NOT NULL,
    "Dim1Metric" decimal(18,9)   NOT NULL,
    "Dim1SortValue" decimal(18,9)   NOT NULL,
    "Dim2Imperial" decimal(18,9)   NOT NULL,
    "Dim2Metric" decimal(18,9)   NOT NULL,
    "Dim2SortValue" decimal(18,9)   NOT NULL,
    "Dim3Imperial" decimal(18,9)   NOT NULL,
    "Dim3Metric" decimal(18,9)   NOT NULL,
    "Dim3SortValue" decimal(18,9)   NOT NULL,
    "Dim4Imperial" decimal(18,9)   NOT NULL,
    "Dim4Metric" decimal(18,9)   NOT NULL,
    "Dim4SortValue" decimal(18,9)   NOT NULL,
    "Dim5Imperial" decimal(18,9)   NOT NULL,
    "Dim5Metric" decimal(18,9)   NOT NULL,
    "Dim5SortValue" decimal(18,9)   NOT NULL,
    "Dim6Imperial" decimal(18,9)   NOT NULL,
    "Dim6Metric" decimal(18,9)   NOT NULL,
    "Dim6SortValue" decimal(18,9)   NOT NULL,
    "SortOrder" int   NOT NULL,
    "SortOrder_Reverse" int   NOT NULL,
    "ProNestDesignation" varchar(255)   NOT NULL,
    "SigmaNestDesignation" varchar(255)   NOT NULL,
    "ERPDesignation" char(1)   NOT NULL,
    CONSTRAINT "pk_Sizes" PRIMARY KEY (
        "SizeID"
     )
);

CREATE TABLE "Grades" (
    "GradeID" int   NOT NULL,
    "ShapeID" int   NOT NULL,
    "Grade" varchar(255)   NOT NULL,
    "DefaultGrade" boolean   NOT NULL,
    "WeightMultiplier" decimal(10,2)   NOT NULL,
    "ProNestDesignation" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Grades" PRIMARY KEY (
        "GradeID"
     )
);

CREATE TABLE "LaborRates" (
    "LaborRateID" int   NOT NULL,
    "Description" varchar(1024)   NOT NULL,
    "LaborRateCurrencyID" int   NOT NULL,
    "LaborRate" decimal(10,2)   NOT NULL,
    "SpecialMeaning" varchar(255)   NOT NULL,
    "CostCodeID" int   NOT NULL,
    "CostTypeID" int   NOT NULL,
    CONSTRAINT "pk_LaborRates" PRIMARY KEY (
        "LaborRateID"
     )
);

CREATE TABLE "LaborGroups" (
    "LaborGroupID" int   NOT NULL,
    "Number" int   NOT NULL,
    "Description" varchar(1024)   NOT NULL,
    "LaborRateID" int   NOT NULL,
    "Activity" varchar(255)   NOT NULL,
    CONSTRAINT "pk_LaborGroups" PRIMARY KEY (
        "LaborGroupID"
     )
);

CREATE TABLE "Estimates" (
    "EstimateID" int   NOT NULL,
    "Estimator" varchar(255)   NOT NULL,
    "BidDate" date   NOT NULL,
    "JobNumber" varchar(255)   NOT NULL,
    "JobName" varchar(255)   NOT NULL,
    "Location" varchar(255)   NOT NULL,
    "JobStatusID" int   NOT NULL,
    "DistanceToJob" decimal(10,2)   NOT NULL,
    "ShopDrawingCostCurrencyID" int   NOT NULL,
    "GalvanizingCostPerKilogramCurrencyID" int   NOT NULL,
    "GalvanizingMinimumCostCurrencyID" int   NOT NULL,
    "GalvanizingFreightCostCurrencyID" int   NOT NULL,
    "GalvanizingLaborCostCurrencyID" int   NOT NULL,
    "ShopDrawingCost" decimal(10,2)   NOT NULL,
    "GalvanizingCostPerKilogram" decimal(10,2)   NOT NULL,
    "GalvanizingMinimumCost" decimal(10,2)   NOT NULL,
    "GalvanizingTruckWeight" decimal(10,2)   NOT NULL,
    "GalvanizingFreightCost" decimal(10,2)   NOT NULL,
    "GalvanizingLaborCost" decimal(10,2)   NOT NULL,
    "GalvanizingWeightPercent" decimal(5,2)   NOT NULL,
    "LaborArchiveDateTime" datetime   NOT NULL,
    "LaborArchiveID" int   NOT NULL,
    "PricingCombinationRunID" int   NOT NULL,
    "LengthInputTypeIDImperial" int   NOT NULL,
    "LengthInputTypeIDMetric" int   NOT NULL,
    "ThicknessInputTypeIDImperial" int   NOT NULL,
    "ThicknessInputTypeIDMetric" int   NOT NULL,
    "DefaultFinish" varchar(255)   NOT NULL,
    "DefaultPaintSystemID" int   NOT NULL,
    "DefaultCleanSystemID" int   NOT NULL,
    "ItemIncrement" int   NOT NULL,
    "InputDisplayUnitsSize" varchar(50)   NOT NULL,
    "InputDisplayUnitsLength" varchar(50)   NOT NULL,
    "InputDisplayUnitsWeight" varchar(50)   NOT NULL,
    "InputDisplayUnitsPrice" varchar(50)   NOT NULL,
    "AutoClipAngles" boolean   NOT NULL,
    "UseGradeSubstitutions" boolean   NOT NULL,
    "ApplyKerfMult" boolean   NOT NULL,
    "ApplyKerfNest" boolean   NOT NULL,
    "CombiningRotatePlates" boolean   NOT NULL,
    "CombiningAllowSplitTees" boolean   NOT NULL,
    "NestingShearCut" boolean   NOT NULL,
    CONSTRAINT "pk_Estimates" PRIMARY KEY (
        "EstimateID"
     )
);

CREATE TABLE "EstimateItems" (
    "EstimateItemID" int   NOT NULL,
    "EstimateID" int   NOT NULL,
    "ItemID" int   NOT NULL,
    "Page" int   NOT NULL,
    "AccessoryItemID" int   NOT NULL,
    "PartNumber" varchar(255)   NOT NULL,
    "DimensionString" varchar(255)   NOT NULL,
    "DimensionStringMetric" varchar(255)   NOT NULL,
    "ManHours" decimal(10,2)   NOT NULL,
    "CalculatedManHours" decimal(10,2)   NOT NULL,
    "ManualOverrideSum" decimal(10,2)   NOT NULL,
    "Weight" decimal(10,2)   NOT NULL,
    "WeightItem" decimal(10,2)   NOT NULL,
    "WeightWeld" decimal(10,2)   NOT NULL,
    "SurfaceArea" decimal(10,2)   NOT NULL,
    "SquareMetersEach" decimal(10,2)   NOT NULL,
    "Perimeter" decimal(10,2)   NOT NULL,
    "MaterialCostPricingTypeID" int   NOT NULL,
    "MaterialCostCurrencyID" int   NOT NULL,
    "MaterialUnitCost" decimal(10,2)   NOT NULL,
    "MaterialCost" decimal(10,2)   NOT NULL,
    "MaterialDropCost" decimal(10,2)   NOT NULL,
    "MaterialDropWeight" decimal(10,2)   NOT NULL,
    "MaterialCostUnits" varchar(50)   NOT NULL,
    "MaterialCostDate" date   NOT NULL,
    "ShopBolts" int   NOT NULL,
    "FieldBolts" int   NOT NULL,
    "Quantity" int   NOT NULL,
    "ShapeID" int   NOT NULL,
    "SizeID" int   NOT NULL,
    "DimDepth" decimal(10,2)   NOT NULL,
    "DimWidth" decimal(10,2)   NOT NULL,
    "DimWeight" decimal(10,2)   NOT NULL,
    "DimThickness" decimal(10,2)   NOT NULL,
    "DimGage" varchar(50)   NOT NULL,
    "DimDiameter" decimal(10,2)   NOT NULL,
    "DimComment" varchar(1024)   NOT NULL,
    "Length" decimal(10,2)   NOT NULL,
    "GradeID" int   NOT NULL,
    "Camber" decimal(10,2)   NOT NULL,
    "EstimateExtraString" varchar(1024)   NOT NULL,
    "LaborCodeID" int   NOT NULL,
    "Copes" int   NOT NULL,
    "Holes" int   NOT NULL,
    "HolesWithoutBolts" int   NOT NULL,
    "Stiffeners" int   NOT NULL,
    "TopFlangeHoles" int   NOT NULL,
    "WebHoles" int   NOT NULL,
    "BottomFlangeHoles" int   NOT NULL,
    "WeldedStuds" int   NOT NULL,
    "ManHoursPerPiece" decimal(10,2)   NOT NULL,
    "CostPerPieceCurrencyID" int   NOT NULL,
    "CostPerPiece" decimal(10,2)   NOT NULL,
    "ManualUnitCostCurrencyID" int   NOT NULL,
    "ManualUnitCost" decimal(10,2)   NOT NULL,
    "ManualCost" decimal(10,2)   NOT NULL,
    "ManualEstimateCostUnitID" int   NOT NULL,
    "Finish" varchar(255)   NOT NULL,
    "PaintSystemID" int   NOT NULL,
    "CleanSystemID" int   NOT NULL,
    "CategoryID" int   NOT NULL,
    "SubCategoryID" int   NOT NULL,
    "Sequence" int   NOT NULL,
    "MainPiece" boolean   NOT NULL,
    "DetailingHours" decimal(10,2)   NOT NULL,
    "ErectHours" decimal(10,2)   NOT NULL,
    "DetailingCostCurrencyID" int   NOT NULL,
    "DetailingCost" decimal(10,2)   NOT NULL,
    "ErectCostCurrencyID" int   NOT NULL,
    "ErectCost" decimal(10,2)   NOT NULL,
    "Comment" varchar(1024)   NOT NULL,
    "ProductionCodeID" int   NOT NULL,
    "EstimateStatusID" int   NOT NULL,
    "CostCodeID" int   NOT NULL,
    "CostTypeID" int   NOT NULL,
    "Recalculate" boolean   NOT NULL,
    "ReloadStandardClips" boolean   NOT NULL,
    CONSTRAINT "pk_EstimateItems" PRIMARY KEY (
        "EstimateItemID"
     )
);

CREATE TABLE "EstimateItemLabor" (
    "EstimateItemID" int   NOT NULL,
    "LaborGroupID" int   NOT NULL,
    "ManHours" decimal(10,2)   NOT NULL,
    "CalculatedManHours" decimal(10,2)   NOT NULL
);

ALTER TABLE "Sizes" ADD CONSTRAINT "fk_Sizes_ShapeID" FOREIGN KEY("ShapeID")
REFERENCES "Shapes" ("ShapeID");

ALTER TABLE "Grades" ADD CONSTRAINT "fk_Grades_ShapeID" FOREIGN KEY("ShapeID")
REFERENCES "Shapes" ("ShapeID");

ALTER TABLE "LaborGroups" ADD CONSTRAINT "fk_LaborGroups_LaborRateID" FOREIGN KEY("LaborRateID")
REFERENCES "LaborRates" ("LaborRateID");

ALTER TABLE "EstimateItems" ADD CONSTRAINT "fk_EstimateItems_EstimateID" FOREIGN KEY("EstimateID")
REFERENCES "Estimates" ("EstimateID");

ALTER TABLE "EstimateItems" ADD CONSTRAINT "fk_EstimateItems_ShapeID" FOREIGN KEY("ShapeID")
REFERENCES "Shapes" ("ShapeID");

ALTER TABLE "EstimateItems" ADD CONSTRAINT "fk_EstimateItems_SizeID" FOREIGN KEY("SizeID")
REFERENCES "Sizes" ("SizeID");

ALTER TABLE "EstimateItems" ADD CONSTRAINT "fk_EstimateItems_GradeID" FOREIGN KEY("GradeID")
REFERENCES "Grades" ("GradeID");

ALTER TABLE "EstimateItemLabor" ADD CONSTRAINT "fk_EstimateItemLabor_EstimateItemID" FOREIGN KEY("EstimateItemID")
REFERENCES "EstimateItems" ("EstimateItemID");

ALTER TABLE "EstimateItemLabor" ADD CONSTRAINT "fk_EstimateItemLabor_LaborGroupID" FOREIGN KEY("LaborGroupID")
REFERENCES "LaborGroups" ("LaborGroupID");

