Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A66511B1E6
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Dec 2019 16:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9A26EB7C;
	Wed, 11 Dec 2019 15:33:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C4E6EB7A
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Dec 2019 15:33:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdDQ3MpW+vfd0+TPoRXyfgV9VKClAYBNCZn1q2+a9aa0giMg95ZATxwoLoN/R3JxK584z67KQksJ8vIRCRbduNLKAcLkeOucI2WVE7ibF3xfUIzKNO0eu6xLk3F+ELgyZn+E8OUVogYF/uARlwAGCqbtluwJTbagIIuByWu9hAs11dyLYqUBUjPqRVzXTEb9jE53NFXwTo3BBVbB7QPQwUVaf3EcxYRZ4we/OzfZUbtA2UBDBTn2G4G8PRvszqONBdZLKCstSUtjaRizsaoLKXdKKPBYqf10sFJlr7NCZDsy8hSltp2ZDL+RnlctrRzW529Gzjn4cw8v63p8n6zb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeN9THpRcvY/4KIIiZnnIHLSLSsw+2u4XFBEe1DKvqw=;
 b=PHggREkmq+TicT+XjSzRQuTsvfsfMuhlms9+F3CV8ecATNMpFK2+pn9Qt8haWp4TytP8YwBhnJD4JQVRquwQyP3+tIhwClQ019IvYxvQ0S0IiZF/Qe40AIoU71rxb8FXRXDvFqXaQwZwUmybZgqrlhovGrgqqVCswHDtzGaTdcmBGWWm2gZBGjEhNXgwMyTe5nXUaD1fambKkKj2z9/OsZC8HJje1YyQ3CzK6lTEQglNBzLJMcOsBZsmMBXt0ki024cwJOEAe5GxaqZ0ek6YSZjjtbS8bjphpiKMKocYb5qG6p6lD7ZNdY4YZVZlb4I7fd9C05DElxExGiEfSP499Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeN9THpRcvY/4KIIiZnnIHLSLSsw+2u4XFBEe1DKvqw=;
 b=U6S/3F2YiXseC1eZSu9yn2JHRnhCivK9iy6T35dE0Oe5DUeZQyeh0hJcyz08D4q30lYtMCsUq8UPd2tX6pAIABwMqF3GKzwOq5ws7LZNlcqa54WvpvNK//V5ECnH/VR6yBOLPaeWgv97SiJd7o5L0yTs7v0HZHsBWl8Awqppshg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (52.132.180.155) by
 MW2PR12MB2426.namprd12.prod.outlook.com (52.132.184.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Wed, 11 Dec 2019 15:33:24 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::3d1f:4c20:e980:6e69]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::3d1f:4c20:e980:6e69%5]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 15:33:24 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/39] drm/amd/display: Add definition for number of backlight
 data points
Date: Wed, 11 Dec 2019 10:32:22 -0500
Message-Id: <20191211153253.2291112-9-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191211153253.2291112-1-Rodrigo.Siqueira@amd.com>
References: <20191211153253.2291112-1-Rodrigo.Siqueira@amd.com>
X-ClientProxiedBy: YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20)
 To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fe3fb4fb-1d61-48c4-fef0-08d77e4f759a
X-MS-TrafficTypeDiagnostic: MW2PR12MB2426:|MW2PR12MB2426:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB24265DCCCD34C652F48BDD1D985A0@MW2PR12MB2426.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 024847EE92
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(199004)(189003)(86362001)(6512007)(1076003)(478600001)(54906003)(4326008)(6486002)(66556008)(66476007)(66946007)(2616005)(316002)(2906002)(81156014)(8676002)(26005)(36756003)(52116002)(8936002)(186003)(6916009)(81166006)(5660300002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2426;
 H:MW2PR12MB2524.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u9UADsClvg4pe+YwCDV/gHOSFCTMA8eQvbyXsxLYfAv8pT4MRjzMh+i4Ab6+yxwzkYoABXMDNEGtsCdfn/7avvindaBAA7OqQP779nghu52EQH8OPWkzELOj7awW/51GrvOhw+U1VJJvJrn0zNU0dtRJ8QBFT4ZJ+7Lc6b3+4aQyb4w/vyE6Oc6U4nZe9uPKM7kGsNX4gRREtTZU06w0xiqI4/59nCx8mwhgROxjfZLrVRY2fWffRGGCMu90Ji84BeNFKDjjoesXubiA4mL8NLwQldFVjfeWqWdNvWxsRfs/c9gu85JyUYXEu4Dc2sVxXLt3c/qNjMUasAcL8h8KC580cK4FKTUKRm2rOltmNSq0bnHWmbKfl+FAfVOixxjPLY/g+6ReD4dpE9Q5L1QZTfzMNxG4lREuPPwiSxedH85g1kNqlsfUlWR6ziKPsElE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3fb4fb-1d61-48c4-fef0-08d77e4f759a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 15:33:23.9511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7g7+x+T55Jqx8ujzULG3+u8LHOnXahj3wx2HpFm5aLS88n25yZvrzY10GSjU0yar5COlvUR95NemsfKCwEbiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2426
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
Cc: Sunpeng.Li@amd.com, Bhawanpreet.Lakha@amd.com, Harry.Wentland@amd.com,
 Camille Cho <Camille.Cho@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Camille Cho <Camille.Cho@amd.com>

[Why]
A hardcoded number is used today

[How]
Add definition for number of BL data points

Signed-off-by: Camille Cho <Camille.Cho@amd.com>
Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dm_services_types.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dm_services_types.h b/drivers/gpu/drm/amd/display/dc/dm_services_types.h
index a3d1be20dd9d..b52ba6ffabe1 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_services_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_services_types.h
@@ -220,6 +220,7 @@ struct dm_bl_data_point {
 };
 
 /* Total size of the structure should not exceed 256 bytes */
+#define BL_DATA_POINTS 99
 struct dm_acpi_atif_backlight_caps {
 	uint16_t size; /* Bytes 0-1 (2 bytes) */
 	uint16_t flags; /* Byted 2-3 (2 bytes) */
@@ -229,7 +230,7 @@ struct dm_acpi_atif_backlight_caps {
 	uint8_t  min_input_signal; /* Byte 7 */
 	uint8_t  max_input_signal; /* Byte 8 */
 	uint8_t  num_data_points; /* Byte 9 */
-	struct dm_bl_data_point data_points[99]; /* Bytes 10-207 (198 bytes)*/
+	struct dm_bl_data_point data_points[BL_DATA_POINTS]; /* Bytes 10-207 (198 bytes)*/
 };
 
 enum dm_acpi_display_type {
-- 
2.24.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
