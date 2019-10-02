Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B817AC9087
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC756E1B1;
	Wed,  2 Oct 2019 18:16:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760084.outbound.protection.outlook.com [40.107.76.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37856E19B
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUHun5nvWVC0gQEwdE/mUZVZOEPf9jXa1z6IkZd4jtnc7jAYbw2mRDNz8LkhRh+NBnIFpLite9XAbk0ACQflsS0bAq9sVksayIqVfX7ub4hj5UPZc58T62eyzQTI+2Jgoo3ee+X8g2JuC9rJGgOA9dmU95O9LEnoY9BVrSftUBHhj65dd9Bw3Ah7Y/FVuu2jgZF/cwDO0G7Fx4zY9sJ3kQgPqii4ZsF4wQWF1UzN+dxmM7B1F5fVNF6R3BABa4CiSUbgw9G07gkrY2OabspAvXuEOfl6mMYvytH34Vls6yfFdzEv3+7ZdTrdo9n3StiV/5EGN2uH+4PsKUEvp0DBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqpRSl9TIYjXsJ4EdAc6ha2vEQwWMF8+TKJUicsA73w=;
 b=E5Qqf20D4HNtDqWCPn+y9G4Ukjm92zQA0uH0iv1HtZ9sBnespNGROhhnMsKimLPTBFuh9dH/osj3oM2nHkpxKGShW9MM5P2gI459yMFIq7npTD4pRLiMnIRilkZrlPMKmnK3BNQLxnJDyXfT0f0IwvWKnjRjbEIoG7kAJ4rhAUVTDm0aYqmmi9QuL4i4a2viSrL5uOoL/mt6kSHTrIFNWE28lWKBohPm8MLzFmAd/+s7oOV6s5ARFU/K/jgIqF1nAna6vOtIbxlJr2fLZYuWqrwynfX2VG6SKUblb7lFcLdVQR7i1T1fUcy/5B0TSuTmpTM/612si0XrfpSNLYlWzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0023.namprd12.prod.outlook.com (2603:10b6:4:1::33) by
 BN8PR12MB3252.namprd12.prod.outlook.com (2603:10b6:408:69::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:42 +0000
Received: from DM3NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM5PR12CA0023.outlook.office365.com
 (2603:10b6:4:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT005.mail.protection.outlook.com (10.152.82.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:42 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:40 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 16/38] drm/amd/display: Properly round nominal frequency for
 SPD
Date: Wed, 2 Oct 2019 14:16:11 -0400
Message-ID: <20191002181633.22805-17-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(396003)(376002)(428003)(189003)(199004)(16586007)(316002)(4326008)(8936002)(50226002)(48376002)(1076003)(53416004)(486006)(6666004)(81166006)(8676002)(356004)(81156014)(86362001)(6916009)(2906002)(2616005)(336012)(76176011)(70206006)(126002)(186003)(70586007)(51416003)(7696005)(476003)(446003)(36756003)(11346002)(426003)(47776003)(5660300002)(2351001)(50466002)(305945005)(26005)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3252; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e28033eb-4673-4378-32b3-08d74764ad5d
X-MS-TrafficTypeDiagnostic: BN8PR12MB3252:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3252BE0D2AD940C61B7AF1C5F99C0@BN8PR12MB3252.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 79iJwjLXFYGCBQKX6Ik50e1K2fBpqoASN36b1/cI33R/SvElrBu0Fey7m7xKdJQBwL6xyuRF1Z2AMoYTifWN5+q8qHcz34PK0ye4f5RQYNtIEYmjkiR38x5Rm/4C4rjg9wYY40Iy6SroCrQch9cYKX+Ta3FlYb5wFd6zlxo/z7EdGy4cP0ybFVBGxwukKx/2Laoxbvng4zS4CS7jiNyp8LEcBF8WAryT5bRajGfXsrpTzboqFllyBJgAThOeQLTru6Gb+H2BVQZF9DHPrgFji2maE91EbD7NvAGk/joeKpEOX4b1uXT+aVrMsISw1pMbbE41GuwJ8ODViV2dkzyg1jDE6K7pZhvMBWJysr3Rp9Va7g0d3qriPqM70Guyyq75Qz/FAgIAGQoPUcZ3+X7APbmK2h4oYEPQu4cTPgZdtzI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:42.5801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e28033eb-4673-4378-32b3-08d74764ad5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3252
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqpRSl9TIYjXsJ4EdAc6ha2vEQwWMF8+TKJUicsA73w=;
 b=Etv8vK6YwwjDg6Spgso6EbuMGpa8jK/x7CJlUtxfOxjqBfOyQQp5U84TrbOQZf3b7H338HNsV7dfVXeNNAFIEsQdKJRNvclPu6FfNwTQmzcuqOJVINZEFxh4ObAjPIQ4I/jAFqXlUHMp4Ts2CepzWgPDTvxqbxg2xU8btmHFJp0=
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
Cc: Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpbV2h5XQpTb21lIGRpc3BsYXlzIHJl
bHkgb24gdGhlIFNQRCB2ZXJ0aWNsZSBmcmVxdWVuY3kgbWF4aW11bSB2YWx1ZS4KTXVzdCByb3Vu
ZCB0aGUgY2FsY3VsYXRlZCByZWZyZXNoIHJhdGUgdG8gdGhlIG5lYXJlc3QgaW50ZWdlci4KCltI
b3ddClJvdW5kIHRoZSBub21pbmFsIGNhbGN1bGF0ZWQgcmVmcmVzaCByYXRlIHRvIHRoZSBuZWFy
ZXN0IHdob2xlCmludGVnZXIuCgpDaGFuZ2UtSWQ6IEk0MzQ3NDI4ZjM1YTg5OWZhZDAyOGE5ZWUx
YjAyZWEzYzg0MjMxZjIyClNpZ25lZC1vZmYtYnk6IEFyaWMgQ3lyIDxhcmljLmN5ckBhbWQuY29t
PgpSZXZpZXdlZC1ieTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CkFja2VkLWJ5
OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiAuLi4v
Z3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2ZyZWVzeW5jL2ZyZWVzeW5jLmMgfCAxMyArKysr
KysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2ZyZWVz
eW5jL2ZyZWVzeW5jLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9mcmVl
c3luYy9mcmVlc3luYy5jCmluZGV4IDljZTU2YThmMDI3ZC4uOGZkM2Q0ZWMzMzljIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9mcmVlc3luYy9mcmVlc3lu
Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2ZyZWVzeW5jL2Zy
ZWVzeW5jLmMKQEAgLTc0Myw2ICs3NDMsMTAgQEAgdm9pZCBtb2RfZnJlZXN5bmNfYnVpbGRfdnJy
X3BhcmFtcyhzdHJ1Y3QgbW9kX2ZyZWVzeW5jICptb2RfZnJlZXN5bmMsCiAJbm9taW5hbF9maWVs
ZF9yYXRlX2luX3VoeiA9CiAJCQltb2RfZnJlZXN5bmNfY2FsY19ub21pbmFsX2ZpZWxkX3JhdGUo
c3RyZWFtKTsKIAorCS8qIFJvdW5kZWQgdG8gdGhlIG5lYXJlc3QgSHogKi8KKwlub21pbmFsX2Zp
ZWxkX3JhdGVfaW5fdWh6ID0gMTAwMDAwMFVMTCAqCisJCQlkaXZfdTY0KG5vbWluYWxfZmllbGRf
cmF0ZV9pbl91aHogKyA1MDAwMDAsIDEwMDAwMDApOworCiAJbWluX3JlZnJlc2hfaW5fdWh6ID0g
aW5fY29uZmlnLT5taW5fcmVmcmVzaF9pbl91aHo7CiAJbWF4X3JlZnJlc2hfaW5fdWh6ID0gaW5f
Y29uZmlnLT5tYXhfcmVmcmVzaF9pbl91aHo7CiAKQEAgLTEwMDIsMTQgKzEwMDYsMTMgQEAgdW5z
aWduZWQgbG9uZyBsb25nIG1vZF9mcmVlc3luY19jYWxjX25vbWluYWxfZmllbGRfcmF0ZSgKIAkJ
CWNvbnN0IHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSkKIHsKIAl1bnNpZ25lZCBsb25n
IGxvbmcgbm9taW5hbF9maWVsZF9yYXRlX2luX3VoeiA9IDA7CisJdW5zaWduZWQgaW50IHRvdGFs
ID0gc3RyZWFtLT50aW1pbmcuaF90b3RhbCAqIHN0cmVhbS0+dGltaW5nLnZfdG90YWw7CiAKLQkv
KiBDYWxjdWxhdGUgbm9taW5hbCBmaWVsZCByYXRlIGZvciBzdHJlYW0gKi8KKwkvKiBDYWxjdWxh
dGUgbm9taW5hbCBmaWVsZCByYXRlIGZvciBzdHJlYW0sIHJvdW5kZWQgdXAgdG8gbmVhcmVzdCBp
bnRlZ2VyICovCiAJbm9taW5hbF9maWVsZF9yYXRlX2luX3VoeiA9IHN0cmVhbS0+dGltaW5nLnBp
eF9jbGtfMTAwaHogLyAxMDsKIAlub21pbmFsX2ZpZWxkX3JhdGVfaW5fdWh6ICo9IDEwMDBVTEwg
KiAxMDAwVUxMICogMTAwMFVMTDsKLQlub21pbmFsX2ZpZWxkX3JhdGVfaW5fdWh6ID0gZGl2X3U2
NChub21pbmFsX2ZpZWxkX3JhdGVfaW5fdWh6LAotCQkJCQkJc3RyZWFtLT50aW1pbmcuaF90b3Rh
bCk7Ci0Jbm9taW5hbF9maWVsZF9yYXRlX2luX3VoeiA9IGRpdl91NjQobm9taW5hbF9maWVsZF9y
YXRlX2luX3VoeiwKLQkJCQkJCXN0cmVhbS0+dGltaW5nLnZfdG90YWwpOworCisJbm9taW5hbF9m
aWVsZF9yYXRlX2luX3VoeiA9CWRpdl91NjQobm9taW5hbF9maWVsZF9yYXRlX2luX3VoeiwgdG90
YWwpOwogCiAJcmV0dXJuIG5vbWluYWxfZmllbGRfcmF0ZV9pbl91aHo7CiB9Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
