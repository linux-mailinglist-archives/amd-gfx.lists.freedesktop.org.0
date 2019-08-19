Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0869270A
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77B16E179;
	Mon, 19 Aug 2019 14:36:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680083.outbound.protection.outlook.com [40.107.68.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460C16E14F
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:36:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFSehkdb0dM0thlTYtMTjZn80bPIO4CjisT8nd7v0S/fFqjmOFeETu9yFl9sPIa0khcfh+K74AeFYh3927zlbYxumi1BukBfA5RzGWLN8wXF2aVuGAOfdhs8c1fcxv1W6o8D9cPi+xIjAfexC4muKll8FBkxNlYvc2OK7Of+G2Xyalc3wAkDp44REbhKsowjR3IsUW0FgZxXZtm/lI/PqM655VwEariWmi2MVH27EEWy38p70w7zu+AgyZPFqUlS52kMeGZyx6mvwjz15rQIjvMd68BQWXlwGHrPtkyISKj5ZzbgyrY5NtZlNobvP7+wt22+oPNmXtjAkAJfQrmJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zs+zwkrZsE1Hd27lXrXCsrewm87/w/275qk4H1WrVXc=;
 b=UF1pSMBh0wKW859FyiFJqXz0KQBEO/R0ULTdI5lkQNlEivyaLfoVaqnQz9UXWZp3OdfxVxHhqe019rgylEUDozBc1aDJT5OQUT8hWAAAyJvksaCi+KOgV3tuVLBgWbnNpzse8ogZjYyeBWQ1GCOiT/XtyaS36H6ZaA6Pomhay6y3F5PIprTXKDG/Ef/jMXTvHsIAfrieOFxz6iO9HLvlclhJ1WZiBiOt/wcpaVBAT2qhlQ1910af506j+EEDiFbrSD6by6tvPt26VQ5FJz6uPFgSlaqFo9x/sTl18LqykdM+f0EqbbKes1xJyAAfngE1ciN+jJ85sl7QTfJ9qZwTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0034.namprd12.prod.outlook.com (2603:10b6:405:70::20)
 by DM5PR12MB1531.namprd12.prod.outlook.com (2603:10b6:4:f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 14:36:07 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by BN6PR12CA0034.outlook.office365.com
 (2603:10b6:405:70::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:36:07 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:36:06 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:50 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 33/36] drm/amd/display: revert wait in pipelock
Date: Mon, 19 Aug 2019 10:35:12 -0400
Message-ID: <20190819143515.21653-34-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(316002)(53416004)(356004)(16586007)(14444005)(47776003)(76176011)(50466002)(81156014)(51416003)(7696005)(6916009)(478600001)(6666004)(336012)(486006)(36756003)(186003)(26005)(446003)(2616005)(53936002)(50226002)(476003)(70586007)(70206006)(11346002)(86362001)(126002)(426003)(2906002)(5660300002)(4326008)(48376002)(81166006)(2351001)(1076003)(305945005)(8936002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1531; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53b73297-0019-4d7e-81bd-08d724b29204
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1531; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1531:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15312118D6E9E55087877532F9A80@DM5PR12MB1531.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ih2crWxdCy+/gERdnstXx0HoemmU/lH1Y+nUukaTvVREtA4Wsw1DFWWZPI6EIXV7tE6HtPIYGsTItVSLC8AO8GjgTUvEG/qSqH/jI82Yj0sPnLlFC3/nifON8hqh3FmYhtsiN7UAFK3PIScs8eBHK/J+4QX7zSt2tOV9x+n3RklfmpaPXswVn3vVDSz81VySVdUa/OBwi4CaKeETlqGm3O3wIxrjoavil0VQZW+scKnTUhhOoo19BgkmxsSgLUjVwgrTtlq5tFgGQhKZXS85R4Qup2xDpiAEsvuv/A6efFxN5+dyvbyLihS26vURu+q4vaLtcRloqXCZ6mkEr/2OiMerwiorvXfnYRdS0/9fofSf1v3WeP8P7fAPYQ9uI46arRAF35rUt3Xm0xraxrwHWbsjiQoS2TA+feOvRyPmnNA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:36:06.7220 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b73297-0019-4d7e-81bd-08d724b29204
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1531
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zs+zwkrZsE1Hd27lXrXCsrewm87/w/275qk4H1WrVXc=;
 b=RMbl8ECkBa0CL04bmAHvcHBfizqIrc+EEeMZJEWjVFG7DUVszoi50jfXhCNaxNp0PMk/lGR5Zg4OIKt9ThZQaJMMLSwdRhaz/pUDc3A3akozCQ44bZ8OrdFhMh3cqyG3xhbgqYdTdLS0kKz93srpFZSmq1Kgmvo/UCdkYGIjg6U=
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
Cc: Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KUHJldmlvdXMgd29ya2Fyb3Vu
ZCB0byBwcmV2ZW50IGEgdnN5bmMgZmxpcCB0byBiZSBjb252ZXJ0ZWQKdG8gaW1tZWRpYXRlIGZs
aXAgaXMgbm8gbG9uZ2VyIG5lZWRlZCwgYW5kIGlzIHJpc2t5IGJlY2F1c2UKdGhlcmUgYXJlIGNh
c2VzIHdoZXJlIGl0IGNhbiByZXN1bHQgaW4gaW5maW5pdGUgbG9vcC4KCltob3ddClJlbW92ZSB3
YWl0IGxvb3AgKHdoaWNoIGlzIHBvdGVudGlhbGx5IGluZmluaXRlKSBiZWZvcmUgbG9ja2luZwpw
aXBlCgpTaWduZWQtb2ZmLWJ5OiBKdW4gTGVpIDxKdW4uTGVpQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBDaGFybGVuZSBMaXUgPENoYXJsZW5lLkxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRXJpYyBZ
YW5nIDxlcmljLnlhbmcyQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhh
d2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyB8IDExIC0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfaHdzZXEuYwppbmRleCBmYjdhMjQ0ZWFmY2EuLjY5ZDYwMDE4M2RiOCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2Vx
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2Vx
LmMKQEAgLTExMDcsMTcgKzExMDcsNiBAQCB2b2lkIGRjbjIwX3BpcGVfY29udHJvbF9sb2NrKAog
CWlmIChwaXBlLT5wbGFuZV9zdGF0ZSAhPSBOVUxMKQogCQlmbGlwX2ltbWVkaWF0ZSA9IHBpcGUt
PnBsYW5lX3N0YXRlLT5mbGlwX2ltbWVkaWF0ZTsKIAotCWlmIChmbGlwX2ltbWVkaWF0ZSAmJiBs
b2NrKSB7Ci0JCXdoaWxlIChwaXBlLT5wbGFuZV9yZXMuaHVicC0+ZnVuY3MtPmh1YnBfaXNfZmxp
cF9wZW5kaW5nKHBpcGUtPnBsYW5lX3Jlcy5odWJwKSkJewotCQkJdWRlbGF5KDEpOwotCQl9Ci0K
LQkJaWYgKHBpcGUtPmJvdHRvbV9waXBlICE9IE5VTEwpCi0JCQl3aGlsZSAocGlwZS0+Ym90dG9t
X3BpcGUtPnBsYW5lX3Jlcy5odWJwLT5mdW5jcy0+aHVicF9pc19mbGlwX3BlbmRpbmcocGlwZS0+
Ym90dG9tX3BpcGUtPnBsYW5lX3Jlcy5odWJwKSkJewotCQkJCXVkZWxheSgxKTsKLQkJCX0KLQl9
Ci0KIAkvKiBJbiBmbGlwIGltbWVkaWF0ZSBhbmQgcGlwZSBzcGxpdHRpbmcgY2FzZSwgd2UgbmVl
ZCB0byB1c2UgR1NMCiAJICogZm9yIHN5bmNocm9uaXphdGlvbi4gT25seSBkbyBzZXR1cCBvbiBs
b2NraW5nIGFuZCBvbiBmbGlwIHR5cGUgY2hhbmdlLgogCSAqLwotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
