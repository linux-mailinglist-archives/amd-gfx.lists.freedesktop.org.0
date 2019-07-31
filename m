Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 335367C896
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 18:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6C189798;
	Wed, 31 Jul 2019 16:26:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710071.outbound.protection.outlook.com [40.107.71.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F75789798
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 16:26:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7MNVpnSoUbjXWgsbhrP6Wpnzn8Q7ClzduRAANDkosfGS6+WrSHOvc8imPLXAIH73TFNqE2nnDHBnkjMWlZy2SzxRKLn/k77AHc6vAnWX3BVi+vijUV3TTBDFM9pgO2pPwdykn1KJzHmJLlZYcTr+VGczk5yVXKN7h1zrc6a5H+421cLwLK60eFcfL1GjaptMeHaowh6Kf0KOiwrvdo2GDxxRMuQnxoMiyvQDYNeMFBFEJDhZF0svlqQdBbgi9mrcEx6eT2e0U9JvIf1on0xqrTUeqgGVoswqrvteTq5Qican1D6ZpJwXheZQxQdJuTaVeTS9a55SrANaS+qw/g5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g06737mJqITAjAZ3IVu7DgEjGK9TRvyWN5EZ47W2xzQ=;
 b=N4j3fkAghds5XEv8/IRPxKFGdWcpHLCBcBJvV4C8jfOqSorqC5j7m+dIhTbA4X5Hs/HvKz0ntsAl06q+M/vhgzw2f/rINNKFwtRN6XkZq4NjfUukpJPS8dm5EoFm0aRdO6+mTxFN+xw0nvO2RvHOM5mvrMtt9ByplRb6rZdOSMUgx9Y26Z7UHKoPY7wP5DTpYFS3UB9wxvpWufNIsuch1We7qolvCqxoHfDMd6UpxzNUCSk60cZKqrpS4IABGDlub2UezGA0XZy1AwDsfqPWwda8Zw9CUX2MdqAxa3rg1U2HTV+4R7n97l+bjo2CN0AmZ2/hne32c5JtnT9ohfrHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0029.namprd12.prod.outlook.com (2603:10b6:208:a8::42)
 by DM5PR12MB2421.namprd12.prod.outlook.com (2603:10b6:4:b4::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14; Wed, 31 Jul
 2019 16:26:13 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by MN2PR12CA0029.outlook.office365.com
 (2603:10b6:208:a8::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.13 via Frontend
 Transport; Wed, 31 Jul 2019 16:26:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Wed, 31 Jul 2019 16:26:12 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 31 Jul 2019
 11:26:11 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amd/display: Skip determining update type for async
 updates
Date: Wed, 31 Jul 2019 12:26:03 -0400
Message-ID: <20190731162604.28509-2-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731162604.28509-1-nicholas.kazlauskas@amd.com>
References: <20190731162604.28509-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(53416004)(54906003)(11346002)(316002)(426003)(446003)(6916009)(53936002)(86362001)(5660300002)(14444005)(15650500001)(50226002)(2616005)(8936002)(81166006)(2351001)(81156014)(356004)(47776003)(50466002)(76176011)(70586007)(70206006)(26005)(2906002)(186003)(478600001)(36756003)(336012)(44832011)(6666004)(48376002)(486006)(305945005)(68736007)(4326008)(8676002)(7696005)(16586007)(1076003)(51416003)(476003)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2421; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0599d43-523b-4b53-0a46-08d715d3cd73
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB2421; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2421:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2421F56A1B9A3D344D3FFC34ECDF0@DM5PR12MB2421.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 011579F31F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: vmzuUeuzXDQBj8sFV0wnecmr/6OrJIba+LCFM5BZ2FxR5kXZD5xOxrppmHOz5qALPS3HC/Mr9KYxAz42KyNOf+6OckESpiVVYrlcgefrGrZnAzuyKBW39Zy/ymi6HRxxGxi/F3FBXirCsaKfMMafiJKvkJkrtG8U9KRw7n41HqAbmR3Al1pHbvqkLVDGJ7f3JrUjI8Rfz9jERiDoJ+IPxCgdlOVAvnu1bBMZn/kfl+LKGoj38hM+7TsL4rgBF6fAFPA5mDCSFEteOxiBfjAuoXXJCxFn0c3cBkZkAvxO8aKZUmKs5G6SWNoJHnXTUkEXovK3GFnBXU/EbdefHQxPhZJc9Y8o+lim/uakjyTkuG4u9bNX/0sSOeBY2xfbS4eAcGzNIdY6OET3vTSNU0aVwZXwCgUb6KKGRaTCB9IRCEE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 16:26:12.3384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0599d43-523b-4b53-0a46-08d715d3cd73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g06737mJqITAjAZ3IVu7DgEjGK9TRvyWN5EZ47W2xzQ=;
 b=CUIQIxGdKdrVSJAES9JlbOC0GXaclwn/x3TvaqwzuCWs2UlioUXPkSqS5mL/9gCHCSHxK31Kv1rJYAb8+veb43SqaiUQTSghkqDDamsoRk2BUCD+/Q3+szAQyffedvTvuYjGJGvNmCJ+b4JuKz/75xPFNrc/58a+Pj+CP9TyEHM=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <david.francis@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KQnkgcGFzc2luZyB0aHJvdWdoIHRoZSBkbV9kZXRlcm1pbmVfdXBkYXRlX3R5cGVfZm9y
X2NvbW1pdCBmb3IgYXRvbWljCmNvbW1pdHMgdGhhdCBjYW4gYmUgZG9uZSBhc3luY2hyb25vdXNs
eSB3ZSBhcmUgaW5jdXJyaW5nIGEKcGVyZm9ybWFuY2UgcGVuYWx0eSBieSBsb2NraW5nIGFjY2Vz
cyB0byB0aGUgZ2xvYmFsIHByaXZhdGUgb2JqZWN0CmFuZCBob2xkaW5nIHRoYXQgYWNjZXNzIHVu
dGlsIHRoZSBlbmQgb2YgdGhlIHByb2dyYW1taW5nIHNlcXVlbmNlLgoKVGhpcyBpcyBhbHNvIGFs
bG9jYXRpbmcgYSBuZXcgbGFyZ2UgZGNfc3RhdGUgb24gZXZlcnkgYWNjZXNzIGluIGFkZGl0aW9u
CnRvIHJldGFpbmluZyBhbGwgdGhlIHJlZmVyZW5jZXMgb24gZWFjaCBzdHJlYW0gYW5kIHBsYW5l
IHVudGlsIHRoZSBlbmQKb2YgdGhlIHByb2dyYW1taW5nIHNlcXVlbmNlLgoKW0hvd10KU2hpZnQg
dGhlIGRldGVybWluYXRpb24gZm9yIGFzeW5jIHVwZGF0ZSBiZWZvcmUgdmFsaWRhdGlvbi4gUmV0
dXJuIGVhcmx5CmlmIGl0J3MgZ29pbmcgdG8gYmUgYW4gYXN5bmMgdXBkYXRlLgoKQ2M6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogRGF2aWQgRnJhbmNpcyA8ZGF2aWQuZnJhbmNpc0Bh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXps
YXVza2FzQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIHwgMjcgKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggMmVmYjBlYWRmNjAyLi40YzkwNjYy
ZTlmYTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYwpAQCAtNzIxNiw2ICs3MjE2LDI2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2F0
b21pY19jaGVjayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCWlmIChyZXQpCiAJCWdvdG8gZmFp
bDsKIAorCWlmIChzdGF0ZS0+bGVnYWN5X2N1cnNvcl91cGRhdGUpIHsKKwkJLyoKKwkJICogVGhp
cyBpcyBhIGZhc3QgY3Vyc29yIHVwZGF0ZSBjb21pbmcgZnJvbSB0aGUgcGxhbmUgdXBkYXRlCisJ
CSAqIGhlbHBlciwgY2hlY2sgaWYgaXQgY2FuIGJlIGRvbmUgYXN5bmNocm9ub3VzbHkgZm9yIGJl
dHRlcgorCQkgKiBwZXJmb3JtYW5jZS4KKwkJICovCisJCXN0YXRlLT5hc3luY191cGRhdGUgPQor
CQkJIWRybV9hdG9taWNfaGVscGVyX2FzeW5jX2NoZWNrKGRldiwgc3RhdGUpOworCisJCS8qCisJ
CSAqIFNraXAgdGhlIHJlbWFpbmluZyBnbG9iYWwgdmFsaWRhdGlvbiBpZiB0aGlzIGlzIGFuIGFz
eW5jCisJCSAqIHVwZGF0ZS4gQ3Vyc29yIHVwZGF0ZXMgY2FuIGJlIGRvbmUgd2l0aG91dCBhZmZl
Y3RpbmcKKwkJICogc3RhdGUgb3IgYmFuZHdpZHRoIGNhbGNzIGFuZCB0aGlzIGF2b2lkcyB0aGUg
cGVyZm9ybWFuY2UKKwkJICogcGVuYWx0eSBvZiBsb2NraW5nIHRoZSBwcml2YXRlIHN0YXRlIG9i
amVjdCBhbmQKKwkJICogYWxsb2NhdGluZyBhIG5ldyBkY19zdGF0ZS4KKwkJICovCisJCWlmIChz
dGF0ZS0+YXN5bmNfdXBkYXRlKQorCQkJcmV0dXJuIDA7CisJfQorCiAJLyogQ2hlY2sgc2NhbGlu
ZyBhbmQgdW5kZXJzY2FuIGNoYW5nZXMqLwogCS8qIFRPRE8gUmVtb3ZlZCBzY2FsaW5nIGNoYW5n
ZXMgdmFsaWRhdGlvbiBkdWUgdG8gaW5hYmlsaXR5IHRvIGNvbW1pdAogCSAqIG5ldyBzdHJlYW0g
aW50byBjb250ZXh0IHdcbyBjYXVzaW5nIGZ1bGwgcmVzZXQuIE5lZWQgdG8KQEAgLTcyNjgsMTMg
KzcyODgsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKIAkJCXJldCA9IC1FSU5WQUw7CiAJCQlnb3RvIGZhaWw7CiAJCX0KLQl9IGVs
c2UgaWYgKHN0YXRlLT5sZWdhY3lfY3Vyc29yX3VwZGF0ZSkgewotCQkvKgotCQkgKiBUaGlzIGlz
IGEgZmFzdCBjdXJzb3IgdXBkYXRlIGNvbWluZyBmcm9tIHRoZSBwbGFuZSB1cGRhdGUKLQkJICog
aGVscGVyLCBjaGVjayBpZiBpdCBjYW4gYmUgZG9uZSBhc3luY2hyb25vdXNseSBmb3IgYmV0dGVy
Ci0JCSAqIHBlcmZvcm1hbmNlLgotCQkgKi8KLQkJc3RhdGUtPmFzeW5jX3VwZGF0ZSA9ICFkcm1f
YXRvbWljX2hlbHBlcl9hc3luY19jaGVjayhkZXYsIHN0YXRlKTsKIAl9CiAKIAkvKiBNdXN0IGJl
IHN1Y2Nlc3MgKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
