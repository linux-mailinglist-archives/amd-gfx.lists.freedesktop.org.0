Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B6369DAF
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C5289C2C;
	Mon, 15 Jul 2019 21:21:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780079.outbound.protection.outlook.com [40.107.78.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFEF89C07
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgbsOGV0V8TZsibA5nelD/oI3y0iOOhMQWQk2HWdyGLQR/qDKNb4Jd0MaXEmSzokVbJVej8EXTmALXZM575Y408jWteV1E97sJ1454KqyCNbnVdeF/1k9dpOHScdql37lZfaRPTulxAvJlwkQAYemy7S+3pHzazLsBM11uc6qeiSVIYykuJIdP9WAXG+TvG2MO9gtomQLhumWPR9y8W86li9iwKOXruAryccWi63VBukHi9cYBgPPFwoof9FsRg0az+KwXuEC9wy/YnbyObFHaKQRGF1UA9aTNMQbk0Pi8LOLwmhAwMGltQvOYRuHfSWPtviTZqZT4+wfoVy5S85Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xjj1NfiAOqIMyFiEBd6mx2/X5SAW51YJVdphKM4fssM=;
 b=cyV/0szFmpVrXxw31m43H1UKm+MYemgH0nt6dfDT+RGovBNQBgcyoucBJf6hxp7XM6oWCQRC3dzuGXd8XnO0Ee0WHJweMrCBCmkmjaHWYrjO7JHXdglbrAJInzQKXhTzQfqI3x72pJ1A7Ix/SLaf52CJEpiNpkNR1y0f7uE4eHp+yuxwtMHZUYp3P8B6sRNprdPo3mMB1lQTC5w7W5KmgAHItF9HkZhkOgHq8teOkvu5WeQsG6Zh+hAVd4c4CIXdTjUE9GE1uPl6A41CQ3uynOF1HQbsXetALAO8yVhtoOqeQ6Us1FivMX6+wDGfCTzffp15dOAg/Y7o5eOGtWtv7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0007.namprd12.prod.outlook.com (2603:10b6:208:a8::20)
 by CH2PR12MB3928.namprd12.prod.outlook.com (2603:10b6:610:23::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:31 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MN2PR12CA0007.outlook.office365.com
 (2603:10b6:208:a8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:31 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:19 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 29/87] drm/amd/display: add functionality to get pipe CRC
 source.
Date: Mon, 15 Jul 2019 17:19:51 -0400
Message-ID: <20190715212049.4584-30-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(2980300002)(428003)(199004)(189003)(2351001)(14444005)(81166006)(2870700001)(68736007)(4326008)(1076003)(2906002)(81156014)(8936002)(8676002)(6916009)(6666004)(356004)(47776003)(53936002)(50226002)(426003)(50466002)(478600001)(2876002)(305945005)(316002)(11346002)(49486002)(5660300002)(48376002)(2616005)(51416003)(446003)(126002)(336012)(76176011)(486006)(86362001)(186003)(476003)(70206006)(70586007)(54906003)(36756003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3928; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a28b0ddd-5f34-4425-3e6c-08d7096a6818
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CH2PR12MB3928; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3928:
X-Microsoft-Antispam-PRVS: <CH2PR12MB39284544D124F888F101A82982CF0@CH2PR12MB3928.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: UwiNlUVVt5YDyKl/FzfdMSevDElzTWARKgznWQoqehxkd5aExEHprcn4Tfnc/p5s6KXK5yasUjkOPBrl2JSwvEgUbByBhw4GlPb7rLLaDP/diKR+Fw4wFzVoL4um7JCHXtAAS8gG5y0oa4/UoxNm1EbCKahlyl0LjhwqhajBsB2dCHSJHLn84yErPL3LuL54em/OtlFTU4Qv3itUo0SOQr5NBw6PWHL+T2E4mzkBefKQSGY97FsbpzXKM6bhlRUyJXNLwcn97sJkgf/13m3yKFaQiEKAWiKTyLXhCBHODbXytXMnx0CXHi+JMKHwq0BS/aNslmUSuzdiz3jy0NWfeBOV3PwTiErhLpEXZXiOp4ooVyblLID4yl5si6YGx6R/SLiqGE3aBpcs0FOpkz795DUPuRRlJOH5hIMA5xEg5Ao=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:31.1835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a28b0ddd-5f34-4425-3e6c-08d7096a6818
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3928
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xjj1NfiAOqIMyFiEBd6mx2/X5SAW51YJVdphKM4fssM=;
 b=ZmfoZvQ0LmJtv5BbULuN9thuQRov2cmM0i5BHxWEIGFMRK0DA0Qsebpgaql2s7nEmWciAj5IqZW7a/AndWipV309ZcEPiHuWrDAUpygqkUYmye7nkDWOz6bVLrbFEH/C2j84dAgA6/Zri6CvYoL45P8CRDpyEXTKBPPjjKj1S+w=
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
Cc: Leo Li <sunpeng.li@amd.com>, Dingchen Zhang <dingchen.zhang@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGluZ2NoZW4gWmhhbmcgPGRpbmdjaGVuLnpoYW5nQGFtZC5jb20+CgpbV2h5XQpXZSBu
ZWVkIHRvIGNoZWNrIHRoZSBwaXBlIGNyYyBzb3VyY2UgdGhyb3VnaCBkZWJ1Z2ZzIGZvciBieXBh
c3MgbW9kZSB0ZXN0LgoKW0hvd10KYWRkIGltcGxlbWVudGF0aW9uIG9mIGFtZGdwdV9kbV9jcnRj
X2dldF9jcmNfc291cmNlcyBhbmQgaG9vayBpbnRvIGRybV9jcnRjCmNhbGxiYWNrIGdldF9jcmNf
c291cmNlcy4KClNpZ25lZC1vZmYtYnk6IERpbmdjaGVuIFpoYW5nIDxkaW5nY2hlbi56aGFuZ0Bh
bWQuY29tPgpSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8TmljaG9sYXMuS2F6bGF1
c2thc0BhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyAgfCAgMSAr
CiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2NyYy5jICB8IDE0
ICsrKysrKysrKysrKysrCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX2NyYy5oICB8ICAzICsrKwogMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
aW5kZXggYjJlMmNhNjU3OTk4Li45NmIzMmMyMDM1NjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtMzgwNiw2ICszODA2LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19mdW5jcyBhbWRncHVfZG1fY3J0Y19mdW5j
cyA9IHsKIAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBkbV9jcnRjX2Rlc3Ryb3lfc3RhdGUsCiAJ
LnNldF9jcmNfc291cmNlID0gYW1kZ3B1X2RtX2NydGNfc2V0X2NyY19zb3VyY2UsCiAJLnZlcmlm
eV9jcmNfc291cmNlID0gYW1kZ3B1X2RtX2NydGNfdmVyaWZ5X2NyY19zb3VyY2UsCisJLmdldF9j
cmNfc291cmNlcyA9IGFtZGdwdV9kbV9jcnRjX2dldF9jcmNfc291cmNlcywKIAkuZW5hYmxlX3Zi
bGFuayA9IGRtX2VuYWJsZV92YmxhbmssCiAJLmRpc2FibGVfdmJsYW5rID0gZG1fZGlzYWJsZV92
YmxhbmssCiB9OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV9jcmMuYwppbmRleCA1MjkzMDQ1YjAxNjQuLjc0MzZjMmU1YTBhOSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
Y3JjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1fY3JjLmMKQEAgLTI5LDYgKzI5LDEzIEBACiAjaW5jbHVkZSAiYW1kZ3B1X2RtLmgiCiAjaW5j
bHVkZSAiZGMuaCIKIAorc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IHBpcGVfY3JjX3NvdXJjZXNb
XSA9IHsKKwkibm9uZSIsCisJImNydGMiLAorCSJkcHJ4IiwKKwkiYXV0byIsCit9OworCiBzdGF0
aWMgZW51bSBhbWRncHVfZG1fcGlwZV9jcmNfc291cmNlIGRtX3BhcnNlX2NyY19zb3VyY2UoY29u
c3QgY2hhciAqc291cmNlKQogewogCWlmICghc291cmNlIHx8ICFzdHJjbXAoc291cmNlLCAibm9u
ZSIpKQpAQCAtNDEsNiArNDgsMTMgQEAgc3RhdGljIGVudW0gYW1kZ3B1X2RtX3BpcGVfY3JjX3Nv
dXJjZSBkbV9wYXJzZV9jcmNfc291cmNlKGNvbnN0IGNoYXIgKnNvdXJjZSkKIAlyZXR1cm4gQU1E
R1BVX0RNX1BJUEVfQ1JDX1NPVVJDRV9JTlZBTElEOwogfQogCitjb25zdCBjaGFyICpjb25zdCAq
YW1kZ3B1X2RtX2NydGNfZ2V0X2NyY19zb3VyY2VzKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKKwkJ
CQkJCSAgc2l6ZV90ICpjb3VudCkKK3sKKwkqY291bnQgPSBBUlJBWV9TSVpFKHBpcGVfY3JjX3Nv
dXJjZXMpOworCXJldHVybiBwaXBlX2NyY19zb3VyY2VzOworfQorCiBpbnQKIGFtZGdwdV9kbV9j
cnRjX3ZlcmlmeV9jcmNfc291cmNlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywgY29uc3QgY2hhciAq
c3JjX25hbWUsCiAJCQkJIHNpemVfdCAqdmFsdWVzX2NudCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2NyYy5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fY3JjLmgKaW5kZXggMzc5M2Rj
ODcyNDM2Li5iNjNhOTAxMWY1MTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2NyYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2NyYy5oCkBAIC00NiwxMCArNDYsMTMgQEAgaW50
IGFtZGdwdV9kbV9jcnRjX3NldF9jcmNfc291cmNlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywgY29u
c3QgY2hhciAqc3JjX25hbWUpOwogaW50IGFtZGdwdV9kbV9jcnRjX3ZlcmlmeV9jcmNfc291cmNl
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkJCQkgICAgIGNvbnN0IGNoYXIgKnNyY19uYW1lLAog
CQkJCSAgICAgc2l6ZV90ICp2YWx1ZXNfY250KTsKK2NvbnN0IGNoYXIgKmNvbnN0ICphbWRncHVf
ZG1fY3J0Y19nZXRfY3JjX3NvdXJjZXMoc3RydWN0IGRybV9jcnRjICpjcnRjLAorCQkJCQkJICBz
aXplX3QgKmNvdW50KTsKIHZvaWQgYW1kZ3B1X2RtX2NydGNfaGFuZGxlX2NyY19pcnEoc3RydWN0
IGRybV9jcnRjICpjcnRjKTsKICNlbHNlCiAjZGVmaW5lIGFtZGdwdV9kbV9jcnRjX3NldF9jcmNf
c291cmNlIE5VTEwKICNkZWZpbmUgYW1kZ3B1X2RtX2NydGNfdmVyaWZ5X2NyY19zb3VyY2UgTlVM
TAorI2RlZmluZSBhbWRncHVfZG1fY3J0Y19nZXRfY3JjX3NvdXJjZXMgTlVMTAogI2RlZmluZSBh
bWRncHVfZG1fY3J0Y19oYW5kbGVfY3JjX2lycSh4KQogI2VuZGlmCiAKLS0gCjIuMjIuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
