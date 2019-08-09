Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02478850B
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBA76EEC4;
	Fri,  9 Aug 2019 21:38:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710050.outbound.protection.outlook.com [40.107.71.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22566EEC6
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHpEH0WKIDYRgxewnVABuEitQ+8/HyF7zqUeUkeaxWBadmyhlOMB6eurdGV5FgKZvZHTrMz44TyPP4KbsIATPHYIYx3fDaQV4rjyIeTlCel+xqaVUN8ZzqO8dhIPjMrnrZ46rYkGYrBdjM/moZKfNIjUfm3R5iXWz+wfRyfxwRBxN2BAoeCS0rnurH5ImSrVGU6IVxU/iLCkPkFSXNQn/QXKUIMtCuQajqZALaFzBYORe2y3XoYGxhclortEFsKPwO4T1y+0sWE3qaHM8qGLggFYvxUjXSXWw64hTeHfyvBGEph5zUeznIfASOO7wK4Ks6/6rS49qLWvJAi4dCn8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Cn3pv579EVxspNx+bPuYp7Kmy3vhA3Vy1HI/B74RYw=;
 b=YZlAFthFa5C5PsPfCsvua5U9/UmoghkcnYG86sV0kSpeKilst2qvp3tU/tzK73p7ip5uWsC2jo7w+9swI/Pp309IuqZQYytaKUG+jR7rPeMFSbeeQdwdIoE3VYZ7GLg2uEQiHIvlrxbsBxCZzz5UG68iqIscY29InZF/1wjUBG3aab/nga+WfoCzV6xEwVvwO29MgFM3nCuX0xLlseDLbr7iLg81xNaKXWJlvdhiMyksSqZGuf0OIINhKnj5TxLZ2rCQxJ+Vb+t1wiAFBrlPFqlou15RulqExX4VNHwnkbwrylO4HIuV9JXRXsD7ppo1oPTSdweoV+CWzFNmOZ7vtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0004.namprd12.prod.outlook.com
 (2603:10b6:405:4c::14) by DM6PR12MB2715.namprd12.prod.outlook.com
 (2603:10b6:5:4a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18; Fri, 9 Aug
 2019 21:38:50 +0000
Received: from DM3NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by BN6PR1201CA0004.outlook.office365.com
 (2603:10b6:405:4c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT003.mail.protection.outlook.com (10.152.82.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:50 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:40 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 35/49] drm/amd/display: Correct DSC PPS log
Date: Fri, 9 Aug 2019 17:37:28 -0400
Message-ID: <20190809213742.30301-36-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39850400004)(136003)(2980300002)(428003)(199004)(189003)(4326008)(86362001)(478600001)(1076003)(316002)(50466002)(48376002)(6916009)(305945005)(50226002)(53936002)(81166006)(8676002)(36756003)(54906003)(70586007)(81156014)(8936002)(70206006)(356004)(2876002)(426003)(51416003)(336012)(486006)(2870700001)(2616005)(11346002)(126002)(476003)(2351001)(14444005)(2906002)(76176011)(5660300002)(49486002)(47776003)(186003)(26005)(446003)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2715; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca184ed3-6761-48c2-ef6e-08d71d11f7a1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2715; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2715:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27157FB81EABC1422A203F9782D60@DM6PR12MB2715.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +jPVFuI2FgEU7lsq1xBHFc7ODH4vuA/HK/L/HSvlF4UiD0TCQho9NgQJQYoLQDTeEd9KvtZXEl140jgS6qn4+AOnWP7dcnwqnuPVonIDotV1wX98SsKuMOAj172JlC+bNWVCV+RVj5Mw3l1fTSbIW4WxCyAPejs/HewMFcyit4oi7f/vjmarPqYH2TksSw8uT676TSAwf8stC+wqOSGmH0yhO4NzHhyD8BK47odMbdtQSNh51P0qffH9ImvZajnjoDKBf9wDiQfTxtn/KX18oIwrFHT4fQQd0N6fcqi8aR55f4HPleYnuGGG7j4pL3lXtTU/ROSosaxyT3Jh/dQwX/f2+cKjEuSNPuVHd4xTi7nPzV6a/pfhrRR9f8km9YFD1lb2VorIwiBYSGYWfaQ1tZpqmAKQxgVxmyAqd1SgVGE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:50.1468 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca184ed3-6761-48c2-ef6e-08d71d11f7a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2715
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Cn3pv579EVxspNx+bPuYp7Kmy3vhA3Vy1HI/B74RYw=;
 b=ED2q2vJDMyfN2mUXz51eDjhHPI8YFHEW7oUDyAY/BW3KXqPDxMwjS+5WDCnxRKfdRCbu0Ex2Y7y79mERn74kGX1k0unyX66y1lw5wi3E5PqzXEO1zD5CIWmS83O6JeUqXy1aZ716S/vtg5fV50DgtYj8aqdB2bnUNOsrtVQIHAA=
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
Cc: Leo Li <sunpeng.li@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KQSBtaXNs
ZWFkaW5nIG1lc3NhZ2UgIlByb2dyYW1taW5nIFBQUyIgYXBwZWFycyBiZWZvcmUgYm90aCBwcm9n
cmFtbWluZwphbmQgInF1ZXJ5IFBQUyIgZnVuY3Rpb25zCgpbaG93XQpNb3ZlIHRoZSBtZXNzYWdl
IGZyb20gImxvZyBQUFMiIGZ1bmN0aW9uIHRvICJwcm9ncmFtIFBQUyIgZnVuY3Rpb24KClNpZ25l
ZC1vZmYtYnk6IE5pa29sYSBDb3JuaWogPG5pa29sYS5jb3JuaWpAYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IFdlbmppbmcgTGl1IDxXZW5qaW5nLkxpdUBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxz
dW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX2RzYy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX2RzYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX2RzYy5jCmluZGV4IDE0MjcwYTk4Yzk2ZC4uODA4ZjRkMTU0ZTYxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCkBAIC0xOTIs
NiArMTkyLDcgQEAgc3RhdGljIHZvaWQgZHNjMl9zZXRfY29uZmlnKHN0cnVjdCBkaXNwbGF5X3N0
cmVhbV9jb21wcmVzc29yICpkc2MsIGNvbnN0IHN0cnVjdAogCWRzY19jb25maWdfbG9nKGRzYywg
ZHNjX2NmZyk7CiAJaXNfY29uZmlnX29rID0gZHNjX3ByZXBhcmVfY29uZmlnKGRzY19jZmcsICZk
c2MyMC0+cmVnX3ZhbHMsIGRzY19vcHRjX2NmZyk7CiAJQVNTRVJUKGlzX2NvbmZpZ19vayk7CisJ
RENfTE9HX0RTQygicHJvZ3JhbW1pbmcgRFNDIFBpY3R1cmUgUGFyYW1ldGVyIFNldCAoUFBTKToi
KTsKIAlkc2NfbG9nX3Bwcyhkc2MsICZkc2MyMC0+cmVnX3ZhbHMucHBzKTsKIAlkc2Nfd3JpdGVf
dG9fcmVnaXN0ZXJzKGRzYywgJmRzYzIwLT5yZWdfdmFscyk7CiB9CkBAIC0yNTAsNyArMjUxLDYg
QEAgc3RhdGljIHZvaWQgZHNjX2xvZ19wcHMoc3RydWN0IGRpc3BsYXlfc3RyZWFtX2NvbXByZXNz
b3IgKmRzYywgc3RydWN0IGRybV9kc2NfY28KIAlpbnQgaTsKIAlpbnQgYml0c19wZXJfcGl4ZWwg
PSBwcHMtPmJpdHNfcGVyX3BpeGVsOwogCi0JRENfTE9HX0RTQygicHJvZ3JhbW1pbmcgRFNDIFBp
Y3R1cmUgUGFyYW1ldGVyIFNldCAoUFBTKToiKTsKIAlEQ19MT0dfRFNDKCJcdGRzY192ZXJzaW9u
X21ham9yICVkIiwgcHBzLT5kc2NfdmVyc2lvbl9tYWpvcik7CiAJRENfTE9HX0RTQygiXHRkc2Nf
dmVyc2lvbl9taW5vciAlZCIsIHBwcy0+ZHNjX3ZlcnNpb25fbWlub3IpOwogCURDX0xPR19EU0Mo
Ilx0Yml0c19wZXJfY29tcG9uZW50ICVkIiwgcHBzLT5iaXRzX3Blcl9jb21wb25lbnQpOwotLSAK
Mi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
