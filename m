Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7881171D1
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 08:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C591894D7;
	Wed,  8 May 2019 06:41:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700071.outbound.protection.outlook.com [40.107.70.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21DF894D7
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 06:41:40 +0000 (UTC)
Received: from DM3PR12CA0071.namprd12.prod.outlook.com (2603:10b6:0:57::15) by
 BYAPR12MB3478.namprd12.prod.outlook.com (2603:10b6:a03:ad::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.20; Wed, 8 May 2019 06:41:39 +0000
Received: from DM3NAM03FT033.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by DM3PR12CA0071.outlook.office365.com
 (2603:10b6:0:57::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Wed, 8 May 2019 06:41:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT033.mail.protection.outlook.com (10.152.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Wed, 8 May 2019 06:41:38 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 8 May 2019
 01:41:37 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amd/powerplay: valid Vega10 DPMTABLE_OD_UPDATE_VDDC
 settings V2
Date: Wed, 8 May 2019 14:41:32 +0800
Message-ID: <20190508064132.15971-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(5660300002)(51416003)(7696005)(77096007)(478600001)(68736007)(72206003)(1076003)(8936002)(50226002)(426003)(476003)(6666004)(356004)(6916009)(126002)(44832011)(81166006)(81156014)(70586007)(53936002)(8676002)(336012)(36756003)(2616005)(486006)(26005)(70206006)(47776003)(186003)(50466002)(48376002)(86362001)(4326008)(316002)(54906003)(2870700001)(53416004)(2351001)(2906002)(305945005)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3478; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1c02375-5211-44ea-b1d6-08d6d3803924
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BYAPR12MB3478; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB3478:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3478940B8E23BDDD01603A63E4320@BYAPR12MB3478.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 36Wk0lghX4Cd+zjvh4aWi9YtiTeIhe1xkxZGpqp3QIlLJEzzCN77ki9rojZlekamnk6UJkDqri9qH9Llj0ZWfV8aGTfiI8TFZBwQ4ePpDwP6S7ikJOosa3ZjfPA+r1rA5vswZ4KEWX142Iv2K8qMCswRUr2PNxUHe6mVbApWEBLbvyQbKMxKRODSLBHyeeBR4cWqJEdtXPB1ASNkilD837Ji1cb+jjePZv0VUtY8gx+PbBrZWUJCsWxYpTZx6SsVaAAX6OKaYaAlc22ZFewH6o38lZeEAeNDM+YH7A2nHUvyzBFoz9LIKBVxJ56vq3H+2LtFhqhMkggAa5fpjmAXJxI3fHmxPHcvq9ga7he/kA/wOwhWgdjkq2dND7YxnY4aBnQSqTEjD8Ovozi0o87rrSHMwbSD+fMnzUJeuUkIEgo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 06:41:38.6253 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c02375-5211-44ea-b1d6-08d6d3803924
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3478
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=li73nxLILGml2GnekPM5ojL1NvRdOFr7eW7srqf2k10=;
 b=J6F5aGdpkljT15SW1dQDuOabDKAaq23COgrIbosf5daOLGcwwoKhYt4652MK/DCWc8+AEPxp9qccOycfcd/hR//j/GXd+bFwwX3uF7uzReaVrsc6ftCyCSQSU/VBZmVuVVFNLGG99m+h3g9Mgi/TU/OryAM/ssGq4ms6PrOOHVw=
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
Cc: Alexander.Deucher@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2l0aCB1c2VyIHNwZWNpZmllZCB2b2x0YWdlKERQTVRBQkxFX09EX1VQREFURV9WRERDKSwgdGhl
IEFWRlMKd2lsbCBiZSBkaXNhYmxlZC4gSG93ZXZlciwgdGhlIGJ1Z2d5IGNvZGUgbWFrZXMgdGhp
cyBhY3R1YWxseSBub3QKd29ya2luZyBhcyBleHBlY3RlZC4KCi0gVjI6IGNsZWFyIGFsbCBPRCBm
bGFncyBleGNwZXQgRFBNVEFCTEVfT0RfVVBEQVRFX1ZEREMKCkNoYW5nZS1JZDogSWZhODNhNjI1
NWJiM2Y2ZmE0YmRiNGRlNjE2NTIxY2I3YmFiNjgzMGEKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFu
IDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9o
d21nci92ZWdhMTBfaHdtZ3IuYyB8IDkgKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMKaW5kZXggMTM4ZjlmOWVhNzY1Li4wNWY2YmY3
ZDcwM2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Zl
Z2ExMF9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Zl
Z2ExMF9od21nci5jCkBAIC0yNDY2LDExICsyNDY2LDYgQEAgc3RhdGljIHZvaWQgdmVnYTEwX2No
ZWNrX2RwbV90YWJsZV91cGRhdGVkKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAJCQlyZXR1cm47
CiAJCX0KIAl9Ci0KLQlpZiAoZGF0YS0+bmVlZF91cGRhdGVfZHBtX3RhYmxlICYgRFBNVEFCTEVf
T0RfVVBEQVRFX1ZEREMpIHsKLQkJZGF0YS0+bmVlZF91cGRhdGVfZHBtX3RhYmxlICY9IH5EUE1U
QUJMRV9PRF9VUERBVEVfVkREQzsKLQkJZGF0YS0+bmVlZF91cGRhdGVfZHBtX3RhYmxlIHw9IERQ
TVRBQkxFX09EX1VQREFURV9TQ0xLIHwgRFBNVEFCTEVfT0RfVVBEQVRFX01DTEs7Ci0JfQogfQog
CiAvKioKQEAgLTM2ODMsNiArMzY3OCwxMCBAQCBzdGF0aWMgaW50IHZlZ2ExMF9zZXRfcG93ZXJf
c3RhdGVfdGFza3Moc3RydWN0IHBwX2h3bWdyICpod21nciwKIAogCXZlZ2ExMF91cGRhdGVfYXZm
cyhod21ncik7CiAKKwkvKgorCSAqIENsZWFyIGFsbCBPRCBmbGFncyBleGNlcHQgRFBNVEFCTEVf
T0RfVVBEQVRFX1ZEREMuCisJICogVGhhdCB3aWxsIGhlbHAgdG8ga2VlcCBBVkZTIGRpc2FibGVk
LgorCSAqLwogCWRhdGEtPm5lZWRfdXBkYXRlX2RwbV90YWJsZSAmPSBEUE1UQUJMRV9PRF9VUERB
VEVfVkREQzsKIAogCXJldHVybiAwOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
