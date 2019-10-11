Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A17D48B9
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0104B6EC97;
	Fri, 11 Oct 2019 19:53:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700055.outbound.protection.outlook.com [40.107.70.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD296EC9B
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ask3/5agRRwy2r9PXcEq/pOINQWOqzc2P8CQzpAv1M8Jmp/a3gf3W7BTFFUgEIi3KE+GnL+oajzKdKFC/bZcRu5RDDClJbrgSnuVfj0dnUAFxRcU0uI9No6k1Rae+My4Oh4MI8zkQgHZWV1Qll1y8ieSplf/tGzTz7GwBDiFwF/G17BzdpGwbE4pRcoyb2i5tX2SFgvuqKL7u6B01zR3Y1VR7rVoX8kj/EABy5pP8YrNFI3Vnyl1k49hUUafoPFz6klnpO+57V/GEzgIkIYaDOIg7ROKh35QBAdFXfGEbcikBDvletTWyobDvZNPNwwsRzKgcrUR6JcATJEDsLvFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxlZm4VCPHnVhk5u3uiX64ugYWAvzLjTxbgBfplIHSE=;
 b=JXPLVlXS2ftu8/Ub19YBGce/JsX1/ncSd83R5o9rn9ey/NrU/IS18r0InHq99iaTAvxBpnCUQ1BjCHhb7ARSzVXotnEgz7k9LscdGLsZJBrRzZKpEVWz48kbJ/EkgsiT5/5b9ez+1q1lQycXlhsub9Lpq94ybqsflX3RpQF4axkXmlPJnDPam25pzbwDNEdtGCkMo48e/wFkqKGX6ogSDgr7EXq9xR7hKg7HAej61WhYPBS9rY+DCRQ1QLpvcIHwjZKLVxrpnk3rdSvXuoyps1/5pObZk2ywdJtQEbz/sECs4CgoWzqBd6avFOyeaOpL+NbbAhy65n14wFOD3D/RQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0005.namprd12.prod.outlook.com
 (2603:10b6:405:4c::15) by MN2PR12MB4013.namprd12.prod.outlook.com
 (2603:10b6:208:163::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 19:53:53 +0000
Received: from BY2NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by BN6PR1201CA0005.outlook.office365.com
 (2603:10b6:405:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT061.mail.protection.outlook.com (10.152.85.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:53 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:48 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 21/29] drm/amd/display: update odm mode validation to be in
 line with policy
Date: Fri, 11 Oct 2019 15:53:16 -0400
Message-ID: <20191011195324.16268-22-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(428003)(189003)(199004)(2906002)(5660300002)(478600001)(50466002)(48376002)(6916009)(47776003)(36756003)(126002)(70586007)(1076003)(476003)(486006)(6666004)(356004)(4326008)(53416004)(26005)(2616005)(426003)(15650500001)(186003)(446003)(81156014)(2351001)(51416003)(7696005)(11346002)(16586007)(8936002)(8676002)(50226002)(81166006)(305945005)(86362001)(70206006)(316002)(14444005)(76176011)(336012)(44824005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4013; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 368d2836-179f-4ce5-8fd6-08d74e84be89
X-MS-TrafficTypeDiagnostic: MN2PR12MB4013:
X-Microsoft-Antispam-PRVS: <MN2PR12MB40131B1DF140E914CC2FAF10F9970@MN2PR12MB4013.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HQ0Nn9tJC1S4jNjTDBq2J5UwlyckOLrHk65GYbEY+HyjMoBjWMsOdjQkAKymS9K5gbTLeDmGa4lgiHkZcboMZRBDMN1nf0XKOMzKQWve1AtwSToPfKP30F0YaAMwd93Q0CuzBxcHcE9YjvM7aP1c2+RwX6Uf5Gn7e2MkYc6LCEOT2ev7cXSNNb34RxCrrMvmeSYvVznuPcackIVrEwUuJ5LabaJVYXXkjDxR4LRCF5adZlgFN/8p4RY75ECFv4m4vsbKwDHx/MDENCp1clbcX1Kr5dEECC62aMJRYRl4cWzVl/FLD692Ov+13uzoJupTDWxtP2UQIRNHPmNSULA7Fb9OykVrO5ymbtJmSHJrNvYWBkkiLoTU74XwZhQ30JE3rdag77eX4axV+AXTV5xahXCHdqiQV8+AWATKB94LtB0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:53.3899 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 368d2836-179f-4ce5-8fd6-08d74e84be89
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4013
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxlZm4VCPHnVhk5u3uiX64ugYWAvzLjTxbgBfplIHSE=;
 b=i9CbFUol5QFbIxXWiOgOcPwf1t723xXdUBSh2o3dnmb+nI4M2gtdc5Lr2Ji0UTjpGf2n/i5dLisGX06et+YH40pbPpcyyGjs6Lj1kiff22+1EPOKSRsQm2DsFAC6hVUoPjLgpQqSDD2hZlL5JJE88WkeUbm/ox8JFEH0UCCGD9w=
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClBy
ZXZpb3VzbHkgOGszMCB3b3JrZWQgd2l0aCBkc2MgYW5kIG9kbSBjb21iaW5lIGR1ZSB0byBhIHdv
cmthcm91bmQgdGhhdCByYW4KdGhlIGZvcm11bGEgYSBzZWNvbmQgdGltZSB3aXRoIGRzYyBzdXBw
b3J0IGVuYWJsZSBzaG91bGQgZHNjIHZhbGlkYXRpb24gZmFpbC4KVGhpcyB3b3JrZWQgd2hlbiBj
bG9ja3Mgd2VyZSBsb3cgZW5vdWdoIGZvciBmb3JtdWxhIHRvIGVuYWJsZSBvZG0gdG8gbG93ZXIK
dm9sdGFnZSwgaG93ZXZlciBub3cgYnJva2UgZHVlIHRvIGluY3JlYXNlZCBjbG9ja3MuCgpUaGlz
IGNoYW5nZSB1cGRhdGVzIHRoZSBPRE0gY29tYmluZSBwb2xpY3kgd2l0aGluIHRoZSBmb3JtdWxh
IHRvIHByb3Blcmx5CnJlZmxlY3Qgb3VyIGN1cnJlbnQgcG9saWN5IHdpdGhpbiBEQywgb25seSBl
bmFibGluZyBPRE0gd2hlbiB3ZSBoYXZlIHRvLCBhcwp3ZWxsIGFzIGFkZGluZyBhIGNoZWNrIGZv
ciB2aWV3cG9ydCB3aWR0aCB3aGVuIGRzYyBpcyBlbmFibGVkLgoKQXMgYSBzaWRlIGVmZmVjdCB0
aGUgcmVkdW5kYW50IGNhbGwgdG8gZG1sIHdoZW4gb2RtIGlzIHJlcXVpcmVkIGlzIG5vdwp1bm5l
Y2Vzc2FyeS4KClNpZ25lZC1vZmYtYnk6IERteXRybyBMYWt0eXVzaGtpbiA8RG15dHJvLkxha3R5
dXNoa2luQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQu
TGFraGFAYW1kLmNvbT4KLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24yMS9kaXNw
bGF5X21vZGVfdmJhXzIxLmMgICB8IDkgKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RtbC9kY24yMS9kaXNwbGF5X21vZGVfdmJhXzIxLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlfbW9kZV92YmFfMjEuYwppbmRl
eCAzYjZlZDYwZGNkMzUuLmZkNzA3ZTc0NTliNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RtbC9kY24yMS9kaXNwbGF5X21vZGVfdmJhXzIxLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24yMS9kaXNwbGF5X21vZGVfdmJhXzIx
LmMKQEAgLTY1LDYgKzY1LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgewogCiAjZGVmaW5lIEJQUF9JTlZB
TElEIDAKICNkZWZpbmUgQlBQX0JMRU5ERURfUElQRSAweGZmZmZmZmZmCisjZGVmaW5lIERDTjIx
X01BWF9EU0NfSU1BR0VfV0lEVEggNTE4NAogCiBzdGF0aWMgdm9pZCBEaXNwbGF5UGlwZUNvbmZp
Z3VyYXRpb24oc3RydWN0IGRpc3BsYXlfbW9kZV9saWIgKm1vZGVfbGliKTsKIHN0YXRpYyB2b2lk
IERJU1BDTEtEUFBDTEtEQ0ZDTEtEZWVwU2xlZXBQcmVmZXRjaFBhcmFtZXRlcnNXYXRlcm1hcmtz
QW5kUGVyZm9ybWFuY2VDYWxjdWxhdGlvbigKQEAgLTM5MzYsNiArMzkzNywxMCBAQCB2b2lkIGRt
bDIxX01vZGVTdXBwb3J0QW5kU3lzdGVtQ29uZmlndXJhdGlvbkZ1bGwoc3RydWN0IGRpc3BsYXlf
bW9kZV9saWIgKm1vZGVfbAogCQkJCW1vZGVfbGliLT52YmEuTWF4aW11bVN3YXRoV2lkdGhJbkxp
bmVCdWZmZXIpOwogCX0KIAlmb3IgKGkgPSAwOyBpIDw9IG1vZGVfbGliLT52YmEuc29jLm51bV9z
dGF0ZXM7IGkrKykgeworCQlkb3VibGUgTWF4TWF4RGlzcGNsa1JvdW5kZWREb3duID0gUm91bmRU
b0RGU0dyYW51bGFyaXR5RG93bigKKwkJCW1vZGVfbGliLT52YmEuTWF4RGlzcGNsa1ttb2RlX2xp
Yi0+dmJhLnNvYy5udW1fc3RhdGVzXSwKKwkJCW1vZGVfbGliLT52YmEuRElTUENMS0RQUENMS1ZD
T1NwZWVkKTsKKwogCQlmb3IgKGogPSAwOyBqIDwgMjsgaisrKSB7CiAJCQltb2RlX2xpYi0+dmJh
Lk1heERpc3BjbGtSb3VuZGVkRG93blRvREZTR3JhbnVsYXJpdHkgPSBSb3VuZFRvREZTR3JhbnVs
YXJpdHlEb3duKAogCQkJCW1vZGVfbGliLT52YmEuTWF4RGlzcGNsa1tpXSwKQEAgLTM5NjUsNyAr
Mzk3MCw5IEBAIHZvaWQgZG1sMjFfTW9kZVN1cHBvcnRBbmRTeXN0ZW1Db25maWd1cmF0aW9uRnVs
bChzdHJ1Y3QgZGlzcGxheV9tb2RlX2xpYiAqbW9kZV9sCiAJCQkJCQkmJiBpID09IG1vZGVfbGli
LT52YmEuc29jLm51bV9zdGF0ZXMpCiAJCQkJCW1vZGVfbGliLT52YmEuUGxhbmVSZXF1aXJlZERJ
U1BDTEtXaXRoT0RNQ29tYmluZSA9IG1vZGVfbGliLT52YmEuUGl4ZWxDbG9ja1trXSAvIDIKIAkJ
CQkJCQkqICgxICsgbW9kZV9saWItPnZiYS5ESVNQQ0xLRFBQQ0xLRFNDQ0xLRG93blNwcmVhZGlu
ZyAvIDEwMC4wKTsKLQkJCQlpZiAobW9kZV9saWItPnZiYS5PRE1DYXBhYmlsaXR5ID09IGZhbHNl
IHx8IG1vZGVfbGliLT52YmEuUGxhbmVSZXF1aXJlZERJU1BDTEtXaXRob3V0T0RNQ29tYmluZSA8
PSBtb2RlX2xpYi0+dmJhLk1heERpc3BjbGtSb3VuZGVkRG93blRvREZTR3JhbnVsYXJpdHkpIHsK
KwkJCQlpZiAobW9kZV9saWItPnZiYS5PRE1DYXBhYmlsaXR5ID09IGZhbHNlIHx8CisJCQkJCQko
bG9jYWxzLT5QbGFuZVJlcXVpcmVkRElTUENMS1dpdGhvdXRPRE1Db21iaW5lIDw9IE1heE1heERp
c3BjbGtSb3VuZGVkRG93bgorCQkJCQkJCSYmICghbG9jYWxzLT5EU0NFbmFibGVkW2tdIHx8IGxv
Y2Fscy0+SEFjdGl2ZVtrXSA8PSBEQ04yMV9NQVhfRFNDX0lNQUdFX1dJRFRIKSkpIHsKIAkJCQkJ
bG9jYWxzLT5PRE1Db21iaW5lRW5hYmxlUGVyU3RhdGVbaV1ba10gPSBmYWxzZTsKIAkJCQkJbW9k
ZV9saWItPnZiYS5QbGFuZVJlcXVpcmVkRElTUENMSyA9IG1vZGVfbGliLT52YmEuUGxhbmVSZXF1
aXJlZERJU1BDTEtXaXRob3V0T0RNQ29tYmluZTsKIAkJCQl9IGVsc2UgewotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
