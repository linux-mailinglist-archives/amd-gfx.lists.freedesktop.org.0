Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB4A36BD
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 14:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2376E2EA;
	Fri, 30 Aug 2019 12:25:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4a::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B115B6E2EA
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 12:25:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VV+5sKRjrpj+QWw0xMWLXAq7DnYo3BK6zD5mrlNuk8fydgtr994xNhRMN71O/lsyxWekh9lgHLkfhTx7Qt2Gus/IJdmbG5lkIGNpMPi9CGKNK820Wefjad8TDnJv8CjEAUv09nZ8l+BrqVDtl+kHontbj64Dx2mbQIpC5a0ud70HHHDSnyuoDNRJZ60wquJkMS3hxOZGUPjCTAeyZioeaxuNR/TYr+UIz5RgN6o0Hf2P1joVR9u7XtvcJORAPt3FjMMygLgxgozQ7HeE12qcLeAhy7dXmzYKHnLka2GCtBkAQTxK1YWcA+aGt5Kh01CYrP+/ii+YerJJhCrbL3Tutg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oxn4303x+MtAA3Jd0qN42MBDaqhMSKCwq5/2XW+ZT8c=;
 b=E3AxJTORq8xC4h3CAYwdM6uLTTQB5C54YRlzGADaXr6yoBgaXegyCXLmxO+7fDRU+BP0b6D1JQwNCzgDFCCBy+wxIH9ToncgwpTx/fkveRRkrvQDkVZe4jruI0X6ApkUosFgcgIaAEPHRFDKYdoLhTP1Boo2at7hOfmqkAdCse7SFcQ2IdxykBAkwuG6VP4MVR4OuJVKR1WrF4AD0iztCy7/k/ozlUXwStvxIjEclmZQnWjZyw1k7NjDEqli2I817+cIahL/nsODomtv+PEwiUyq2cPfETnIHQQn7AuRiZWXgbusewGeHMmjbrMrNXm+hJrB2vS6hS8DN/gqSRZPbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0017.namprd12.prod.outlook.com (2603:10b6:5:1c0::30)
 by CY4PR1201MB0088.namprd12.prod.outlook.com (2603:10b6:910:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Fri, 30 Aug
 2019 12:25:45 +0000
Received: from CO1NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM6PR12CA0017.outlook.office365.com
 (2603:10b6:5:1c0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19 via Frontend
 Transport; Fri, 30 Aug 2019 12:25:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT017.mail.protection.outlook.com (10.152.80.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 12:25:45 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 30 Aug 2019
 07:25:44 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <andrey.grodzovsky@amd.com>,
 <guchun.chen@amd.com>, <dennis.li@amd.com>, <hawking.zhang@amd.com>
Subject: [PATCH 2/4] drm/amdgpu: Hook EEPROM table to RAS
Date: Fri, 30 Aug 2019 20:24:51 +0800
Message-ID: <20190830122453.19703-3-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830122453.19703-1-tao.zhou1@amd.com>
References: <20190830122453.19703-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(428003)(189003)(199004)(356004)(14444005)(26005)(51416003)(76176011)(7696005)(186003)(6666004)(70586007)(478600001)(6636002)(53416004)(48376002)(4326008)(47776003)(305945005)(50226002)(8676002)(81166006)(81156014)(53936002)(8936002)(16586007)(1076003)(316002)(126002)(2616005)(50466002)(446003)(11346002)(336012)(2906002)(476003)(486006)(5660300002)(2201001)(86362001)(110136005)(426003)(70206006)(36756003)(79990200002)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0088; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eebb2616-7ed7-4286-9bec-08d72d452eb5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR1201MB0088; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0088:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00886BC6B8A37B97EBE55ED8B0BD0@CY4PR1201MB0088.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: TE9KcpRvUcbK4p/UMiUd6uDMe1TBmWJ1B8WNeSEDBz5MuOj0KPaxiBpe7ugtap3/xNLW1gjSJ/veQllGIlut49iGTHmLZ4VzMu2V8fn+r+cR0Evzr3deKTQbyom45tcGhYY1NXgAZXPg33Q+ioODcu1+2Rb5KBV8fQ22Dt1AXAVeUh8ajylWQLQyRCOagJaZfVznlFxdPCeBS88ZJL1repWkuzksCjMHsDEcTL0cl+GKHD+eh+DYE9BRFM28O8LPKYmy2ahl3CN71Z1Lw6i3mBWJCoTkIbrJZicMY6NEbUY0cxQwmFGr9Xl4l8Ybnjo3Muu0IZP0hgHBQJkgQL8ckmfuS0XzgC92sB1ZDsBY4T/qW9HBCBMhJ/NCs6lDLevJzg1d95W7fyVOWW7VY1NP8kzceeanBlkPaO59Z+iGIVRvR2mdOyPQLk/PM4uMoYFVDGJTnKBFIbCrk3yRXeOlQA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 12:25:45.3980 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eebb2616-7ed7-4286-9bec-08d72d452eb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0088
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oxn4303x+MtAA3Jd0qN42MBDaqhMSKCwq5/2XW+ZT8c=;
 b=lBIPoldlzicBBrDFrkc9xpruLqi0/Cs2ff/K32f8V4tdb93B0tJr5nq8DxljxRew4iPDrABCmaSzqBRESqsNfNCW4U+cLzcTwyF1R9Vyv3T2+owVzjn5+RvJIyXNkDWEZ3SuX4H33IJ3D5eta+GdTE+ZCNLRNwT5va0tmhCtcuM=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c3VwcG9ydCBlZXByb20gcmVjb3JkcyBsb2FkIGFuZCBzYXZlIGZvciByYXMsCm1vdmUgRUVQUk9N
IHJlY29yZHMgc3RvcmluZyB0byBiYWQgcGFnZSByZXNlcnZpbmcKClNpZ25lZC1vZmYtYnk6IFRh
byBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zz
a3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTExICsrKysrKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCAyNDY2M2VjNDEyNDguLjAyMTIwYWEzY2I1
ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtMTM0OCw2ICsx
MzQ4LDcyIEBAIGludCBhbWRncHVfcmFzX2FkZF9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCiAJcmV0dXJuIHJldDsKIH0KIAorLyoKKyAqIHdyaXRlIGVycm9yIHJlY29yZCBh
cnJheSB0byBlZXByb20sIHRoZSBmdW5jdGlvbiBzaG91bGQgYmUKKyAqIHByb3RlY3RlZCBieSBy
ZWNvdmVyeV9sb2NrCisgKi8KK3N0YXRpYyBpbnQgYW1kZ3B1X3Jhc19zYXZlX2JhZF9wYWdlcyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0g
YW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsKKwlzdHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2Rh
dGEgKmRhdGE7CisJc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wgPQor
CQkJCQkmYWRldi0+cHNwLnJhcy5yYXMtPmVlcHJvbV9jb250cm9sOworCWludCBzYXZlX2NvdW50
OworCisJaWYgKCFjb24gfHwgIWNvbi0+ZWhfZGF0YSkKKwkJcmV0dXJuIDA7CisKKwlkYXRhID0g
Y29uLT5laF9kYXRhOworCWlmICghZGF0YSkKKwkJcmV0dXJuIDA7CisKKwlzYXZlX2NvdW50ID0g
ZGF0YS0+Y291bnQgLSBjb250cm9sLT5udW1fcmVjczsKKwkvKiBvbmx5IG5ldyBlbnRyaWVzIGFy
ZSBzYXZlZCAqLworCWlmIChzYXZlX2NvdW50ID4gMCkKKwkJaWYgKGFtZGdwdV9yYXNfZWVwcm9t
X3Byb2Nlc3NfcmVjb2RzKCZjb24tPmVlcHJvbV9jb250cm9sLAorCQkJCQkJCSZkYXRhLT5icHNb
Y29udHJvbC0+bnVtX3JlY3NdLAorCQkJCQkJCXRydWUsCisJCQkJCQkJc2F2ZV9jb3VudCkpIHsK
KwkJCURSTV9FUlJPUigiRmFpbGVkIHRvIHNhdmUgRUVQUk9NIHRhYmxlIGRhdGEhIik7CisJCQly
ZXR1cm4gLUVJTzsKKwkJfQorCisJcmV0dXJuIDA7Cit9CisKKy8qCisgKiByZWFkIGVycm9yIHJl
Y29yZCBhcnJheSBpbiBlZXByb20gYW5kIHJlc2VydmUgZW5vdWdoIHNwYWNlIGZvcgorICogc3Rv
cmluZyBuZXcgYmFkIHBhZ2VzCisgKi8KK3N0YXRpYyBpbnQgYW1kZ3B1X3Jhc19sb2FkX2JhZF9w
YWdlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlzdHJ1Y3QgYW1kZ3B1X3Jhc19l
ZXByb21fY29udHJvbCAqY29udHJvbCA9CisJCQkJCSZhZGV2LT5wc3AucmFzLnJhcy0+ZWVwcm9t
X2NvbnRyb2w7CisJc3RydWN0IGVlcHJvbV90YWJsZV9yZWNvcmQgKmJwcyA9IE5VTEw7CisJaW50
IHJldCA9IDA7CisKKwkvKiBubyBiYWQgcGFnZSByZWNvcmQsIHNraXAgZWVwcm9tIGFjY2VzcyAq
LworCWlmICghY29udHJvbC0+bnVtX3JlY3MpCisJCXJldHVybiByZXQ7CisKKwlicHMgPSBrY2Fs
bG9jKGNvbnRyb2wtPm51bV9yZWNzLCBzaXplb2YoKmJwcyksIEdGUF9LRVJORUwpOworCWlmICgh
YnBzKQorCQlyZXR1cm4gLUVOT01FTTsKKworCWlmIChhbWRncHVfcmFzX2VlcHJvbV9wcm9jZXNz
X3JlY29kcyhjb250cm9sLCBicHMsIGZhbHNlLAorCQljb250cm9sLT5udW1fcmVjcykpIHsKKwkJ
RFJNX0VSUk9SKCJGYWlsZWQgdG8gbG9hZCBFRVBST00gdGFibGUgcmVjb3JkcyEiKTsKKwkJcmV0
ID0gLUVJTzsKKwkJZ290byBvdXQ7CisJfQorCisJcmV0ID0gYW1kZ3B1X3Jhc19hZGRfYmFkX3Bh
Z2VzKGFkZXYsIGJwcywgY29udHJvbC0+bnVtX3JlY3MpOworCitvdXQ6CisJa2ZyZWUoYnBzKTsK
KwlyZXR1cm4gcmV0OworfQorCiAvKiBjYWxsZWQgaW4gZ3B1IHJlY292ZXJ5L2luaXQgKi8KIGlu
dCBhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogewpAQCAtMTM1NSw3ICsxNDIxLDcgQEAgaW50IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFn
ZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJc3RydWN0IHJhc19lcnJfaGFuZGxlcl9k
YXRhICpkYXRhOwogCXVpbnQ2NF90IGJwOwogCXN0cnVjdCBhbWRncHVfYm8gKmJvOwotCWludCBp
OworCWludCBpLCByZXQgPSAwOwogCiAJaWYgKCFjb24gfHwgIWNvbi0+ZWhfZGF0YSkKIAkJcmV0
dXJuIDA7CkBAIC0xMzc1LDkgKzE0NDEsMTEgQEAgaW50IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRf
cGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCWRhdGEtPmJwc19ib1tpXSA9IGJv
OwogCQlkYXRhLT5sYXN0X3Jlc2VydmVkID0gaSArIDE7CiAJfQorCisJcmV0ID0gYW1kZ3B1X3Jh
c19zYXZlX2JhZF9wYWdlcyhhZGV2KTsKIG91dDoKIAltdXRleF91bmxvY2soJmNvbi0+cmVjb3Zl
cnlfbG9jayk7Ci0JcmV0dXJuIDA7CisJcmV0dXJuIHJldDsKIH0KIAogLyogY2FsbGVkIHdoZW4g
ZHJpdmVyIHVubG9hZCAqLwpAQCAtMTQwOSwzMyArMTQ3NywxMSBAQCBzdGF0aWMgaW50IGFtZGdw
dV9yYXNfcmVsZWFzZV9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJcmV0
dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19zYXZlX2JhZF9wYWdlcyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKLXsKLQkvKiBUT0RPCi0JICogd3JpdGUgdGhlIGFycmF5IHRv
IGVlcHJvbSB3aGVuIFNNVSBkaXNhYmxlZC4KLQkgKi8KLQlyZXR1cm4gMDsKLX0KLQotLyoKLSAq
IHJlYWQgZXJyb3IgcmVjb3JkIGFycmF5IGluIGVlcHJvbSBhbmQgcmVzZXJ2ZSBlbm91Z2ggc3Bh
Y2UgZm9yCi0gKiBzdG9yaW5nIG5ldyBiYWQgcGFnZXMKLSAqLwotc3RhdGljIGludCBhbWRncHVf
cmFzX2xvYWRfYmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQotewotCXN0cnVj
dCBlZXByb21fdGFibGVfcmVjb3JkICpicHMgPSBOVUxMOwotCWludCByZXQ7Ci0KLQlyZXQgPSBh
bWRncHVfcmFzX2FkZF9iYWRfcGFnZXMoYWRldiwgYnBzLAotCQkJCWFkZXYtPnVtYy5tYXhfcmFz
X2Vycl9jbnRfcGVyX3F1ZXJ5KTsKLQotCXJldHVybiByZXQ7Ci19Ci0KIHN0YXRpYyBpbnQgYW1k
Z3B1X3Jhc19yZWNvdmVyeV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCXN0
cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpOwogCXN0
cnVjdCByYXNfZXJyX2hhbmRsZXJfZGF0YSAqKmRhdGEgPSAmY29uLT5laF9kYXRhOworCWludCBy
ZXQ7CiAKIAkqZGF0YSA9IGttYWxsb2Moc2l6ZW9mKCoqZGF0YSksCiAJCQlHRlBfS0VSTkVMfF9f
R0ZQX1pFUk8pOwpAQCAtMTQ0Nyw4ICsxNDkzLDE4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19y
ZWNvdmVyeV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWF0b21pY19zZXQoJmNv
bi0+aW5fcmVjb3ZlcnksIDApOwogCWNvbi0+YWRldiA9IGFkZXY7CiAKLQlhbWRncHVfcmFzX2xv
YWRfYmFkX3BhZ2VzKGFkZXYpOwotCWFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMoYWRldik7
CisJcmV0ID0gYW1kZ3B1X3Jhc19lZXByb21faW5pdCgmYWRldi0+cHNwLnJhcy5yYXMtPmVlcHJv
bV9jb250cm9sKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJaWYgKGFkZXYtPnBzcC5y
YXMucmFzLT5lZXByb21fY29udHJvbC5udW1fcmVjcykgeworCQlyZXQgPSBhbWRncHVfcmFzX2xv
YWRfYmFkX3BhZ2VzKGFkZXYpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwkJcmV0ID0g
YW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyhhZGV2KTsKKwkJaWYgKHJldCkKKwkJCXJldHVy
biByZXQ7CisJfQogCiAJcmV0dXJuIDA7CiB9CkBAIC0xNDU5LDcgKzE1MTUsNiBAQCBzdGF0aWMg
aW50IGFtZGdwdV9yYXNfcmVjb3ZlcnlfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAlzdHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2RhdGEgKmRhdGEgPSBjb24tPmVoX2RhdGE7CiAKIAlj
YW5jZWxfd29ya19zeW5jKCZjb24tPnJlY292ZXJ5X3dvcmspOwotCWFtZGdwdV9yYXNfc2F2ZV9i
YWRfcGFnZXMoYWRldik7CiAJYW1kZ3B1X3Jhc19yZWxlYXNlX2JhZF9wYWdlcyhhZGV2KTsKIAog
CW11dGV4X2xvY2soJmNvbi0+cmVjb3ZlcnlfbG9jayk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
