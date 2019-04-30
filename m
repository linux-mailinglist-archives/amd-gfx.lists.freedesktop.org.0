Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 881DEF204
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 10:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9B88912F;
	Tue, 30 Apr 2019 08:30:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770077.outbound.protection.outlook.com [40.107.77.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B39A8912F
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 08:30:23 +0000 (UTC)
Received: from DM3PR12CA0097.namprd12.prod.outlook.com (2603:10b6:0:55::17) by
 SN1PR12MB0656.namprd12.prod.outlook.com (2a01:111:e400:c428::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.15; Tue, 30 Apr
 2019 08:30:21 +0000
Received: from BY2NAM03FT018.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by DM3PR12CA0097.outlook.office365.com
 (2603:10b6:0:55::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 08:30:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT018.mail.protection.outlook.com (10.152.84.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 08:30:20 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 03:30:16 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Add IDH_QUERY_ALIVE event for SR-IOV
Date: Tue, 30 Apr 2019 16:30:13 +0800
Message-ID: <1556613013-8586-1-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(8676002)(7696005)(356004)(6666004)(126002)(476003)(486006)(70206006)(5660300002)(47776003)(70586007)(14444005)(53416004)(36756003)(478600001)(426003)(2616005)(4326008)(2906002)(72206003)(53936002)(68736007)(86362001)(8936002)(51416003)(50226002)(81156014)(50466002)(81166006)(6916009)(316002)(305945005)(186003)(26005)(77096007)(336012)(16586007)(2351001)(48376002)(97736004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB0656; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78b0949f-cdd1-4504-be87-08d6cd461558
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:SN1PR12MB0656; 
X-MS-TrafficTypeDiagnostic: SN1PR12MB0656:
X-Microsoft-Antispam-PRVS: <SN1PR12MB065653469BB8AA6E2E035268FE3A0@SN1PR12MB0656.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Q4AX5M7xuxovMgE9jyGWJ/sGFR4/QTw/2WMXNboj1Vtnl7XIwkxuBrcvAUdwN01liZqW6FrjedYVYMQcxa9e1EpymC0HLgylpG+ArIeGE+B+YEwNy47iUBqH6EojU6/OOTf0VZc9/jROAgSpdBbBK/FxFYqffkTD1tIkBHBHPY5S6HU+k9gUtnFxCUyYIFPhDO258snKPVp0iG+dpy0RE9NNbhpJ/5gshDuOj1RI/T2hOt+ttTOsuj8LRnRREnybqAotsXHhAZ+RTYrLZKsF1xFGf7Pek2RdzTW/xlArlBaJtQ36iP+Se1Jrg5fMNWwN3lR9aglu7dMfaMybzP6BBqhvYQ+fahtOjjVcEq18sI6Vlz6Zpvmf7+qmC0kPaUv+gMSrc88MclI0XnmBBgRE2etSUXC4fmwpMzvRD1caXdo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 08:30:20.6487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b0949f-cdd1-4504-be87-08d6cd461558
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB0656
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xdg+kZ06I6CSvLUxQxNcwGwOmLXs9oTPIJr/x8NX6no=;
 b=RWltORcNAeUomqXxUQsgC12KkVCnSwt7hyzwbxJViXMkNweKoUJdNpF07jWzl5NQTbuKAwdLloYAnx+jHYV5bQiI7+yLMtSjXg/BHD7/H/t+x8kQpRvZqAXBU7kwzbJPALLmAumDwLl5UNo0QDKKR851xQDTtNv/AG8WtguzvwE=
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
Cc: Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U1ItSU9WIGhvc3Qgc2lkZSB3aWxsIHNlbmQgSURIX1FVRVJZX0FMSVZFIHRvIGd1ZXN0IFZNIHRv
IGNoZWNrCmlmIHRoaXMgZ3Vlc3QgVk0gaXMgc3RpbGwgYWxpdmUgKG5vdCBkZXN0cm95ZWQpLiBU
aGUgb25seSB0aGluZwpndWVzdCBLTUQgbmVlZCB0byBkbyBpcyB0byBzZW5kIEFDSyBiYWNrIHRv
IGhvc3QuCgpTaWduZWQtb2ZmLWJ5OiBUcmlnZ2VyIEh1YW5nIDxUcmlnZ2VyLkh1YW5nQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbXhncHVfYWkuYyB8IDMgKysrCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV9haS5oIHwgMSArCiAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L214Z3B1X2FpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV9haS5jCmlu
ZGV4IDhkYmFkNDkuLjI0NzFlN2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L214Z3B1X2FpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbXhncHVfYWku
YwpAQCAtMzcyLDYgKzM3Miw5IEBAIHN0YXRpYyBpbnQgeGdwdV9haV9tYWlsYm94X3Jjdl9pcnEo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCWlmIChhbWRncHVfc3Jpb3ZfcnVudGltZShh
ZGV2KSkKIAkJCXNjaGVkdWxlX3dvcmsoJmFkZXYtPnZpcnQuZmxyX3dvcmspOwogCQlicmVhazsK
KwkJY2FzZSBJREhfUVVFUllfQUxJVkU6CisJCQl4Z3B1X2FpX21haWxib3hfc2VuZF9hY2soYWRl
dik7CisJCQlicmVhazsKIAkJLyogUkVBRFlfVE9fQUNDRVNTX0dQVSBpcyBmZXRjaGVkIGJ5IGtl
cm5lbCBwb2xsaW5nLCBJUlEgY2FuIGlnbm9yZQogCQkgKiBpdCBieWZhciBzaW5jZSB0aGF0IHBv
bGxpbmcgdGhyZWFkIHdpbGwgaGFuZGxlIGl0LAogCQkgKiBvdGhlciBtc2cgbGlrZSBmbHIgY29t
cGxldGUgaXMgbm90IGhhbmRsZWQgaGVyZS4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L214Z3B1X2FpLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV9h
aS5oCmluZGV4IDM5ZDE1MWIuLjA3N2U5MWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L214Z3B1X2FpLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbXhn
cHVfYWkuaApAQCAtNDksNiArNDksNyBAQCBlbnVtIGlkaF9ldmVudCB7CiAJSURIX0ZMUl9OT1RJ
RklDQVRJT05fQ01QTCwKIAlJREhfU1VDQ0VTUywKIAlJREhfRkFJTCwKKwlJREhfUVVFUllfQUxJ
VkUsCiAJSURIX0VWRU5UX01BWAogfTsKIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
