Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE523AF1B4
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Jun 2021 19:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259CE6E2ED;
	Mon, 21 Jun 2021 17:13:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049096E2B6
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Jun 2021 17:13:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVPwD0prjHrfdS3qqIbe+5Ts9w1RI03mRRmqn17YP0lR57R9mySAHHdetaid3qQXug8CpATQ1dbezXIgLQJgD4dVRN2zStX1NQMl0JiVufJF0GMb5qoFXV3NtbG/DQ9je4WdyZQTM3oN2/DHHI1ZN5J3d64lue1t1KvA557zDk7Yd62W74YpiY+jisnddppEsK3t79erKn6c0suR56Qqy60bt2I8zLLv0fbEZS7gRML3ZkyrGaYa2kSaqAB27+wuJhTNzLzFNAGbVEeavRb877JNsdldCqGGGRJPmEcltgL0nwJGe4vmSLWskd/Ey43KmQTncETHw4KSlxBrZFOoog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl0QH2vOwFbsBQddcrYYFO7ovShO5BQF1PDj3CCy+Z8=;
 b=PAiAzjUWSXDvmpItzG5H/IE40Ke6QlGzmY+K9Ei1xkPFAMD7Vi0IOWVoGBVuBBA3tEseXiCJ4hkcVbRZqKrjjiHKosQnCkdcNPeKImtWAVlk3H0n6EisJ6+IoZwwc2t/E24MMInpDg25W6K7eQgU+7gczszIz4nFcL4i4uIy60AZnLWwIZU3O5/R5G8r6sb01kkQ2HCRML4i1hQ67p3zqpDzGOjDj5xC5K/B08q+X+NDR7vz+KXZevgkcuQbYpJw953TOqYKgkWwsciERsCNAKt9AunZCWum3fja/aSROuoXXu/hfmiT1YP8uN7LJwFqd5L3cmv5ZcHqSJdozmjYeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl0QH2vOwFbsBQddcrYYFO7ovShO5BQF1PDj3CCy+Z8=;
 b=s9GFDjIA8vXXx5DV+uodMwk6Ef45V0npzBvCwzt44yWupkfqIQPHDuPjR/+w/oxU7XCOA7ALMapU0yqaGOQ5k+cxVsD0rs4jFAucX3MFj5zhjKQdZ9SIDCHzNT3e8FK3hSai+OnHroQF2prG3bdBMcx0aWSXK1i5kK1YgSiEANs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB2985.namprd12.prod.outlook.com (2603:10b6:5:116::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Mon, 21 Jun
 2021 17:13:35 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::142:82e3:7e9d:55a0]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::142:82e3:7e9d:55a0%6]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 17:13:35 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 39/43] drm/amdgpu: Optimize EEPROM RAS table I/O
Date: Mon, 21 Jun 2021 13:12:17 -0400
Message-Id: <20210621171221.5720-40-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621171221.5720-1-luben.tuikov@amd.com>
References: <20210621171221.5720-1-luben.tuikov@amd.com>
X-Originating-IP: [108.162.138.69]
X-ClientProxiedBy: YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::23) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (108.162.138.69) by
 YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Mon, 21 Jun 2021 17:13:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6aeef68-1e1a-405f-4c20-08d934d7d5da
X-MS-TrafficTypeDiagnostic: DM6PR12MB2985:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2985227E517B1E39CEE715C2990A9@DM6PR12MB2985.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wuo55dGG88Ou1Tw31PqB2kHSEDkOlL+16meo85zdu3467aFLHbsjIbqjHYsVj6UijURbYNyQQAtdl1RvSNPbdv8o7e0K4TxQkXFO60GKbSjCPcgjVklT4b8C0mKAot/mjunVrxJ/Sy5nv7iCq07dOAnv+E52EWRAVyjRxW2xVtvc/YU+kADqlSSnbaGwpgTd+5zEWtW3bww6so1yot6nYZIo5o/Gv+b4I6XWHpNnw88jkfMGJLNtIIwmjL4MrJzjFks6URadm6/6rDxzVgYFaf7H67AyIyFFk57vMl2vPig7NeGX5eTMrAZnKcm2N/KeuWWgbLPXeerkPWrJEN2OEOL66Ut/hsIIqTs+JDIUE3rWZe1Vott431JNksE2IWAgborU5mDhTn1Qu07PWyU4HO3pXjAB6xH5Xc3Skk2XgoAJjc1RLyRtGups/ttYAwgEp7NVFPqlUlhAHrbvFIKdIQ2HQbHygF3R3kv001peuqk1+43jiVvTU5vcsSBAhjPpKthVlzT3MXceEXmzXo0ubHLyytOywpHAk1esDfV6wdOiDVBXyqA3DClCQSeod8dnS+EdPx0qNrVbC8JrAtH50EWtziBDiceRaPda8TjNDmqLYl+axgu62CjHnaULiQ7PzPUrcmp5Ds4nMLkX+lWBAjSqUCKbKqsm+4SmSm8PXm7tdPModRgDEjWbF0/PEumW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(6666004)(55236004)(8676002)(316002)(6506007)(6486002)(54906003)(44832011)(8936002)(478600001)(66476007)(66946007)(956004)(2616005)(6512007)(66556008)(2906002)(52116002)(36756003)(30864003)(38100700002)(38350700002)(86362001)(5660300002)(186003)(4326008)(1076003)(83380400001)(26005)(16526019)(6916009)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hSD7fVP2PdLTOHYcTHH29Y4xYeUs3bSFPQPBPK2Z55dr+22WLWjUz6/ZqIM1?=
 =?us-ascii?Q?Zmjd0G+T6snwjCZwEZeSjHW/4iBcz/EWie4zh/c8RyxcUxUasy9VvAGlm1vn?=
 =?us-ascii?Q?1BixjiqzcjC5d/vKXmmlup0ZMgQDvmSsanuVp8iZgrNmXmoqlHrjMGgG6/m9?=
 =?us-ascii?Q?sZKG5UUCFHufPtCTTAFJuQLLek4eCZLQGZGFKyXDD2rwYJTtav3hZT6lLlzl?=
 =?us-ascii?Q?a1p2J8o+Wc7u7Y2Y2BLocIsL45MwAJ+nxAPvl88SyrHwxcqHDqhA6QDJI+w/?=
 =?us-ascii?Q?IIsIr7dd8V0xhxKVy+RqKFPvNgV3IJDuWK6peMXDNgK6afwr2/IlyXazJaqw?=
 =?us-ascii?Q?dVlpZWvgTQDlE7/i0aX+m7ZPkkag2hFmFRJIG7rNh5+0ZuD/NM3oIH1sDHxC?=
 =?us-ascii?Q?305GaMn2ydqaPLkE4/8CPz4qM0vVixvIxvEXCl2+raEYyUbBCf2SKoHSAMzo?=
 =?us-ascii?Q?1lg7wX4VCAP+ZTih6OjITGRDmC4dp9Xrjut3StxrndaRHnIzAD4veYMH7a9F?=
 =?us-ascii?Q?agOyGqvHx7fEaJySLcg9HiaNHDdG3VmVMMwEKwjnX6dGd3ULiVAijfveuHBm?=
 =?us-ascii?Q?d8xl6mQhP1YRa5syNENDGpbtWzJkpi/brARER+Y2iIFWcjOZrSX/7P/iUK2x?=
 =?us-ascii?Q?raoIgT+fWYK4vDSCLTj1bQ6jHCbYr6mSZdaqA5ZShMx/FlwZO4AeTYxOBxHk?=
 =?us-ascii?Q?3S0RbxX9jnv3BtAXIcJ3Z5Tzepg2us1kjQzfwuW45Li42AevC78jn31FuHVG?=
 =?us-ascii?Q?omSzZ5kP4jR3gsEJ3Sd45N028XaKtjx8tCJBTFkICKFOp6KlJF1bWJIg8VGC?=
 =?us-ascii?Q?Dufx4ggUuMxa6a8PX/TuoOlJLs1awnPHbAdX7aZyIOvqwbKn0OQ8yL+FDpe1?=
 =?us-ascii?Q?5Tili9SyKc/NaYaB2V5Lsf9KELAcpipvYGqmoG9FjeCitsugWTx+AVix7G0d?=
 =?us-ascii?Q?I+Df+2XjNEZoMVZle2rya8YzakkSqYIF8pN+2LwZZ/suKwuAKfubygB4PXLo?=
 =?us-ascii?Q?78cxzV4eIg2l0pqr9mOi2N04C29edpx5f1zdyLhmIHXHCSF+XOSqH1JmO8zr?=
 =?us-ascii?Q?WAfo76WKvBUlvud/yT37nXI1Syp6NJGvrVz7I2HYi/q5U2i2rlNQhXlOV97B?=
 =?us-ascii?Q?s/PnDmZCktkF5tUXuM7GlIw/BjJ7oOrp+wcyKKdmqRKMiGilSWhw1Kia9Slm?=
 =?us-ascii?Q?g7PDI2IC08w+GWAoSC9oBj3fVMIdddg8I7mN8GRq6BxtM8+Ue4EIK4Qq01LP?=
 =?us-ascii?Q?PU+pIcGzZ9G9YbxFCoZ+tIKZ0e7m5kU8TKSBZGDWqJulYWirm6ZzTim9ibbX?=
 =?us-ascii?Q?i9V6yQqvJJ2+k/zmcjl5uISx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6aeef68-1e1a-405f-4c20-08d934d7d5da
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 17:13:06.1741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6HsXWW3zj+2EMlRIclDOE820FWbnV9CMAwZSGAThMIEIlSoNGYD7bRpEE/izoXM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2985
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Split functionality between read and write, which
simplifies the code and exposes areas of
optimization and more or less complexity, and take
advantage of that.

