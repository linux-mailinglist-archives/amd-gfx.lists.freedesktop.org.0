Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D83072EFAB9
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Jan 2021 22:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E7F6E8F1;
	Fri,  8 Jan 2021 21:50:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937366E8ED
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Jan 2021 21:50:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwUcgbmCEsKUYe1lpw1a7meCFxMmdjoi+5aNO4bvxjUWSnXYujUsXaXdIIcfp/NmU06ahVzD0R8Vq3uvmUzJVsvEaDrqlgQcQQ0vSacZyuamFhXUvnnb6wAmEW7Ro5HGRlI9vjoJNAnz3POeyxXODAeRO3JUtLWgUI8SECagzOQiU2m0QxmzVicqCb2cF2TM31Rv9DuZiCQDeBj3EwynQcuQlH4mu1jgwAI8ppj6DNx9/kqXqF7cEwGFlOsLDb/Medr8h190Wk0pFGSlpNlf1Sjh245eabNe1RDmi//s76EQ1jDvRazrugyB8Gcy4l/uPEvRtMeJyAogt0ckai6Frw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sxkblurjv1YtTTKp0niY9AKD8TutwSksN4n4hMEHLng=;
 b=HyKDPntEkRyWCEXS2rJTJqj7YRw3T9uqRbePDmOKLJ9hQir5WFEhdlDRNTFODr3DDZU4nRLczKVqJdIkNRIBIiaSq4kL9kTR6chcqwgk2YtQocj/xcsoeV3bodhmmURLFlIyhnLQa7WT3GgotNOdy+EE9Lrn32lCUO627dqKU3RRt7feJ3/CoMAGTqPor0OrmQnLBWU2oFb7daCMoL9em/DSyE/Q4nHFbwe3Iwmple26D7/kmE5HMm3WFhKhZJP334h+8gZQF547hAoiLxIPU5jUYFWU2GPtJgnc9cpoxtEiuoBADf1ZNVfy3iayMEDHLzO0IrUJsZWub/eeh/wjeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sxkblurjv1YtTTKp0niY9AKD8TutwSksN4n4hMEHLng=;
 b=v+ZSjaDS3oYoMFdmVAffcUF3ISaL7CFQ2B2/Y7d4TbTF5vEcKgJhtKTyXco83b6MUs4yi7SQhH/2rSXjz4UGI2Hb8Hils26yeID7ZcDn0Qb6gmqdqDPqAhGiB89WYn4rkTPC3nGjKwG2gaUYxwF+3bbJ/M6rc+OUhbVwAHaS/0c=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM5PR12MB1882.namprd12.prod.outlook.com (2603:10b6:3:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Fri, 8 Jan
 2021 21:50:45 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540%12]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 21:50:45 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/21] drm/amd/display: Remove unused P010 debug flag
