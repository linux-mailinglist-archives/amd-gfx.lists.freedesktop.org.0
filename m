Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEDAD59E0
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 05:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACBE6E1BB;
	Mon, 14 Oct 2019 03:21:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690078.outbound.protection.outlook.com [40.107.69.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4734D6E1BC
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 03:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5H4NmknsaNqYzEJGFCK+GpC/Xho+uLpOCL6uOgIgu/ZjDxecvfUHXmd5pXw4Hs/VvAYeoACPMqkyEqBaMpShEEYqYRVc6ba7FoDuWkT2fPIM1hq3iDOqKtl/vKSBDwSWTost/XyIifQSnke118RjHyA3RzyHRlPKEtDWPBmPhpbfomtAwf6dGJ+0230dIT/zb+wPq7VIvTRGFIMQC78zB7L7n6I5SVktRKu4XdLqDfVUVX3Rp/YN9Eayk0zKJkpL8UTWfJnKK1PQh+5IYzkVfG8wfOCSzcDkZT6yILW6gpS1ZkLzfiLQ/jeEywPHOsnmGoXFrmaw6iZPzP9RL6bkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKNjFNnY4u7JMR0ex69/QgBaE5kDFlc5p2h3jVVFt00=;
 b=RxJsZbsVdy80WOM260oghu+6xWa1fONtAlMIUw8bdfG+SC8RJr6E9EFgM1AKOa/Hu6voHn4f/Z1zFTedqHQVJeJco1J22IML4hpA4xryobAIyEydhOIEwZ4pgcOfL6XVEap8OULuJ0RHyZ2ySQw2KqVmUu+0iQ6vq1hKvUZIFdIMV1FHil1p28eThIL38wcnyZXreZ+cNOQlLM/mpKSO43LZmppPhX2GPX3wXUyGPkzVtJSiKTD0FqCya3daQJdqhKIIGZGkt8XMHgT/Mll5AT04gS9In6cFUb3cwQZWaqellFJAOqSNWAUGAdG9V+OtWpSlgtku0PkB9MITpEckRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0006.namprd12.prod.outlook.com
 (2603:10b6:301:4a::16) by BN6PR12MB1636.namprd12.prod.outlook.com
 (2603:10b6:405:6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Mon, 14 Oct
 2019 03:21:29 +0000
Received: from BY2NAM03FT059.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by MWHPR1201CA0006.outlook.office365.com
 (2603:10b6:301:4a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Mon, 14 Oct 2019 03:21:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT059.mail.protection.outlook.com (10.152.85.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2347.21 via Frontend Transport; Mon, 14 Oct 2019 03:21:28 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 13 Oct
 2019 22:21:28 -0500
Received: from rico-code.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sun, 13 Oct 2019 22:21:26 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/8] drm/amdgpu: update atomfirmware header with memory
 training related members(v3)
Date: Mon, 14 Oct 2019 11:21:14 +0800
Message-ID: <20191014032118.14020-4-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014032118.14020-1-tianci.yin@amd.com>
References: <20191014032118.14020-1-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(428003)(199004)(189003)(486006)(1076003)(53416004)(54906003)(86362001)(16586007)(316002)(47776003)(356004)(2351001)(8936002)(8676002)(126002)(6666004)(50466002)(476003)(70586007)(70206006)(81166006)(81156014)(426003)(478600001)(51416003)(7696005)(76176011)(2616005)(4326008)(305945005)(6916009)(48376002)(2906002)(336012)(186003)(26005)(44832011)(50226002)(5660300002)(11346002)(446003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1636; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42594107-ea7a-45bf-c256-08d750559a83
X-MS-TrafficTypeDiagnostic: BN6PR12MB1636:
X-Microsoft-Antispam-PRVS: <BN6PR12MB163617B43767F975B1DEF27B95900@BN6PR12MB1636.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-Forefront-PRVS: 01901B3451
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4lQbzASPwEnvctF1nSD50orlWVA0ALKNlznwzw2ixS8gZpAemSytCtAw+Ap2DwicYgj7LkV9DJYFgE5spRmJjgJSNZJkCI0st4Tft+75hoyieQht6e15XWLMmaZjv8Zk1L/zftLzobSGMQL/H8H2i7d9G9Xk/NNoV3bdvUEyEzT5aCm4OO3ZmFlG1MgID8u/jeLv3m3ig5/G7RPqDjpoTdD4TBwXdRHHhrUabtJWP7uaOvufRjFIR9t+B/vpxLXzB+0cXq1KMuKQOTbItTS49223bjvjSYJfozh5nt4sad2pMrDWoMU6OzbHpFKG274a9tRR3faMQimIBdfct4E/46hQQjteAgP0epzFhRvDTHJIrUwtNxWW3zeYecq9l73rQ7uFNynlJndNndOUJOBHlwW37KtDpyC4RQ0J/saw4u4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 03:21:28.9694 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42594107-ea7a-45bf-c256-08d750559a83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1636
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKNjFNnY4u7JMR0ex69/QgBaE5kDFlc5p2h3jVVFt00=;
 b=PsLz9eQXcj4/z1t6rkgOsqZl07oAYN9/Xk7Dd8GTPWGR5G3kyelm0f/vgf9dVIW8JrnyRyGIuwWX/t0MUCMT5pEO23U7EwzHpXsYPFfeQacvBeb62I/d3MEk+Y/8Zkpi6UKaLukntdMQU9iaO00L2638kqHuRWEhbYsoH9KZFy0=
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
Cc: Deucher Alexander <Alexander.Deucher@amd.com>,
 Tuikov Luben <Luben.Tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tianci Yin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgphZGQgbmV3IHZyYW1fcmVz
ZXJ2ZV9ibG9jayBzdHJ1Y3R1cmUgYW5kIGF0b21maXJtd2FyZV9pbnRlcm5hbF9jb25zdGFudHMg
ZW51bWVyYXRpb24KCkNoYW5nZS1JZDogSTZiYTY0MmVjZDdhZDk0MjUwMTYyYWU1YzMyMmVkOGQ4
NWRlOWMzNWEKUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8dGlhbmNpLnlpbkBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hdG9tZmlybXdhcmUuaCB8IDI3ICsrKysrKysr
KysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hdG9tZmly
bXdhcmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hdG9tZmlybXdhcmUuaAppbmRl
eCBlODg1NDFkNjdhYTAuLmRkN2NiYzAwYTBhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL2F0b21maXJtd2FyZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9hdG9tZmlybXdhcmUuaApAQCAtNDkyLDEyICs0OTIsMTMgQEAgc3RydWN0IGF0b21fZmly
bXdhcmVfaW5mb192M18xCiAvKiBUb3RhbCAzMmJpdCBjYXAgaW5kaWNhdGlvbiAqLwogZW51bSBh
dG9tYmlvc19maXJtd2FyZV9jYXBhYmlsaXR5CiB7Ci0gIEFUT01fRklSTVdBUkVfQ0FQX0ZJUk1X
QVJFX1BPU1RFRCA9IDB4MDAwMDAwMDEsCi0gIEFUT01fRklSTVdBUkVfQ0FQX0dQVV9WSVJUVUFM
SVpBVElPTiAgPSAweDAwMDAwMDAyLAotICBBVE9NX0ZJUk1XQVJFX0NBUF9XTUlfU1VQUE9SVCAg
PSAweDAwMDAwMDQwLAotICBBVE9NX0ZJUk1XQVJFX0NBUF9IV0VNVV9FTkFCTEUgID0gMHgwMDAw
MDA4MCwKLSAgQVRPTV9GSVJNV0FSRV9DQVBfSFdFTVVfVU1DX0NGRyA9IDB4MDAwMDAxMDAsCi0g
IEFUT01fRklSTVdBUkVfQ0FQX1NSQU1fRUNDICAgICAgPSAweDAwMDAwMjAwLAorCUFUT01fRklS
TVdBUkVfQ0FQX0ZJUk1XQVJFX1BPU1RFRCA9IDB4MDAwMDAwMDEsCisJQVRPTV9GSVJNV0FSRV9D
QVBfR1BVX1ZJUlRVQUxJWkFUSU9OICA9IDB4MDAwMDAwMDIsCisJQVRPTV9GSVJNV0FSRV9DQVBf
V01JX1NVUFBPUlQgID0gMHgwMDAwMDA0MCwKKwlBVE9NX0ZJUk1XQVJFX0NBUF9IV0VNVV9FTkFC
TEUgID0gMHgwMDAwMDA4MCwKKwlBVE9NX0ZJUk1XQVJFX0NBUF9IV0VNVV9VTUNfQ0ZHID0gMHgw
MDAwMDEwMCwKKwlBVE9NX0ZJUk1XQVJFX0NBUF9TUkFNX0VDQyAgICAgID0gMHgwMDAwMDIwMCwK
KwlBVE9NX0ZJUk1XQVJFX0NBUF9FTkFCTEVfMlNUQUdFX0JJU1RfVFJBSU5JTkcgID0gMHgwMDAw
MDQwMCwKIH07CiAKIGVudW0gYXRvbV9jb29saW5nX3NvbHV0aW9uX2lkewpAQCAtNjcxLDYgKzY3
MiwyMCBAQCBzdHJ1Y3QgdnJhbV91c2FnZWJ5ZmlybXdhcmVfdjJfMQogICB1aW50MTZfdCAgdXNl
ZF9ieV9kcml2ZXJfaW5fa2I7IAogfTsKIAorLyogVGhpcyBpcyBwYXJ0IG9mIHZyYW1fdXNhZ2Vi
eWZpcm13YXJlX3YyXzEgKi8KK3N0cnVjdCB2cmFtX3Jlc2VydmVfYmxvY2sKK3sKKwl1aW50MzJf
dCBzdGFydF9hZGRyZXNzX2luX2tiOworCXVpbnQxNl90IHVzZWRfYnlfZmlybXdhcmVfaW5fa2I7
CisJdWludDE2X3QgdXNlZF9ieV9kcml2ZXJfaW5fa2I7Cit9OworCisvKiBEZWZpbml0aW9ucyBm
b3IgY29uc3RhbmNlICovCitlbnVtIGF0b21maXJtd2FyZV9pbnRlcm5hbF9jb25zdGFudHMKK3sK
KwlPTkVfS2lCCT0gMHg0MDAsCisJT05FX01pQgk9IDB4MTAwMDAwLAorfTsKIAogLyogCiAgICoq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
