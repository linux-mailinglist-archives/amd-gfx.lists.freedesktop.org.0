Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3757435A
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 04:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84B26E4B6;
	Thu, 25 Jul 2019 02:39:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710045.outbound.protection.outlook.com [40.107.71.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C3E6E4B6
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 02:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/AyEr5JZZ6kwqcJJhwGIhiMfasX2mUOpkBBABzg0IDjW992/HN4zm2qViBCVqOiKwdrhJM6IEFp4bhBZApSoYZedBkLuTa1U7utHra/7yTwDaDAU1ZKRBwvsGac/ou2eNspdNz7ZX9pCdBpu2EK7RA46dFmNlRvN4JGtQfLcLSRL6fh3vKXQTUFP/Rp0lc7MxPx0P4516PLTbhzAnqGGPZx1ofCKVx3nb3gQi70C1jfDE5Wgl6qqjNY3KA20MQmbsCD/JXYewieb1FSENLx5g896lpONn1OvlU30rr4tDbWcolcC0Rbx+yWtyqvzcd1FOQKJhCbseR+5mFfoSgjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZdpesW6wiTE7TU8wxXADzHNiG8HThxL5puNH8DTqHg=;
 b=Vv6kalwMOiaMzAJzMT7GIUwugutmkTknJBe2XWYQfYHIGtFol925+M1gSHByrWmSeDQnFpO1bScIHI1l0thByOMT3SBLCB5Ka2CGyBaCAjNBmkGw350tmZ+nWJzh+wMCvECwL5qKVwmzy2B1+eIBw4AC+7ATcVGfjoJgSkOaKSpBCXCjMJSoXSjR1R2a/FpFm6qui65zuX/bVrZ5CeiHkIQmeNbhDcCNbnkQTlmXtXShv4pC3O1shM1e7+RIuLRDrn/BZxjrFkXLrOcg20kAe0o1qpOWUV/UY5iYyJ4fpWdJnmvTpzWLG6n+G9mEu357yfXprJUvxPNp+Xt5Y08WWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0065.namprd12.prod.outlook.com (10.175.83.155) by
 DM5PR1201MB2491.namprd12.prod.outlook.com (10.172.91.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 02:39:37 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM5PR12CA0065.outlook.office365.com
 (2603:10b6:3:103::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.16 via Frontend
 Transport; Thu, 25 Jul 2019 02:39:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 02:39:37 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 24 Jul 2019
 21:39:36 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: minor fixes around SW SMU power and fan
 setting
Date: Thu, 25 Jul 2019 10:39:28 +0800
Message-ID: <20190725023930.22521-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(2980300002)(428003)(189003)(199004)(1076003)(70586007)(53416004)(356004)(6666004)(53936002)(2906002)(2870700001)(47776003)(48376002)(70206006)(36756003)(81166006)(86362001)(7696005)(8676002)(44832011)(478600001)(426003)(26005)(81156014)(316002)(305945005)(51416003)(486006)(4326008)(5660300002)(50226002)(476003)(336012)(68736007)(126002)(6916009)(2351001)(14444005)(50466002)(8936002)(186003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2491; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4626cabe-a00e-43a5-7f2a-08d710a9562d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB2491; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2491:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2491678DBA1389AC5C92F4C1E4C10@DM5PR1201MB2491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: IXq6JyrhRRHrOcudjl0oqQpVWmuCGNmZWf9L2V33HCQMYgkuAxOnMJvEFvK2FcbmG4aUhGqai+bIQ9ZWC8CyeX0Sm38PGf6KOo+1R8fQ5ymWMjJc48+c93wQsT6Ar+aPn6PQ9ZgBPdT3GuQ763u4vlHxxRZ1fWxClxBRyPcpy0yLheZ0suynxpoyQzMyF0G3jUpXEJa0Z7Q7kutZApjO7Qf8bNarTr8iJXp0tLQdhIK9AhpKSyZ/1wmn1kXYCWIt5XG8cLPbUlvfd5vIv+vk+z4Z8K3LRVt1WFsapQzbWnCSSJ0N0d3WamqGaoPRe7JLVxpVYprCAxx215eoMhm+723PkhknpeqbU3gAoov5Dmbp1nbk8d/ZRlyf7qmSwkh0LnqeRgM5VpXw9T74aPfEBFvxrDfnQbdpAAHnP3qPFtc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 02:39:37.5492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4626cabe-a00e-43a5-7f2a-08d710a9562d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2491
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZdpesW6wiTE7TU8wxXADzHNiG8HThxL5puNH8DTqHg=;
 b=V6myaHZ0INiKjKzQto6pby1/BvEaI9RLwltjRUzhBdJO4/LpGK9LE1nkvgE8MQFdq90+DMVp3WNvzX5nu+fLItdOlRF0IdZxNiuYqeDWhUtHcZm9ZhDLgh++5eqNfuRIZaYfMsgbxIKV1qoaz3fHVmULHBfuYLHdnc+HI+RNPcM=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGNoZWNraW5nIGZvciBwb3NzaWJsZSBpbnZhbGlkIGlucHV0IGFuZCBudWxsIHBvaW50ZXIu
IEFuZApkcm9wIHJlZHVuZGFudCBjb2RlLgoKQ2hhbmdlLUlkOiBJNmViZDZhY2Q5NDRlODIxZmIx
OWFmNzdlZDFlYWE4YzRiMWQ0MDdjZQpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVh
bkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jICAg
IHwgMjIgKysrKysrKysrKy0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVfdjExXzAuYyB8IDI0ICsrKysrKysrKysrLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BtLmMKaW5kZXggYmRmNTM3ZDNmNDU5Li45YWEwMGQ2N2U2MWQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCkBAIC0xNjY3LDIwICsxNjY3LDE2IEBA
IHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9od21vbl9zZXRfcHdtMV9lbmFibGUoc3RydWN0IGRldmlj
ZSAqZGV2LAogCSAgICAgKGFkZXYtPmRkZXYtPnN3aXRjaF9wb3dlcl9zdGF0ZSAhPSBEUk1fU1dJ
VENIX1BPV0VSX09OKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQlpZiAoaXNfc3VwcG9ydF9zd19z
bXUoYWRldikpIHsKLQkJZXJyID0ga3N0cnRvaW50KGJ1ZiwgMTAsICZ2YWx1ZSk7Ci0JCWlmIChl
cnIpCi0JCQlyZXR1cm4gZXJyOworCWVyciA9IGtzdHJ0b2ludChidWYsIDEwLCAmdmFsdWUpOwor
CWlmIChlcnIpCisJCXJldHVybiBlcnI7CiAKKwlpZiAoaXNfc3VwcG9ydF9zd19zbXUoYWRldikp
IHsKIAkJc211X3NldF9mYW5fY29udHJvbF9tb2RlKCZhZGV2LT5zbXUsIHZhbHVlKTsKIAl9IGVs
c2UgewogCQlpZiAoIWFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X2Zhbl9jb250cm9sX21v
ZGUpCiAJCQlyZXR1cm4gLUVJTlZBTDsKIAotCQllcnIgPSBrc3RydG9pbnQoYnVmLCAxMCwgJnZh
bHVlKTsKLQkJaWYgKGVycikKLQkJCXJldHVybiBlcnI7Ci0KIAkJYW1kZ3B1X2RwbV9zZXRfZmFu
X2NvbnRyb2xfbW9kZShhZGV2LCB2YWx1ZSk7CiAJfQogCkBAIC0yMTAwLDE2ICsyMDk2LDE4IEBA
IHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9od21vbl9zZXRfcG93ZXJfY2FwKHN0cnVjdCBkZXZpY2Ug
KmRldiwKIAkJcmV0dXJuIGVycjsKIAogCXZhbHVlID0gdmFsdWUgLyAxMDAwMDAwOyAvKiBjb252
ZXJ0IHRvIFdhdHQgKi8KKwogCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkgewotCQlhZGV2
LT5zbXUuZnVuY3MtPnNldF9wb3dlcl9saW1pdCgmYWRldi0+c211LCB2YWx1ZSk7CisJCWVyciA9
IHNtdV9zZXRfcG93ZXJfbGltaXQoJmFkZXYtPnNtdSwgdmFsdWUpOwogCX0gZWxzZSBpZiAoYWRl
di0+cG93ZXJwbGF5LnBwX2Z1bmNzICYmIGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X3Bv
d2VyX2xpbWl0KSB7CiAJCWVyciA9IGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X3Bvd2Vy
X2xpbWl0KGFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGUsIHZhbHVlKTsKLQkJaWYgKGVycikKLQkJ
CXJldHVybiBlcnI7CiAJfSBlbHNlIHsKLQkJcmV0dXJuIC1FSU5WQUw7CisJCWVyciA9IC1FSU5W
QUw7CiAJfQogCisJaWYgKGVycikKKwkJcmV0dXJuIGVycjsKKwogCXJldHVybiBjb3VudDsKIH0K
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwppbmRleCBkMTQ4NmMz
ZTEzNTcuLjhhYzlhY2FiZWJmOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvc211X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211
X3YxMV8wLmMKQEAgLTEwOTIsNiArMTA5Miw4IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3NldF9w
b3dlcl9saW1pdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgbikKIAkJbWF4X3Bv
d2VyX2xpbWl0ICo9ICgxMDAgKyBzbXUtPnNtdV90YWJsZS5URFBPRExpbWl0KTsKIAkJbWF4X3Bv
d2VyX2xpbWl0IC89IDEwMDsKIAl9CisJaWYgKG4gPiBtYXhfcG93ZXJfbGltaXQpCisJCXJldHVy
biAtRUlOVkFMOwogCiAJaWYgKHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVS
RV9QUFRfQklUKSkKIAkJcmV0ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwgU01V
X01TR19TZXRQcHRMaW1pdCwgbik7CkBAIC0xNDA3LDE3ICsxNDA5LDE3IEBAIHNtdV92MTFfMF9n
ZXRfZmFuX2NvbnRyb2xfbW9kZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIH0KIAogc3RhdGlj
IGludAotc211X3YxMV8wX3NtY19mYW5fY29udHJvbChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwg
Ym9vbCBzdGFydCkKK3NtdV92MTFfMF9hdXRvX2Zhbl9jb250cm9sKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LCBib29sIGF1dG9fZmFuX2NvbnRyb2wpCiB7CiAJaW50IHJldCA9IDA7CiAKIAlpZiAo
c211X2ZlYXR1cmVfaXNfc3VwcG9ydGVkKHNtdSwgU01VX0ZFQVRVUkVfRkFOX0NPTlRST0xfQklU
KSkKIAkJcmV0dXJuIDA7CiAKLQlyZXQgPSBzbXVfZmVhdHVyZV9zZXRfZW5hYmxlZChzbXUsIFNN
VV9GRUFUVVJFX0ZBTl9DT05UUk9MX0JJVCwgc3RhcnQpOworCXJldCA9IHNtdV9mZWF0dXJlX3Nl
dF9lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfRkFOX0NPTlRST0xfQklULCBhdXRvX2Zhbl9jb250
cm9sKTsKIAlpZiAocmV0KQogCQlwcl9lcnIoIlslc10lcyBzbWMgRkFOIENPTlRST0wgZmVhdHVy
ZSBmYWlsZWQhIiwKLQkJICAgICAgIF9fZnVuY19fLCAoc3RhcnQgPyAiU3RhcnQiIDogIlN0b3Ai
KSk7CisJCSAgICAgICBfX2Z1bmNfXywgKGF1dG9fZmFuX2NvbnRyb2wgPyAiU3RhcnQiIDogIlN0
b3AiKSk7CiAKIAlyZXR1cm4gcmV0OwogfQpAQCAtMTQ0MSwxNiArMTQ0MywxNSBAQCBzdGF0aWMg
aW50CiBzbXVfdjExXzBfc2V0X2Zhbl9zcGVlZF9wZXJjZW50KHN0cnVjdCBzbXVfY29udGV4dCAq
c211LCB1aW50MzJfdCBzcGVlZCkKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHNt
dS0+YWRldjsKLQl1aW50MzJfdCBkdXR5MTAwOwotCXVpbnQzMl90IGR1dHk7CisJdWludDMyX3Qg
ZHV0eTEwMCwgZHV0eTsKIAl1aW50NjRfdCB0bXA2NDsKLQlib29sIHN0b3AgPSAwOwogCiAJaWYg
KHNwZWVkID4gMTAwKQogCQlzcGVlZCA9IDEwMDsKIAotCWlmIChzbXVfdjExXzBfc21jX2Zhbl9j
b250cm9sKHNtdSwgc3RvcCkpCisJaWYgKHNtdV92MTFfMF9hdXRvX2Zhbl9jb250cm9sKHNtdSwg
MCkpCiAJCXJldHVybiAtRUlOVkFMOworCiAJZHV0eTEwMCA9IFJFR19HRVRfRklFTEQoUlJFRzMy
X1NPQzE1KFRITSwgMCwgbW1DR19GRE9fQ1RSTDEpLAogCQkJCUNHX0ZET19DVFJMMSwgRk1BWF9E
VVRZMTAwKTsKIAlpZiAoIWR1dHkxMDApCkBAIC0xNDcyLDE4ICsxNDczLDE2IEBAIHNtdV92MTFf
MF9zZXRfZmFuX2NvbnRyb2xfbW9kZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCSAgICAg
ICB1aW50MzJfdCBtb2RlKQogewogCWludCByZXQgPSAwOwotCWJvb2wgc3RhcnQgPSAxOwotCWJv
b2wgc3RvcCAgPSAwOwogCiAJc3dpdGNoIChtb2RlKSB7CiAJY2FzZSBBTURfRkFOX0NUUkxfTk9O
RToKIAkJcmV0ID0gc211X3YxMV8wX3NldF9mYW5fc3BlZWRfcGVyY2VudChzbXUsIDEwMCk7CiAJ
CWJyZWFrOwogCWNhc2UgQU1EX0ZBTl9DVFJMX01BTlVBTDoKLQkJcmV0ID0gc211X3YxMV8wX3Nt
Y19mYW5fY29udHJvbChzbXUsIHN0b3ApOworCQlyZXQgPSBzbXVfdjExXzBfYXV0b19mYW5fY29u
dHJvbChzbXUsIDApOwogCQlicmVhazsKIAljYXNlIEFNRF9GQU5fQ1RSTF9BVVRPOgotCQlyZXQg
PSBzbXVfdjExXzBfc21jX2Zhbl9jb250cm9sKHNtdSwgc3RhcnQpOworCQlyZXQgPSBzbXVfdjEx
XzBfYXV0b19mYW5fY29udHJvbChzbXUsIDEpOwogCQlicmVhazsKIAlkZWZhdWx0OgogCQlicmVh
azsKQEAgLTE1MDMsMTMgKzE1MDIsMTIgQEAgc3RhdGljIGludCBzbXVfdjExXzBfc2V0X2Zhbl9z
cGVlZF9ycG0oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYgPSBzbXUtPmFkZXY7CiAJaW50IHJldDsKIAl1aW50MzJfdCB0YWNoX3BlcmlvZCwgY3J5
c3RhbF9jbG9ja19mcmVxOwotCWJvb2wgc3RvcCA9IDA7CiAKIAlpZiAoIXNwZWVkKQogCQlyZXR1
cm4gLUVJTlZBTDsKIAogCW11dGV4X2xvY2soJihzbXUtPm11dGV4KSk7Ci0JcmV0ID0gc211X3Yx
MV8wX3NtY19mYW5fY29udHJvbChzbXUsIHN0b3ApOworCXJldCA9IHNtdV92MTFfMF9hdXRvX2Zh
bl9jb250cm9sKHNtdSwgMCk7CiAJaWYgKHJldCkKIAkJZ290byBzZXRfZmFuX3NwZWVkX3JwbV9m
YWlsZWQ7CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
