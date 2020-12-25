ALTER TABLE [dbo].[AnnualTable] ADD  CONSTRAINT [DF_AnnualTable_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DesignationTable] ADD  CONSTRAINT [DF_DesignationTable_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[ProgrameTable] ADD  CONSTRAINT [DF_ProgrameTable_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[StaffTable] ADD  CONSTRAINT [DF_StaffTable_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[StudentTable] ADD  CONSTRAINT [DF_StudentTable_IsEnrolled]  DEFAULT ((0)) FOR [IsEnrolled]
GO
ALTER TABLE [dbo].[StudentTable] ADD  CONSTRAINT [DF_StudentTable_IsShortList]  DEFAULT ((0)) FOR [IsShortList]
GO
ALTER TABLE [dbo].[StudentTable] ADD  CONSTRAINT [DF_StudentTable_IsApply]  DEFAULT ((0)) FOR [IsApply]
GO
ALTER TABLE [dbo].[StudentTable] ADD  CONSTRAINT [DF_StudentTable_PreviousPercentage]  DEFAULT ((0)) FOR [PreviousPercentage]
GO
ALTER TABLE [dbo].[TimeTblTable] ADD  CONSTRAINT [DF_TimeTblTable_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AnnualTable]  WITH CHECK ADD  CONSTRAINT [FK_AnnualTable_ProgrameTable] FOREIGN KEY([ProgrameID])
REFERENCES [dbo].[ProgrameTable] ([ProgrameID])
GO
ALTER TABLE [dbo].[AnnualTable] CHECK CONSTRAINT [FK_AnnualTable_ProgrameTable]
GO
ALTER TABLE [dbo].[AnnualTable]  WITH CHECK ADD  CONSTRAINT [FK_AnnualTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[AnnualTable] CHECK CONSTRAINT [FK_AnnualTable_UserTable]
GO
ALTER TABLE [dbo].[AttendanceTable]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceTable_StudentTable] FOREIGN KEY([StudentID])
REFERENCES [dbo].[StudentTable] ([StudentID])
GO
ALTER TABLE [dbo].[AttendanceTable] CHECK CONSTRAINT [FK_AttendanceTable_StudentTable]
GO
ALTER TABLE [dbo].[DesignationTable]  WITH CHECK ADD  CONSTRAINT [FK_DesignationTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[DesignationTable] CHECK CONSTRAINT [FK_DesignationTable_UserTable]
GO
ALTER TABLE [dbo].[ExamSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamSettingTable_ExamTable] FOREIGN KEY([ExamID])
REFERENCES [dbo].[ExamTable] ([ExamID])
GO
ALTER TABLE [dbo].[ExamSettingTable] CHECK CONSTRAINT [FK_ExamSettingTable_ExamTable]
GO
ALTER TABLE [dbo].[ExamSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamSettingTable_ProgrameSessionTable] FOREIGN KEY([ProgrameSessionID])
REFERENCES [dbo].[ProgrameSessionTable] ([ProgrameSessionID])
GO
ALTER TABLE [dbo].[ExamSettingTable] CHECK CONSTRAINT [FK_ExamSettingTable_ProgrameSessionTable]
GO
ALTER TABLE [dbo].[ExamSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamSettingTable_SessionTable] FOREIGN KEY([SessionID])
REFERENCES [dbo].[SessionTable] ([SessionID])
GO
ALTER TABLE [dbo].[ExamSettingTable] CHECK CONSTRAINT [FK_ExamSettingTable_SessionTable]
GO
ALTER TABLE [dbo].[ExamSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamSettingTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ExamSettingTable] CHECK CONSTRAINT [FK_ExamSettingTable_UserTable]
GO
ALTER TABLE [dbo].[ExamTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ExamTable] CHECK CONSTRAINT [FK_ExamTable_UserTable]
GO
ALTER TABLE [dbo].[ExpensesTable]  WITH CHECK ADD  CONSTRAINT [FK_ExpensesTable_ExpensesTypeTable] FOREIGN KEY([ExpenseTypeID])
REFERENCES [dbo].[ExpensesTypeTable] ([ExpenseTypeID])
GO
ALTER TABLE [dbo].[ExpensesTable] CHECK CONSTRAINT [FK_ExpensesTable_ExpensesTypeTable]
GO
ALTER TABLE [dbo].[ExpensesTable]  WITH CHECK ADD  CONSTRAINT [FK_ExpensesTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ExpensesTable] CHECK CONSTRAINT [FK_ExpensesTable_UserTable]
GO
ALTER TABLE [dbo].[ExpensesTypeTable]  WITH CHECK ADD  CONSTRAINT [FK_ExpensesTypeTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO

ALTER TABLE [dbo].[ProgrameSessionTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgrameSessionTable_ProgrameTable] FOREIGN KEY([ProgrameID])
REFERENCES [dbo].[ProgrameTable] ([ProgrameID])
GO
ALTER TABLE [dbo].[ProgrameSessionTable] CHECK CONSTRAINT [FK_ProgrameSessionTable_ProgrameTable]
GO
ALTER TABLE [dbo].[ProgrameSessionTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgrameSessionTable_SessionTable] FOREIGN KEY([SessionID])
REFERENCES [dbo].[SessionTable] ([SessionID])
GO
ALTER TABLE [dbo].[ProgrameSessionTable] CHECK CONSTRAINT [FK_ProgrameSessionTable_SessionTable]
GO
ALTER TABLE [dbo].[ProgrameSessionTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgrameSessionTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ProgrameSessionTable] CHECK CONSTRAINT [FK_ProgrameSessionTable_UserTable]
GO
ALTER TABLE [dbo].[ProgrameTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgrameTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ProgrameTable] CHECK CONSTRAINT [FK_ProgrameTable_UserTable]
GO

ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_SessionProgrameSubjectSettingTable_AnnualTable] FOREIGN KEY([AnnualID])
REFERENCES [dbo].[AnnualTable] ([AnnualID])
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable] CHECK CONSTRAINT [FK_SessionProgrameSubjectSettingTable_AnnualTable]
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_SessionProgrameSubjectSettingTable_ProgrameTable] FOREIGN KEY([ProgrameID])
REFERENCES [dbo].[ProgrameTable] ([ProgrameID])
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable] CHECK CONSTRAINT [FK_SessionProgrameSubjectSettingTable_ProgrameTable]
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_SessionProgrameSubjectSettingTable_SessionTable] FOREIGN KEY([SessionID])
REFERENCES [dbo].[SessionTable] ([SessionID])
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable] CHECK CONSTRAINT [FK_SessionProgrameSubjectSettingTable_SessionTable]
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_SessionProgrameSubjectSettingTable_SubjectTable] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[SubjectTable] ([SubjectID])
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable] CHECK CONSTRAINT [FK_SessionProgrameSubjectSettingTable_SubjectTable]
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_SessionProgrameSubjectSettingTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable] CHECK CONSTRAINT [FK_SessionProgrameSubjectSettingTable_UserTable]
GO
ALTER TABLE [dbo].[SessionTable]  WITH CHECK ADD  CONSTRAINT [FK_SessionTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[SessionTable] CHECK CONSTRAINT [FK_SessionTable_UserTable]
GO
ALTER TABLE [dbo].[StaffAttendanceTable]  WITH CHECK ADD  CONSTRAINT [FK_StaffAttendanceTable_StaffTable] FOREIGN KEY([StaffID])
REFERENCES [dbo].[StaffTable] ([StaffID])
GO
ALTER TABLE [dbo].[StaffAttendanceTable] CHECK CONSTRAINT [FK_StaffAttendanceTable_StaffTable]
GO
ALTER TABLE [dbo].[StaffTable]  WITH CHECK ADD  CONSTRAINT [FK_StaffTable_DesignationTable] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[DesignationTable] ([DesignationID])
GO
ALTER TABLE [dbo].[StaffTable] CHECK CONSTRAINT [FK_StaffTable_DesignationTable]
GO
ALTER TABLE [dbo].[StaffTable]  WITH CHECK ADD  CONSTRAINT [FK_StaffTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[StaffTable] CHECK CONSTRAINT [FK_StaffTable_UserTable]
GO
ALTER TABLE [dbo].[StudentTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentTable_ProgrameTable] FOREIGN KEY([ProgrameID])
REFERENCES [dbo].[ProgrameTable] ([ProgrameID])
GO
ALTER TABLE [dbo].[StudentTable] CHECK CONSTRAINT [FK_StudentTable_ProgrameTable]
GO
ALTER TABLE [dbo].[StudentTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentTable_SessionTable] FOREIGN KEY([SessionID])
REFERENCES [dbo].[SessionTable] ([SessionID])
GO
ALTER TABLE [dbo].[StudentTable] CHECK CONSTRAINT [FK_StudentTable_SessionTable]
GO
ALTER TABLE [dbo].[StudentTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[StudentTable] CHECK CONSTRAINT [FK_StudentTable_UserTable]
GO
ALTER TABLE [dbo].[SubjectTable]  WITH CHECK ADD  CONSTRAINT [FK_SubjectTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[SubjectTable] CHECK CONSTRAINT [FK_SubjectTable_UserTable]
GO
ALTER TABLE [dbo].[SubmissionFeeTable]  WITH CHECK ADD  CONSTRAINT [FK_SubmissionFeeTable_ProgrameTable] FOREIGN KEY([ProgrameID])
REFERENCES [dbo].[ProgrameTable] ([ProgrameID])
GO
ALTER TABLE [dbo].[SubmissionFeeTable] CHECK CONSTRAINT [FK_SubmissionFeeTable_ProgrameTable]
GO
ALTER TABLE [dbo].[SubmissionFeeTable]  WITH CHECK ADD  CONSTRAINT [FK_SubmissionFeeTable_StudentTable] FOREIGN KEY([StudentID])
REFERENCES [dbo].[StudentTable] ([StudentID])
GO
ALTER TABLE [dbo].[SubmissionFeeTable] CHECK CONSTRAINT [FK_SubmissionFeeTable_StudentTable]
GO
ALTER TABLE [dbo].[SubmissionFeeTable]  WITH CHECK ADD  CONSTRAINT [FK_SubmissionFeeTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[SubmissionFeeTable] CHECK CONSTRAINT [FK_SubmissionFeeTable_UserTable]
GO
ALTER TABLE [dbo].[TimeTblTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTblTable_RoomTable] FOREIGN KEY([Room_ID])
REFERENCES [dbo].[RoomTable] ([RoomID])
GO
ALTER TABLE [dbo].[TimeTblTable] CHECK CONSTRAINT [FK_TimeTblTable_RoomTable]
GO
ALTER TABLE [dbo].[TimeTblTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTblTable_SessionProgrameSubjectSettingTable] FOREIGN KEY([SessionProgrameSubjectSettingID])
REFERENCES [dbo].[SessionProgrameSubjectSettingTable] ([SessionProgrameSubjectSettingID])
GO
ALTER TABLE [dbo].[TimeTblTable] CHECK CONSTRAINT [FK_TimeTblTable_SessionProgrameSubjectSettingTable]
GO
ALTER TABLE [dbo].[TimeTblTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTblTable_SubjectTable] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[SubjectTable] ([SubjectID])
GO
ALTER TABLE [dbo].[TimeTblTable] CHECK CONSTRAINT [FK_TimeTblTable_SubjectTable]
GO
ALTER TABLE [dbo].[TimeTblTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTblTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[TimeTblTable] CHECK CONSTRAINT [FK_TimeTblTable_UserTable]
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_UserTypeTable] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypeTable] ([UserTypeID])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTable_UserTypeTable]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UserTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "UserTypeTable"
            Begin Extent = 
               Top = 9
               Left = 401
               Bottom = 122
               Right = 571
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAllUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAllUsers'
GO
