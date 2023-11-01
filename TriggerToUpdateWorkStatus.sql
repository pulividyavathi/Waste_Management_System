CREATE TRIGGER UpdateWorkOrderStatus
ON WorkOrder
AFTER UPDATE
AS
BEGIN
    IF UPDATE(WorkOrderEndDate)
    BEGIN
        UPDATE WorkOrder
        SET WorkOrderStatus = 'Completed'
        FROM inserted
        WHERE inserted.WorkOrderID = WorkOrder.WorkOrderID
          AND inserted.WorkOrderEndDate IS NOT NULL
    END
END


 