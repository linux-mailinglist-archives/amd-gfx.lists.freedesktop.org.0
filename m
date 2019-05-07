Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89E15D00
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 08:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067EB89C96;
	Tue,  7 May 2019 06:09:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770048.outbound.protection.outlook.com [40.107.77.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3D189C56
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 06:09:23 +0000 (UTC)
Received: from DM3PR12CA0088.namprd12.prod.outlook.com (2603:10b6:0:57::32) by
 MWHPR12MB1152.namprd12.prod.outlook.com (2603:10b6:300:e::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 06:09:22 +0000
Received: from CO1NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM3PR12CA0088.outlook.office365.com
 (2603:10b6:0:57::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 7 May 2019 06:09:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT030.mail.protection.outlook.com (10.152.80.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 06:09:21 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 01:09:16 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amd/powerplay: valid Vega10 DPMTABLE_OD_UPDATE_VDDC
 settings
Date: Tue, 7 May 2019 14:08:57 +0800
Message-ID: <20190507060859.27650-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507060859.27650-1-evan.quan@amd.com>
References: <20190507060859.27650-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(396003)(376002)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(76176011)(478600001)(70206006)(81156014)(81166006)(50466002)(2351001)(47776003)(50226002)(356004)(68736007)(72206003)(51416003)(6666004)(14444005)(1076003)(44832011)(70586007)(446003)(486006)(2616005)(476003)(126002)(2906002)(426003)(11346002)(186003)(77096007)(26005)(8936002)(7696005)(2870700001)(53416004)(316002)(48376002)(53936002)(5660300002)(54906003)(305945005)(6916009)(336012)(4326008)(86362001)(36756003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1152; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ef621a7-2a05-4a18-3587-08d6d2b28c29
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MWHPR12MB1152; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1152:
X-Microsoft-Antispam-PRVS: <MWHPR12MB11524550D85FE4D4C6760970E4310@MWHPR12MB1152.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tWgX89vWoszcxa8QzZ5O4Vx9h4ULYLmqbsurGESqGkancGZxnlBUx6tINFaluypi+a4UA+Lw1I2Xd1uAUEALXn0Mr+JWGQqw1DdqpGvk9BWPcy/+hqP/X491xq8+0EjdKROh4gZ0HLw2cePMGLApaEiwOR5RA5BFtIJTk4Ou7VdF+l3WKhXhWOijvuGNfYDgcuxeLRNtk93x7IaeuZg7OYzZ8QGLAdDppTLA1NtezC0i7lMRlUOP3xVTVECZMOJipIxBOL5bzTZIp83FYPg7NcxEdfL3AS/xUu5QUUL8kIWAd3s4R6fPZn9F92PK6Rw/Xy+PzRzJstBaaI4tdONzB9hi1wPT2I6qj8JjSaW665SQMcCOiw2MlAXvqMOzYQsPEJ61DqJVR3uRWsFJVgbPoJ+sz+UD3bW1Q+HdtcjOZ/c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 06:09:21.3388 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef621a7-2a05-4a18-3587-08d6d2b28c29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYSXfQUQyM6fNfG5+uZilXHFU2pIaXqjKjYpDX8jQNA=;
 b=1y4grhifvTFpjjXhSFqpZZYevHOLOHFGS9ekMoKLu6RRFLMqczSqxACHBCUzDO480ZyhGSjEckuGb6hoNsBWoA8WSBzhMCS31iV9twPHbEhuzBTgpjlUSUc8Vib4y3WBIRYnuWmfKlDmWGvJgejUA7pzaQ2/mfruwe39Bxv5yBE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; yiannakis.de; dkim=none (message not signed)
 header.d=none;yiannakis.de; dmarc=permerror action=none header.from=amd.com;
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
Cc: yanik@yiannakis.de, Alexander.Deucher@amd.com,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2l0aCB1c2VyIHNwZWNpZmllZCB2b2x0YWdlKERQTVRBQkxFX09EX1VQREFURV9WRERDKSwgdGhl
IEFWRlMKd2lsbCBiZSBkaXNhYmxlZC4gSG93ZXZlciwgdGhlIGJ1Z2d5IGNvZGUgbWFrZXMgdGhp
cyBhY3R1YWxseSBub3QKd29ya2luZyBhcyBleHBlY3RlZC4KCkNoYW5nZS1JZDogSWZhODNhNjI1
NWJiM2Y2ZmE0YmRiNGRlNjE2NTIxY2I3YmFiNjgzMGEKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFu
IDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9o
d21nci92ZWdhMTBfaHdtZ3IuYyB8IDcgKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMKaW5kZXggMTM4ZjlmOWVhNzY1Li4xMDNmN2UzZjA3
ODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2Ex
MF9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2Ex
MF9od21nci5jCkBAIC0yNDY2LDExICsyNDY2LDYgQEAgc3RhdGljIHZvaWQgdmVnYTEwX2NoZWNr
X2RwbV90YWJsZV91cGRhdGVkKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAJCQlyZXR1cm47CiAJ
CX0KIAl9Ci0KLQlpZiAoZGF0YS0+bmVlZF91cGRhdGVfZHBtX3RhYmxlICYgRFBNVEFCTEVfT0Rf
VVBEQVRFX1ZEREMpIHsKLQkJZGF0YS0+bmVlZF91cGRhdGVfZHBtX3RhYmxlICY9IH5EUE1UQUJM
RV9PRF9VUERBVEVfVkREQzsKLQkJZGF0YS0+bmVlZF91cGRhdGVfZHBtX3RhYmxlIHw9IERQTVRB
QkxFX09EX1VQREFURV9TQ0xLIHwgRFBNVEFCTEVfT0RfVVBEQVRFX01DTEs7Ci0JfQogfQogCiAv
KioKQEAgLTM2ODMsNyArMzY3OCw3IEBAIHN0YXRpYyBpbnQgdmVnYTEwX3NldF9wb3dlcl9zdGF0
ZV90YXNrcyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCiAJdmVnYTEwX3VwZGF0ZV9hdmZzKGh3
bWdyKTsKIAotCWRhdGEtPm5lZWRfdXBkYXRlX2RwbV90YWJsZSAmPSBEUE1UQUJMRV9PRF9VUERB
VEVfVkREQzsKKwlkYXRhLT5uZWVkX3VwZGF0ZV9kcG1fdGFibGUgPSAwOwogCiAJcmV0dXJuIDA7
CiB9Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
