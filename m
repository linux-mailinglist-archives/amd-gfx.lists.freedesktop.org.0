Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2698069DA8
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5876889C14;
	Mon, 15 Jul 2019 21:21:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700086.outbound.protection.outlook.com [40.107.70.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD91989C17
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOAt+a7EAKIPKFg2XtkeF32ZxBCjiN5646hFWfI/I0cbLPjNjUxXfTb+WyIgSvKe/NIqm6fWViIifurxEUtKq4RMgUxXd7JsUBbZn9lE0ErITQL9KO/oEPSXZoF23CNDjd3EElgsUGwZzc3Biln3qf+Lo28bDaJh5C6b+7tiAwLQIxD9y7QhW2xzARUmweXpIcwNTJMDhrXEydQO/QRwdmKhXSE8rnHyz/hVlu4ODx9xeypTUgXkHZH8om6NQ/PrzhnPn0eVUSpn1Kj4Bb7cGIEqzhXcRbqAfF4azoiCltVINWLDzTDsPhfTNX+nv1CHD92amdUJeUDbuZ8O9oUD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QryzXbNLzkpCH+ET0mMwtmsH4GYxgfguQUGFsJ/Q3Lk=;
 b=SMN2ybjXqUt0rB9NVYdRW3svLqQjvjDp4WBCPlbTFuAx7c0H+501PKgOYYd9lyN2TytNzp3xpOA1uYr63FHA5RoLbAFXg005lTl5r/Lwjzu6XqmyojsrJsTwxEc7t5jMGd1RCnyywpkWuXVzKp2j0GknZ9yRQ/wuaC81NAUvM/ZSRVgSmLgjAPahEhI+nYA1naDVi+aEXdJPGtyoGmTZBHESdpeyXWaeiBrcUbDaanGZ5rhwd0ZhC8VOyGFE5ATcDm506Mum8UNygLSQpPght3KMDrz9U+fr+BKqZReiYXCeGEpv0cEybgTeSIARZ5oBTkosVnofWy0XtALNbsINSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0030.namprd12.prod.outlook.com (2603:10b6:208:a8::43)
 by CY4PR12MB1925.namprd12.prod.outlook.com (2603:10b6:903:120::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:28 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by MN2PR12CA0030.outlook.office365.com
 (2603:10b6:208:a8::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2032.20 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:26 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:16 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 21/87] drm/amd/display: Copy max_clks_by_state after
 dce_clk_mgr_construct
Date: Mon, 15 Jul 2019 17:19:43 -0400
Message-ID: <20190715212049.4584-22-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(428003)(189003)(199004)(2616005)(8676002)(81156014)(81166006)(316002)(54906003)(486006)(8936002)(476003)(126002)(446003)(11346002)(49486002)(50226002)(86362001)(68736007)(6916009)(26005)(76176011)(51416003)(2870700001)(47776003)(426003)(336012)(36756003)(50466002)(48376002)(2906002)(2876002)(4326008)(186003)(70586007)(70206006)(1076003)(2351001)(305945005)(6666004)(356004)(53936002)(478600001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1925; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 853dc846-687e-46b6-4983-08d7096a658c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1925; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1925:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1925B0E04C85F90243429F0982CF0@CY4PR12MB1925.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ouYGpQKsHDI+5MzcOVzaah8pYyEtdkjs86ccwoI6sKyHopt5fGOWdOZDRTnhvby5tXAQ2bd1Z6PJ2JHuM8E+hM4YZ5mwpB+vOmgDGvMtGfgZ2EJnHR05plG0zlTH4vYSaYaywf0dvFmRee6d3ZBREZNcSOo48IJ17oC18kpjid2dHU8VGu1MrW6l23XP5PCY7myfWG2fzYOGKO2HM+POTXxTVnNIRR45MlhxEt13v2KkK7cca6diSoZNlPI+KOdxtT6Pmt2vBofi5VC+KE/TxT36YFbjbB7iUaFLTlm7kALYrJ80Dyh3dISPakYveuiY29U5KGfKtNs+pBlIUVOJ/wK8sJAnyFaScmfCfzXT293yqeAQ0vht+6MnFBMIcA8s0Z87Okkjj1HH17p83UukZlFj+wGNTH22a/k4ZUPINAc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:26.9178 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 853dc846-687e-46b6-4983-08d7096a658c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1925
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QryzXbNLzkpCH+ET0mMwtmsH4GYxgfguQUGFsJ/Q3Lk=;
 b=DxmNKaBUC8BXqrkJGHwn4v9DFEwseADBX3KMIe5qGihcd3iaX5uanRUylITNFoBvWlrLS/r/cTiugIzLa+7Oiawynp6HzEBx6X+g2XNJ41IE3yH5TlId/Mij3JwqqFcPSHeCQmoYf9t+OVhCbFq+jCyoOF/uDV50wIQlxW8XiYM=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KRm9yIERDRTExMCwgRENFMTEyIGFuZCBEQ0UxMjAgdGhlIG1heF9jbGtzX2J5X3N0YXRl
IGZvciB0aGUgY2xrX21nciBhcmUKY29waWVkIGZyb20gdGhlaXIgcmVzcGVjdGl2ZSB0YWJsZSBi
ZWZvcmUgdGhlIGNhbGwgdG8KZGNlX2Nsa19tZ3JfY29uc3RydWN0LCBidXQgdGhlbiBkY2VfY2xr
X21ncl9jb25zdHJ1Y3Qgb3ZlcndyaXRlcwp0aGVzZSB3aXRoIHRoZSBkY2U4MF9tYXhfY2xrc19i
eV9zdGF0ZS4KCltIb3ddCkNvcHkgdGhlc2UgYWZ0ZXIgd2UgY2FsbCBkY2VfY2xrX21ncl9jb25z
dHJ1Y3Qgc28gd2UncmUgdXNpbmcgdGhlCnJpZ2h0IHRhYmxlcy4KClNpZ25lZC1vZmYtYnk6IE5p
Y2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Ns
a19tZ3IvZGNlMTEwL2RjZTExMF9jbGtfbWdyLmMgICAgfCA0ICsrLS0KIC4uLi9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNlMTEyL2RjZTExMl9jbGtfbWdyLmMgICAgfCA0ICsrLS0K
IC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNlMTIwL2RjZTEyMF9jbGtfbWdy
LmMgICAgfCA0ICsrLS0KIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtf
bWdyL2RjZTExMC9kY2UxMTBfY2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2Nsa19tZ3IvZGNlMTEwL2RjZTExMF9jbGtfbWdyLmMKaW5kZXggYzFhOTJjMTY1MzVjLi41
Y2MzYWNjY2RhMmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
bGtfbWdyL2RjZTExMC9kY2UxMTBfY2xrX21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jbGtfbWdyL2RjZTExMC9kY2UxMTBfY2xrX21nci5jCkBAIC0yNjIsMTIgKzI2
MiwxMiBAQCB2b2lkIGRjZTExMF9jbGtfbWdyX2NvbnN0cnVjdCgKIAkJc3RydWN0IGRjX2NvbnRl
eHQgKmN0eCwKIAkJc3RydWN0IGNsa19tZ3JfaW50ZXJuYWwgKmNsa19tZ3IpCiB7CisJZGNlX2Ns
a19tZ3JfY29uc3RydWN0KGN0eCwgY2xrX21ncik7CisKIAltZW1jcHkoY2xrX21nci0+bWF4X2Ns
a3NfYnlfc3RhdGUsCiAJCWRjZTExMF9tYXhfY2xrc19ieV9zdGF0ZSwKIAkJc2l6ZW9mKGRjZTEx
MF9tYXhfY2xrc19ieV9zdGF0ZSkpOwogCi0JZGNlX2Nsa19tZ3JfY29uc3RydWN0KGN0eCwgY2xr
X21ncik7Ci0KIAljbGtfbWdyLT5yZWdzID0gJmRpc3BfY2xrX3JlZ3M7CiAJY2xrX21nci0+Y2xr
X21ncl9zaGlmdCA9ICZkaXNwX2Nsa19zaGlmdDsKIAljbGtfbWdyLT5jbGtfbWdyX21hc2sgPSAm
ZGlzcF9jbGtfbWFzazsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jbGtfbWdyL2RjZTExMi9kY2UxMTJfY2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2Nsa19tZ3IvZGNlMTEyL2RjZTExMl9jbGtfbWdyLmMKaW5kZXggNzc4MzkyYzcz
MTg3Li43Yzc0NmVmMWUzMmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jbGtfbWdyL2RjZTExMi9kY2UxMTJfY2xrX21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjZTExMi9kY2UxMTJfY2xrX21nci5jCkBAIC0yMjYs
MTIgKzIyNiwxMiBAQCB2b2lkIGRjZTExMl9jbGtfbWdyX2NvbnN0cnVjdCgKIAkJc3RydWN0IGRj
X2NvbnRleHQgKmN0eCwKIAkJc3RydWN0IGNsa19tZ3JfaW50ZXJuYWwgKmNsa19tZ3IpCiB7CisJ
ZGNlX2Nsa19tZ3JfY29uc3RydWN0KGN0eCwgY2xrX21ncik7CisKIAltZW1jcHkoY2xrX21nci0+
bWF4X2Nsa3NfYnlfc3RhdGUsCiAJCWRjZTExMl9tYXhfY2xrc19ieV9zdGF0ZSwKIAkJc2l6ZW9m
KGRjZTExMl9tYXhfY2xrc19ieV9zdGF0ZSkpOwogCi0JZGNlX2Nsa19tZ3JfY29uc3RydWN0KGN0
eCwgY2xrX21ncik7Ci0KIAljbGtfbWdyLT5yZWdzID0gJmRpc3BfY2xrX3JlZ3M7CiAJY2xrX21n
ci0+Y2xrX21ncl9zaGlmdCA9ICZkaXNwX2Nsa19zaGlmdDsKIAljbGtfbWdyLT5jbGtfbWdyX21h
c2sgPSAmZGlzcF9jbGtfbWFzazsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jbGtfbWdyL2RjZTEyMC9kY2UxMjBfY2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNlMTIwL2RjZTEyMF9jbGtfbWdyLmMKaW5kZXggOTA2
MzEwYzNlMmViLi41Mzk5YjhjZjZiNzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jbGtfbWdyL2RjZTEyMC9kY2UxMjBfY2xrX21nci5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjZTEyMC9kY2UxMjBfY2xrX21nci5jCkBA
IC0xMjcsMTIgKzEyNywxMiBAQCBzdGF0aWMgc3RydWN0IGNsa19tZ3JfZnVuY3MgZGNlMTIwX2Z1
bmNzID0gewogCiB2b2lkIGRjZTEyMF9jbGtfbWdyX2NvbnN0cnVjdChzdHJ1Y3QgZGNfY29udGV4
dCAqY3R4LCBzdHJ1Y3QgY2xrX21ncl9pbnRlcm5hbCAqY2xrX21ncikKIHsKKwlkY2VfY2xrX21n
cl9jb25zdHJ1Y3QoY3R4LCBjbGtfbWdyKTsKKwogCW1lbWNweShjbGtfbWdyLT5tYXhfY2xrc19i
eV9zdGF0ZSwKIAkJZGNlMTIwX21heF9jbGtzX2J5X3N0YXRlLAogCQlzaXplb2YoZGNlMTIwX21h
eF9jbGtzX2J5X3N0YXRlKSk7CiAKLQlkY2VfY2xrX21ncl9jb25zdHJ1Y3QoY3R4LCBjbGtfbWdy
KTsKLQogCWNsa19tZ3ItPmJhc2UuZHByZWZjbGtfa2h6ID0gNjAwMDAwOwogCWNsa19tZ3ItPmJh
c2UuZnVuY3MgPSAmZGNlMTIwX2Z1bmNzOwogfQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
