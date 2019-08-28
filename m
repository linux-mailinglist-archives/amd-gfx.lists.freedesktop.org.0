Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B617CA0060
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 13:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5620689B01;
	Wed, 28 Aug 2019 11:00:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam01on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe42::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301AC89A9F
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 11:00:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f95wWO71KAZzRHhfc1Iy8Rx/bFdCXvxzNF0eH/hlaWPXRymMkNtMHVJ4lMJfbLtMrotlLbTi+/o6V9Gr9ObqPwvAD9yQcziCG+pCmhLhTMm0WO/3+4uLBmVAVlq7ijHaLx3WHxz7mfa2xEmDsroa2bz6QA6WH5szFjMy7TQJt++JEll+HsvY2GZ29H1A2X2pDypw4Q+z27KX0xlRz397kv7W4bLuTlNMz088/Rv9AfsB31JKJpUsvw8HXYsDxvAtnh63EzZvTJA1/1zazCTC+G4+FJRzwcI7Iy9YSMvxK6UoMbRdo3MUSidN2PvMsMMCb7xxfED5IlwKH94fV+5jXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5LbO0lzXEwRusb/qPPzw0dID0BXzEEOJ0Te1Ajh3XI=;
 b=KRTge01/qz6kkfflIM68E1aDkcWG5BCOGnstnSdtb1YOmNgPECHvLc2+KcgRryqgJHAUYuVnBJbk3LSykDYtgb/kqI/nd+PBI5h43vz6kDmy6RLk3GKknrz1DAnNN/Z2RKxaL9/gYNgff6j+h+s6TrsgJKuzO13imnMo6r347gseW54OVeQlcnnbb26wz5taJA98v5gDtGIsYYfIAsu727wxmy5zKvxiRjamxwdb1iY58SseTVuv2SDg4tf+dJSXVditOUAozmcz725uQ7GPFo34ROHyUVodTzviBYFcLj5GlaFhXoAqfQLw2rLC1f0sPgLr6xAalVQUln4TYmYMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0033.namprd12.prod.outlook.com (2603:10b6:208:a8::46)
 by BN6PR12MB1266.namprd12.prod.outlook.com (2603:10b6:404:14::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Wed, 28 Aug
 2019 11:00:29 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MN2PR12CA0033.outlook.office365.com
 (2603:10b6:208:a8::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Wed, 28 Aug 2019 11:00:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 28 Aug 2019 11:00:28 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 06:00:26 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Date: Wed, 28 Aug 2019 19:00:21 +0800
Message-ID: <1566990022-24240-1-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(7696005)(54906003)(51416003)(48376002)(16586007)(36756003)(53936002)(50466002)(44832011)(86362001)(4326008)(2351001)(316002)(50226002)(6916009)(70206006)(70586007)(47776003)(478600001)(2906002)(426003)(336012)(305945005)(2616005)(26005)(186003)(476003)(126002)(356004)(81156014)(14444005)(5660300002)(81166006)(53416004)(8936002)(8676002)(486006)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1266; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 899f0938-0d5b-41de-1fc2-08d72ba6efeb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1266; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1266:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1266B4F6161BD781781D9DEA95A30@BN6PR12MB1266.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1XC7K4atWtYgetCHHK8qISiHVWfEd8rQJ2NgIc55X6Khs7eJ4aipL0Czkt8wAFEYDVOF0JWr51hCIeWMraIUTupvKyd0dcnFF2+r2kQH9ZuQW/hrdksr55PiNTEdIaX0NhPSgDf/JZ8ELAcz3x2miK2sXHK3Zzuw+p7mHlnbdyMK6dE+hRt+yE8QcxIhFQ9cBXQWWgpOmOkDSYAnedJ8fOuEmwk6BUgVefS7RTzHNOfpCLMHkPeoq2BPjGqJ7to5c/lsMhiSLns4z2SLLLF/rwThWFjyTSDyGZwSpkD/B8d445fSZpquC646fk/2PIT7jIAwim2e/lMWOpghAIigPJRFEq8iUvQqrkRvpiRk7gP6PPXFgMLyFm5mFWjI/sjMsxYPPVofhBXHUr4B9+l8utRrmlwgyH+uyslwgCS7ayo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 11:00:28.3861 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899f0938-0d5b-41de-1fc2-08d72ba6efeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5LbO0lzXEwRusb/qPPzw0dID0BXzEEOJ0Te1Ajh3XI=;
 b=B+R/HF68pSmAsGjZwaeSX47Da7zweeevgljCp/5+n1vrV1qbNl5DTaZTEYHOJHvD3OT57UvU28/orFo9WIqDPY3CcagM+L2d7trQV0Klh3UOR5zSiL/2lGQBFrpONe4wpT+8sjXxbTJBV9TrRLIhL4SeAfs8DQ7keO7ZVmZWM68=
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, "Le
 . Ma" <Le.Ma@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Tianci Yin <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgpGaXggY29tcHV0ZSByaW5n
IHRlc3QgZmFpbHVyZSBpbiBzcmlvdiBzY2VuYXJpby4KClNpZ25lZC1vZmYtYnk6IFRpYW5jaS5Z
aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcHNwLmMgfCAxNCArKysrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BzcC5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwpp
bmRleCA5ZjdjYzViLi45MmM2OGM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3BzcC5jCkBAIC0yNjEsOSArMjYxLDE1IEBAIHN0YXRpYyBpbnQgcHNwX3Rtcl9pbml0KHN0cnVj
dCBwc3BfY29udGV4dCAqcHNwKQogCQl9CiAJfQogCi0JcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9r
ZXJuZWwocHNwLT5hZGV2LCB0bXJfc2l6ZSwgUFNQX1RNUl9TSVpFLAotCQkJCSAgICAgIEFNREdQ
VV9HRU1fRE9NQUlOX1ZSQU0sCi0JCQkJICAgICAgJnBzcC0+dG1yX2JvLCAmcHNwLT50bXJfbWNf
YWRkciwgTlVMTCk7CisJcHNwLT50bXJfYnVmID0gTlVMTDsKKwlpZiAoIWFtZGdwdV9zcmlvdl92
Zihwc3AtPmFkZXYpKQorCQlyZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChwc3AtPmFkZXYs
IHRtcl9zaXplLCBQU1BfVE1SX1NJWkUsCisJCQkJCSAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZS
QU0sCisJCQkJCSAgICAgICZwc3AtPnRtcl9ibywgJnBzcC0+dG1yX21jX2FkZHIsIE5VTEwpOwor
CWVsc2UKKwkJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwocHNwLT5hZGV2LCB0bXJfc2l6
ZSwgUFNQX1RNUl9TSVpFLAorCQkJCQkgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAorCQkJ
CQkgICAgICAmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCAmcHNwLT50bXJfYnVmKTsK
IAogCXJldHVybiByZXQ7CiB9CkBAIC0xMjE2LDcgKzEyMjIsNyBAQCBzdGF0aWMgaW50IHBzcF9o
d19maW5pKHZvaWQgKmhhbmRsZSkKIAogCXBzcF9yaW5nX2Rlc3Ryb3kocHNwLCBQU1BfUklOR19U
WVBFX19LTSk7CiAKLQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+dG1yX2JvLCAmcHNwLT50
bXJfbWNfYWRkciwgTlVMTCk7CisJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3AtPnRtcl9ibywg
JnBzcC0+dG1yX21jX2FkZHIsICZwc3AtPnRtcl9idWYpOwogCWFtZGdwdV9ib19mcmVlX2tlcm5l
bCgmcHNwLT5md19wcmlfYm8sCiAJCQkgICAgICAmcHNwLT5md19wcmlfbWNfYWRkciwgJnBzcC0+
ZndfcHJpX2J1Zik7CiAJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3AtPmZlbmNlX2J1Zl9ibywK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaAppbmRleCBiYzA5NDdmLi5iNzNk
NGFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oCkBAIC0xNzEsNiAr
MTcxLDcgQEAgc3RydWN0IHBzcF9jb250ZXh0CiAJLyogdG1yIGJ1ZmZlciAqLwogCXN0cnVjdCBh
bWRncHVfYm8JCSp0bXJfYm87CiAJdWludDY0X3QJCQl0bXJfbWNfYWRkcjsKKwl2b2lkCQkJCSp0
bXJfYnVmOwogCiAJLyogYXNkIGZpcm13YXJlIGFuZCBidWZmZXIgKi8KIAljb25zdCBzdHJ1Y3Qg
ZmlybXdhcmUJCSphc2RfZnc7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