Date: Fri,  8 Jan 2021 16:49:57 -0500
Message-Id: <20210108215007.851249-12-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108215007.851249-1-Rodrigo.Siqueira@amd.com>
References: <20210108215007.851249-1-Rodrigo.Siqueira@amd.com>
X-Originating-IP: [2607:fea8:56e0:6d60:691c:c3e7:a457:38d0]
X-ClientProxiedBy: BN6PR19CA0063.namprd19.prod.outlook.com
 (2603:10b6:404:e3::25) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:691c:c3e7:a457:38d0)
 by BN6PR19CA0063.namprd19.prod.outlook.com (2603:10b6:404:e3::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 21:50:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3acceb42-634b-4eb9-7bc8-08d8b41f740f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1882:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB188235FBC304D402EADA2BE398AE0@DM5PR12MB1882.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yzI6heBhLACr+ofYObtUsv/A2/Q9dxPUa9d7DeBdq0tSVF8xk1QVQK09O4SIyA7b0RXXmkdWPL5gSQpLyK2kLeN1d2l+OszXYmuA0SWHSJf1G3/WnmfA6U1N1Du7Q7ZMQHiD2cHhupXS4CaUMLT06sHYnnOynYI2ixJdSlLTN4Cw2IElzwvJqgOwaYINOpLlITGcV42CaujXs7Ila7wbF4A2onHFT5E2JsHbxl6LbAOPgNV0ZUcenx2PJFk+yZLBFN6nDukh9BoPmveDIZGdHrSKJi44s6J1jQv7GWwbz24QURVAQ19uWlwEWIPlEWuyUciNy2WEyBOKywPVefNIUsFjrAKRnvjJ3Gcs0HII5wGtPkj09i8tEKbNl4Yzc6YhD0L7slIJUF6XX6zLGfSRGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(5660300002)(6512007)(478600001)(86362001)(4744005)(66476007)(6486002)(4326008)(52116002)(83380400001)(6916009)(66946007)(66556008)(8676002)(1076003)(16526019)(36756003)(2906002)(6666004)(316002)(54906003)(6506007)(186003)(2616005)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CrXuVafjUAS8hw3w2X44x3Hcy6HTfhCx/d9fhkjTvumSzm3nLSqHa9QUjpXd?=
 =?us-ascii?Q?PAJ3dJRtgVSduVQ0PYXhBcL0BsTdYFw+xX/hKnNYvCp3z7O92xhYs4+irEuX?=
 =?us-ascii?Q?nYL8ybf0vH33SsVNCPLeNkj+uK8sOTbr+M6Oh0zJKxT1/zQVeZ5lupd0E1K3?=
 =?us-ascii?Q?uZ63Yj/5VRQtiouzn4NchkEKhXu495p7wtvqCFqeJ30OCDcDE5C2lK7Sb1zY?=
 =?us-ascii?Q?NyCYVPMKLCvAOlz2ViLq//BBBZusw3wPgXKPfId9RMprX08VFS5kcGqm4f3r?=
 =?us-ascii?Q?Eo5wDWGEyNeJ1XxInge4lPQ4T4me99yJgqZ5mtabdNz37WjS14E/+AZAfWeY?=
 =?us-ascii?Q?IvFmycWGL4L+JSgz8iJ5xXIJJ/zDDVuy0XIRFhwww7sPoGIYsOg1npkXLFCc?=
 =?us-ascii?Q?ucfWCRYhv9MKqJQ6NPQ+rOjksvvrCzDnDQHprweZAfJGxgno/LNcHTcI924u?=
 =?us-ascii?Q?aqYuqIOSpBMmhaPExvXGdw+LvfK44mYIc0wrfpl3Dt7MJYDOkWK8FJpp3wpI?=
 =?us-ascii?Q?lr36Dvy2NS9oALWFlY4IW7JyONgkOlnwlgGrbqxPPa8wAJ3hpJ1FX1mtbtC5?=
 =?us-ascii?Q?aTzuOJWITbvPiK3IJ6qqf33FWN6nOFWb2ZXi1Ny/+yFhZ95C7KUSdh/orNt5?=
 =?us-ascii?Q?dEtxGE1mBkSOQOuhEtArpbNg0MXqS7iimRa1H3vLQVghVkN25ABjv+KH5Dit?=
 =?us-ascii?Q?rzh9iTVXbZP8wCCowbSqCXfJ1r1mTP+PPipfvavJ5Fy/DCSaMBhaS8D/6uio?=
 =?us-ascii?Q?lDcA0gI37pXDahwJ/u9croG37agCG864Tc5D8LUJNgfdz2o91sxjRvpXHEUm?=
 =?us-ascii?Q?I5xlEfHop21ZW+A/egxWBNoAjEP6lJuzdOJ3BesMYGf1UD8Sd+iaDGknYcpX?=
 =?us-ascii?Q?k5B7w4HXbWhscitEJTKWSYTKjR2lm3SvBxPEl8I0O9fHKSURvtFJhfkMHZaF?=
 =?us-ascii?Q?3SSx+su/palMvWUKCuyZK7V3XFw1eN3p3Ag9Z8xUpdBI40Dfcu/LCH4XkVjf?=
 =?us-ascii?Q?e1p+CQQYupk6MTE0bcETpb3iTbjrofRicCdVesB53mPn7QZmS2Tc7fFWjicE?=
 =?us-ascii?Q?1tDHpGiU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 21:50:45.5033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acceb42-634b-4eb9-7bc8-08d8b41f740f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sb2vP/zYG9ik4Vcm+BFQwmEscjeWKmP15wxUtZMQ6wU6CGmc3+6794AFHJHgTWrXcvam5D5ibwI3UbYAUNFOVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1882
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
Cc: Aric Cyr <Aric.Cyr@amd.com>, Eryk.Brol@amd.com, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, Aurabindo.Pillai@amd.com,
 Mike Hsieh <chun-wei.hsieh@amd.com>, Bhawanpreet.Lakha@amd.com,
 bindu.r@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Mike Hsieh <chun-wei.hsieh@amd.com>

Signed-off-by: Mike Hsieh <chun-wei.hsieh@amd.com>
Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 38a962bc28f2..3737fb9802a4 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -484,7 +484,6 @@ struct dc_debug_options {
 	bool performance_trace;
 	bool az_endpoint_mute_only;
 	bool always_use_regamma;
-	bool p010_mpo_support;
 	bool recovery_enabled;
 	bool avoid_vbios_exec_table;
 	bool scl_reset_length10;
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
