Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6140E76C684
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Aug 2023 09:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA1210E4FA;
	Wed,  2 Aug 2023 07:20:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com
 [115.124.28.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C0C10E1CA;
 Tue,  1 Aug 2023 10:00:33 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436259|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0317584-1.51847e-05-0.968226;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5tYPZM_1690884025; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5tYPZM_1690884025) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 18:00:27 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in smu73_discrete.h
Date: Tue,  1 Aug 2023 10:00:24 +0000
Message-Id: <20230801100024.8215-1-sunran001@208suo.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 02 Aug 2023 07:20:04 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Ran Sun <sunran001@208suo.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line
ERROR: trailing whitespace
ERROR: space prohibited before open square bracket '['

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../drm/amd/pm/powerplay/inc/smu73_discrete.h | 73 ++++++++-----------
 1 file changed, 29 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu73_discrete.h b/drivers/gpu/drm/amd/pm/powerplay/inc/smu73_discrete.h
index 5916be08a7fe..fd0964ac465e 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu73_discrete.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu73_discrete.h
@@ -27,8 +27,7 @@
 
 #pragma pack(push, 1)
 
-struct SMIO_Pattern
-{
+struct SMIO_Pattern {
   uint16_t Voltage;
   uint8_t  Smio;
   uint8_t  padding;
@@ -36,8 +35,7 @@ struct SMIO_Pattern
 
 typedef struct SMIO_Pattern SMIO_Pattern;
 
-struct SMIO_Table
-{
+struct SMIO_Table {
   SMIO_Pattern Pattern[SMU_MAX_SMIO_LEVELS];
 };
 
@@ -100,8 +98,7 @@ struct SMU73_Discrete_Ulv {
 
 typedef struct SMU73_Discrete_Ulv SMU73_Discrete_Ulv;
 
-struct SMU73_Discrete_MemoryLevel
-{
+struct SMU73_Discrete_MemoryLevel {
     uint32_t MinVoltage;
     uint32_t    MinMvdd;
 
@@ -124,10 +121,9 @@ struct SMU73_Discrete_MemoryLevel
 
 typedef struct SMU73_Discrete_MemoryLevel SMU73_Discrete_MemoryLevel;
 
-struct SMU73_Discrete_LinkLevel
-{
+struct SMU73_Discrete_LinkLevel {
     uint8_t     PcieGenSpeed;           ///< 0:PciE-gen1 1:PciE-gen2 2:PciE-gen3
-    uint8_t     PcieLaneCount;          ///< 1=x1, 2=x2, 3=x4, 4=x8, 5=x12, 6=x16 
+    uint8_t     PcieLaneCount;          ///< 1=x1, 2=x2, 3=x4, 4=x8, 5=x12, 6=x16
     uint8_t     EnabledForActivity;
     uint8_t     SPC;
     uint32_t    DownThreshold;
@@ -139,8 +135,7 @@ typedef struct SMU73_Discrete_LinkLevel SMU73_Discrete_LinkLevel;
 
 
 // MC ARB DRAM Timing registers.
-struct SMU73_Discrete_MCArbDramTimingTableEntry
-{
+struct SMU73_Discrete_MCArbDramTimingTableEntry {
     uint32_t McArbDramTiming;
     uint32_t McArbDramTiming2;
     uint8_t  McArbBurstTime;
@@ -151,16 +146,14 @@ struct SMU73_Discrete_MCArbDramTimingTableEntry
 
 typedef struct SMU73_Discrete_MCArbDramTimingTableEntry SMU73_Discrete_MCArbDramTimingTableEntry;
 
-struct SMU73_Discrete_MCArbDramTimingTable
-{
+struct SMU73_Discrete_MCArbDramTimingTable {
     SMU73_Discrete_MCArbDramTimingTableEntry entries[SMU__NUM_SCLK_DPM_STATE][SMU__NUM_MCLK_DPM_LEVELS];
 };
 
 typedef struct SMU73_Discrete_MCArbDramTimingTable SMU73_Discrete_MCArbDramTimingTable;
 
 // UVD VCLK/DCLK state (level) definition.
-struct SMU73_Discrete_UvdLevel
-{
+struct SMU73_Discrete_UvdLevel {
     uint32_t VclkFrequency;
     uint32_t DclkFrequency;
     uint32_t MinVoltage;
@@ -172,8 +165,7 @@ struct SMU73_Discrete_UvdLevel
 typedef struct SMU73_Discrete_UvdLevel SMU73_Discrete_UvdLevel;
 
 // Clocks for other external blocks (VCE, ACP, SAMU).
-struct SMU73_Discrete_ExtClkLevel
-{
+struct SMU73_Discrete_ExtClkLevel {
     uint32_t Frequency;
     uint32_t MinVoltage;
     uint8_t  Divider;
@@ -182,8 +174,7 @@ struct SMU73_Discrete_ExtClkLevel
 
 typedef struct SMU73_Discrete_ExtClkLevel SMU73_Discrete_ExtClkLevel;
 
-struct SMU73_Discrete_StateInfo
-{
+struct SMU73_Discrete_StateInfo {
     uint32_t SclkFrequency;
     uint32_t MclkFrequency;
     uint32_t VclkFrequency;
@@ -206,8 +197,7 @@ struct SMU73_Discrete_StateInfo
 
 typedef struct SMU73_Discrete_StateInfo SMU73_Discrete_StateInfo;
 
-struct SMU73_Discrete_DpmTable
-{
+struct SMU73_Discrete_DpmTable {
     // Multi-DPM controller settings
     SMU73_PIDController                  GraphicsPIDController;
     SMU73_PIDController                  MemoryPIDController;
@@ -225,9 +215,9 @@ struct SMU73_Discrete_DpmTable
     uint32_t                            MvddLevelCount;
 
 
-    uint8_t                             BapmVddcVidHiSidd        [SMU73_MAX_LEVELS_VDDC];
-    uint8_t                             BapmVddcVidLoSidd        [SMU73_MAX_LEVELS_VDDC];
-    uint8_t                             BapmVddcVidHiSidd2       [SMU73_MAX_LEVELS_VDDC];
+    uint8_t                             BapmVddcVidHiSidd[SMU73_MAX_LEVELS_VDDC];
+    uint8_t                             BapmVddcVidLoSidd[SMU73_MAX_LEVELS_VDDC];
+    uint8_t                             BapmVddcVidHiSidd2[SMU73_MAX_LEVELS_VDDC];
 
     uint8_t                             GraphicsDpmLevelCount;
     uint8_t                             MemoryDpmLevelCount;
@@ -246,19 +236,19 @@ struct SMU73_Discrete_DpmTable
     uint32_t                            Reserved[4];
 
     // State table entries for each DPM state
-    SMU73_Discrete_GraphicsLevel        GraphicsLevel           [SMU73_MAX_LEVELS_GRAPHICS];
+    SMU73_Discrete_GraphicsLevel        GraphicsLevel[SMU73_MAX_LEVELS_GRAPHICS];
     SMU73_Discrete_MemoryLevel          MemoryACPILevel;
-    SMU73_Discrete_MemoryLevel          MemoryLevel             [SMU73_MAX_LEVELS_MEMORY];
-    SMU73_Discrete_LinkLevel            LinkLevel               [SMU73_MAX_LEVELS_LINK];
+    SMU73_Discrete_MemoryLevel          MemoryLevel[SMU73_MAX_LEVELS_MEMORY];
+    SMU73_Discrete_LinkLevel            LinkLevel[SMU73_MAX_LEVELS_LINK];
     SMU73_Discrete_ACPILevel            ACPILevel;
-    SMU73_Discrete_UvdLevel             UvdLevel                [SMU73_MAX_LEVELS_UVD];
-    SMU73_Discrete_ExtClkLevel          VceLevel                [SMU73_MAX_LEVELS_VCE];
-    SMU73_Discrete_ExtClkLevel          AcpLevel                [SMU73_MAX_LEVELS_ACP];
-    SMU73_Discrete_ExtClkLevel          SamuLevel               [SMU73_MAX_LEVELS_SAMU];
+    SMU73_Discrete_UvdLevel             UvdLevel[SMU73_MAX_LEVELS_UVD];
+    SMU73_Discrete_ExtClkLevel          VceLevel[SMU73_MAX_LEVELS_VCE];
+    SMU73_Discrete_ExtClkLevel          AcpLevel[SMU73_MAX_LEVELS_ACP];
+    SMU73_Discrete_ExtClkLevel          SamuLevel[SMU73_MAX_LEVELS_SAMU];
     SMU73_Discrete_Ulv                  Ulv;
 
     uint32_t                            SclkStepSize;
-    uint32_t                            Smio                    [SMU73_MAX_ENTRIES_SMIO];
+    uint32_t                            Smio[SMU73_MAX_ENTRIES_SMIO];
 
     uint8_t                             UvdBootLevel;
     uint8_t                             VceBootLevel;
@@ -368,8 +358,7 @@ typedef struct SMU73_Discrete_DpmTable SMU73_Discrete_DpmTable;
 
 
 // --------------------------------------------------- Fan Table -----------------------------------------------------------
-struct SMU73_Discrete_FanTable
-{
+struct SMU73_Discrete_FanTable {
     uint16_t FdoMode;
     int16_t  TempMin;
     int16_t  TempMed;
@@ -397,8 +386,7 @@ typedef struct SMU73_Discrete_FanTable SMU73_Discrete_FanTable;
 
 
 
-struct SMU7_MclkDpmScoreboard
-{
+struct SMU7_MclkDpmScoreboard {
 
     uint32_t PercentageBusy;
 
@@ -448,8 +436,8 @@ struct SMU7_MclkDpmScoreboard
     uint8_t  VbiWaitCounter;
     uint8_t  EnabledLevelsChange;
 
-    uint16_t LevelResidencyCounters [SMU73_MAX_LEVELS_MEMORY];
-    uint16_t LevelSwitchCounters [SMU73_MAX_LEVELS_MEMORY];
+    uint16_t LevelResidencyCounters[SMU73_MAX_LEVELS_MEMORY];
+    uint16_t LevelSwitchCounters[SMU73_MAX_LEVELS_MEMORY];
 
     void     (*TargetStateCalculator)(uint8_t);
     void     (*SavedTargetStateCalculator)(uint8_t);
@@ -469,8 +457,7 @@ struct SMU7_MclkDpmScoreboard
 
 typedef struct SMU7_MclkDpmScoreboard SMU7_MclkDpmScoreboard;
 
-struct SMU7_UlvScoreboard
-{
+struct SMU7_UlvScoreboard {
     uint8_t     EnterUlv;
     uint8_t     ExitUlv;
     uint8_t     UlvActive;
@@ -485,8 +472,7 @@ struct SMU7_UlvScoreboard
 
 typedef struct SMU7_UlvScoreboard SMU7_UlvScoreboard;
 
-struct VddgfxSavedRegisters
-{
+struct VddgfxSavedRegisters {
   uint32_t GPU_DBG[3];
   uint32_t MEC_BaseAddress_Hi;
   uint32_t MEC_BaseAddress_Lo;
@@ -497,8 +483,7 @@ struct VddgfxSavedRegisters
 
 typedef struct VddgfxSavedRegisters VddgfxSavedRegisters;
 
-struct SMU7_VddGfxScoreboard
-{
+struct SMU7_VddGfxScoreboard {
     uint8_t     VddGfxEnable;
     uint8_t     VddGfxActive;
     uint8_t     VPUResetOccured;
-- 
2.17.1

