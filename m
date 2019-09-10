Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79737AF1A3
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C476E97A;
	Tue, 10 Sep 2019 19:06:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720064.outbound.protection.outlook.com [40.107.72.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB6E6E975
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:06:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSXT77e3ASZm9WcRdcxmjiz69kypjKFr0dWV65H72ik4/3Tz2xEgDnuxQIo6mKuNt9EwRvBc8UC1FV6EMLRSWjMHnlnwPiCVi3CieeFX9WsOJ2OJR7vM+lVEoZDh6zttqQL3VYBTkKbC145DWiybHyNo+7qWX8jIIXJpdR/32/kkCOWcBKpa4l2ErZ6FSmhCABqtdv02hmMsdX8N3YKnlb3ppiwfq5Lj5dLrONeeQZ4mM4p8eFVObQXIQ3PL/o95Mo2RO0qpFsrkJvD8zxPdLjSrh8/wifwziv1UsKNQGL95r/1Gwxcz03O+mEd3ryKtY3SwnFzM8XpTD7wL2w/U+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1YI80+OLtr91UQnmBq4PFYB72wgsaayWFdbQNQpcXg=;
 b=Tz4dfNpbhY1tRHx+pn9+v7/AL4Zhi+1cdgSkHkNGAp/YbBbwTAThM3GOXH+nFsqSwiDq5ryy2Vb5IymkVmaFQIIh5Iy9I1I770qGbS0j2tPHTDqrRyLknFxAdGMxYSy1M51HN667lkH19Tn7nTUjERGQFYPtcBKtDh4tgUy/q74SO24+yp/X0cdM5jA9Vo+BJz3ljDARkW6yvURuZSY3EAxcseLIQj4qfAYJEd8Jp6eMBMwhw2mmVLZe9ayfX9jU+FNWOD4JOQwxdsOgY3/d6Wx+I0U7r8tGRHw4ZlaQ0mKP7qn2eGx3b/tYynmoGPxOlS15XZyjMTrYZofDEW2JnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0031.namprd12.prod.outlook.com (2603:10b6:301:2::17)
 by DM5PR12MB1914.namprd12.prod.outlook.com (2603:10b6:3:109::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 19:06:28 +0000
Received: from DM3NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by MWHPR12CA0031.outlook.office365.com
 (2603:10b6:301:2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.13 via Frontend
 Transport; Tue, 10 Sep 2019 19:06:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT009.mail.protection.outlook.com (10.152.82.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:06:27 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:06:21 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 20/20] drm/amd/display: Add hdcp to Kconfig
Date: Tue, 10 Sep 2019 15:05:54 -0400
Message-ID: <20190910190554.1539-21-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-10-Bhawanpreet.Lakha@amd.com>
 <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(2980300002)(428003)(199004)(189003)(50226002)(336012)(478600001)(316002)(4326008)(305945005)(6666004)(186003)(16586007)(1076003)(356004)(76176011)(8676002)(2906002)(51416003)(7696005)(53936002)(81156014)(81166006)(8936002)(6916009)(70586007)(446003)(70206006)(486006)(86362001)(4744005)(36756003)(50466002)(5660300002)(476003)(26005)(2616005)(53416004)(47776003)(426003)(11346002)(2351001)(126002)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1914; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4283f95-959d-4103-4b8a-08d73621fb81
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1914; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1914:
X-Microsoft-Antispam-PRVS: <DM5PR12MB191420FB31AFD0A3AD15BF05F9B60@DM5PR12MB1914.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: nJOpA8hQ6oYOxLy9Obwdu65lFvG7X9riQZNAcG/5KtCWP0ize3pkpV0DL728ltqLIghr0psCG9giRSHCHbWwVw5b1wQ3mAObkM/9PvurcgmWBFdRO5PDLn6v29ZQrB2vU3fQGZ/kkNAz5qzuilA9RjkxW+sY6zSRsWqbZ/2IGjWvFcKZpuEUQ41tp5uOH6xcWdKcg+7LMNKMOnAALHIMFRXhPVapM/T5uU+ST+AXjoYkVdFQ9IzKubLI2vjYwu9De/yHklaBR9Z1UGvMur2nO6f88VREYcLt/YZOFYg8iEuZkTYr/n2zqkxzULo6uVTQcxAeMSazlhxIXXdksncHicI6UFAfvEvKEep0TyAr3DB5NfdEltmGL5jZdywliYMMT/4wIqwSENv9O5R0NYWaGv/U8zUm+ayyWrvJElEOqZY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:06:27.6338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4283f95-959d-4103-4b8a-08d73621fb81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1914
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1YI80+OLtr91UQnmBq4PFYB72wgsaayWFdbQNQpcXg=;
 b=sCm3Dxkms20Fa0Gp/oQPHHYyoqraujOPfQzoa31p4KZaODVEMk9pIwRUUf+iKmE5tLGvOfxTpATXVoSECR5zG9OXmRLS937Qdd99180OL8Ebq8qe+q3AxO0VjECCiXm9RZ0tB2IBHDl1iboyIP7r1flD4QxZwclmjnPU1tfRQPs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KSERDUCBpcyBub3QgZnVsbHkgZmluaXNoZWQsIHNvIHdlIG5lZWQgdG8gYmUgYWJsZSB0
bwpidWlsZCBhbmQgcnVuIHRoZSBkcml2ZXIgd2l0aG91dCBpdC4KCltIb3ddCkFkZCBhIEtjb25m
aWcgdG8gdG9nZ2xlIGl0CgpTaWduZWQtb2ZmLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2Fu
cHJlZXQuTGFraGFAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53
ZW50bGFuZEBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9LY29uZmln
IHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L0tjb25maWcKaW5kZXggODE1NGZkNjM3YWZiLi5iNDUwNDI1Nzg3M2EgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9LY29uZmlnCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9LY29uZmlnCkBAIC00Myw2ICs0MywxNCBAQCBjb25maWcg
RFJNX0FNRF9EQ19EU0NfU1VQUE9SVAogCSAgICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IHdh
bnQgdG8gaGF2ZQogCSAgICBEeW5hbWljIFN0cmVhbSBDb21wcmVzc2lvbiBzdXBwb3J0CiAKK2Nv
bmZpZyBEUk1fQU1EX0RDX0hEQ1AKKyAgICAgICAgYm9vbCAiRW5hYmxlIEhEQ1Agc3VwcG9ydCBp
biBEQyIKKyAgICAgICAgZGVwZW5kcyBvbiBEUk1fQU1EX0RDCisgICAgICAgIGhlbHAKKyAgICAg
ICAgIENob29zZSB0aGlzIG9wdGlvbgorICAgICAgICAgaWYgeW91IHdhbnQgdG8gc3VwcG9ydAor
ICAgICAgICAgSERDUCBhdXRoZW50aWNhdGlvbgorCiBjb25maWcgREVCVUdfS0VSTkVMX0RDCiAJ
Ym9vbCAiRW5hYmxlIGtnZGIgYnJlYWsgaW4gREMiCiAJZGVwZW5kcyBvbiBEUk1fQU1EX0RDCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
