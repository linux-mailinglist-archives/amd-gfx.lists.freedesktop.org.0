Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A009314F47F
	for <lists+amd-gfx@lfdr.de>; Fri, 31 Jan 2020 23:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F3D6FC3E;
	Fri, 31 Jan 2020 22:17:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750052.outbound.protection.outlook.com [40.107.75.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3236FC36
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 Jan 2020 22:17:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PF028ZbmjVAqK9PAEVZzbqayre7LRNxwP/AmWjDYE+r1MaA7OZTI45FVnQ1twE2anZy7nGl+3OkbQy//MnCzMtq/NBfSffhtj3UDI78ETs7gKajQ85NzU5eiADPAV+4FPiQq0Te0apIzdyYvRIkhGiLbpxncl05c0HFEUGPCHL4mPRok8bOJ0mmBHl7HuvRl1fIi5mBDV4EgqlQ92zu+L53itIq8+GQRs7zhPSqfgFe9W6ZvYfKV00nhC1fibJOuV7AV292ATkkV9ZJTengAE13EYQFhkwW9VVM5i36ms6iTwy62wNwcP/tBXNv2fEFHkGMb0MoHglsWb/hMT2IhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPAtZJT5KkJr2NXG/aVUwOzJSf9fVBJwyWGnhy7B8tE=;
 b=E03ICvQm1Ax1mgvs+BefajKxq96GYQCLNJ2TDKqiGn7nImZObOV3puKOB/4Zs24tQc+rxK/+WdWhyLTSuajwoALv3yj5GprtF+GyLChwAIoY+1IT2HOn0+QC0nJ/CtLaygcPhtwRvCZ2LH9QfXTuELfuMUKtiV1VMDdFRyLdZXAXNHDFB2lfSGDdBETK8/SC3tHFpoSouJZwbkopAevEJ4BkmZrmf16zs2qLLP4XVKQ2HEBDg9F8pEdB4IJZAjVaaka7S5s/kzIm1aIfhGz2u66uuUxUM98s+EYFTIMtrPVDcqu7K4mxOsU6cn5VuoDE8tM6Tz5Eby9mpmHKYDs7rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPAtZJT5KkJr2NXG/aVUwOzJSf9fVBJwyWGnhy7B8tE=;
 b=U93NyGlMIqaT3qiJiLvni8NZK16lHE+672pRGnRwjxl4o9blNUbMI1ljaGYh1NTLcBhx5G/vwIc/t7uig2QqWRtJE6/e0e2xrSauMuzXyLSUXcvU2wk1k+N30wWzebExIfWe4VjNWJhnm2ZxQRDDdLX3kjTSTy+bH/4clv4Dnis=
Received: from SN1PR12CA0098.namprd12.prod.outlook.com (2603:10b6:802:21::33)
 by SN6PR12MB2765.namprd12.prod.outlook.com (2603:10b6:805:77::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.23; Fri, 31 Jan
 2020 22:17:12 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::204) by SN1PR12CA0098.outlook.office365.com
 (2603:10b6:802:21::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.23 via Frontend
 Transport; Fri, 31 Jan 2020 22:17:12 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2686.25 via Frontend Transport; Fri, 31 Jan 2020 22:17:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 31 Jan
 2020 16:17:05 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 31 Jan
 2020 16:17:05 -0600
Received: from blakha.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 31 Jan 2020 16:17:05 -0600
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/33] drm/amd/display: Fix GSL acquire
Date: Fri, 31 Jan 2020 17:16:22 -0500
Message-ID: <20200131221643.10035-13-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131221643.10035-1-Bhawanpreet.Lakha@amd.com>
References: <20200131221643.10035-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(428003)(189003)(199004)(4326008)(5660300002)(356004)(8676002)(81156014)(81166006)(26005)(6666004)(316002)(186003)(8936002)(1076003)(54906003)(2616005)(70206006)(2906002)(70586007)(336012)(426003)(36756003)(86362001)(478600001)(6916009)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2765; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d747b7a-0219-4803-7dc3-08d7a69b51d0
X-MS-TrafficTypeDiagnostic: SN6PR12MB2765:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27656D763D5FB410D81631D7F9070@SN6PR12MB2765.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 029976C540
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ii0K8BqwNS1hLYI6ObTOiDZ2DjaFt6gEYm9L7l0iMJeAaojqHD91KUFTRUWiCf+9a3GQD2c2TjcF2Q1b4c9N0wx1xSIQQCOOpvlB/eGYXc4SVuBfDzvz1fiea2Nu08mAC3KlBQZ2rjB4FOV7dX0R6zsC3N9tfdHyMeUc16O4oyhRdnCns2N0Lu91yZM/ikLPJHkgfWD6uSYPkg5y188yYu+21JiD/LEa1Ebn1iwyvwCMcbfHb4vrtisnqC3TmIeTx4/LzGpmY6MhUI7Z7b3kZuOlNZwIUqpqSZwzI+pJ4TlxjMPs5m5CvcGRjjmxqu0EmUKAhk2Gu1Dx2Ownx/KcCqxTFIoF9eQ/xtjtLqSZm/TXrLSqzOuQP3ooMpfD46v1LEZkq/g9+YB79XuFTwntjOpRFXa9oYoTL2q8HW5ummRh3sZrkw6NdCobbtO7kuIy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2020 22:17:11.7353 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d747b7a-0219-4803-7dc3-08d7a69b51d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2765
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
Cc: sunpeng.li@amd.com, rodrigo.siqueira@amd.com, Aric Cyr <aric.cyr@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Aric Cyr <aric.cyr@amd.com>

[Why]
After locking refactor GSL is not acquired properly
resulting in immediate flip issues.

[How]
Do not copy old GSL state anymore since GSL is acquired
earlier now.

Signed-off-by: Aric Cyr <aric.cyr@amd.com>
Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 129a91e8f250..9713f452debf 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1562,12 +1562,6 @@ void dcn20_program_front_end_for_ctx(
 		}
 	}
 
-	/* Carry over GSL groups in case the context is changing. */
-	for (i = 0; i < dc->res_pool->pipe_count; i++)
-		if (context->res_ctx.pipe_ctx[i].stream == dc->current_state->res_ctx.pipe_ctx[i].stream)
-			context->res_ctx.pipe_ctx[i].stream_res.gsl_group =
-				dc->current_state->res_ctx.pipe_ctx[i].stream_res.gsl_group;
-
 	/* Set pipe update flags and lock pipes */
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		dcn20_detect_pipe_changes(&dc->current_state->res_ctx.pipe_ctx[i],
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