Read and write the table in one go; use a separate
stage to decode or encode the data, as opposed to
on the fly, which keeps the I2C bus busy. Use a
single read/write to read/write the table or at
most two if the number of records we're
reading/writing wraps around.

Check the check-sum of a table in EEPROM on init.

Update the checksum at the same time as when
updating the table header signature, when the
threshold was increased on boot.

Take advantage of arithmetic modulo 256, that is,
use a byte!, to greatly simplify checksum
arithmetic.

Cc: Alexander Deucher <Alexander.Deucher@amd.com>
Cc: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
Acked-by: Alexander Deucher <Alexander.Deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c    |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h    |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |   8 +-
 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    | 844 ++++++++++++------
 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h    |  32 +-
 5 files changed, 620 insertions(+), 307 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
index a4815af111ed12..4c3c65a5acae9b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
@@ -176,8 +176,8 @@ static int __amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap, u32 eeprom_addr,
  *
  * Returns the number of bytes read/written; -errno on error.
  */
-int amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap, u32 eeprom_addr,
-		       u8 *eeprom_buf, u16 buf_size, bool read)
+static int amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap, u32 eeprom_addr,
+			      u8 *eeprom_buf, u16 buf_size, bool read)
 {
 	const struct i2c_adapter_quirks *quirks = i2c_adap->quirks;
 	u16 limit;
@@ -221,3 +221,19 @@ int amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap, u32 eeprom_addr,
 		return res;
 	}
 }
+
+int amdgpu_eeprom_read(struct i2c_adapter *i2c_adap,
+		       u32 eeprom_addr, u8 *eeprom_buf,
+		       u16 bytes)
+{
+	return amdgpu_eeprom_xfer(i2c_adap, eeprom_addr, eeprom_buf, bytes,
+				  true);
+}
+
+int amdgpu_eeprom_write(struct i2c_adapter *i2c_adap,
+			u32 eeprom_addr, u8 *eeprom_buf,
+			u16 bytes)
+{
+	return amdgpu_eeprom_xfer(i2c_adap, eeprom_addr, eeprom_buf, bytes,
+				  false);
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h
index 966b434f0de2b7..6935adb2be1f1c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h
@@ -26,23 +26,12 @@
 
 #include <linux/i2c.h>
 
-int amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap, u32 eeprom_addr,
-		       u8 *eeprom_buf, u16 bytes, bool read);
+int amdgpu_eeprom_read(struct i2c_adapter *i2c_adap,
+		       u32 eeprom_addr, u8 *eeprom_buf,
+		       u16 bytes);
 
