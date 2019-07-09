Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA416301A
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 07:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B5489E2C;
	Tue,  9 Jul 2019 05:41:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820042.outbound.protection.outlook.com [40.107.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780E289E2C
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 05:41:22 +0000 (UTC)
Received: from MWHPR1201CA0008.namprd12.prod.outlook.com
 (2603:10b6:301:4a::18) by MWHPR12MB1856.namprd12.prod.outlook.com
 (2603:10b6:300:108::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.17; Tue, 9 Jul
 2019 05:41:20 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by MWHPR1201CA0008.outlook.office365.com
 (2603:10b6:301:4a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Tue, 9 Jul 2019 05:41:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 9 Jul 2019 05:41:19 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 9 Jul 2019
 00:41:18 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: increase the SMU msg response waiting time
Date: Tue, 9 Jul 2019 13:41:11 +0800
Message-ID: <20190709054111.11433-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(478600001)(8676002)(316002)(186003)(1076003)(53936002)(26005)(2351001)(77096007)(8936002)(6916009)(336012)(72206003)(50466002)(36756003)(86362001)(70206006)(5660300002)(81156014)(70586007)(81166006)(6666004)(68736007)(53416004)(486006)(51416003)(7696005)(4744005)(2616005)(426003)(14444005)(2870700001)(4326008)(305945005)(126002)(47776003)(50226002)(476003)(44832011)(48376002)(54906003)(356004)(2906002)(69900200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1856; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6099b9da-f988-40e2-3602-08d7043011c9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1856; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1856:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1856A14298A4DE4035D290FDE4F10@MWHPR12MB1856.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-Forefront-PRVS: 0093C80C01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Fn2phJuozV63SoiEqiL58/9flhxmSBcwo0XdidWMvdM7yFzj65w2vKb373vvF/8k45AEKEC2LzCryt3U/99iHNoeU1+bPudRqj7tG03+y26v5c2VepHKprOL/g5ppjPqdzq1anveFaNoCosDMF4Caa53Whl0OOPq/2wfAjW3yI//y9FpMjPU2+kNxXDphIUlZ30qhDDC/u+7z1C8nRSSGbxlreVIBA9Q3j7ZTbI5MnIun2Eamxm/XpY6DrO2OR3APXv+puW0Azbj9258flYszzf9ZMjwG9ScODEwBHpGacrOMmIf7zDaLB0cW7BllXnIOzCdSp6Dqw/WaTXxrk5KQ2Wr81F+uQvXT955G9uQJt3uyz1Cjlh8IizjAp3jheVSEPwnYMM1yly7CBdiclRMrtiSBkOYYxDcqulwQx+4was=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 05:41:19.7493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6099b9da-f988-40e2-3602-08d7043011c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1856
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1w0mWmJJoIHGDvrHw6feoAOvMEQtCp49nj3ZC1SWTtA=;
 b=0erLsVtQvErKRme1tHhsKB/fo2hyTLcZ+sz92x1sHMtub6blWI+u6WWmrOp77i0u+6pOTMTWTHKGzVZrwte1jSFctvX66X1qISTanbZIrzlLJI/pcg0/S1lpzsdVbNu+Aw3yA0+HB7hzhZFvit+XHFh+OQISiphz9gxJE5kYiN0=
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
Cc: Alexander.Deucher@amd.com, Andrey.Grodzovsky@amd.com,
 Evan Quan <evan.quan@amd.com>, Xiaowei.Wu@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW5jcmVhc2UgdGhlIHdhaXRpbmcgdGltZSB0byAxcyBmcm9tIDIwMG1zLiBUaGlzIGlzIGV4cGVj
dGVkCnRvIGZpeCBzb21lIG1vZGUxIHJlc2V0IGZhaWx1cmVzLgoKQ2hhbmdlLUlkOiBJNGMxMTk5
NjYyOGNkNDBkNTU5YzZlZGVhOTdkMDkyZjM5NzEyMmQ3OApTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1
YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9h
bWRfc2hhcmVkLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3No
YXJlZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaAppbmRleCA0
NDdiYzRkLi43NzljOWU3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUv
YW1kX3NoYXJlZC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVk
LmgKQEAgLTI4LDcgKzI4LDcgQEAKICNlbmRpZgogCiAKLSNkZWZpbmUgQU1EX01BWF9VU0VDX1RJ
TUVPVVQJCTIwMDAwMCAgLyogMjAwIG1zICovCisjZGVmaW5lIEFNRF9NQVhfVVNFQ19USU1FT1VU
CQkxMDAwMDAwICAvKiAxMDAwIG1zICovCiAKIC8qCiAgKiBDaGlwIGZsYWdzCi0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
