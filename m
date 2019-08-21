Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4197602
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 11:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D199D6E2B8;
	Wed, 21 Aug 2019 09:24:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770052.outbound.protection.outlook.com [40.107.77.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A006E2B8
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 09:24:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gu+3sGYLRM2yt5/HWbF5iANb2OkhI3/kBGz/eJGHTSnhcMqIi/wHIc9vhe49Z4Tovcj9V/Z8RGjBc04q304Y9yHRT5ESEyVwlE5ifCxBdeS/f8oMPkXJKwpp5QPkVhfFDUEwz6dEM0eMd78H+pj8sZUE1/4QZtKx3IlyIQn1qLJGxFG9EG9mSj4AjM0BIEGb5MAbyEoTP5PgwR5RWa+Dazyx792PqLuLkliux/WsoIO9NC7u48iS5ZmaRgjMX9+ijQDi1pvD+z/hEWABhRmzAZP87HwccHaGNUcIeoQjpFSijxvxy6nKbv5S8ib1afVShgecn65JW4gpcogfbcPO8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvmacV3hzfcyCOp9JMAbc6CyvAGkn7xtre9+A7e+yBI=;
 b=ZMKkihf9VELPuLySppaIZjii5v9l0RIwTIj9w8HB/dkt3Jc1GQIha4LxNRV0bZAK8EmEC0cjtHNjfAjRWglq3thmE/10YLQmrG5ziF5HmI7d598hGW0jccNZKjyXAUO2a0g0JxrTHG2bhpHxWSyf/CZy3QwtqrSIMy/rgm50J4y+bw3vwqQAnsPkXA4MEqpobS0dYMuvnOtFj32hXAGJNvbGL49gS5wXze0Z/5Nr+5oaj42OwQ92ucKkcV/YKyb9kM9Mw4p3gM6ZYHn1b+eH12EEPBxwtVwMZjVLaC/g+KKgdED2J5HxyrynFwoMi82BCoYSjQ60fAnXzGWfcatrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:405:70::15)
 by BN6PR12MB1267.namprd12.prod.outlook.com (2603:10b6:404:17::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 09:24:22 +0000
Received: from DM3NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by BN6PR12CA0029.outlook.office365.com
 (2603:10b6:405:70::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 21 Aug 2019 09:24:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT037.mail.protection.outlook.com (10.152.83.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 09:24:22 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 21 Aug 2019
 04:24:21 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: update cached feature enablement status
Date: Wed, 21 Aug 2019 17:24:13 +0800
Message-ID: <20190821092413.27155-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(2980300002)(428003)(199004)(189003)(356004)(6666004)(70206006)(50226002)(14444005)(478600001)(36756003)(70586007)(86362001)(5660300002)(486006)(2351001)(126002)(476003)(53936002)(53416004)(44832011)(316002)(2616005)(186003)(6916009)(8936002)(51416003)(7696005)(4326008)(426003)(8676002)(305945005)(50466002)(2906002)(2870700001)(1076003)(15650500001)(48376002)(81166006)(26005)(336012)(47776003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1267; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8c88044-0d2f-401b-c90b-08d726195a1b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR12MB1267; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1267:
X-Microsoft-Antispam-PRVS: <BN6PR12MB12670F7C6C47D5A1D2D68A2AE4AA0@BN6PR12MB1267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:364;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 12TpAx9Zso7r9BXImnMBqQ55z4CU3WfYUDQLNKSsD1MSnGExBXCyAjVzMcwjArJHuKGeOzw/yz5sVoGSHYe4ybp1cOEKDSNUmBJ4kz4/MLFKiwnY7yB+qzy6xS/I9g8+OhWy+0xlj9DV6rGhMhLpIzVLn3fLmJX3XZN+GZPPzW09G5aVoX7cS0nCSuAKZusxSSaK0Pdpabf1Bh1qCKgpVCURukLDZLAsfahw73nKUxqbBBh7gB+36gZ4EgjqtIUy8M+YmEGEtMDF0A0yBXfg8rBrX1FZJ7qZ7UVGQvtPyYhaN0s1urbu8RAOK4dB/PPN3JlnNiD43zAwrKb3uS+cco9NzdDMf3ffaqVLRVZFUoxoRY7xMQzMknAGgAbeGmMhwC5uRc5baZwIpio4Jfa90HMVDaw7dBGAw5taekD2hxM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 09:24:22.2201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c88044-0d2f-401b-c90b-08d726195a1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvmacV3hzfcyCOp9JMAbc6CyvAGkn7xtre9+A7e+yBI=;
 b=mqAx9JTVUYj8XKphTcbSpEQ8L0sUKxLc3yHlKfml0c7OHKfyncDHa6StrZJLq29+yCpxse2o/Ai4QMLCWQqr6gy+DTuiPbC5AEwNGkofKhnjv2KHWo0+vjHgeaBY5Xf2hC1YogHSc22xGVSKVXZ9VIVk8dvs0mP+kNwy2hI3uf8=
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

TmVlZCB0byB1cGRhdGUgaW4gY2FjaGUgZmVhdHVyZSBlbmFibGVtZW50IHN0YXR1cyBhZnRlciBw
cF9mZWF0dXJlCnNldHRpbmdzLiBBbm90aGVyIGZpeCBmb3IgdGhlIGNvbW1pdCBiZWxvdzoKZHJt
L2FtZC9wb3dlcnBsYXk6IGltcGxtZW50IHN5c2ZzIGZlYXR1cmUgc3RhdHVzIGZ1bmN0aW9uIGlu
IHNtdQoKQ2hhbmdlLUlkOiBJOTBlMjliMGQ4MzlkZjI2ODI1ZDU5OTMyMTJmNjA5N2M3YWQ0YmVi
ZgpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDE2ICsrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IGM2NjNkMjVkYjVhYi4uMDQ4NjdjYWZiMzIy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC05Niwx
MSArOTYsMTMgQEAgc2l6ZV90IHNtdV9zeXNfZ2V0X3BwX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwgY2hhciAqYnVmKQogCiBpbnQgc211X3N5c19zZXRfcHBfZmVhdHVyZV9t
YXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50NjRfdCBuZXdfbWFzaykKIHsKKwlzdHJ1
Y3Qgc211X2ZlYXR1cmUgKmZlYXR1cmUgPSAmc211LT5zbXVfZmVhdHVyZTsKIAlpbnQgcmV0ID0g
MDsKIAl1aW50MzJfdCBmZWF0dXJlX21hc2tbMl0gPSB7IDAgfTsKIAl1aW50NjRfdCBmZWF0dXJl
XzJfZW5hYmxlZCA9IDA7CiAJdWludDY0X3QgZmVhdHVyZV8yX2Rpc2FibGVkID0gMDsKIAl1aW50
NjRfdCBmZWF0dXJlX2VuYWJsZXMgPSAwOworCXVpbnQ2NF90IGZlYXR1cmVfaWQ7CiAKIAlyZXQg
PSBzbXVfZmVhdHVyZV9nZXRfZW5hYmxlZF9tYXNrKHNtdSwgZmVhdHVyZV9tYXNrLCAyKTsKIAlp
ZiAocmV0KQpAQCAtMTE1LDExICsxMTcsMjUgQEAgaW50IHNtdV9zeXNfc2V0X3BwX2ZlYXR1cmVf
bWFzayhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDY0X3QgbmV3X21hc2spCiAJCXJldCA9
IHNtdV9mZWF0dXJlX3VwZGF0ZV9lbmFibGVfc3RhdGUoc211LCBmZWF0dXJlXzJfZW5hYmxlZCwg
dHJ1ZSk7CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OworCisJCW11dGV4X2xvY2soJmZlYXR1
cmUtPm11dGV4KTsKKwkJZm9yIChmZWF0dXJlX2lkID0gMDsgZmVhdHVyZV9pZCA8IDY0OyBmZWF0
dXJlX2lkKyspIHsKKwkJCWlmIChmZWF0dXJlXzJfZW5hYmxlZCAmICgxVUxMIDw8IGZlYXR1cmVf
aWQpKQorCQkJCXRlc3RfYW5kX3NldF9iaXQoZmVhdHVyZV9pZCwgZmVhdHVyZS0+ZW5hYmxlZCk7
CisJCX0KKwkJbXV0ZXhfdW5sb2NrKCZmZWF0dXJlLT5tdXRleCk7CiAJfQogCWlmIChmZWF0dXJl
XzJfZGlzYWJsZWQpIHsKIAkJcmV0ID0gc211X2ZlYXR1cmVfdXBkYXRlX2VuYWJsZV9zdGF0ZShz
bXUsIGZlYXR1cmVfMl9kaXNhYmxlZCwgZmFsc2UpOwogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJl
dDsKKworCQltdXRleF9sb2NrKCZmZWF0dXJlLT5tdXRleCk7CisJCWZvciAoZmVhdHVyZV9pZCA9
IDA7IGZlYXR1cmVfaWQgPCA2NDsgZmVhdHVyZV9pZCsrKSB7CisJCQlpZiAoZmVhdHVyZV8yX2Rp
c2FibGVkICYgKDFVTEwgPDwgZmVhdHVyZV9pZCkpCisJCQkJdGVzdF9hbmRfY2xlYXJfYml0KGZl
YXR1cmVfaWQsIGZlYXR1cmUtPmVuYWJsZWQpOworCQl9CisJCW11dGV4X3VubG9jaygmZmVhdHVy
ZS0+bXV0ZXgpOwogCX0KIAogCXJldHVybiByZXQ7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
