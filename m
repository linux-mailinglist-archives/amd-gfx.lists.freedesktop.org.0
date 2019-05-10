Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7E51A236
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 19:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BAB6E794;
	Fri, 10 May 2019 17:20:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750057.outbound.protection.outlook.com [40.107.75.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC6E89FD4
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 17:20:26 +0000 (UTC)
Received: from DM3PR12CA0061.namprd12.prod.outlook.com (2603:10b6:0:56::29) by
 BN6SPR00MB03.namprd12.prod.outlook.com (2603:10b6:404:b3::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Fri, 10 May 2019 17:20:24 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM3PR12CA0061.outlook.office365.com
 (2603:10b6:0:56::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Fri, 10 May 2019 17:20:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Fri, 10 May 2019 17:20:23 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 10 May 2019
 12:20:13 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/16] drm/amd/display: Use DCN functions instead of DCE
Date: Fri, 10 May 2019 13:19:29 -0400
Message-ID: <20190510171935.19792-11-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
References: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(6916009)(4326008)(72206003)(68736007)(478600001)(305945005)(50466002)(2906002)(53416004)(48376002)(53936002)(14444005)(7696005)(51416003)(86362001)(356004)(6666004)(76176011)(70206006)(316002)(16586007)(2351001)(70586007)(336012)(47776003)(11346002)(426003)(1076003)(446003)(8936002)(50226002)(8676002)(81166006)(81156014)(36756003)(5660300002)(126002)(2616005)(77096007)(186003)(476003)(26005)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6SPR00MB03; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 967a49a2-cea7-4dde-4bd5-08d6d56bc99b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6SPR00MB03; 
X-MS-TrafficTypeDiagnostic: BN6SPR00MB03:
X-Microsoft-Antispam-PRVS: <BN6SPR00MB0353443F70E701AE6A38C3F90C0@BN6SPR00MB03.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 0033AAD26D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Fka0haHua2vT6k13CYskRSKikpx1UcRUxuxCDLgFPdSegsqNGUoBQNhjRxhBxZKh+rVqp7WA1XdRLwSSqAHQnpHhFc5exK/ra1Rg9Uakfs4wWcZQ22Ljm/446chLPN0V7Bk34QL2CJ0Q6TY+65TBhVoiJtvrgkFADvN+aU3+bRwkuQaFm/8iieg0xkKXdQSKI5UIlA9ZsVb8FyPOd0jFyJ2wlD5r290wMxUxDMp1jummhWBs7ztdAjYu93/i8aR4Hw6ddEiJRvRh7UyUx+C9d0t3fRgi/yc6utABwUwZMEWzSDzfAgSsyIKIakyz94SdfNNzFTsExmTewy9HxThHp146c3gsBECLLsUuEU2et8cYEZVu5uPSZF1j2Of3Ab1f5pvntYmQ8IjsA0+qcDbtq428gLhImILXAgBySzm5I8U=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2019 17:20:23.8327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 967a49a2-cea7-4dde-4bd5-08d6d56bc99b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6SPR00MB03
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGNVOfu8NwfOier3K9nvQsgOlV+o+KCAFNVQXR7/Gy8=;
 b=3zBXRAQ3+3qQfgr7jPdgj8XdKFqTmfsvW4E56UBKEUJVxumFViSyd6k1/nwvVypFKKNL1Yol3sIuFa5foE1XajcDYeOR1Mpm3mzGsqFS6WLQvx1KBbDl/k86yxAnB6npi7rpT28kVaLVUpRR2ropQs2Zm7d2+Mf9Rpo9DN+MzaY=
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
Cc: Wesley Chalmers <Wesley.Chalmers@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VzbGV5IENoYWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KCltXSFldCkRD
TiBjb2RlIHNob3VsZCBtYWtlIGFzIGZldyByZWZlcmVuY2VzIHRvIERDRSBhcyBwb3NzaWJsZQoK
W0hPV10KQ29weSBEQ0UxMTAgaW1wbGVtZW50YXRpb24gb2YgZmluZF9maXJzdF9mcmVlX21hdGNo
X3N0cmVhbV9lbmNfZm9yX2xpbmsKaW50byBEQ04xMAoKU2lnbmVkLW9mZi1ieTogV2VzbGV5IENo
YWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFRvbnkgQ2hlbmcg
PFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5w
cmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNu
MTBfcmVzb3VyY2UuYyB8IDM0ICsrKysrKysrKysrKysrKysrKy0KIC4uLi9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMTAvZGNuMTBfcmVzb3VyY2UuaCB8ICA1ICsrKwogMiBmaWxlcyBjaGFuZ2VkLCAz
OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfcmVzb3VyY2UuYwppbmRleCA5N2ZiMGE2ZGRm
OTUuLmRmMzBkOTE2OWMyYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMKQEAgLTEyMzUsNiArMTIzNSwzOCBAQCBzdGF0
aWMgZW51bSBkY19zdGF0dXMgZGNuMTBfZ2V0X2RlZmF1bHRfc3dpenpsZV9tb2RlKHN0cnVjdCBk
Y19wbGFuZV9zdGF0ZSAqcGxhbgogCXJldHVybiByZXN1bHQ7CiB9CiAKK3N0cnVjdCBzdHJlYW1f
ZW5jb2RlciAqZGNuMTBfZmluZF9maXJzdF9mcmVlX21hdGNoX3N0cmVhbV9lbmNfZm9yX2xpbmso
CisJCXN0cnVjdCByZXNvdXJjZV9jb250ZXh0ICpyZXNfY3R4LAorCQljb25zdCBzdHJ1Y3QgcmVz
b3VyY2VfcG9vbCAqcG9vbCwKKwkJc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtKQorewor
CWludCBpOworCWludCBqID0gLTE7CisJc3RydWN0IGRjX2xpbmsgKmxpbmsgPSBzdHJlYW0tPmxp
bms7CisKKwlmb3IgKGkgPSAwOyBpIDwgcG9vbC0+c3RyZWFtX2VuY19jb3VudDsgaSsrKSB7CisJ
CWlmICghcmVzX2N0eC0+aXNfc3RyZWFtX2VuY19hY3F1aXJlZFtpXSAmJgorCQkJCXBvb2wtPnN0
cmVhbV9lbmNbaV0pIHsKKwkJCS8qIFN0b3JlIGZpcnN0IGF2YWlsYWJsZSBmb3IgTVNUIHNlY29u
ZCBkaXNwbGF5CisJCQkgKiBpbiBkYWlzeSBjaGFpbiB1c2UgY2FzZQorCQkJICovCisJCQlqID0g
aTsKKwkJCWlmIChwb29sLT5zdHJlYW1fZW5jW2ldLT5pZCA9PQorCQkJCQlsaW5rLT5saW5rX2Vu
Yy0+cHJlZmVycmVkX2VuZ2luZSkKKwkJCQlyZXR1cm4gcG9vbC0+c3RyZWFtX2VuY1tpXTsKKwkJ
fQorCX0KKworCS8qCisJICogRm9yIENaIGFuZCBsYXRlciwgd2UgY2FuIGFsbG93IERJRyBGRSBh
bmQgQkUgdG8gZGlmZmVyIGZvciBhbGwgZGlzcGxheSB0eXBlcworCSAqLworCisJaWYgKGogPj0g
MCkKKwkJcmV0dXJuIHBvb2wtPnN0cmVhbV9lbmNbal07CisKKwlyZXR1cm4gTlVMTDsKK30KKwog
c3RhdGljIGNvbnN0IHN0cnVjdCBkY19jYXBfZnVuY3MgY2FwX2Z1bmNzID0gewogCS5nZXRfZGNj
X2NvbXByZXNzaW9uX2NhcCA9IGRjbjEwX2dldF9kY2NfY29tcHJlc3Npb25fY2FwCiB9OwpAQCAt
MTI0OCw3ICsxMjgwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZV9mdW5jcyBkY24x
MF9yZXNfcG9vbF9mdW5jcyA9IHsKIAkudmFsaWRhdGVfZ2xvYmFsID0gZGNuMTBfdmFsaWRhdGVf
Z2xvYmFsLAogCS5hZGRfc3RyZWFtX3RvX2N0eCA9IGRjbjEwX2FkZF9zdHJlYW1fdG9fY3R4LAog
CS5nZXRfZGVmYXVsdF9zd2l6emxlX21vZGUgPSBkY24xMF9nZXRfZGVmYXVsdF9zd2l6emxlX21v
ZGUsCi0JLmZpbmRfZmlyc3RfZnJlZV9tYXRjaF9zdHJlYW1fZW5jX2Zvcl9saW5rID0gZGNlMTEw
X2ZpbmRfZmlyc3RfZnJlZV9tYXRjaF9zdHJlYW1fZW5jX2Zvcl9saW5rCisJLmZpbmRfZmlyc3Rf
ZnJlZV9tYXRjaF9zdHJlYW1fZW5jX2Zvcl9saW5rID0gZGNuMTBfZmluZF9maXJzdF9mcmVlX21h
dGNoX3N0cmVhbV9lbmNfZm9yX2xpbmsKIH07CiAKIHN0YXRpYyB1aW50MzJfdCByZWFkX3BpcGVf
ZnVzZXMoc3RydWN0IGRjX2NvbnRleHQgKmN0eCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9yZXNvdXJjZS5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmgKaW5kZXggOTk5YzY4NGEwYjM2
Li42MzMwMjVjY2I4NzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24xMC9kY24xMF9yZXNvdXJjZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24xMC9kY24xMF9yZXNvdXJjZS5oCkBAIC00Miw2ICs0MiwxMSBAQCBzdHJ1Y3QgcmVz
b3VyY2VfcG9vbCAqZGNuMTBfY3JlYXRlX3Jlc291cmNlX3Bvb2woCiAJCWNvbnN0IHN0cnVjdCBk
Y19pbml0X2RhdGEgKmluaXRfZGF0YSwKIAkJc3RydWN0IGRjICpkYyk7CiAKK3N0cnVjdCBzdHJl
YW1fZW5jb2RlciAqZGNuMTBfZmluZF9maXJzdF9mcmVlX21hdGNoX3N0cmVhbV9lbmNfZm9yX2xp
bmsoCisJCXN0cnVjdCByZXNvdXJjZV9jb250ZXh0ICpyZXNfY3R4LAorCQljb25zdCBzdHJ1Y3Qg
cmVzb3VyY2VfcG9vbCAqcG9vbCwKKwkJc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtKTsK
KwogCiAjZW5kaWYgLyogX19EQ19SRVNPVVJDRV9EQ04xMF9IX18gKi8KIAotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
