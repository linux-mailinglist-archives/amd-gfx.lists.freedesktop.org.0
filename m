Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C60091DE4
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 09:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8899D6E0A6;
	Mon, 19 Aug 2019 07:35:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690058.outbound.protection.outlook.com [40.107.69.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CC56E0A6
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 07:35:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Syzbfos6jCBqxT89xM/q4r/sI11Spj5H+fpFrTZBYFy+IXeXLMsJ3OD1a3Mho1APZBA29KNX7l8E+lzukBpP2H93fzmKjWK+xZHXcSZxqFtwrvdnGptQrWKcIPKcgTyZJRnmZJZpbIoZUBHC4zfO/xe9epWYTbGI7oOwjlX5Ix5ZTXAqjfzE6LWqrn7/k80K/ni58xDYpHp+gHsOqZbrbuoJUJmhTjgjlzXNE3e5fddiQgHAAq0M0Fpr8SeZK9z2b1HlB3zEdZV/GBiwBf+Gs9Z3nzx+lK3Jm6toQMZamHqPGVQyqmhICx+459sIJMZYy7gPCvmtOJCE2eL000qNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL5QxKuAJujpQDj/yIA4YMtnKOM/2rvAp+ajzIDrE6w=;
 b=QhILgZe5jsxnzpINAQe4zGUluHukzaDoQi8RHozcR498cHVdu37dDGZTqClrCjBY1VvelC2zbu3QC36XGTIa6g9kU3hUkBlUjCo2p9ii+dLWvwg1EIqFG4642NdtjEOqDld4q6fW7/nq5S9ea2NBzG6q8aA7h++6GKOrxGr90gIeergSqjWrC7GbxKGzQz0edB5BwNHyUFNm6BhscC/kStWutRm5Q1W/fEuAxCiarZ6lC7ihdtoHnK9EBsVCfOz/lsJKGOrLWSZRK1cZnexVZvC+MoGq5rEr2g8/BX27MuZukRItv58k20TTyhn2hY53Oe22hkaWvKkvNbfLHUr0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0021.namprd12.prod.outlook.com (2603:10b6:5:1c0::34)
 by BN6PR12MB1265.namprd12.prod.outlook.com (2603:10b6:404:1d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Mon, 19 Aug
 2019 07:34:59 +0000
Received: from CO1NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM6PR12CA0021.outlook.office365.com
 (2603:10b6:5:1c0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.23 via Frontend
 Transport; Mon, 19 Aug 2019 07:34:58 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT041.mail.protection.outlook.com (10.152.81.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 07:34:58 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 02:34:56 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/psp: move TMR to cpu invisible vram region
Date: Mon, 19 Aug 2019 15:34:52 +0800
Message-ID: <1566200092-17283-1-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(486006)(48376002)(50466002)(2906002)(186003)(26005)(4326008)(356004)(6666004)(70206006)(70586007)(51416003)(7696005)(14444005)(53936002)(305945005)(54906003)(336012)(316002)(6916009)(47776003)(16586007)(36756003)(8676002)(81156014)(81166006)(8936002)(86362001)(50226002)(44832011)(478600001)(5660300002)(2351001)(426003)(126002)(476003)(2616005)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1265; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2db67ebd-8fed-4d0a-3f0b-08d72477bce6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR12MB1265; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1265:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1265B63F8E5C732F587FC52B95A80@BN6PR12MB1265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KqIfZ7PFsI7DWWAqmcepZ8ydgcyjfQiNWIU6FG9U0CetJlsJT4g70wgbEkMZLrZK8Ab4jQ8jSi92Gf6Lo7Vg9ajsKXgRI4tPZr6SPVvlPVSJVGD2ToMZXdGI1cIE2BF/ilkF84f5Vkn2GqmJEDrIPLNQF+ISElnJTFkZShr+Tz9MXUJMFco4OcjSMU+jrILW9GsWKaEr06uKs05a1kXe0vWIxOj6Q416ikiwwLGw7Q43D8waRTPakMt9WYKFjy4vHv156Zeu2JAAy4m5SN/Tz+kcH+gE+i1f91plkq3NMzHKmpz9CGorH4vZ9C+8bKoJcqggEwsc0cv3pVJ1eGwEtKXDga7sKrz9QLxGzqr0dzHt9pBz4QZqO38G6RVTSY5WCxBrTydjZr78zpxZlgialPVuVmdrbayRN7D0lnihD7w=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 07:34:58.2936 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db67ebd-8fed-4d0a-3f0b-08d72477bce6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL5QxKuAJujpQDj/yIA4YMtnKOM/2rvAp+ajzIDrE6w=;
 b=Ics9ZR6BzuujklB7muXqCPI62V8KudxbnEs4nb2BUHvBAIWs8xPupqst2tqAJ7RHep4X473mRf9F1BmUtbeepfI2db2lxSgS29jJJZ1fibSMXcJkdnzIw8jucZygFDoRalTJS12YpwfnQ1VrBjLH3O4mNmuz8O2Oh4B6xfad6PI=
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Tianci Yin <tianci.yin@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgpzbyB0aGF0IG1vcmUgdmlz
aWJsZSB2cmFtIGNhbiBiZSBhdmFpbGFibGUgZm9yIG9jbCBhcHBsaWNhdGlvbnMuCgpTaWduZWQt
b2ZmLWJ5OiBUaWFuY2kuWWluIDx0aWFuY2kueWluQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIHwgNSArKystLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jICAgIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmggICAgfCAxIC0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9vYmplY3QuYwppbmRleCAxMDU5NzcxLi5jYTM1ODY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCkBAIC0yNDYsOCArMjQ2LDkgQEAgaW50IGFtZGdwdV9i
b19jcmVhdGVfcmVzZXJ2ZWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJYnAuc2l6ZSA9
IHNpemU7CiAJYnAuYnl0ZV9hbGlnbiA9IGFsaWduOwogCWJwLmRvbWFpbiA9IGRvbWFpbjsKLQli
cC5mbGFncyA9IEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9BQ0NFU1NfUkVRVUlSRUQgfAotCQlBTURH
UFVfR0VNX0NSRUFURV9WUkFNX0NPTlRJR1VPVVM7CisJYnAuZmxhZ3MgPSAoY3B1X2FkZHIpP0FN
REdQVV9HRU1fQ1JFQVRFX0NQVV9BQ0NFU1NfUkVRVUlSRUQKKwkJOkFNREdQVV9HRU1fQ1JFQVRF
X05PX0NQVV9BQ0NFU1M7CisJYnAuZmxhZ3MgfD0gQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DT05U
SUdVT1VTOwogCWJwLnR5cGUgPSB0dG1fYm9fdHlwZV9rZXJuZWw7CiAJYnAucmVzdiA9IE5VTEw7
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwppbmRleCA3NzE1YzBkLi41
ZTdmYmJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNw
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCkBAIC0yNjQs
NyArMjY0LDcgQEAgc3RhdGljIGludCBwc3BfdG1yX2luaXQoc3RydWN0IHBzcF9jb250ZXh0ICpw
c3ApCiAKIAlyZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChwc3AtPmFkZXYsIHRtcl9zaXpl
LCBQU1BfVE1SX1NJWkUsCiAJCQkJICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKLQkJCQkg
ICAgICAmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCAmcHNwLT50bXJfYnVmKTsKKwkJ
CQkgICAgICAmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCBOVUxMKTsKIAogCXJldHVy
biByZXQ7CiB9CkBAIC0xMjE1LDcgKzEyMTUsNyBAQCBzdGF0aWMgaW50IHBzcF9od19maW5pKHZv
aWQgKmhhbmRsZSkKIAogCXBzcF9yaW5nX2Rlc3Ryb3kocHNwLCBQU1BfUklOR19UWVBFX19LTSk7
CiAKLQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+dG1yX2JvLCAmcHNwLT50bXJfbWNfYWRk
ciwgJnBzcC0+dG1yX2J1Zik7CisJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3AtPnRtcl9ibywg
JnBzcC0+dG1yX21jX2FkZHIsIE5VTEwpOwogCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNwLT5m
d19wcmlfYm8sCiAJCQkgICAgICAmcHNwLT5md19wcmlfbWNfYWRkciwgJnBzcC0+ZndfcHJpX2J1
Zik7CiAJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3AtPmZlbmNlX2J1Zl9ibywKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaAppbmRleCAwMDI5ZmEyLi40OGIwNTdkIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oCkBAIC0xNzIsNyArMTcyLDYgQEAg
c3RydWN0IHBzcF9jb250ZXh0CiAJLyogdG1yIGJ1ZmZlciAqLwogCXN0cnVjdCBhbWRncHVfYm8J
CSp0bXJfYm87CiAJdWludDY0X3QJCQl0bXJfbWNfYWRkcjsKLQl2b2lkCQkJCSp0bXJfYnVmOwog
CiAJLyogYXNkIGZpcm13YXJlIGFuZCBidWZmZXIgKi8KIAljb25zdCBzdHJ1Y3QgZmlybXdhcmUJ
CSphc2RfZnc7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
