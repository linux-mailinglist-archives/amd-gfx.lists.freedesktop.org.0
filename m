Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 358FD2BAE6
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8553C89AA6;
	Mon, 27 May 2019 19:52:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92EF89AB2
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:13 +0000 (UTC)
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 BN6PR1201MB0051.namprd12.prod.outlook.com (2603:10b6:405:54::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.16; Mon, 27 May
 2019 19:52:12 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Mon, 27 May 2019 19:52:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:11 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:51:58 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 16/26] drm/amd/display: do not power on eDP power rail early
Date: Mon, 27 May 2019 15:50:55 -0400
Message-ID: <1558986665-12964-17-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(2351001)(48376002)(50466002)(86152003)(2616005)(14444005)(126002)(446003)(11346002)(4326008)(76176011)(486006)(336012)(47776003)(51416003)(7696005)(476003)(77096007)(426003)(26005)(50226002)(53416004)(68736007)(8676002)(305945005)(70586007)(81156014)(81166006)(70206006)(6916009)(186003)(53936002)(8936002)(36756003)(86362001)(72206003)(2906002)(5660300002)(2876002)(478600001)(316002)(16586007)(6666004)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0051; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ccb9ceb-8c4d-432a-41d9-08d6e2dccf77
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR1201MB0051; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0051:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0051EF49ED3C15ACC38CD8BD821D0@BN6PR1201MB0051.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bF8a+F14zt0Rc9D2JY/1eRpSKhmCxPNs6Q+RK1tVqkIB2za0zVGw0XR3pcaQNYNTnqSp1D/kjSbD+ur9Xk2xNQlCiLN+ypxMyx5a7WVXab6W6ikkcqOOOhIaH+nqmPYdjEAHJjGpLFP5C523JlhuA4+aPNSIEkF5YluNDUt7TZuFQOEcI3kfZvZIUeL99mIWnYpYfy4KZtGV6O9gwqYcd0tUQXM9kOynABfleFIju/tiP2B4oLv6y3+XoQT2CqGw+5IZOnOnh/SS3XRFHD0od/uVgo/UHLp2r25bEAvVYawydDXsvG+SsZBAX1VkjpajbhWcLAZ9yO44eGdPt0Aorrta6I7JdvF7anJAlqH6Gn+vyZ2rgVL7epvZsTZOfQhEusf8GMVX068dFNskATXtM3oac6ESpQAxnD8VnukvP0o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:11.7581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ccb9ceb-8c4d-432a-41d9-08d6e2dccf77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0051
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pqtw+wCRaC+Ib7/Yi4bA7kH9DNQQPYmYWg+tIg1nNfY=;
 b=eN+ywA71/4RWeraAFYD28f/Fvd4rP3P7kXmJQrrOQ5kWu/MTxlM3XJodQrx5VQr8gHwP/Pt2iZYo88fRqdNYBoONTW0m/i15a4AKiJEV1gwrBmD1SWenq/C84eMjC4ci8VXApEKpEr3ZTq1O58AKzD+VeIEUhsKHxe2ju55Jnw4=
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
Cc: Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CgpbV2h5XQpNb2Rlcm4gU3Rh
bmRieSBtYXkgdG9nZ2xlIGRpc3BsYXkgYWRhcHRlciBzdGF0ZSBiZXR3ZWVuIEQwCmFuZCBEMyBz
dGF0ZSB1bnByZWRpY3RhYmx5LgpCdXQgZXZlbnRzIHRoYXQgY2F1c2UgdHJhbnNpdGlvbiB0byBE
MCBhcmUgbm90IGFsd2F5cyByZXN1bHRpbmcKaW4gYSBkaXNwbGF5IGxpZ2h0IHVwIHNjZW5hcmlv
LgoKTW9kZXJuIGVEUCBwYW5lbHMgc2hvdWxkIGJlIGFibGUgdG8gcG93ZXIgb24gcGFuZWwgbG9n
aWMKcXVpY2tseSB1cG9uIFZERCBnb2luZyBoaWdoLiBCYXNlZCBvbiBzcGVjLCB0aGUgVDMgdGlt
ZQpiZXR3ZWVuIFZERCBvbiBhbmQgSFBEIGhpZ2ggY2FuIGJlIGJldHdlZW4gMCBhbmQgODAgbXMu
CgpEb2luZyBhbnkgdHJpY2t5IHNvcnRzIG9mIG9wdGltaXphdGlvbiBieSBwb3dlcmluZyBvbiBw
YW5lbApWREQgZWFybHkgZHVyaW5nIEQwIHRyYW5zaXRpb24gb24gY2FuIG5lZ2F0aXZlbHkgaW1w
YWN0IG90aGVyCmZlYXR1cmVzIGR1ZSB0byB1bm5lY2Vzc2FyeSBwb3dlciBkcmFpbiBhbmQgdG9n
Z2xpbmcgd2hlbgpmaW5hbCBzeXN0ZW0gc3RhdGUgZG9lcyBub3QgaW50ZW5kIGZvciB0aGUgcGFu
ZWwgdG8gYmUgbGl0IHVwLgoKV2UgbmVlZCBPRU1zIHRvIHNvdXJjZSBoaWdoZXIgZW5kIHBhbmVs
cyB0aGF0IGhhdmUgVDMgdGltZQpjbG9zZSB0byAwIGlmIHRoZXkgd2FudCBxdWljayBTMy9Nb2Rl
cm4gU3RhbmRieSByZXN1bWUgdGltZXMuCgpbSG93XQpSZW1vdmUgcGFuZWwgVkREIHBvd2VyIG9u
IGluIGluaXRfaHcKClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQu
Y29tPgpSZXZpZXdlZC1ieTogVG9ueSBDaGVuZyA8VG9ueS5DaGVuZ0BhbWQuY29tPgpBY2tlZC1i
eTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMgfCAzIC0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jICAgfCAzIC0t
LQogMiBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMK
aW5kZXggZjNkZDExNy4uMzA0Mjc0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMKQEAgLTIzNTIs
OSArMjM1Miw2IEBAIHN0YXRpYyB2b2lkIGluaXRfaHcoc3RydWN0IGRjICpkYykKIAkJICogZGVm
YXVsdCBzaWduYWwgb24gY29ubmVjdG9yKS4gKi8KIAkJc3RydWN0IGRjX2xpbmsgKmxpbmsgPSBk
Yy0+bGlua3NbaV07CiAKLQkJaWYgKGxpbmstPmxpbmtfZW5jLT5jb25uZWN0b3IuaWQgPT0gQ09O
TkVDVE9SX0lEX0VEUCkKLQkJCWRjLT5od3NzLmVkcF9wb3dlcl9jb250cm9sKGxpbmssIHRydWUp
OwotCiAJCWxpbmstPmxpbmtfZW5jLT5mdW5jcy0+aHdfaW5pdChsaW5rLT5saW5rX2VuYyk7CiAJ
fQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNu
MTBfaHdfc2VxdWVuY2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAv
ZGNuMTBfaHdfc2VxdWVuY2VyLmMKaW5kZXggYzIyMDdkZi4uODIxYTI4MCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1
ZW5jZXIuYwpAQCAtMTEwMiw5ICsxMTAyLDYgQEAgc3RhdGljIHZvaWQgZGNuMTBfaW5pdF9odyhz
dHJ1Y3QgZGMgKmRjKQogCQkgKi8KIAkJc3RydWN0IGRjX2xpbmsgKmxpbmsgPSBkYy0+bGlua3Nb
aV07CiAKLQkJaWYgKGxpbmstPmxpbmtfZW5jLT5jb25uZWN0b3IuaWQgPT0gQ09OTkVDVE9SX0lE
X0VEUCkKLQkJCWRjLT5od3NzLmVkcF9wb3dlcl9jb250cm9sKGxpbmssIHRydWUpOwotCiAJCWxp
bmstPmxpbmtfZW5jLT5mdW5jcy0+aHdfaW5pdChsaW5rLT5saW5rX2VuYyk7CiAKIAkJLyogQ2hl
Y2sgZm9yIGVuYWJsZWQgRElHIHRvIGlkZW50aWZ5IGVuYWJsZWQgZGlzcGxheSAqLwotLSAKMi43
LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
