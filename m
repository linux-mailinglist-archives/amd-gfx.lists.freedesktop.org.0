Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96609A0278
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 15:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23D4893CD;
	Wed, 28 Aug 2019 13:03:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720056.outbound.protection.outlook.com [40.107.72.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBBC893CD
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 13:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lE4e/vp8mTXSfwtjnUC7OjZt1gG0V3uD4f9uDat8SbP6Zflo9lWRaQdp1hDZRerZ0K5Gu6pgyjmBO86GPAPdB5Ah2O22KG8oCfpHuecOjm4VPLBMRNtQ28YjHezXkzJTMxuXPaV7WG/QWMD/k59Qpv5oVNVQp2SN8Y/yErEpZK0Hlu/Eq0Gu4fm1Os/rn4YRmVRIctBSKiOYtkaRmRrmEQTylnpDM5T9BgYTjfq0uXFkGD8sQJQGYqajmcrTaKafXfTPyxxRB0myAXNlrQJ6TcwWv6QVqUVJ5YXGxh93uRyaLT4p+L/ZWzHvPSJVllhbAPH9vrXBu+Meb9jm3szGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MENHQ8L9lL+3ZccA5VTQlYWXfCQcQbueI6SwX5OOqVI=;
 b=Chwo/jlJDGv8rs6Zc2NWh8G/npsRKvWpvmmh3adU2pMapwSsi0DVzuuE0VGMkrGg/4IB7G2MhuOqAfItC00qSr7ObXCzJmxIUuCvuhR7uu9z64mRdnql0ZirgieZ2j/5BSHahindbJCNW5b+xMfLyeFtreHinYAUX5GtxVgvsQMy8FlR37xIXwVzTkPjSCiD9O7/2XDxX+aVm3Nt4iFPAE1cQvMlcA4e6z9SXOvKh2xMhaKFVyKR6q48hbovmdf7l+4Y2zTatv997ZfXxnzeRIHRjotK4mHOQK8CWygQBdD6+64/vTgOUSSRwJfbnk0cJsisOyzrLTdFnNEwxTFjHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0031.namprd12.prod.outlook.com (2603:10b6:208:a8::44)
 by BN6PR12MB1268.namprd12.prod.outlook.com (2603:10b6:404:1a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Wed, 28 Aug
 2019 13:03:25 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by MN2PR12CA0031.outlook.office365.com
 (2603:10b6:208:a8::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 13:03:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 28 Aug 2019 13:03:23 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 28 Aug 2019 08:03:22 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Tao Zhou <tao.zhou1@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
Subject: [PATCH 1/7] drm/amdgpu: add helper function to do common ras_late_init
Date: Wed, 28 Aug 2019 21:03:09 +0800
Message-ID: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(4326008)(8936002)(50466002)(48376002)(70206006)(50226002)(53936002)(70586007)(6636002)(336012)(426003)(16586007)(478600001)(53416004)(47776003)(6666004)(110136005)(356004)(316002)(186003)(5660300002)(36756003)(305945005)(14444005)(486006)(51416003)(126002)(81166006)(8676002)(476003)(7696005)(26005)(81156014)(86362001)(2616005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1268; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad7d19d1-92bf-42ae-4952-08d72bb81c54
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1268; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1268:
X-Microsoft-Antispam-PRVS: <BN6PR12MB126854F803D5BE579C7A8957FCA30@BN6PR12MB1268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: JDfJAArDglHSgdxhGolGIEvOn2jPsGYv4mZpIyE+AXJFXyf2pxaJe5SIRHnI3udCrp8jxUBP7acVfhNC1QpMvYuyl5uxNMgf36vJanXMO/z4oFXU+5RysoTvx1OFlDhhvd96E+lu1aJS88yeIh+GH538bqAg4i/LAkGzwIMTkFqpsOnRvHOQQO7aQiiaTTI/NmHHf72ZR0Fufnvm0jXrNKlWXmzyp6ayCPwl/G2nmb3OunViYTLPk/Afan8744A+1f4wcxhFnmsCrd2LQUQRCbqRGB4cbbZKgUFClwZ/MGWfTGVByDFuIbeGgRggFH0EuJyk2LDbBm+nxmJtF+GBEsIGW7FABW3cGWv3Ux184NKNXA0ZAxoVG0FYrHumaeaVu4eKr7nWXQms0ndaIRb5Qv0aIhoQ39ei9g5P1aXqUO0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 13:03:23.2967 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7d19d1-92bf-42ae-4952-08d72bb81c54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MENHQ8L9lL+3ZccA5VTQlYWXfCQcQbueI6SwX5OOqVI=;
 b=bPpiAfdInFzD+ee0o0EVjs/Jyxae0mTdaM21hZFtLXqGWCjfk5NjPHKoI0g60Y75z/DcvIdtIDsAIEPnjIyH/FIFSBZSb41IiX8x14X+lUCFquZUmlE7CTdkxgozjhpXs3CqNyluqk0xX/wKHMNncBzQiADbv1oDCZCRB8AT1hg=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gbGF0ZV9pbml0IGZvciByYXMsIHRoZSBoZWxwZXIgZnVuY3Rpb24gd2lsbCBiZSB1c2VkIHRv
CjEpLiBkaXNhYmxlIHJhcyBmZWF0dXJlIGlmIHRoZSBJUCBibG9jayBpcyBtYXNrZWQgYXMgZGlz
YWJsZWQKMikuIHNlbmQgZW5hYmxlIGZlYXR1cmUgY29tbWFuZCBpZiB0aGUgaXAgYmxvY2sgd2Fz
IG1hc2tlZCBhcyBlbmFibGVkCjMpLiBjcmVhdGUgZGVidWdmcy9zeXNmcyBub2RlIHBlciBJUCBi
bG9jawo0KS4gcmVnaXN0ZXIgaW50ZXJydXB0IGhhbmRsZXIKClNpZ25lZC1vZmYtYnk6IEhhd2tp
bmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmMgfCA1NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8ICA0ICsrKwogMiBm
aWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5jCmluZGV4IDIzMGY3ZTYuLjJjMzJmOTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTE1NjQsNiArMTU2NCw2MyBAQCBpbnQgYW1kZ3B1X3Jh
c19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVybiAtRUlOVkFMOwogfQog
CisvKiBoZWxwZXIgZnVuY3Rpb24gdG8gaGFuZGxlIGNvbW1vbiBzdHVmZiBpbiBpcCBsYXRlIGlu
aXQgcGhhc2UgKi8KK2ludCBhbWRncHVfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKKwkJCSBzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcmFzX2Jsb2NrLAorCQkJIHN0cnVj
dCByYXNfZnNfaWYgKmZzX2luZm8sCisJCQkgc3RydWN0IHJhc19paF9pZiAqaWhfaW5mbykKK3sK
KwlpbnQgcjsKKworCS8qIGRpc2FibGUgUkFTIGZlYXR1cmUgcGVyIElQIGJsb2NrIGlmIGl0IGlz
IG5vdCBzdXBwb3J0ZWQgKi8KKwlpZiAoIWFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIHJh
c19ibG9jay0+YmxvY2spKSB7CisJCWFtZGdwdV9yYXNfZmVhdHVyZV9lbmFibGVfb25fYm9vdChh
ZGV2LCByYXNfYmxvY2ssIDApOworCQlyZXR1cm4gMDsKKwl9CisKKwlyID0gYW1kZ3B1X3Jhc19m
ZWF0dXJlX2VuYWJsZV9vbl9ib290KGFkZXYsIHJhc19ibG9jaywgMSk7CisJaWYgKHIpIHsKKwkJ
aWYgKHIgPT0gLUVBR0FJTikgeworCQkJLyogcmVxdWVzdCBncHUgcmVzZXQuIHdpbGwgcnVuIGFn
YWluICovCisJCQlhbWRncHVfcmFzX3JlcXVlc3RfcmVzZXRfb25fYm9vdChhZGV2LAorCQkJCQly
YXNfYmxvY2stPmJsb2NrKTsKKwkJCXJldHVybiAwOworCQl9CisJCS8qIGluIHJlc3VtZSBwaGFz
ZSwgaWYgZmFpbCB0byBlbmFibGUgcmFzLAorCQkgKiBjbGVhbiB1cCBhbGwgcmFzIGZzIG5vZGVz
LCBhbmQgZGlzYWJsZSByYXMgKi8KKwkJaWYgKGFkZXYtPmluX3N1c3BlbmQpCisJCQlnb3RvIGNs
ZWFudXA7CisJfQorCisJLyogaW4gcmVzdW1lIHBoYXNlLCBubyBuZWVkIHRvIGNyZWF0ZSByYXMg
ZnMgbm9kZSAqLworCWlmIChhZGV2LT5pbl9zdXNwZW5kKQorCQlyZXR1cm4gMDsKKworCWlmIChy
YXNfYmxvY2stPmJsb2NrID09IEFNREdQVV9SQVNfQkxPQ0tfX1VNQyB8fAorCSAgICByYXNfYmxv
Y2stPmJsb2NrID09IEFNREdQVV9SQVNfQkxPQ0tfX1NETUEgfHwKKwkgICAgcmFzX2Jsb2NrLT5i
bG9jayA9PSBBTURHUFVfUkFTX0JMT0NLX19HRlgpIHsKKwkJciA9IGFtZGdwdV9yYXNfaW50ZXJy
dXB0X2FkZF9oYW5kbGVyKGFkZXYsIGloX2luZm8pOworCQlpZiAocikKKwkJCWdvdG8gaW50ZXJy
dXB0OworCX0KKworCWFtZGdwdV9yYXNfZGVidWdmc19jcmVhdGUoYWRldiwgZnNfaW5mbyk7CisK
KwlyID0gYW1kZ3B1X3Jhc19zeXNmc19jcmVhdGUoYWRldiwgZnNfaW5mbyk7CisJaWYgKHIpCisJ
CWdvdG8gc3lzZnM7CisKKwlyZXR1cm4gMDsKK2NsZWFudXA6CisJYW1kZ3B1X3Jhc19zeXNmc19y
ZW1vdmUoYWRldiwgcmFzX2Jsb2NrKTsKK3N5c2ZzOgorCWFtZGdwdV9yYXNfZGVidWdmc19yZW1v
dmUoYWRldiwgcmFzX2Jsb2NrKTsKKwlhbWRncHVfcmFzX2ludGVycnVwdF9yZW1vdmVfaGFuZGxl
cihhZGV2LCBpaF9pbmZvKTsKK2ludGVycnVwdDoKKwlhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxl
KGFkZXYsIHJhc19ibG9jaywgMCk7CisJcmV0dXJuIHI7Cit9CisKIC8qIGRvIHNvbWUgaW5pdCB3
b3JrIGFmdGVyIElQIGxhdGUgaW5pdCBhcyBkZXBlbmRlbmNlLgogICogYW5kIGl0IHJ1bnMgaW4g
cmVzdW1lL2dwdSByZXNldC9ib290aW5nIHVwIGNhc2VzLgogICovCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmgKaW5kZXggNmM3NmJiMi4uNTIxMjk2MSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaApAQCAtNTY2LDYgKzU2NiwxMCBAQCBhbWRncHVf
cmFzX2Vycm9yX3RvX3RhKGVudW0gYW1kZ3B1X3Jhc19lcnJvcl90eXBlIGVycm9yKSB7CiBpbnQg
YW1kZ3B1X3Jhc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIGludCBhbWRncHVf
cmFzX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50IGFtZGdwdV9yYXNfcHJl
X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOworaW50IGFtZGdwdV9yYXNfbGF0ZV9p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJIHN0cnVjdCByYXNfY29tbW9uX2lm
ICpyYXNfYmxvY2ssCisJCQkgc3RydWN0IHJhc19mc19pZiAqZnNfaW5mbywKKwkJCSBzdHJ1Y3Qg
cmFzX2loX2lmICppaF9pbmZvKTsKIAogaW50IGFtZGdwdV9yYXNfZmVhdHVyZV9lbmFibGUoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCXN0cnVjdCByYXNfY29tbW9uX2lmICpoZWFkLCBi
b29sIGVuYWJsZSk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
