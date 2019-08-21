Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E2980C9
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 18:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A8D6E35F;
	Wed, 21 Aug 2019 16:57:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790053.outbound.protection.outlook.com [40.107.79.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2167E6E35F
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 16:57:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwSwWHw8VTPWZRkxFljV2pa6SbkfPR/hD0tRJxCF/yrFrtihkZuAw1ksiSiTxSSx++Zg1ciwtxL8S9cOISSiRM8T65nKsfLfM43XFMigxPlL0GbA7LEhLIto+v8n8rfem2ZOqU6rvnmDjUvzuQ8AkNDIThXA1mQ8bsB/mk9BpT+MlHYUeBpnpJ2GiB2M9OG2FW7GBeIUK0U/7+ndJSkKo2J69g7pAdOwGwn2tb0VCHxEOosxCRB69U4GHuASB9VH3wMKFhFBM9nnLCm9G6lQO+V6yEiTrfRa7rmJIWSsNgS2GWoi0NRhnhqL6E4DSz/Becv3sJQMfStyKoTLM2d4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZpsrN339CFBVVGsksuZ1of2vHIUE8aEE94gCdOqf9c=;
 b=ND/uW/6FinZGTbYFO/wc5TjL+B7h+zCCEd8CVfPZng8vSf5XakUYde+b5jj7FWkK63+vZKyCLz89zSWrFXtKURpNDEnNLxql5NZf9o5zLRE3kASxv4X5e1JxHI/iZll8HF25UmUfRJFae7wA8GDRwC3W8UiQNEA9l4yHHTw1w+W8ShHa/qVfiiyQLA68y4v9ayMbnEC2mF0Ab3/kWJJxG8Je8J5dQ+OWWrZUPn60pb0VoWWQhNRmKq9JGXNMGxoYn7fpreLWluO9+m1G8jbW33CQTGsT/Crf8qmvCiGjkbKhEP7b8ZnX436YVV7ERgYQGq33KOcjeBiLi4rkJJmyKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0041.namprd12.prod.outlook.com (2603:10b6:903:129::27)
 by BN7PR12MB2705.namprd12.prod.outlook.com (2603:10b6:408:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Wed, 21 Aug
 2019 16:57:26 +0000
Received: from BY2NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by CY4PR12CA0041.outlook.office365.com
 (2603:10b6:903:129::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Wed, 21 Aug 2019 16:57:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT008.mail.protection.outlook.com (10.152.84.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 16:57:25 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 21 Aug 2019
 11:57:24 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Calculate bpc based on max_requested_bpc
Date: Wed, 21 Aug 2019 12:57:11 -0400
Message-ID: <20190821165711.4031-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(2980300002)(428003)(189003)(199004)(1076003)(53936002)(48376002)(478600001)(2616005)(476003)(336012)(126002)(426003)(305945005)(2351001)(50466002)(316002)(5660300002)(16586007)(186003)(486006)(44832011)(54906003)(53416004)(47776003)(6916009)(4326008)(6666004)(356004)(8936002)(81166006)(81156014)(70586007)(70206006)(8676002)(26005)(36756003)(50226002)(2906002)(51416003)(7696005)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2705; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c0cfa4f-f030-454c-5ef1-08d72658a4b5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN7PR12MB2705; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2705:
X-Microsoft-Antispam-PRVS: <BN7PR12MB27057AA8D648E9689C6E37D6ECAA0@BN7PR12MB2705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: kB8CQ4+E6bny3sw0Z4L1AQawICyp8YtkbJIMcGJKqI8NcEzpxtuYuPm3L6ecQfEGYYQSHhAI8rlVFRhaTe1B7eu1chZXckI+26bgBwGfqGSXRo4HguiqGZnK3e+CBUt3+bwcCk7i6a/e16DoyiAKHwuhyGdn+lmB3pnO2lB7mbnwRxyhL1GAG3yZk23eDxAadYQkfJMt6MZ0YhUNlvObMTfbh7+GgDYK69egPKK244vaYSvAWwASWmj5LfkpegiCVxlCvwU3FE8f09/ManA2VmLME31XuR10tkgsY0XiH6XRXiKd4iiVejS5FpfMETyvgIGXwtQU6UsdQzJLylS+rngUcueINsZJepGItYZfu0iukIsujVMPn8TsJ4Z2EQyjUV8Z0PXs/0cRsKlT2evVBW02AcygIMC5aEUWyDK97hs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 16:57:25.7040 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0cfa4f-f030-454c-5ef1-08d72658a4b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2705
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZpsrN339CFBVVGsksuZ1of2vHIUE8aEE94gCdOqf9c=;
 b=T7PFq81c42NJQprhT67RTSq8+j1PAr8bMvgVbegLtobjqNfqw3yuuyQVDvQ56tN54ENcK2d1V/xAUfucRQnSryvALdwa8aFo8ynAEt2bbgX10dxnUppzdAQlFHu8XwE4Idyne9tasWAuuBJixFID8p+DDr9hvm7GUcmAA8nntwI=
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
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KVGhlIG9ubHkgcGxhY2Ugd2hlcmUgc3RhdGUtPm1heF9icGMgaXMgdXBkYXRlZCBvbiB0
aGUgY29ubmVjdG9yIGlzCmF0IHRoZSBzdGFydCBvZiBhdG9taWMgY2hlY2sgZHVyaW5nIGRybV9h
dG9taWNfY29ubmVjdG9yX2NoZWNrLiBJdAppc24ndCB1cGRhdGVkIHdoZW4gYWRkaW5nIHRoZSBj
b25uZWN0b3JzIHRvIHRoZSBhdG9taWMgc3RhdGUgYWZ0ZXIKdGhlIGZhY3QuIEl0IGFsc28gZG9l
c24ndCBuZWNlc3NhcmlseSByZWZsZWN0IHRoZSByaWdodCB2YWx1ZSB3aGVuCmNhbGxlZCBpbiBh
bWRncHUgZHVyaW5nIG1vZGUgdmFsaWRhdGlvbiBvdXRzaWRlIG9mIGF0b21pYyBjaGVjay4KClRo
aXMgY2FuIGNhdXNlIHRoZSB3cm9uZyBicGMgdG8gYmUgdXNlZCBldmVuIGlmIHRoZSBtYXhfcmVx
dWVzdGVkX2JwYwppcyB0aGUgY29ycmVjdCB2YWx1ZS4KCltIb3ddCkRvbid0IHJlbHkgb24gc3Rh
dGUtPm1heF9icGMgcmVmbGVjdGluZyB0aGUgcmVhbCBicGMgdmFsdWUgYW5kIGp1c3QKZG8gdGhl
IG1pbiguLi4pIGJhc2VkIG9uIGRpc3BsYXkgaW5mbyBicGMgYW5kIG1heF9yZXF1ZXN0ZWRfYnBj
LgoKQ2M6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KQ2M6IEJoYXdhbnBy
ZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5n
LmxpQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFz
LmthemxhdXNrYXNAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMgICAgfCAxNiArKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCA3Y2Y4ZGJjY2NlOTUuLjcz
ZWQ3YjZiZDhkMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jCkBAIC0zMjE2LDEzICszMjE2LDI1IEBAIHN0YXRpYyBlbnVtIGRjX2Nv
bG9yX2RlcHRoCiBjb252ZXJ0X2NvbG9yX2RlcHRoX2Zyb21fZGlzcGxheV9pbmZvKGNvbnN0IHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJCQkJICAgICAgY29uc3Qgc3RydWN0IGRy
bV9jb25uZWN0b3Jfc3RhdGUgKnN0YXRlKQogewotCXVpbnQzMl90IGJwYyA9IGNvbm5lY3Rvci0+
ZGlzcGxheV9pbmZvLmJwYzsKKwl1aW50OF90IGJwYyA9ICh1aW50OF90KWNvbm5lY3Rvci0+ZGlz
cGxheV9pbmZvLmJwYzsKKworCS8qIEFzc3VtZSA4IGJwYyBieSBkZWZhdWx0IGlmIG5vIGJwYyBp
cyBzcGVjaWZpZWQuICovCisJYnBjID0gYnBjID8gYnBjIDogODsKIAogCWlmICghc3RhdGUpCiAJ
CXN0YXRlID0gY29ubmVjdG9yLT5zdGF0ZTsKIAogCWlmIChzdGF0ZSkgewotCQlicGMgPSBzdGF0
ZS0+bWF4X2JwYzsKKwkJLyoKKwkJICogQ2FwIGRpc3BsYXkgYnBjIGJhc2VkIG9uIHRoZSB1c2Vy
IHJlcXVlc3RlZCB2YWx1ZS4KKwkJICoKKwkJICogVGhlIHZhbHVlIGZvciBzdGF0ZS0+bWF4X2Jw
YyBtYXkgbm90IGNvcnJlY3RseSB1cGRhdGVkCisJCSAqIGRlcGVuZGluZyBvbiB3aGVuIHRoZSBj
b25uZWN0b3IgZ2V0cyBhZGRlZCB0byB0aGUgc3RhdGUKKwkJICogb3IgaWYgdGhpcyB3YXMgY2Fs
bGVkIG91dHNpZGUgb2YgYXRvbWljIGNoZWNrLCBzbyBpdAorCQkgKiBjYW4ndCBiZSB1c2VkIGRp
cmVjdGx5LgorCQkgKi8KKwkJYnBjID0gbWluKGJwYywgc3RhdGUtPm1heF9yZXF1ZXN0ZWRfYnBj
KTsKKwogCQkvKiBSb3VuZCBkb3duIHRvIHRoZSBuZWFyZXN0IGV2ZW4gbnVtYmVyLiAqLwogCQli
cGMgPSBicGMgLSAoYnBjICYgMSk7CiAJfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