-static inline int amdgpu_eeprom_read(struct i2c_adapter *i2c_adap,
-				     u32 eeprom_addr, u8 *eeprom_buf,
-				     u16 bytes)
-{
-	return amdgpu_eeprom_xfer(i2c_adap, eeprom_addr, eeprom_buf, bytes,
-				  true);
-}
-
-static inline int amdgpu_eeprom_write(struct i2c_adapter *i2c_adap,
-				      u32 eeprom_addr, u8 *eeprom_buf,
-				      u16 bytes)
-{
-	return amdgpu_eeprom_xfer(i2c_adap, eeprom_addr, eeprom_buf, bytes,
-				  false);
-}
+int amdgpu_eeprom_write(struct i2c_adapter *i2c_adap,
+			u32 eeprom_addr, u8 *eeprom_buf,
+			u16 bytes);
 
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index cd2fce8bbcab87..f15f8ab5b9affb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -451,7 +451,7 @@ static ssize_t amdgpu_ras_debugfs_eeprom_write(struct file *f,
 	ret = amdgpu_ras_eeprom_reset_table(
 		&(amdgpu_ras_get_context(adev)->eeprom_control));
 
-	if (ret > 0) {
+	if (!ret) {
 		/* Something was written to EEPROM.
 		 */
 		amdgpu_ras_get_context(adev)->flags = RAS_DEFAULT_FLAGS;
@@ -1821,9 +1821,9 @@ int amdgpu_ras_save_bad_pages(struct amdgpu_device *adev)
 	save_count = data->count - control->ras_num_recs;
 	/* only new entries are saved */
 	if (save_count > 0) {
-		if (amdgpu_ras_eeprom_write(control,
-					    &data->bps[control->ras_num_recs],
-					    save_count)) {
+		if (amdgpu_ras_eeprom_append(control,
+					     &data->bps[control->ras_num_recs],
+					     save_count)) {
 			dev_err(adev->dev, "Failed to save EEPROM table data!");
 			return -EIO;
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index 7522d2ca5b03fc..dc4a845a32404c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -52,11 +52,27 @@
 
 /* Assume 2-Mbit size EEPROM and take up the whole space. */
 #define RAS_TBL_SIZE_BYTES      (256 * 1024)
-#define RAS_HDR_START           0
+#define RAS_TABLE_START         0
+#define RAS_HDR_START           RAS_TABLE_START
 #define RAS_RECORD_START        (RAS_HDR_START + RAS_TABLE_HEADER_SIZE)
 #define RAS_MAX_RECORD_COUNT    ((RAS_TBL_SIZE_BYTES - RAS_TABLE_HEADER_SIZE) \
 				 / RAS_TABLE_RECORD_SIZE)
 
+/* Given a zero-based index of an EEPROM RAS record, yields the EEPROM
+ * offset off of RAS_TABLE_START.  That is, this is something you can
+ * add to control->i2c_address, and then tell I2C layer to read
+ * from/write to there. _N is the so called absolute index,
+ * because it starts right after the table header.
+ */
+#define RAS_INDEX_TO_OFFSET(_C, _N) ((_C)->ras_record_offset + \
+				     (_N) * RAS_TABLE_RECORD_SIZE)
+
+#define RAS_OFFSET_TO_INDEX(_C, _O) (((_O) - \
+				      (_C)->ras_record_offset) / RAS_TABLE_RECORD_SIZE)
+
+#define RAS_NUM_RECS(_tbl_hdr)  (((_tbl_hdr)->tbl_size - \
+				  RAS_TABLE_HEADER_SIZE) / RAS_TABLE_RECORD_SIZE)
+
 #define to_amdgpu_device(x) (container_of(x, struct amdgpu_ras, eeprom_control))->adev
 
 static bool __is_ras_eeprom_supported(struct amdgpu_device *adev)
@@ -117,10 +133,11 @@ static bool __get_eeprom_i2c_addr(struct amdgpu_device *adev,
 	return true;
 }
 
