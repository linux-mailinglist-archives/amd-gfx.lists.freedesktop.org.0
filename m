Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A41D380E
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 05:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38F46EB9B;
	Fri, 11 Oct 2019 03:51:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353696EB9A
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 03:51:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ot2LLq7OjB198X3x3FH62XJPre06Gkr1qmWZyH99C7mW4+SW6pEqzRxRD5MxW1X54+E1Gsne+URa3Qeu8uQv5GzXmrJzHIdy4Lx0D4bPyE/Arrfw8dLyh+BCUxYF+MCmftd+oRfUduIcDUXIV/FDzSn2j7eZgngbTtuFoXow3ZqxbkUOaeJ/WX2EYRlPW3CQlFhYsPSmyli5TjG8f0NIOpPdzrxh0CSu9Ar8rvVNM19TMTR7y0ORcTpxgx3G6xA45RA2YR1bQbVb5rRtyiLxsm8YjbDpoMbW5eS9ZYZ4sNeIcVSHtlGq8fmnrdLdsnYDuCGnoGOW0O7yvXflsj4u1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuGvDxDXTpgyKw0GR/onDFCZ+hlZzEGb75VbtAP1HVs=;
 b=C7AdXv5Z23qGAEwgIyMI/IiaFBvmwuWfQJqsSFz3ddhqADN5231YbpzPUb+QSCnNnmnbooxHxF6iEsF3lpqqAQmY8PDxhX6tru1P+49juNRMNliWCauuB0+Ed/866Wl9d7LiBYiCGsJgskUSB5o9sxPd0ByDY5MWkFuU7Gl7gHKgg4Bf3xMfzyNbEtmB36gLzZff6QZzNqxL9miZC0bwZMjhxBpyigPqeclBUPeuLwWICxIYZ2B3VPajHjr8C8U7GBAypxEHzb6PnSxPHDD1abf5dMP6KdAvuHLQLNw+JFP3wmCEnUY8M9xzhr6CLYfeS7cfpL1agk0836/MidbK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0068.namprd12.prod.outlook.com (2603:10b6:0:57::12) by
 DM5PR1201MB0187.namprd12.prod.outlook.com (2603:10b6:4:5b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 03:51:10 +0000
Received: from BY2NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by DM3PR12CA0068.outlook.office365.com
 (2603:10b6:0:57::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.24 via Frontend
 Transport; Fri, 11 Oct 2019 03:51:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT035.mail.protection.outlook.com (10.152.84.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 03:51:09 +0000
Received: from rico-code.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 10 Oct 2019
 22:51:08 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Date: Fri, 11 Oct 2019 11:50:32 +0800
Message-ID: <20191011035033.24935-7-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011035033.24935-1-tianci.yin@amd.com>
References: <20191011035033.24935-1-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(428003)(189003)(199004)(186003)(54906003)(50466002)(2906002)(26005)(316002)(16586007)(44832011)(53416004)(36756003)(446003)(11346002)(426003)(2616005)(476003)(126002)(336012)(2351001)(486006)(76176011)(7696005)(86362001)(51416003)(5660300002)(6916009)(305945005)(8936002)(81166006)(81156014)(8676002)(50226002)(48376002)(70586007)(356004)(70206006)(1076003)(4326008)(6666004)(478600001)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0187; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84a681e5-d1f7-477b-c3d9-08d74dfe40cc
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0187:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0187C5D9B15D460209C8D49095970@DM5PR1201MB0187.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 659MnokgYVv0QLJpyUzP8wxifhxna67b9iBcIktsvkcCXPvYPaAZDvu0P/sTZ6u+RxhgnMlyXgKi76khC+NKwwhDJI5uMZowQmNLHMeZYhUCF6kVM8ZlUxRB3mgO1CRuKog6tab5ung13PZhsZxth3M7/4trB6+7iI5Tc/q8M1rbwuVnOghXuZL2+L+u7YI9BlO7MV+4edZ3ZdXcfCFmMdTW+rHQ9v9TiE98ODz+3l82H2M9GzRhUM9n1KEQ1jfqHWeMov8ASxXilzoSZgCHHWsaR40dxts6qIqjiiRqJiNKujhMWngTzvdfbUDbSrRp0kHWVBJnjW1UNLrYrMpcOwnQ/SJFegxoT07OaZ/J7FAvDvLZsPT7JlGpb2Z0exZNx9EgVgLpKrNBDYo2+FfrHeIRsTZePkIlQXCApJCb0uo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 03:51:09.8796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a681e5-d1f7-477b-c3d9-08d74dfe40cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0187
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuGvDxDXTpgyKw0GR/onDFCZ+hlZzEGb75VbtAP1HVs=;
 b=lFfX728YH57bY9sEVjstgZTu6yilwfAuH4+vZwKaTFObwQhbzcp1jkQWMapowARm/AGTIGkx9LXMRnQ90UUHsW2OucpAzhTaEmli3zIlq3DSOISV43NMB0bJLu8KE4e7rZDaZI204KE1Zy4hh3XNIqFeOug03Lv9E5ulAoYxW+M=
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

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgptZW1vcnkgdHJhaW5pbmcg
dXNpbmcgc3BlY2lmaWMgZml4ZWQgdnJhbSBzZWdtZW50LCByZXNlcnZlIHRoZXNlCnNlZ21lbnRz
IGJlZm9yZSBhbnlvbmUgbWF5IGFsbG9jYXRlIGl0LgoKQ2hhbmdlLUlkOiBJMTQzNjc1NTgxM2E1
NjU2MDhhMjg1N2E2ODNmNTM1Mzc3NjIwYTYzNwpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaWFuY2kuWWluIDx0aWFu
Y2kueWluQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jIHwgOTYgKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDk2IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKaW5kZXgg
OWRhNjM1MGE0YmEyLi40MmQwZmNiOTgzODIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMKQEAgLTE2NjcsNiArMTY2Nyw5MyBAQCBzdGF0aWMgaW50IGFtZGdwdV90dG1f
ZndfcmVzZXJ2ZV92cmFtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQkJCSAg
JmFkZXYtPmZ3X3ZyYW1fdXNhZ2UudmEpOwogfQogCisvKgorICogTWVtb3kgdHJhaW5pbmcgcmVz
ZXJ2YXRpb24gZnVuY3Rpb25zCisgKi8KKworLyoqCisgKiBhbWRncHVfdHRtX3RyYWluaW5nX3Jl
c2VydmVfdnJhbV9maW5pIC0gZnJlZSBtZW1vcnkgdHJhaW5pbmcgcmVzZXJ2ZWQgdnJhbQorICoK
KyAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKKyAqCisgKiBmcmVlIG1lbW9yeSB0cmFp
bmluZyByZXNlcnZlZCB2cmFtIGlmIGl0IGhhcyBiZWVuIHJlc2VydmVkLgorICovCitzdGF0aWMg
aW50IGFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2Zpbmkoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCit7CisJc3RydWN0IHBzcF9tZW1vcnlfdHJhaW5pbmdfY29udGV4dCAqY3R4
ID0gJmFkZXYtPnBzcC5tZW1fdHJhaW5fY3R4OworCisJY3R4LT5pbml0ID0gUFNQX01FTV9UUkFJ
Tl9OT1RfU1VQUE9SVDsKKwlpZiAoY3R4LT5jMnBfYm8pIHsKKwkJYW1kZ3B1X2JvX2ZyZWVfa2Vy
bmVsKCZjdHgtPmMycF9ibywgTlVMTCwgTlVMTCk7CisJCWN0eC0+YzJwX2JvID0gTlVMTDsKKwl9
CisJaWYgKGN0eC0+cDJjX2JvKSB7CisJCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmY3R4LT5wMmNf
Ym8sIE5VTEwsIE5VTEwpOworCQljdHgtPnAyY19ibyA9IE5VTEw7CisJfQorCisJcmV0dXJuIDA7
Cit9CisKKy8qKgorICogYW1kZ3B1X3R0bV90cmFpbmluZ19yZXNlcnZlX3ZyYW1faW5pdCAtIGNy
ZWF0ZSBibyB2cmFtIHJlc2VydmF0aW9uIGZyb20gbWVtb3J5IHRyYWluaW5nCisgKgorICogQGFk
ZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgorICoKKyAqIGNyZWF0ZSBibyB2cmFtIHJlc2VydmF0
aW9uIGZyb20gbWVtb3J5IHRyYWluaW5nLgorICovCitzdGF0aWMgaW50IGFtZGdwdV90dG1fdHJh
aW5pbmdfcmVzZXJ2ZV92cmFtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJ
aW50IHJldDsKKwlzdHJ1Y3QgcHNwX21lbW9yeV90cmFpbmluZ19jb250ZXh0ICpjdHggPSAmYWRl
di0+cHNwLm1lbV90cmFpbl9jdHg7CisKKwltZW1zZXQoY3R4LCAwLCBzaXplb2YoKmN0eCkpOwor
CWlmICghYWRldi0+ZndfdnJhbV91c2FnZS5tZW1fdHJhaW5fc3VwcG9ydCkgeworCQlEUk1fREVC
VUcoIm1lbW9yeSB0cmFpbmluZyBkb2VzIG5vdCBzdXBwb3J0IVxuIik7CisJCXJldHVybiAwOwor
CX0KKworCWN0eC0+YzJwX3RyYWluX2RhdGFfb2Zmc2V0ID0gYWRldi0+ZndfdnJhbV91c2FnZS5t
ZW1fdHJhaW5fZmJfbG9jOworCWN0eC0+cDJjX3RyYWluX2RhdGFfb2Zmc2V0ID0gKGFkZXYtPmdt
Yy5tY192cmFtX3NpemUgLSBHRERSNl9NRU1fVFJBSU5JTkdfT0ZGU0VUKTsKKwljdHgtPnRyYWlu
X2RhdGFfc2l6ZSA9IEdERFI2X01FTV9UUkFJTklOR19EQVRBX1NJWkVfSU5fQllURVM7CisKKwlE
Uk1fREVCVUcoInRyYWluX2RhdGFfc2l6ZTolbGx4LHAyY190cmFpbl9kYXRhX29mZnNldDolbGx4
LGMycF90cmFpbl9kYXRhX29mZnNldDolbGx4LlxuIiwKKwkJICBjdHgtPnRyYWluX2RhdGFfc2l6
ZSwKKwkJICBjdHgtPnAyY190cmFpbl9kYXRhX29mZnNldCwKKwkJICBjdHgtPmMycF90cmFpbl9k
YXRhX29mZnNldCk7CisKKwlyZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbF9hdChhZGV2LAor
CQkJCQkgY3R4LT5wMmNfdHJhaW5fZGF0YV9vZmZzZXQsCisJCQkJCSBjdHgtPnRyYWluX2RhdGFf
c2l6ZSwKKwkJCQkJIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCisJCQkJCSAmY3R4LT5wMmNfYm8s
CisJCQkJCSBOVUxMKTsKKwlpZiAocmV0KSB7CisJCURSTV9FUlJPUigiYWxsb2MgcDJjX2JvIGZh
aWxlZCglZCkhXG4iLCByZXQpOworCQlyZXQgPSAtRU5PTUVNOworCQlnb3RvIGVycl9vdXQ7CisJ
fQorCisJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwKKwkJCQkJIGN0eC0+
YzJwX3RyYWluX2RhdGFfb2Zmc2V0LAorCQkJCQkgY3R4LT50cmFpbl9kYXRhX3NpemUsCisJCQkJ
CSBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAorCQkJCQkgJmN0eC0+YzJwX2JvLAorCQkJCQkgTlVM
TCk7CisJaWYgKHJldCkgeworCQlEUk1fRVJST1IoImFsbG9jIGMycF9ibyBmYWlsZWQoJWQpIVxu
IiwgcmV0KTsKKwkJcmV0ID0gLUVOT01FTTsKKwkJZ290byBlcnJfb3V0OworCX0KKworCWN0eC0+
aW5pdCA9IFBTUF9NRU1fVFJBSU5fUkVTRVJWRV9TVUNDRVNTOworCXJldHVybiAwOworCitlcnJf
b3V0OgorCWFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2ZpbmkoYWRldik7CisJcmV0
dXJuIHJldDsKK30KKwogLyoqCiAgKiBhbWRncHVfdHRtX2luaXQgLSBJbml0IHRoZSBtZW1vcnkg
bWFuYWdlbWVudCAodHRtKSBhcyB3ZWxsIGFzIHZhcmlvdXMKICAqIGd0dC92cmFtIHJlbGF0ZWQg
ZmllbGRzLgpAQCAtMTc0MCw2ICsxODI3LDE0IEBAIGludCBhbWRncHVfdHRtX2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCXJldHVybiByOwogCX0KIAorCS8qCisJICpUaGUgcmVz
ZXJ2ZWQgdnJhbSBmb3IgbWVtb3J5IHRyYWluaW5nIG11c3QgYmUgcGlubmVkIHRvIHRoZSBzcGVj
aWZpZWQKKwkgKnBsYWNlIG9uIHRoZSBWUkFNLCBzbyByZXNlcnZlIGl0IGVhcmx5LgorCSAqLwor
CXIgPSBhbWRncHVfdHRtX3RyYWluaW5nX3Jlc2VydmVfdnJhbV9pbml0KGFkZXYpOworCWlmIChy
KQorCQlyZXR1cm4gcjsKKwogCS8qIGFsbG9jYXRlIG1lbW9yeSBhcyByZXF1aXJlZCBmb3IgVkdB
CiAJICogVGhpcyBpcyB1c2VkIGZvciBWR0EgZW11bGF0aW9uIGFuZCBwcmUtT1Mgc2Nhbm91dCBi
dWZmZXJzIHRvCiAJICogYXZvaWQgZGlzcGxheSBhcnRpZmFjdHMgd2hpbGUgdHJhbnNpdGlvbmlu
ZyBiZXR3ZWVuIHByZS1PUwpAQCAtMTgyNSw2ICsxOTIwLDcgQEAgdm9pZCBhbWRncHVfdHRtX2Zp
bmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCXJldHVybjsKIAogCWFtZGdwdV90dG1f
ZGVidWdmc19maW5pKGFkZXYpOworCWFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2Zp
bmkoYWRldik7CiAJYW1kZ3B1X3R0bV9md19yZXNlcnZlX3ZyYW1fZmluaShhZGV2KTsKIAlpZiAo
YWRldi0+bW1hbi5hcGVyX2Jhc2Vfa2FkZHIpCiAJCWlvdW5tYXAoYWRldi0+bW1hbi5hcGVyX2Jh
c2Vfa2FkZHIpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
