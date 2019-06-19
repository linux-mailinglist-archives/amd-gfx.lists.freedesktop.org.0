Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BDD4C0EF
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jun 2019 20:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCD06E452;
	Wed, 19 Jun 2019 18:39:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780071.outbound.protection.outlook.com [40.107.78.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9C36E450
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 18:39:09 +0000 (UTC)
Received: from DM3PR12CA0088.namprd12.prod.outlook.com (2603:10b6:0:57::32) by
 BN6PR1201MB0049.namprd12.prod.outlook.com (2603:10b6:405:57::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.12; Wed, 19 Jun
 2019 18:39:07 +0000
Received: from BY2NAM03FT010.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM3PR12CA0088.outlook.office365.com
 (2603:10b6:0:57::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.12 via Frontend
 Transport; Wed, 19 Jun 2019 18:39:07 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT010.mail.protection.outlook.com (10.152.84.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2008.13 via Frontend Transport; Wed, 19 Jun 2019 18:39:07 +0000
Received: from roma-lnx-dev.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 19 Jun 2019
 13:39:06 -0500
From: <Roman.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Fix null-deref on vega20 with xgmi
Date: Wed, 19 Jun 2019 14:38:46 -0400
Message-ID: <1560969526-9400-1-git-send-email-Roman.Li@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(376002)(136003)(2980300002)(428003)(189003)(199004)(36756003)(68736007)(426003)(26005)(486006)(476003)(53416004)(126002)(81166006)(2906002)(86362001)(50466002)(51416003)(16586007)(2351001)(48376002)(316002)(53936002)(7696005)(47776003)(356004)(77096007)(186003)(2616005)(50226002)(5660300002)(54906003)(478600001)(305945005)(6666004)(2876002)(6916009)(72206003)(336012)(8936002)(70206006)(70586007)(4326008)(8676002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0049; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab6103a4-9b0e-4555-74a1-08d6f4e5698d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR1201MB0049; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0049:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB00490382B276EDA02F70819989E50@BN6PR1201MB0049.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0073BFEF03
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Kk8G8yHAs69b1/PLEJcYXSQ3T8Q9eoZChZu2HUQ0L0dbYGKC3ex50dtprG48vEpsPAOmHbu6p1DzGh6K+XL9IOkHR6b/CH396r+Yn8H+E1X8VfbcCIEQxo2mV4rVMsr6RsgysvrB8cq3mfrO8eSFZHECSnAaPR5Oet9iRbeRuJKXmQc5diwPI1X07Hp3JQeE/KgW2X2INDJalwy7qEyKXbclry0VLbN5LkIpvXV6Xo7L/g02GRauw3qVdNdlH+x5isxKsRIqucnt0ArRF2FM2SVJxWVRnE9zEw7VHXaFYJu10u4/x9j6ZMDSJhfGknt1/rEaf7XC1v+W51zGiygbHAJivC3PGCitcqnBT9XkYDbpF0YWGL+4aC7PKD8pnMt+GtkP15mJ2vIKYBLXX7MVY3Ncqr+ovSSrbZNvTdp3DME=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2019 18:39:07.2928 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6103a4-9b0e-4555-74a1-08d6f4e5698d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0049
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWJD1slg4SnGaTepkcpr2cHHZ7+BtAps/1zKFqRQS8U=;
 b=MOA9b4JyRbla4hlZmOI0shfvxJatXd0XI66FkyWwRHIs4o8Z9q5nQs+ouMJuNeKq7rfP6WDb29TvW1/VxAV5J/Re2p2AOZeUTw3VEknM3qyjm4Yq3Hs5vpumyJpcouzlU6vlMLcQYRPIICUX8xeKHBCXcbkBNga4vC5QkRpjTJY=
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
Cc: Eric.Yang2@amd.com, sunpeng.li@amd.com, harry.wentland@amd.com,
 Roman Li <Roman.Li@amd.com>, Bhawanpreet.Lakha@amd.com, Shaoyun.Liu@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+CgpbV2h5XQpBZnRlciBjbGttZ3IgcmV3
b3JrIGl0IGdldHMgaW5pdGlhbGl6ZWQgYWZ0ZXIgcmVzb3VyY2UgcG9vbC4KVGhlIGNsa21nciBp
cyB1c2VkIGluIHJlc291cmNlIHBvb2wgaW5pdCBmb3IgeGdtaSBwYXRoLgpUaGF0IGNhdXNlcyBk
cml2ZXIgY3Jhc2ggb24gVmVnYTIwIHdpdGggeGdtaSBkdWUgdG8gTlVMTCBkZXJlZi4KCltIb3dd
Ck1vdmUgeGdtaSBjb21wZW5zYXRpb24gY29kZSB0byBkY2UxMjFfY2xrX21ncl9jb25zdHJ1Y3Qo
KQpUaGF0IGFsc28gYWxsb3dzIHRvIG1ha2UgZGNlMTIxX2Nsb2NrX3BhdGNoX3hnbWlfc3NfaW5m
bygpCmludGVybmFsIHN0YXRpYyBmdW5jdGlvbi4KCkNoYW5nZS1JZDogSWQzZmE0NGJkZWIyOTc0
YjM1ODBhNTM1Y2M1MDY5MmJmYThiMDFlMjcKU2lnbmVkLW9mZi1ieTogUm9tYW4gTGkgPFJvbWFu
LkxpQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY2Ux
MjAvZGNlMTIwX2Nsa19tZ3IuYyB8IDE0ICsrKysrKysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jICAgIHwgMTAgLS0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9jbGtfbWdyLmggICAgICAg
ICAgICB8ICAyIC0tCiAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDE1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtf
bWdyL2RjZTEyMC9kY2UxMjBfY2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2Nsa19tZ3IvZGNlMTIwL2RjZTEyMF9jbGtfbWdyLmMKaW5kZXggMDhmMmUyNS4uOTA2MzEw
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNl
MTIwL2RjZTEyMF9jbGtfbWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2Nsa19tZ3IvZGNlMTIwL2RjZTEyMF9jbGtfbWdyLmMKQEAgLTMwLDYgKzMwLDcgQEAKICNpbmNs
dWRlICJkY2UxMTAvZGNlMTEwX2Nsa19tZ3IuaCIKICNpbmNsdWRlICJkY2UxMjBfY2xrX21nci5o
IgogI2luY2x1ZGUgImRjZTEwMC9kY2VfY2xrX21nci5oIgorI2luY2x1ZGUgImRjZTEyMC9kY2Ux
MjBfaHdfc2VxdWVuY2VyLmgiCiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3RhdGVfZGVwZW5kZW50
X2Nsb2NrcyBkY2UxMjBfbWF4X2Nsa3NfYnlfc3RhdGVbXSA9IHsKIC8qQ2xvY2tzU3RhdGVJbnZh
bGlkIC0gc2hvdWxkIG5vdCBiZSB1c2VkKi8KQEAgLTQ1LDE2ICs0NiwxNSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHN0YXRlX2RlcGVuZGVudF9jbG9ja3MgZGNlMTIwX21heF9jbGtzX2J5X3N0YXRl
W10gPSB7CiAKIC8qKgogICogZGNlMTIxX2Nsb2NrX3BhdGNoX3hnbWlfc3NfaW5mbygpIC0gU2F2
ZSBYR01JIHNwcmVhZCBzcGVjdHJ1bSBpbmZvCi0gKiBAY2xrX21ncjogY2xvY2sgbWFuYWdlciBi
YXNlIHN0cnVjdHVyZQorICogQGNsa19tZ3JfZGNlOiBjbG9jayBtYW5hZ2VyIGludGVybmFsIHN0
cnVjdHVyZQogICoKICAqIFJlYWRzIGZyb20gVkJJT1MgdGhlIFhHTUkgc3ByZWFkIHNwZWN0cnVt
IGluZm8gYW5kIHNhdmVzIGl0IHdpdGhpbgogICogdGhlIGRjZSBjbG9jayBtYW5hZ2VyLiBUaGlz
IG9wZXJhdGlvbiB3aWxsIG92ZXJ3cml0ZSB0aGUgZXhpc3RpbmcgZHByZWZjbGsKICAqIFNTIHZh
bHVlcyBpZiB0aGUgdkJJT1MgcXVlcnkgc3VjY2VlZHMuIE90aGVyd2lzZSwgaXQgZG9lcyBub3Ro
aW5nLiBJdCBhbHNvCiAgKiBzZXRzIHRoZSAtPnhnbWlfZW5hYmxlZCBmbGFnLgogICovCi12b2lk
IGRjZTEyMV9jbG9ja19wYXRjaF94Z21pX3NzX2luZm8oc3RydWN0IGNsa19tZ3IgKmNsa19tZ3Jf
YmFzZSkKK3N0YXRpYyB2b2lkIGRjZTEyMV9jbG9ja19wYXRjaF94Z21pX3NzX2luZm8oc3RydWN0
IGNsa19tZ3JfaW50ZXJuYWwgKmNsa19tZ3JfZGNlKQogewotCXN0cnVjdCBjbGtfbWdyX2ludGVy
bmFsICpjbGtfbWdyX2RjZSA9IFRPX0NMS19NR1JfSU5URVJOQUwoY2xrX21ncl9iYXNlKTsKIAll
bnVtIGJwX3Jlc3VsdCByZXN1bHQ7CiAJc3RydWN0IHNwcmVhZF9zcGVjdHJ1bV9pbmZvIGluZm8g
PSB7IHsgMCB9IH07CiAJc3RydWN0IGRjX2Jpb3MgKmJwID0gY2xrX21ncl9kY2UtPmJhc2UuY3R4
LT5kY19iaW9zOwpAQCAtMTQxLDUgKzE0MSwxMyBAQCB2b2lkIGRjZTEyMV9jbGtfbWdyX2NvbnN0
cnVjdChzdHJ1Y3QgZGNfY29udGV4dCAqY3R4LCBzdHJ1Y3QgY2xrX21ncl9pbnRlcm5hbCAqYwog
ewogCWRjZTEyMF9jbGtfbWdyX2NvbnN0cnVjdChjdHgsIGNsa19tZ3IpOwogCWNsa19tZ3ItPmJh
c2UuZHByZWZjbGtfa2h6ID0gNjI1MDAwOworCisJLyoKKwkgKiBUaGUgeEdNSSBlbmFibGVkIGlu
Zm8gaXMgdXNlZCB0byBkZXRlcm1pbmUgaWYgYXVkaW8gYW5kIGRpc3BsYXkKKwkgKiBjbG9ja3Mg
bmVlZCB0byBiZSBhZGp1c3RlZCB3aXRoIHRoZSBXQUZMIGxpbmsncyBTUyBpbmZvLgorCSAqLwor
CWlmIChkY2UxMjFfeGdtaV9lbmFibGVkKGN0eC0+ZGMtPmh3c2VxKSkKKwkJZGNlMTIxX2Nsb2Nr
X3BhdGNoX3hnbWlfc3NfaW5mbyhjbGtfbWdyKTsKKwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYwppbmRleCBh
ZmExYzYwLi43MTljMDIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmMKQEAgLTExNjMsMTYgKzExNjMsNiBAQCBz
dGF0aWMgYm9vbCBjb25zdHJ1Y3QoCiAJaWYgKCFyZXNvdXJjZV9jb25zdHJ1Y3QobnVtX3ZpcnR1
YWxfbGlua3MsIGRjLCAmcG9vbC0+YmFzZSwgcmVzX2Z1bmNzKSkKIAkJZ290byByZXNfY3JlYXRl
X2ZhaWw7CiAKLQkvKgotCSAqIFRoaXMgaXMgYSBiaXQgb2YgYSBoYWNrLiBUaGUgeEdNSSBlbmFi
bGVkIGluZm8gaXMgdXNlZCB0byBkZXRlcm1pbmUKLQkgKiBpZiBhdWRpbyBhbmQgZGlzcGxheSBj
bG9ja3MgbmVlZCB0byBiZSBhZGp1c3RlZCB3aXRoIHRoZSBXQUZMIGxpbmsncwotCSAqIFNTIGlu
Zm8uIFRoaXMgaXMgYSByZXNwb25zaWJsaXR5IG9mIHRoZSBjbGtfbWdyLiBCdXQgc2luY2UgTU1I
VUIgaXMKLQkgKiB1bmRlciBod3NlcSwgYW5kIHRoZSByZWxldmFudCByZWdpc3RlciBpcyBpbiBN
TUhVQiwgd2UgaGF2ZSB0byBkbyBpdAotCSAqIGhlcmUuCi0JICovCi0JaWYgKGlzX3ZnMjAgJiYg
ZGNlMTIxX3hnbWlfZW5hYmxlZChkYy0+aHdzZXEpKQotCQlkY2UxMjFfY2xvY2tfcGF0Y2hfeGdt
aV9zc19pbmZvKGRjLT5jbGtfbWdyKTsKLQogCS8qIENyZWF0ZSBoYXJkd2FyZSBzZXF1ZW5jZXIg
Ki8KIAlpZiAoIWRjZTEyMF9od19zZXF1ZW5jZXJfY3JlYXRlKGRjKSkKIAkJZ290byBjb250cm9s
bGVyX2NyZWF0ZV9mYWlsOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2luYy9ody9jbGtfbWdyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5j
L2h3L2Nsa19tZ3IuaAppbmRleCA3MjFlMTMxLi4zNmViZDViIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2Nsa19tZ3IuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2Nsa19tZ3IuaApAQCAtNTMsOCArNTMsNiBAQCBz
dHJ1Y3QgY2xrX21ncl9mdW5jcyB7CiAJdm9pZCAoKmVuYWJsZV9wbWVfd2EpIChzdHJ1Y3QgY2xr
X21nciAqY2xrX21ncik7CiB9OwogCi12b2lkIGRjZTEyMV9jbG9ja19wYXRjaF94Z21pX3NzX2lu
Zm8oc3RydWN0IGNsa19tZ3IgKmNsa19tZ3JfYmFzZSk7Ci0KIHN0cnVjdCBjbGtfbWdyIHsKIAlz
dHJ1Y3QgZGNfY29udGV4dCAqY3R4OwogCXN0cnVjdCBjbGtfbWdyX2Z1bmNzICpmdW5jczsKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