-static void __encode_table_header_to_buf(struct amdgpu_ras_eeprom_table_header *hdr,
-					 unsigned char *buf)
+static void
+__encode_table_header_to_buf(struct amdgpu_ras_eeprom_table_header *hdr,
+			     unsigned char *buf)
 {
-	uint32_t *pp = (uint32_t *) buf;
+	u32 *pp = (uint32_t *)buf;
 
 	pp[0] = cpu_to_le32(hdr->header);
 	pp[1] = cpu_to_le32(hdr->version);
@@ -129,10 +146,11 @@ static void __encode_table_header_to_buf(struct amdgpu_ras_eeprom_table_header *
 	pp[4] = cpu_to_le32(hdr->checksum);
 }
 
-static void __decode_table_header_from_buf(struct amdgpu_ras_eeprom_table_header *hdr,
-					   unsigned char *buf)
+static void
+__decode_table_header_from_buf(struct amdgpu_ras_eeprom_table_header *hdr,
+			       unsigned char *buf)
 {
-	u32 *pp = (uint32_t *) buf;
+	u32 *pp = (uint32_t *)buf;
 
 	hdr->header	      = le32_to_cpu(pp[0]);
 	hdr->version	      = le32_to_cpu(pp[1]);
@@ -141,124 +159,89 @@ static void __decode_table_header_from_buf(struct amdgpu_ras_eeprom_table_header
 	hdr->checksum	      = le32_to_cpu(pp[4]);
 }
 
-static int __write_table_header(struct amdgpu_ras_eeprom_control *control,
-				unsigned char *buf)
+static int __write_table_header(struct amdgpu_ras_eeprom_control *control)
 {
-	int ret = 0;
+	u8 buf[RAS_TABLE_HEADER_SIZE];
 	struct amdgpu_device *adev = to_amdgpu_device(control);
+	int res;
 
+	memset(buf, 0, sizeof(buf));
 	__encode_table_header_to_buf(&control->tbl_hdr, buf);
 
 	/* i2c may be unstable in gpu reset */
 	down_read(&adev->reset_sem);
-	ret = amdgpu_eeprom_write(&adev->pm.smu_i2c,
-				  control->i2c_address + RAS_HDR_START,
+	res = amdgpu_eeprom_write(&adev->pm.smu_i2c,
+				  control->i2c_address +
+				  control->ras_header_offset,
 				  buf, RAS_TABLE_HEADER_SIZE);
 	up_read(&adev->reset_sem);
 
-	if (ret < 1)
-		DRM_ERROR("Failed to write EEPROM table header, ret:%d", ret);
+	if (res < 0) {
+		DRM_ERROR("Failed to write EEPROM table header:%d", res);
+	} else if (res < RAS_TABLE_HEADER_SIZE) {
+		DRM_ERROR("Short write:%d out of %d\n",
+			  res, RAS_TABLE_HEADER_SIZE);
+		res = -EIO;
+	} else {
+		res = 0;
+	}
 
-	return ret;
+	return res;
 }
 
 static u8 __calc_hdr_byte_sum(const struct amdgpu_ras_eeprom_control *control)
 {
-	int i;
-	u8 hdr_sum = 0;
-	u8  *p;
+	int ii;
+	u8  *pp, csum;
 	size_t sz;
 
 	/* Header checksum, skip checksum field in the calculation */
 	sz = sizeof(control->tbl_hdr) - sizeof(control->tbl_hdr.checksum);
-	p = (u8 *) &control->tbl_hdr;
-	for (i = 0; i < sz; i++, p++)
-		hdr_sum += *p;
-
-	return hdr_sum;
-}
-
-static u8 __calc_recs_byte_sum(const struct eeprom_table_record *record,
-			       const int num)
-{
-	int i, j;
-	u8  tbl_sum = 0;
-
-	if (!record)
-		return 0;
-
-	/* Records checksum */
-	for (i = 0; i < num; i++) {
-		u8 *p = (u8 *) &record[i];
-
-		for (j = 0; j < sizeof(*record); j++, p++)
-			tbl_sum += *p;
-	}
+	pp = (u8 *) &control->tbl_hdr;
+	csum = 0;
+	for (ii = 0; ii < sz; ii++, pp++)
+		csum += *pp;
 
-	return tbl_sum;
-}
-
-static inline u8
-__calc_tbl_byte_sum(struct amdgpu_ras_eeprom_control *control,
-		    struct eeprom_table_record *records, int num)
-{
-	return __calc_hdr_byte_sum(control) +
-		__calc_recs_byte_sum(records, num);
-}
-
-static void __update_tbl_checksum(struct amdgpu_ras_eeprom_control *control,
-				  struct eeprom_table_record *records, int num)
-{
-	u8 v;
-
-	control->tbl_byte_sum = __calc_tbl_byte_sum(control, records, num);
-	/* Avoid 32-bit sign extension. */
-	v = -control->tbl_byte_sum;
-	control->tbl_hdr.checksum = v;
-}
-
-static bool __verify_tbl_checksum(struct amdgpu_ras_eeprom_control *control,
-				  struct eeprom_table_record *records,
-				  int num)
-{
-	u8 result;
-
-	control->tbl_byte_sum = __calc_tbl_byte_sum(control, records, num);
-
-	result = (u8)control->tbl_hdr.checksum + control->tbl_byte_sum;
-	if (result) {
-		DRM_WARN("RAS table checksum mismatch: stored:0x%02X wants:0x%02hhX",
-			 control->tbl_hdr.checksum,
-			 -control->tbl_byte_sum);
-		return false;
-	}
-
-	return true;
+	return csum;
 }
 
 static int amdgpu_ras_eeprom_correct_header_tag(
 	struct amdgpu_ras_eeprom_control *control,
 	uint32_t header)
 {
-	unsigned char buf[RAS_TABLE_HEADER_SIZE];
 	struct amdgpu_ras_eeprom_table_header *hdr = &control->tbl_hdr;
-	int ret = 0;
+	u8 *hh;
+	int res;
+	u8 csum;
 
-	memset(buf, 0, RAS_TABLE_HEADER_SIZE);
+	csum = -hdr->checksum;
 
+	hh = (void *) &hdr->header;
+	csum -= (hh[0] + hh[1] + hh[2] + hh[3]);
+	hh = (void *) &header;
+	csum += hh[0] + hh[1] + hh[2] + hh[3];
+	csum = -csum;
 	mutex_lock(&control->ras_tbl_mutex);
 	hdr->header = header;
-	ret = __write_table_header(control, buf);
+	hdr->checksum = csum;
+	res = __write_table_header(control);
 	mutex_unlock(&control->ras_tbl_mutex);
 
-	return ret;
+	return res;
 }
 
+/**
+ * amdgpu_ras_eeprom_reset_table -- Reset the RAS EEPROM table
+ * @control: pointer to control structure
+ *
+ * Reset the contents of the header of the RAS EEPROM table.
+ * Return 0 on success, -errno on error.
+ */
 int amdgpu_ras_eeprom_reset_table(struct amdgpu_ras_eeprom_control *control)
 {
-	unsigned char buf[RAS_TABLE_HEADER_SIZE] = { 0 };
 	struct amdgpu_ras_eeprom_table_header *hdr = &control->tbl_hdr;
-	int ret = 0;
+	u8 csum;
+	int res;
 
 	mutex_lock(&control->ras_tbl_mutex);
 
@@ -267,83 +250,23 @@ int amdgpu_ras_eeprom_reset_table(struct amdgpu_ras_eeprom_control *control)
 	hdr->first_rec_offset = RAS_RECORD_START;
 	hdr->tbl_size = RAS_TABLE_HEADER_SIZE;
 
-	__update_tbl_checksum(control, NULL, 0);
-	control->next_addr = RAS_RECORD_START;
-	ret = __write_table_header(control, buf);
-
-	mutex_unlock(&control->ras_tbl_mutex);
-
-	return ret;
-
-}
-
-int amdgpu_ras_eeprom_init(struct amdgpu_ras_eeprom_control *control,
-			   bool *exceed_err_limit)
-{
-	int ret = 0;
-	struct amdgpu_device *adev = to_amdgpu_device(control);
-	unsigned char buf[RAS_TABLE_HEADER_SIZE] = { 0 };
-	struct amdgpu_ras_eeprom_table_header *hdr = &control->tbl_hdr;
-	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
-
-	*exceed_err_limit = false;
-
-	if (!__is_ras_eeprom_supported(adev))
-		return 0;
+	csum = __calc_hdr_byte_sum(control);
+	csum = -csum;
+	hdr->checksum = csum;
+	res = __write_table_header(control);
 
-	/* Verify i2c adapter is initialized */
-	if (!adev->pm.smu_i2c.algo)
-		return -ENOENT;
+	control->ras_num_recs = 0;
+	control->ras_fri = 0;
 
-	if (!__get_eeprom_i2c_addr(adev, control))
-		return -EINVAL;
-
-	mutex_init(&control->ras_tbl_mutex);
-
-	/* Read/Create table header from EEPROM address 0 */
-	ret = amdgpu_eeprom_read(&adev->pm.smu_i2c,
-				 control->i2c_address + RAS_HDR_START,
-				 buf, RAS_TABLE_HEADER_SIZE);
-	if (ret < 1) {
-		DRM_ERROR("Failed to read EEPROM table header, ret:%d", ret);
-		return ret;
-	}
-
-	__decode_table_header_from_buf(hdr, buf);
-
-	if (hdr->header == RAS_TABLE_HDR_VAL) {
-		control->ras_num_recs = (hdr->tbl_size - RAS_TABLE_HEADER_SIZE) /
-				    RAS_TABLE_RECORD_SIZE;
-		control->tbl_byte_sum = __calc_hdr_byte_sum(control);
-		control->next_addr = RAS_RECORD_START;
-
-		DRM_DEBUG_DRIVER("Found existing EEPROM table with %d records",
-				 control->ras_num_recs);
-
-	} else if ((hdr->header == RAS_TABLE_HDR_BAD) &&
-			(amdgpu_bad_page_threshold != 0)) {
-		if (ras->bad_page_cnt_threshold > control->ras_num_recs) {
-			dev_info(adev->dev, "Using one valid bigger bad page "
-				"threshold and correcting eeprom header tag.\n");
-			ret = amdgpu_ras_eeprom_correct_header_tag(control,
-							RAS_TABLE_HDR_VAL);
-		} else {
-			*exceed_err_limit = true;
-			dev_err(adev->dev, "Exceeding the bad_page_threshold parameter, "
-				"disabling the GPU.\n");
-		}
-	} else {
-		DRM_INFO("Creating new EEPROM table");
-
-		ret = amdgpu_ras_eeprom_reset_table(control);
-	}
+	mutex_unlock(&control->ras_tbl_mutex);
 
-	return ret > 0 ? 0 : -EIO;
+	return res;
 }
 
-static void __encode_table_record_to_buf(struct amdgpu_ras_eeprom_control *control,
-					 struct eeprom_table_record *record,
-					 unsigned char *buf)
+static void
+__encode_table_record_to_buf(struct amdgpu_ras_eeprom_control *control,
+			     struct eeprom_table_record *record,
+			     unsigned char *buf)
 {
 	__le64 tmp = 0;
 	int i = 0;
@@ -368,9 +291,10 @@ static void __encode_table_record_to_buf(struct amdgpu_ras_eeprom_control *contr
 	memcpy(buf + i, &tmp, 6);
 }
 
-static void __decode_table_record_from_buf(struct amdgpu_ras_eeprom_control *control,
-					   struct eeprom_table_record *record,
-					   unsigned char *buf)
+static void
+__decode_table_record_from_buf(struct amdgpu_ras_eeprom_control *control,
+			       struct eeprom_table_record *record,
+			       unsigned char *buf)
 {
 	__le64 tmp = 0;
 	int i =  0;
@@ -395,22 +319,6 @@ static void __decode_table_record_from_buf(struct amdgpu_ras_eeprom_control *con
 	record->retired_page = (le64_to_cpu(tmp) & 0xffffffffffff);
 }
 
-/*
- * When reaching end of EEPROM memory jump back to 0 record address
- */
-static uint32_t __correct_eeprom_dest_address(uint32_t curr_address)
-{
-	u32 next_address = curr_address + RAS_TABLE_RECORD_SIZE;
-
-	/* When all EEPROM memory used jump back to 0 address */
-	if (next_address >= RAS_TBL_SIZE_BYTES) {
-		DRM_INFO("Reached end of EEPROM memory, wrap around to 0.");
-		return RAS_RECORD_START;
-	}
-
-	return curr_address;
-}
-
 bool amdgpu_ras_eeprom_check_err_threshold(struct amdgpu_device *adev)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
@@ -427,148 +335,530 @@ bool amdgpu_ras_eeprom_check_err_threshold(struct amdgpu_device *adev)
 
 	if (con->eeprom_control.tbl_hdr.header == RAS_TABLE_HDR_BAD) {
 		dev_warn(adev->dev, "This GPU is in BAD status.");
-		dev_warn(adev->dev, "Please retire it or setting one bigger "
-				"threshold value when reloading driver.\n");
+		dev_warn(adev->dev, "Please retire it or set a larger "
+			 "threshold value when reloading driver.\n");
 		return true;
 	}
 
 	return false;
 }
 
-static int amdgpu_ras_eeprom_xfer(struct amdgpu_ras_eeprom_control *control,
-				  struct eeprom_table_record *records,
-				  const u32 num, bool write)
+/**
+ * __amdgpu_ras_eeprom_write -- write indexed from buffer to EEPROM
+ * @control: pointer to control structure
+ * @buf: pointer to buffer containing data to write
+ * @fri: start writing at this index
+ * @num: number of records to write
+ *
+ * The caller must hold the table mutex in @control.
+ * Return 0 on success, -errno otherwise.
+ */
+static int __amdgpu_ras_eeprom_write(struct amdgpu_ras_eeprom_control *control,
+				     u8 *buf, const u32 fri, const u32 num)
 {
-	int i, ret = 0;
-	unsigned char *bufs, *buf;
-	struct eeprom_table_record *record;
 	struct amdgpu_device *adev = to_amdgpu_device(control);
-	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
+	u32 buf_size;
+	int res;
 
-	if (!__is_ras_eeprom_supported(adev))
-		return 0;
+	/* i2c may be unstable in gpu reset */
+	down_read(&adev->reset_sem);
+	buf_size = num * RAS_TABLE_RECORD_SIZE;
+	res = amdgpu_eeprom_write(&adev->pm.smu_i2c,
+				  control->i2c_address +
+				  RAS_INDEX_TO_OFFSET(control, fri),
+				  buf, buf_size);
+	up_read(&adev->reset_sem);
+	if (res < 0) {
+		DRM_ERROR("Writing %d EEPROM table records error:%d",
+			  num, res);
+	} else if (res < buf_size) {
+		/* Short write, return error.
+		 */
+		DRM_ERROR("Wrote %d records out of %d",
+			  res / RAS_TABLE_RECORD_SIZE, num);
+		res = -EIO;
+	} else {
+		res = 0;
+	}
+
+	return res;
+}
 
-	bufs = kcalloc(num, RAS_TABLE_RECORD_SIZE, GFP_KERNEL);
-	if (!bufs)
+static int
+amdgpu_ras_eeprom_append_table(struct amdgpu_ras_eeprom_control *control,
+			       struct eeprom_table_record *record,
+			       const u32 num)
+{
+	u32 a, b, i;
+	u8 *buf, *pp;
+	int res;
+
+	buf = kcalloc(num, RAS_TABLE_RECORD_SIZE, GFP_KERNEL);
+	if (!buf)
 		return -ENOMEM;
 
-	mutex_lock(&control->ras_tbl_mutex);
+	/* Encode all of them in one go.
+	 */
+	pp = buf;
+	for (i = 0; i < num; i++, pp += RAS_TABLE_RECORD_SIZE)
+		__encode_table_record_to_buf(control, &record[i], pp);
+
+	/* a, first record index to write into.
+	 * b, last record index to write into.
+	 * a = first index to read (fri) + number of records in the table,
+	 * b = a + @num - 1.
+	 * Let N = control->ras_max_num_record_count, then we have,
+	 * case 0: 0 <= a <= b < N,
+	 *   just append @num records starting at a;
+	 * case 1: 0 <= a < N <= b,
+	 *   append (N - a) records starting at a, and
+	 *   append the remainder,  b % N + 1, starting at 0.
+	 * case 2: 0 <= fri < N <= a <= b, then modulo N we get two subcases,
+	 * case 2a: 0 <= a <= b < N
+	 *   append num records starting at a; and fix fri if b overwrote it,
+	 *   and since a <= b, if b overwrote it then a must've also,
+	 *   and if b didn't overwrite it, then a didn't also.
+	 * case 2b: 0 <= b < a < N
+	 *   write num records starting at a, which wraps around 0=N
+	 *   and overwrite fri unconditionally. Now from case 2a,
+	 *   this means that b eclipsed fri to overwrite it and wrap
+	 *   around 0 again, i.e. b = 2N+r pre modulo N, so we unconditionally
+	 *   set fri = b + 1 (mod N).
+	 * Now, since fri is updated in every case, except the trivial case 0,
+	 * the number of records present in the table after writing, is,
+	 * num_recs - 1 = b - fri (mod N), and we take the positive value,
+	 * by adding an arbitrary multiple of N before taking the modulo N
+	 * as shown below.
+	 */
+	a = control->ras_fri + control->ras_num_recs;
+	b = a + num  - 1;
+	if (b < control->ras_max_record_count) {
+		res = __amdgpu_ras_eeprom_write(control, buf, a, num);
+	} else if (a < control->ras_max_record_count) {
+		u32 g0, g1;
+
+		g0 = control->ras_max_record_count - a;
+		g1 = b % control->ras_max_record_count + 1;
+		res = __amdgpu_ras_eeprom_write(control, buf, a, g0);
+		if (res)
+			goto Out;
+		res = __amdgpu_ras_eeprom_write(control,
+						buf + g0 * RAS_TABLE_RECORD_SIZE,
+						0, g1);
+		if (res)
+			goto Out;
+		if (g1 > control->ras_fri)
+			control->ras_fri = g1 % control->ras_max_record_count;
+	} else {
+		a %= control->ras_max_record_count;
+		b %= control->ras_max_record_count;
+
+		if (a <= b) {
+			/* Note that, b - a + 1 = num. */
+			res = __amdgpu_ras_eeprom_write(control, buf, a, num);
+			if (res)
+				goto Out;
+			if (b >= control->ras_fri)
+				control->ras_fri = (b + 1) % control->ras_max_record_count;
+		} else {
+			u32 g0, g1;
+
+			/* b < a, which means, we write from
+			 * a to the end of the table, and from
+			 * the start of the table to b.
+			 */
+			g0 = control->ras_max_record_count - a;
+			g1 = b + 1;
+			res = __amdgpu_ras_eeprom_write(control, buf, a, g0);
+			if (res)
+				goto Out;
+			res = __amdgpu_ras_eeprom_write(control,
+							buf + g0 * RAS_TABLE_RECORD_SIZE,
+							0, g1);
+			if (res)
+				goto Out;
+			control->ras_fri = g1 % control->ras_max_record_count;
+		}
+	}
+	control->ras_num_recs = 1 + (control->ras_max_record_count + b
+				     - control->ras_fri)
+		% control->ras_max_record_count;
+Out:
+	kfree(buf);
+	return res;
+}
 
-	/*
-	 * If saved bad pages number exceeds the bad page threshold for
-	 * the whole VRAM, update table header to mark the BAD GPU tag
-	 * and schedule one ras recovery after eeprom write is done,
-	 * this can avoid the missing for latest records.
-	 *
-	 * This new header will be picked up and checked in the bootup
-	 * by ras recovery, which may break bootup process to notify
-	 * user this GPU is in bad state and to retire such GPU for
-	 * further check.
+static int
+amdgpu_ras_eeprom_update_header(struct amdgpu_ras_eeprom_control *control)
+{
+	struct amdgpu_device *adev = to_amdgpu_device(control);
+	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
+	u8 *buf, *pp, csum;
+	u32 buf_size;
+	int res;
+
+	/* Modify the header if it exceeds.
 	 */
-	if (write && (amdgpu_bad_page_threshold != 0) &&
-		((control->ras_num_recs + num) >= ras->bad_page_cnt_threshold)) {
+	if (amdgpu_bad_page_threshold != 0 &&
+	    control->ras_num_recs >= ras->bad_page_cnt_threshold) {
 		dev_warn(adev->dev,
-			"Saved bad pages(%d) reaches threshold value(%d).\n",
-			control->ras_num_recs + num, ras->bad_page_cnt_threshold);
+			"Saved bad pages %d reaches threshold value %d\n",
+			control->ras_num_recs, ras->bad_page_cnt_threshold);
 		control->tbl_hdr.header = RAS_TABLE_HDR_BAD;
 	}
 
-	/* In case of overflow just start from beginning to not lose newest records */
-	if (write &&
-	    (control->next_addr +
-	     RAS_TABLE_RECORD_SIZE * num >= RAS_TBL_SIZE_BYTES))
-		control->next_addr = RAS_RECORD_START;
+	control->tbl_hdr.version = RAS_TABLE_VER;
+	control->tbl_hdr.first_rec_offset = RAS_INDEX_TO_OFFSET(control, control->ras_fri);
+	control->tbl_hdr.tbl_size = RAS_TABLE_HEADER_SIZE + control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
+	control->tbl_hdr.checksum = 0;
+
+	buf_size = control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
+	buf = kcalloc(control->ras_num_recs, RAS_TABLE_RECORD_SIZE, GFP_KERNEL);
+	if (!buf) {
+		DRM_ERROR("allocating memory for table of size %d bytes failed\n",
+			  control->tbl_hdr.tbl_size);
+		res = -ENOMEM;
+		goto Out;
+	}
 
-	/*
-	 * TODO Currently makes EEPROM writes for each record, this creates
-	 * internal fragmentation. Optimized the code to do full page write of
-	 * 256b
+	down_read(&adev->reset_sem);
+	res = amdgpu_eeprom_read(&adev->pm.smu_i2c,
+				 control->i2c_address +
+				 control->ras_record_offset,
+				 buf, buf_size);
+	up_read(&adev->reset_sem);
+	if (res < 0) {
+		DRM_ERROR("EEPROM failed reading records:%d\n",
+			  res);
+		goto Out;
+	} else if (res < buf_size) {
+		DRM_ERROR("EEPROM read %d out of %d bytes\n",
+			  res, buf_size);
+		res = -EIO;
+		goto Out;
+	}
+
+	/* Recalc the checksum.
 	 */
-	for (i = 0; i < num; i++) {
-		buf = &bufs[i * RAS_TABLE_RECORD_SIZE];
-		record = &records[i];
+	csum = 0;
+	for (pp = buf; pp < buf + buf_size; pp++)
+		csum += *pp;
+
+	csum += __calc_hdr_byte_sum(control);
+	/* avoid sign extension when assigning to "checksum" */
+	csum = -csum;
+	control->tbl_hdr.checksum = csum;
+	res = __write_table_header(control);
+Out:
+	kfree(buf);
+	return res;
+}
+
+/**
+ * amdgpu_ras_eeprom_append -- append records to the EEPROM RAS table
+ * @control: pointer to control structure
+ * @record: array of records to append
+ * @num: number of records in @record array
+ *
+ * Append @num records to the table, calculate the checksum and write
+ * the table back to EEPROM. The maximum number of records that
+ * can be appended is between 1 and control->ras_max_record_count,
+ * regardless of how many records are already stored in the table.
+ *
+ * Return 0 on success or if EEPROM is not supported, -errno on error.
+ */
+int amdgpu_ras_eeprom_append(struct amdgpu_ras_eeprom_control *control,
+			     struct eeprom_table_record *record,
+			     const u32 num)
+{
+	struct amdgpu_device *adev = to_amdgpu_device(control);
+	int res;
+
+	if (!__is_ras_eeprom_supported(adev))
+		return 0;
 
-		control->next_addr = __correct_eeprom_dest_address(control->next_addr);
+	if (num == 0) {
+		DRM_ERROR("will not append 0 records\n");
+		return -EINVAL;
+	} else if (num > control->ras_max_record_count) {
+		DRM_ERROR("cannot append %d records than the size of table %d\n",
+			  num, control->ras_max_record_count);
+		return -EINVAL;
+	}
+
+	mutex_lock(&control->ras_tbl_mutex);
 
-		/* EEPROM table content is stored in LE format */
-		if (write)
-			__encode_table_record_to_buf(control, record, buf);
+	res = amdgpu_ras_eeprom_append_table(control, record, num);
+	if (!res)
+		res = amdgpu_ras_eeprom_update_header(control);
 
-		/* i2c may be unstable in gpu reset */
-		down_read(&adev->reset_sem);
-		ret = amdgpu_eeprom_xfer(&adev->pm.smu_i2c,
-					 control->i2c_address + control->next_addr,
-					 buf, RAS_TABLE_RECORD_SIZE, !write);
-		up_read(&adev->reset_sem);
+	mutex_unlock(&control->ras_tbl_mutex);
+	return res;
+}
 
-		if (ret < 1) {
-			DRM_ERROR("Failed to process EEPROM table records, ret:%d", ret);
+/**
+ * __amdgpu_ras_eeprom_read -- read indexed from EEPROM into buffer
+ * @control: pointer to control structure
+ * @buf: pointer to buffer to read into
+ * @fri: first record index, start reading at this index, absolute index
+ * @num: number of records to read
+ *
+ * The caller must hold the table mutex in @control.
+ * Return 0 on success, -errno otherwise.
+ */
+static int __amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
+				    u8 *buf, const u32 fri, const u32 num)
+{
+	struct amdgpu_device *adev = to_amdgpu_device(control);
+	u32 buf_size;
+	int res;
 
-			/* TODO Restore prev next EEPROM address ? */
-			goto free_buf;
-		}
-		/*
-		 * The destination EEPROM address might need to be corrected to account
-		 * for page or entire memory wrapping
+	/* i2c may be unstable in gpu reset */
+	down_read(&adev->reset_sem);
+	buf_size = num * RAS_TABLE_RECORD_SIZE;
+	res = amdgpu_eeprom_read(&adev->pm.smu_i2c,
+				 control->i2c_address +
+				 RAS_INDEX_TO_OFFSET(control, fri),
+				 buf, buf_size);
+	up_read(&adev->reset_sem);
+	if (res < 0) {
+		DRM_ERROR("Reading %d EEPROM table records error:%d",
+			  num, res);
+	} else if (res < buf_size) {
+		/* Short read, return error.
 		 */
-		control->next_addr += RAS_TABLE_RECORD_SIZE;
+		DRM_ERROR("Read %d records out of %d",
+			  res / RAS_TABLE_RECORD_SIZE, num);
+		res = -EIO;
+	} else {
+		res = 0;
 	}
 
-	if (!write) {
-		for (i = 0; i < num; i++) {
-			buf = &bufs[i * RAS_TABLE_RECORD_SIZE];
-			record = &records[i];
+	return res;
+}
 
-			__decode_table_record_from_buf(control, record, buf);
-		}
+/**
+ * amdgpu_ras_eeprom_read -- read EEPROM
+ * @control: pointer to control structure
+ * @record: array of records to read into
+ * @num: number of records in @record
+ *
+ * Reads num records from the RAS table in EEPROM and
+ * writes the data into @record array.
+ *
+ * Returns 0 on success, -errno on error.
+ */
+int amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
+			   struct eeprom_table_record *record,
+			   const u32 num)
+{
+	struct amdgpu_device *adev = to_amdgpu_device(control);
+	int i, res;
+	u8 *buf, *pp;
+	u32 g0, g1;
+
+	if (!__is_ras_eeprom_supported(adev))
+		return 0;
+
+	if (num == 0) {
+		DRM_ERROR("will not read 0 records\n");
+		return -EINVAL;
+	} else if (num > control->ras_num_recs) {
+		DRM_ERROR("too many records to read:%d available:%d\n",
+			  num, control->ras_num_recs);
+		return -EINVAL;
 	}
 
-	if (write) {
-		/*
-		 * Update table header with size and CRC and account for table
-		 * wrap around where the assumption is that we treat it as empty
-		 * table
-		 *
-		 * TODO - Check the assumption is correct
-		 */
-		control->ras_num_recs += num;
-		control->ras_num_recs %= RAS_MAX_RECORD_COUNT;
-		control->tbl_hdr.tbl_size += RAS_TABLE_RECORD_SIZE * num;
-		if (control->tbl_hdr.tbl_size > RAS_TBL_SIZE_BYTES)
-			control->tbl_hdr.tbl_size = RAS_TABLE_HEADER_SIZE +
-			control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
-
-		__update_tbl_checksum(control, records, num);
-		__write_table_header(control, bufs);
-	} else if (!__verify_tbl_checksum(control, records, num)) {
-		DRM_WARN("EEPROM Table checksum mismatch!");
-		/* TODO Uncomment when EEPROM read/write is relliable */
-		/* ret = -EIO; */
+	buf = kcalloc(num, RAS_TABLE_RECORD_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/* Determine how many records to read, from the first record
+	 * index, fri, to the end of the table, and from the beginning
+	 * of the table, such that the total number of records is
+	 * @num, and we handle wrap around when fri > 0 and
+	 * fri + num > RAS_MAX_RECORD_COUNT.
+	 *
+	 * First we compute the index of the last element
+	 * which would be fetched from each region,
+	 * g0 is in [fri, fri + num - 1], and
+	 * g1 is in [0, RAS_MAX_RECORD_COUNT - 1].
+	 * Then, if g0 < RAS_MAX_RECORD_COUNT, the index of
+	 * the last element to fetch, we set g0 to _the number_
+	 * of elements to fetch, @num, since we know that the last
+	 * indexed to be fetched does not exceed the table.
+	 *
+	 * If, however, g0 >= RAS_MAX_RECORD_COUNT, then
+	 * we set g0 to the number of elements to read
+	 * until the end of the table, and g1 to the number of
+	 * elements to read from the beginning of the table.
+	 */
+	g0 = control->ras_fri + num - 1;
+	g1 = g0 % control->ras_max_record_count;
+	if (g0 < control->ras_max_record_count) {
+		g0 = num;
+		g1 = 0;
+	} else {
+		g0 = control->ras_max_record_count - control->ras_fri;
+		g1 += 1;
+	}
+
+	mutex_lock(&control->ras_tbl_mutex);
+	res = __amdgpu_ras_eeprom_read(control, buf, control->ras_fri, g0);
+	if (res)
+		goto Out;
+	if (g1) {
+		res = __amdgpu_ras_eeprom_read(control,
+					       buf + g0 * RAS_TABLE_RECORD_SIZE,
+					       0, g1);
+		if (res)
+			goto Out;
 	}
 
-free_buf:
-	kfree(bufs);
+	res = 0;
 
+	/* Read up everything? Then transform.
+	 */
+	pp = buf;
+	for (i = 0; i < num; i++, pp += RAS_TABLE_RECORD_SIZE)
+		__decode_table_record_from_buf(control, &record[i], pp);
+Out:
+	kfree(buf);
 	mutex_unlock(&control->ras_tbl_mutex);
 
-	return ret == num ? 0 : -EIO;
+	return res;
 }
 
-int amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
-			   struct eeprom_table_record *records,
-			   const u32 num)
+inline uint32_t amdgpu_ras_eeprom_max_record_count(void)
 {
-	return amdgpu_ras_eeprom_xfer(control, records, num, false);
+	return RAS_MAX_RECORD_COUNT;
 }
 
-int amdgpu_ras_eeprom_write(struct amdgpu_ras_eeprom_control *control,
-			    struct eeprom_table_record *records,
-			    const u32 num)
+/**
+ * __verify_ras_table_checksum -- verify the RAS EEPROM table checksum
+ * @control: pointer to control structure
+ *
+ * Check the checksum of the stored in EEPROM RAS table.
+ *
+ * Return 0 if the checksum is correct,
+ * positive if it is not correct, and
+ * -errno on I/O error.
+ */
+static int __verify_ras_table_checksum(struct amdgpu_ras_eeprom_control *control)
 {
-	return amdgpu_ras_eeprom_xfer(control, records, num, true);
+	struct amdgpu_device *adev = to_amdgpu_device(control);
+	int res;
+	u8  csum, *buf, *pp;
+	u32 buf_size;
+
+	buf_size = RAS_TABLE_HEADER_SIZE +
+		control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
+	buf = kzalloc(buf_size, GFP_KERNEL);
+	if (!buf) {
+		DRM_ERROR("Out of memory checking RAS table checksum.\n");
+		return -ENOMEM;
+	}
+
+	res = amdgpu_eeprom_read(&adev->pm.smu_i2c,
+				 control->i2c_address +
+				 control->ras_header_offset,
+				 buf, buf_size);
+	if (res < buf_size) {
+		DRM_ERROR("Partial read for checksum, res:%d\n", res);
+		/* On partial reads, return -EIO.
+		 */
+		if (res >= 0)
+			res = -EIO;
+		goto Out;
+	}
+
+	csum = 0;
+	for (pp = buf; pp < buf + buf_size; pp++)
+		csum += *pp;
+Out:
+	kfree(buf);
+	return res < 0 ? res : csum;
 }
 
-inline uint32_t amdgpu_ras_eeprom_max_record_count(void)
+int amdgpu_ras_eeprom_init(struct amdgpu_ras_eeprom_control *control,
+			   bool *exceed_err_limit)
 {
-	return RAS_MAX_RECORD_COUNT;
+	struct amdgpu_device *adev = to_amdgpu_device(control);
+	unsigned char buf[RAS_TABLE_HEADER_SIZE] = { 0 };
+	struct amdgpu_ras_eeprom_table_header *hdr = &control->tbl_hdr;
+	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
+	int res;
+
+	*exceed_err_limit = false;
+
+	if (!__is_ras_eeprom_supported(adev))
+		return 0;
+
+	/* Verify i2c adapter is initialized */
+	if (!adev->pm.smu_i2c.algo)
+		return -ENOENT;
+
+	if (!__get_eeprom_i2c_addr(adev, control))
+		return -EINVAL;
+
+	control->ras_header_offset = RAS_HDR_START;
+	control->ras_record_offset = RAS_RECORD_START;
+	control->ras_max_record_count  = RAS_MAX_RECORD_COUNT;
+	mutex_init(&control->ras_tbl_mutex);
+
+	/* Read the table header from EEPROM address */
+	res = amdgpu_eeprom_read(&adev->pm.smu_i2c,
+				 control->i2c_address + control->ras_header_offset,
+				 buf, RAS_TABLE_HEADER_SIZE);
+	if (res < RAS_TABLE_HEADER_SIZE) {
+		DRM_ERROR("Failed to read EEPROM table header, res:%d", res);
+		return res >= 0 ? -EIO : res;
+	}
+
+	__decode_table_header_from_buf(hdr, buf);
+
+	control->ras_num_recs = RAS_NUM_RECS(hdr);
+	control->ras_fri = RAS_OFFSET_TO_INDEX(control, hdr->first_rec_offset);
+
+	if (hdr->header == RAS_TABLE_HDR_VAL) {
+		DRM_DEBUG_DRIVER("Found existing EEPROM table with %d records",
+				 control->ras_num_recs);
+		res = __verify_ras_table_checksum(control);
+		if (res)
+			DRM_ERROR("RAS table incorrect checksum or error:%d\n",
+				  res);
+	} else if (hdr->header == RAS_TABLE_HDR_BAD &&
+		   amdgpu_bad_page_threshold != 0) {
+		res = __verify_ras_table_checksum(control);
+		if (res)
+			DRM_ERROR("RAS Table incorrect checksum or error:%d\n",
+				  res);
+		if (ras->bad_page_cnt_threshold > control->ras_num_recs) {
+			/* This means that, the threshold was increased since
+			 * the last time the system was booted, and now,
+			 * ras->bad_page_cnt_threshold - control->num_recs > 0,
+			 * so that at least one more record can be saved,
+			 * before the page count threshold is reached.
+			 */
+			dev_info(adev->dev,
+				 "records:%d threshold:%d, resetting "
+				 "RAS table header signature",
+				 control->ras_num_recs,
+				 ras->bad_page_cnt_threshold);
+			res = amdgpu_ras_eeprom_correct_header_tag(control,
+								   RAS_TABLE_HDR_VAL);
+		} else {
+			*exceed_err_limit = true;
+			dev_err(adev->dev,
+				"RAS records:%d exceed threshold:%d, "
+				"maybe retire this GPU?",
+				control->ras_num_recs, ras->bad_page_cnt_threshold);
+		}
+	} else {
+		DRM_INFO("Creating a new EEPROM table");
+
+		res = amdgpu_ras_eeprom_reset_table(control);
+	}
+
+	return res < 0 ? res : 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
index 67a7ec3e6c2296..e26af82ea63a44 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
@@ -28,7 +28,7 @@
 
 struct amdgpu_device;
 
-enum amdgpu_ras_eeprom_err_type{
+enum amdgpu_ras_eeprom_err_type {
 	AMDGPU_RAS_EEPROM_ERR_PLACE_HOLDER,
 	AMDGPU_RAS_EEPROM_ERR_RECOVERABLE,
 	AMDGPU_RAS_EEPROM_ERR_NON_RECOVERABLE
@@ -51,17 +51,34 @@ struct amdgpu_ras_eeprom_control {
 	 */
 	u32 i2c_address;
 
-	uint32_t next_addr;
+	/* The byte offset off of @i2c_address
+	 * where the table header is found,
+	 * and where the records start--always
+	 * right after the header.
+	 */
+	u32 ras_header_offset;
+	u32 ras_record_offset;
 
 	/* Number of records in the table.
 	 */
-	unsigned int ras_num_recs;
+	u32 ras_num_recs;
+
+	/* First record index to read, 0-based.
+	 * Range is [0, num_recs-1]. This is
+	 * an absolute index, starting right after
+	 * the table header.
+	 */
+	u32 ras_fri;
+
+	/* Maximum possible number of records
+	 * we could store, i.e. the maximum capacity
+	 * of the table.
+	 */
+	u32 ras_max_record_count;
 
 	/* Protect table access via this mutex.
 	 */
 	struct mutex ras_tbl_mutex;
-
-	u8 tbl_byte_sum;
 };
 
 /*
@@ -91,6 +108,7 @@ struct eeprom_table_record {
 
 int amdgpu_ras_eeprom_init(struct amdgpu_ras_eeprom_control *control,
 			   bool *exceed_err_limit);
+
 int amdgpu_ras_eeprom_reset_table(struct amdgpu_ras_eeprom_control *control);
 
 bool amdgpu_ras_eeprom_check_err_threshold(struct amdgpu_device *adev);
@@ -98,8 +116,8 @@ bool amdgpu_ras_eeprom_check_err_threshold(struct amdgpu_device *adev);
 int amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
 			   struct eeprom_table_record *records, const u32 num);
 
-int amdgpu_ras_eeprom_write(struct amdgpu_ras_eeprom_control *control,
-			    struct eeprom_table_record *records, const u32 num);
+int amdgpu_ras_eeprom_append(struct amdgpu_ras_eeprom_control *control,
+			     struct eeprom_table_record *records, const u32 num);
 
 inline uint32_t amdgpu_ras_eeprom_max_record_count(void);
 
-- 
2.32.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
