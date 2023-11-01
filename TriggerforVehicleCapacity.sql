CREATE TRIGGER CheckVehicleCapacity
ON Vehicle
AFTER INSERT, UPDATE
AS
BEGIN
  IF EXISTS (SELECT 1 FROM inserted WHERE VehicleCapacity > 10000)
  BEGIN
    RAISERROR('Vehicle capacity cannot be more than 30000', 16, 1)
    ROLLBACK TRANSACTION
  END
END


