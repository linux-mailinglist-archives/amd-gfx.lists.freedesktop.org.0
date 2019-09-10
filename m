Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 886E3AEC7D
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696BC6E902;
	Tue, 10 Sep 2019 13:55:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750087.outbound.protection.outlook.com [40.107.75.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617CC6E8FA
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRS1U4NFKs0OCBRyxXA74BkSB4cFhcme9GXtV3Mmf/GGIKgxoi96xAtkfn8nQ5H+b2lo7YUBFGDz7k+WToXxg+TQ72xC2WgP/yoesHTLP5l2tNfqwmYLTVKPr7Lacn2RsYMgV1dcfVR6yYgofWagi/WXQOSDb75atSzEQOuuNsS9h1BjvdcxsuBxrULc+IUUQslsh6ncwQIR+pi9ZT7yN7tDkIr2gTFCFh9ScrtqkmqBHkEHe6nB5ajezanuR4RvBMXTKw7PFidm54i4lN77YlZgZ4Yylu0+gwFeGtBrCGl3uuJiuAfjwCtsnyV3JVAv5ip8TnzsvjzSR3zslVSBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyJSbOL5Fg5WzFTEe60kb7bWHJLRSFlBlt43RTszWpQ=;
 b=Wd20fIerGId7oTx/A6E1wYpicbde7GBU080s/1gxh8y/h89/Khe1/T1RgRZ3V+1qzwzYLefgNbYjReerstyIJrVPMkCoSusF2eh0x9Haf8HTsrEOwSvR+tzKjQvBQV2eit74kGoC0lBLh/XaY71gvGJacuWUuCnlhlq2fVc8rzKK6/2D3M0M+0th3z9jgtjFopDT+5n+0O13w1IJ8ELag14F6hErTknaeQBZomdjPenGb23yXW7OWGuFtpW8HKXQeACs8vJSzRJjRx/T7VCF4qTNVNcCzZctLyDdEXY6CywLromAGvL3mSQ06NIHk4Ty8eN1vtOGBdpVfjosuS5hfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0023.namprd12.prod.outlook.com (2603:10b6:610:57::33)
 by MW2PR12MB2347.namprd12.prod.outlook.com (2603:10b6:907:7::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 13:55:09 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by CH2PR12CA0023.outlook.office365.com
 (2603:10b6:610:57::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:09 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:55:03 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 25/25] drm/amd/display: Improve LFC behaviour
Date: Tue, 10 Sep 2019 09:54:45 -0400
Message-ID: <20190910135445.18300-26-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(376002)(2980300002)(428003)(199004)(189003)(81166006)(81156014)(305945005)(14444005)(356004)(6666004)(2906002)(54906003)(2351001)(26005)(51416003)(2876002)(70586007)(53936002)(8936002)(50226002)(8676002)(316002)(478600001)(486006)(49486002)(476003)(126002)(186003)(5660300002)(86362001)(2616005)(11346002)(76176011)(50466002)(36756003)(4326008)(48376002)(2870700001)(70206006)(336012)(6916009)(426003)(1076003)(47776003)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2347; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9df2f8a-a214-4aa7-b422-08d735f67e63
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MW2PR12MB2347; 
X-MS-TrafficTypeDiagnostic: MW2PR12MB2347:
X-Microsoft-Antispam-PRVS: <MW2PR12MB234701F97576117A383FA70782B60@MW2PR12MB2347.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QgMCzSW+pY4DRJWFrmZwN5XSMlTX9VY9l7MXj/XeF7kHTPaOTLmu9IQXbj3y/rOS6wUJaGKfZcuTMYPWC2dYTrotOyG6BgstA9lpfYmgFZ4l3o3jUut90y2p/kYbopC27zLXb3niAlwf+24CinhtCy50znHy48FYP+EF/PGYYLOT6riaaWCdJrgkqowp2e40NS9SdV3ChXNeCJLFdadtK/gEjr9LsFIi9SQCaHlEVBQrCt7iA98kUSET2MJkjQ6I4Jk/KeFbS1uMs9RWDx620Hs8Q5vZEvzijUWGCMuWbd2FNagrigEtlPRlq/3VsYXPObRK9dLKC02WgTIX+N7G1TssZ+llaa0ZL1B2kwnGtTf7AEbkEyRmHVq0hTNcYupW6I1wY9C20vTPINrXtBBfy1hU4z9AdaHdaULlxrh2GpQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:09.2953 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9df2f8a-a214-4aa7-b422-08d735f67e63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2347
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyJSbOL5Fg5WzFTEe60kb7bWHJLRSFlBlt43RTszWpQ=;
 b=AD5mXDUCuPp+h4I+BxgbIdca0vXZAh02U7Z8MUurEszj3NyZMEQtHHD5jOfvDNBvw2aUr/p2HFDLd4mnxH6XwlZ9icEh/PsXb4dm+1M7ns62+bDEVvxLDBcbVVIHkBDTabDftvMZFCpdOMhieESSXMDHN+nAk32hqpWMMV7ukDs=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Reza Amini <Reza.Amini@amd.com>,
 Sivapiriyan Kumarasamy <Sivapiriyan.Kumarasamy@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpbV2h5XQpUaGVyZSBjYW4gYmUgc29t
ZSB1bnN5bmNocm9uaXplZCBmcmFtZXMgd2hlbiBlbnRlcmluZy9leGl0aW5nCkxGQy4gIFRoaXMg
bWF5IGNhdXNlIHRlYXJpbmcgb3Igc3R1dHRlcmluZyBhdCBzdWNoIHRyYW5zaXRpb25zLgoKW0hv
d10KQWRkIGEgZW50ZXIvZXhpdCBtYXJnaW4gdG8gYWxnb3JpdGhtIHRvIHNtb290aGx5IHRyYW5z
aXRpb24gaW50bwphbmQgb3V0IG9mIExGQyB3aXRob3V0IGRlc3luY2hyb25pemluZyBmcmFtZXMu
CgpTaWduZWQtb2ZmLWJ5OiBBcmljIEN5ciA8YXJpYy5jeXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IFJlemEgQW1pbmkgPFJlemEuQW1pbmlAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVu
Zy5saUBhbWQuY29tPgpBY2tlZC1ieTogU2l2YXBpcml5YW4gS3VtYXJhc2FteSA8U2l2YXBpcml5
YW4uS3VtYXJhc2FteUBhbWQuY29tPgotLS0KIC4uLi9hbWQvZGlzcGxheS9tb2R1bGVzL2ZyZWVz
eW5jL2ZyZWVzeW5jLmMgICB8IDMyICsrKysrKysrKysrLS0tLS0tLS0KIC4uLi9hbWQvZGlzcGxh
eS9tb2R1bGVzL2luYy9tb2RfZnJlZXN5bmMuaCAgICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwg
MjAgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvZnJlZXN5bmMvZnJlZXN5bmMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2ZyZWVzeW5jL2ZyZWVzeW5jLmMKaW5kZXggMTA3
ZDgxZWE2ODliLi41ZTVjZTllNWVhYjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9tb2R1bGVzL2ZyZWVzeW5jL2ZyZWVzeW5jLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L21vZHVsZXMvZnJlZXN5bmMvZnJlZXN5bmMuYwpAQCAtMzUsOCArMzUsOCBA
QAogI2RlZmluZSBTVEFUSUNfU0NSRUVOX1JBTVBfREVMVEFfUkVGUkVTSF9SQVRFX1BFUl9GUkFN
RSAoKDEwMDAgLyA2MCkgKiA2NSkKIC8qIE51bWJlciBvZiBlbGVtZW50cyBpbiB0aGUgcmVuZGVy
IHRpbWVzIGNhY2hlIGFycmF5ICovCiAjZGVmaW5lIFJFTkRFUl9USU1FU19NQVhfQ09VTlQgMTAK
LS8qIFRocmVzaG9sZCB0byBleGl0IEJUUiAodG8gYXZvaWQgZnJlcXVlbnQgZW50ZXItZXhpdHMg
YXQgdGhlIGxvd2VyIGxpbWl0KSAqLwotI2RlZmluZSBCVFJfRVhJVF9NQVJHSU4gMjAwMAorLyog
VGhyZXNob2xkIHRvIGV4aXQvZXhpdCBCVFIgKHRvIGF2b2lkIGZyZXF1ZW50IGVudGVyLWV4aXRz
IGF0IHRoZSBsb3dlciBsaW1pdCkgKi8KKyNkZWZpbmUgQlRSX01BWF9NQVJHSU4gMjUwMAogLyog
VGhyZXNob2xkIHRvIGNoYW5nZSBCVFIgbXVsdGlwbGllciAodG8gYXZvaWQgZnJlcXVlbnQgY2hh
bmdlcykgKi8KICNkZWZpbmUgQlRSX0RSSUZUX01BUkdJTiAyMDAwCiAvKlRocmVzaG9sZCB0byBl
eGl0IGZpeGVkIHJlZnJlc2ggcmF0ZSovCkBAIC0yNDgsMjQgKzI0OCwyMiBAQCBzdGF0aWMgdm9p
ZCBhcHBseV9iZWxvd190aGVfcmFuZ2Uoc3RydWN0IGNvcmVfZnJlZXN5bmMgKmNvcmVfZnJlZXN5
bmMsCiAJdW5zaWduZWQgaW50IGRlbHRhX2Zyb21fbWlkX3BvaW50X2luX3VzXzEgPSAweEZGRkZG
RkZGOwogCXVuc2lnbmVkIGludCBkZWx0YV9mcm9tX21pZF9wb2ludF9pbl91c18yID0gMHhGRkZG
RkZGRjsKIAl1bnNpZ25lZCBpbnQgZnJhbWVzX3RvX2luc2VydCA9IDA7Ci0JdW5zaWduZWQgaW50
IG1pbl9mcmFtZV9kdXJhdGlvbl9pbl9ucyA9IDA7Ci0JdW5zaWduZWQgaW50IG1heF9yZW5kZXJf
dGltZV9pbl91cyA9IGluX291dF92cnItPm1heF9kdXJhdGlvbl9pbl91czsKIAl1bnNpZ25lZCBp
bnQgZGVsdGFfZnJvbV9taWRfcG9pbnRfZGVsdGFfaW5fdXM7Ci0KLQltaW5fZnJhbWVfZHVyYXRp
b25faW5fbnMgPSAoKHVuc2lnbmVkIGludCkgKGRpdjY0X3U2NCgKLQkJKDEwMDAwMDAwMDBVTEwg
KiAxMDAwMDAwKSwKLQkJaW5fb3V0X3Zyci0+bWF4X3JlZnJlc2hfaW5fdWh6KSkpOworCXVuc2ln
bmVkIGludCBtYXhfcmVuZGVyX3RpbWVfaW5fdXMgPQorCQkJaW5fb3V0X3Zyci0+bWF4X2R1cmF0
aW9uX2luX3VzIC0gaW5fb3V0X3Zyci0+YnRyLm1hcmdpbl9pbl91czsKIAogCS8qIFByb2dyYW0g
QlRSICovCi0JaWYgKGxhc3RfcmVuZGVyX3RpbWVfaW5fdXMgKyBCVFJfRVhJVF9NQVJHSU4gPCBt
YXhfcmVuZGVyX3RpbWVfaW5fdXMpIHsKKwlpZiAoKGxhc3RfcmVuZGVyX3RpbWVfaW5fdXMgKyBp
bl9vdXRfdnJyLT5idHIubWFyZ2luX2luX3VzIC8gMikgPCBtYXhfcmVuZGVyX3RpbWVfaW5fdXMp
IHsKIAkJLyogRXhpdCBCZWxvdyB0aGUgUmFuZ2UgKi8KIAkJaWYgKGluX291dF92cnItPmJ0ci5i
dHJfYWN0aXZlKSB7CiAJCQlpbl9vdXRfdnJyLT5idHIuZnJhbWVfY291bnRlciA9IDA7CiAJCQlp
bl9vdXRfdnJyLT5idHIuYnRyX2FjdGl2ZSA9IGZhbHNlOwogCQl9Ci0JfSBlbHNlIGlmIChsYXN0
X3JlbmRlcl90aW1lX2luX3VzID4gbWF4X3JlbmRlcl90aW1lX2luX3VzKSB7CisJfSBlbHNlIGlm
IChsYXN0X3JlbmRlcl90aW1lX2luX3VzID4gKG1heF9yZW5kZXJfdGltZV9pbl91cyArIGluX291
dF92cnItPmJ0ci5tYXJnaW5faW5fdXMgLyAyKSkgewogCQkvKiBFbnRlciBCZWxvdyB0aGUgUmFu
Z2UgKi8KLQkJaW5fb3V0X3Zyci0+YnRyLmJ0cl9hY3RpdmUgPSB0cnVlOworCQlpZiAoIWluX291
dF92cnItPmJ0ci5idHJfYWN0aXZlKSB7CisJCQlpbl9vdXRfdnJyLT5idHIuYnRyX2FjdGl2ZSA9
IHRydWU7CisJCX0KIAl9CiAKIAkvKiBCVFIgc2V0IHRvICJub3QgYWN0aXZlIiBzbyBkaXNlbmdh
Z2UgKi8KQEAgLTMyMSw3ICszMTksOSBAQCBzdGF0aWMgdm9pZCBhcHBseV9iZWxvd190aGVfcmFu
Z2Uoc3RydWN0IGNvcmVfZnJlZXN5bmMgKmNvcmVfZnJlZXN5bmMsCiAJCS8qIENob29zZSBudW1i
ZXIgb2YgZnJhbWVzIHRvIGluc2VydCBiYXNlZCBvbiBob3cgY2xvc2UgaXQKIAkJICogY2FuIGdl
dCB0byB0aGUgbWlkIHBvaW50IG9mIHRoZSB2YXJpYWJsZSByYW5nZS4KIAkJICovCi0JCWlmIChk
ZWx0YV9mcm9tX21pZF9wb2ludF9pbl91c18xIDwgZGVsdGFfZnJvbV9taWRfcG9pbnRfaW5fdXNf
MikgeworCQlpZiAoKGZyYW1lX3RpbWVfaW5fdXMgLyBtaWRfcG9pbnRfZnJhbWVzX2NlaWwpID4g
aW5fb3V0X3Zyci0+bWluX2R1cmF0aW9uX2luX3VzICYmCisJCQkJKGRlbHRhX2Zyb21fbWlkX3Bv
aW50X2luX3VzXzEgPCBkZWx0YV9mcm9tX21pZF9wb2ludF9pbl91c18yIHx8CisJCQkJCQltaWRf
cG9pbnRfZnJhbWVzX2Zsb29yIDwgMikpIHsKIAkJCWZyYW1lc190b19pbnNlcnQgPSBtaWRfcG9p
bnRfZnJhbWVzX2NlaWw7CiAJCQlkZWx0YV9mcm9tX21pZF9wb2ludF9kZWx0YV9pbl91cyA9IGRl
bHRhX2Zyb21fbWlkX3BvaW50X2luX3VzXzIgLQogCQkJCQlkZWx0YV9mcm9tX21pZF9wb2ludF9p
bl91c18xOwpAQCAtMzM3LDcgKzMzNyw3IEBAIHN0YXRpYyB2b2lkIGFwcGx5X2JlbG93X3RoZV9y
YW5nZShzdHJ1Y3QgY29yZV9mcmVlc3luYyAqY29yZV9mcmVlc3luYywKIAkJaWYgKGluX291dF92
cnItPmJ0ci5mcmFtZXNfdG9faW5zZXJ0ICE9IDAgJiYKIAkJCQlkZWx0YV9mcm9tX21pZF9wb2lu
dF9kZWx0YV9pbl91cyA8IEJUUl9EUklGVF9NQVJHSU4pIHsKIAkJCWlmICgoKGxhc3RfcmVuZGVy
X3RpbWVfaW5fdXMgLyBpbl9vdXRfdnJyLT5idHIuZnJhbWVzX3RvX2luc2VydCkgPAotCQkJCQlp
bl9vdXRfdnJyLT5tYXhfZHVyYXRpb25faW5fdXMpICYmCisJCQkJCW1heF9yZW5kZXJfdGltZV9p
bl91cykgJiYKIAkJCQkoKGxhc3RfcmVuZGVyX3RpbWVfaW5fdXMgLyBpbl9vdXRfdnJyLT5idHIu
ZnJhbWVzX3RvX2luc2VydCkgPgogCQkJCQlpbl9vdXRfdnJyLT5taW5fZHVyYXRpb25faW5fdXMp
KQogCQkJCWZyYW1lc190b19pbnNlcnQgPSBpbl9vdXRfdnJyLT5idHIuZnJhbWVzX3RvX2luc2Vy
dDsKQEAgLTc4Niw2ICs3ODYsMTEgQEAgdm9pZCBtb2RfZnJlZXN5bmNfYnVpbGRfdnJyX3BhcmFt
cyhzdHJ1Y3QgbW9kX2ZyZWVzeW5jICptb2RfZnJlZXN5bmMsCiAJCXJlZnJlc2hfcmFuZ2UgPSBp
bl9vdXRfdnJyLT5tYXhfcmVmcmVzaF9pbl91aHogLQogCQkJCWluX291dF92cnItPm1pbl9yZWZy
ZXNoX2luX3VoejsKIAorCQlpbl9vdXRfdnJyLT5idHIubWFyZ2luX2luX3VzID0gaW5fb3V0X3Zy
ci0+bWF4X2R1cmF0aW9uX2luX3VzIC0KKwkJCQkyICogaW5fb3V0X3Zyci0+bWluX2R1cmF0aW9u
X2luX3VzOworCQlpZiAoaW5fb3V0X3Zyci0+YnRyLm1hcmdpbl9pbl91cyA+IEJUUl9NQVhfTUFS
R0lOKQorCQkJaW5fb3V0X3Zyci0+YnRyLm1hcmdpbl9pbl91cyA9IEJUUl9NQVhfTUFSR0lOOwor
CiAJCWluX291dF92cnItPnN1cHBvcnRlZCA9IHRydWU7CiAJfQogCkBAIC04MDEsNiArODA2LDcg
QEAgdm9pZCBtb2RfZnJlZXN5bmNfYnVpbGRfdnJyX3BhcmFtcyhzdHJ1Y3QgbW9kX2ZyZWVzeW5j
ICptb2RfZnJlZXN5bmMsCiAJaW5fb3V0X3Zyci0+YnRyLmluc2VydGVkX2R1cmF0aW9uX2luX3Vz
ID0gMDsKIAlpbl9vdXRfdnJyLT5idHIuZnJhbWVzX3RvX2luc2VydCA9IDA7CiAJaW5fb3V0X3Zy
ci0+YnRyLmZyYW1lX2NvdW50ZXIgPSAwOworCiAJaW5fb3V0X3Zyci0+YnRyLm1pZF9wb2ludF9p
bl91cyA9CiAJCQkJKGluX291dF92cnItPm1pbl9kdXJhdGlvbl9pbl91cyArCiAJCQkJIGluX291
dF92cnItPm1heF9kdXJhdGlvbl9pbl91cykgLyAyOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5jL21vZF9mcmVlc3luYy5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5jL21vZF9mcmVlc3luYy5oCmluZGV4IGRjMTg3ODQ0
ZDEwYi4uZGJlNzgzNWFhYmNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy9pbmMvbW9kX2ZyZWVzeW5jLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L21vZHVsZXMvaW5jL21vZF9mcmVlc3luYy5oCkBAIC05Miw2ICs5Miw3IEBAIHN0cnVj
dCBtb2RfdnJyX3BhcmFtc19idHIgewogCXVpbnQzMl90IGluc2VydGVkX2R1cmF0aW9uX2luX3Vz
OwogCXVpbnQzMl90IGZyYW1lc190b19pbnNlcnQ7CiAJdWludDMyX3QgZnJhbWVfY291bnRlcjsK
Kwl1aW50MzJfdCBtYXJnaW5faW5fdXM7CiB9OwogCiBzdHJ1Y3QgbW9kX3Zycl9wYXJhbXNfZml4
ZWRfcmVmcmVzaCB7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
