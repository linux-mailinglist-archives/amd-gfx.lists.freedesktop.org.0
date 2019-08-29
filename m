Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF0BA20C2
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 18:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE916E130;
	Thu, 29 Aug 2019 16:24:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800073.outbound.protection.outlook.com [40.107.80.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202786E133
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 16:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3dYdteLDmOYkN7/EUMwda86FN5yHSSkHvgqZQmRbnrJW7v+XiuBMArNC2DPuKz5b4+8UOUdvXG56xTsx5YPx9WRT1LXf9DwGllphrD8tPZN2DqmK6jJLX8kR+T/vtzbEeDxHi8A33XThg0UJ/jLiAQnLMUMyjby5ezpu/s6VOEwa+AKbY0uu/85HmZBx/Rau5xa4n5VX4IzCbnHsxtuJk0AaEqkm2DmBw0YgFABlN8T4h/0/cf0ZLo+bZPVvBFTohOw3eHtmyU5dELIjmZS9V6JJ7L+F5FYWyg1/kscHTcExmRhIhW9N/E0iEiVmG40NMpHXJn68aaFF+xUcCtCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/QW3N2rVYYUgpbmB88DdhNDcGFs7lIsyeQE3z+1C+4=;
 b=Sw3vZlWT+QLNDI5KwMIduVzf3pBxe0d++Bxmw/BtPRFELZg6V+Ktdlf82lG7fpfhuCCW91EAwtRQ9j4EANnfaBSSjdxKHqJxl36wblG3LRd5DLIcfkNHCP/rq+blrGdVspF/6iDU0wZdF7XUHO694t71fzv0FmCYYefvlyj8HTWweazt5SmfLvasP1qUOCZlPxnhOwEMMwaVpY/Z09zR/ouue5Fzm8UrhGDSv/7b5uoRxb4iMJ2LCPiM2hxKzC1HTGIsmxtEwJguaK9LZJBhMzbJNfHjdNr11IfKJEAU7NCCNOLmkrbKKhJ+K1R/P0RscADP/YajeHMK5zTq08usSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0017.namprd12.prod.outlook.com (2603:10b6:403:2::27)
 by MWHPR12MB1280.namprd12.prod.outlook.com (2603:10b6:300:12::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.19; Thu, 29 Aug
 2019 16:23:58 +0000
Received: from BY2NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by BN4PR12CA0017.outlook.office365.com
 (2603:10b6:403:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.15 via Frontend
 Transport; Thu, 29 Aug 2019 16:23:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT007.mail.protection.outlook.com (10.152.84.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 16:23:56 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 11:23:43 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/20] drm: uevent for connector status change
Date: Thu, 29 Aug 2019 12:22:39 -0400
Message-ID: <20190829162253.10195-7-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(70206006)(446003)(305945005)(316002)(53416004)(70586007)(6916009)(81156014)(8676002)(81166006)(8936002)(36756003)(336012)(6306002)(50226002)(186003)(426003)(50466002)(6666004)(356004)(2351001)(48376002)(47776003)(86362001)(11346002)(53936002)(7696005)(966005)(486006)(14444005)(51416003)(26005)(76176011)(5660300002)(1076003)(476003)(16586007)(126002)(4326008)(478600001)(2616005)(5024004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1280; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a895c1b4-bfc5-419c-854e-08d72c9d4aaa
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR12MB1280; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1280:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <MWHPR12MB1280AA94A3D097A094836531F9A20@MWHPR12MB1280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: oyi7ElJaNd+rqKOkqyh0SQmIsLG+u3zKUF93A1PNpJGxf0mb8BxpyPLaRfgsNdgjdAsN0a7Jk3ZZzNiZMhgWcu/dWRoUsZFSxQQXDSbIlcaQNuBx0N5TzKRRmLuPm5TserZVWq+T05taGbzlAEEjPTIx4tT71jtfk8TlMB+ZC4WGUgBDOv5jRjSYb3HUSgp4osi0dGXcnWZgBxN2QaVYm6kILaZ7SZ4FVraUY4lcCs4SwF7BUDkhsG2EDm92eLT6kr5ujYsAlsVioel9W2Vlab9AIBmd0QgXiQLF8LRyAEgJhZvOPmzy0RC/Ajx+ESt57vLpImpWWTDRkNHHFqKRHgjRSakHObbKuPRN6aqTsHpwjcjgWdhysNLiF/z8WArFYBr0NiANAVJo7WrUII5QeBqCaaZ3g7SsQUcEAVzGFP4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 16:23:56.8830 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a895c1b4-bfc5-419c-854e-08d72c9d4aaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1280
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/QW3N2rVYYUgpbmB88DdhNDcGFs7lIsyeQE3z+1C+4=;
 b=qg9U81oj7i8t0WI2SML/Bmvncq24fIzm9bmpdqjmJIs8RlT+UNkHio/BuZjgpM4LlA7JyByMa3C7E9my668ybpjJ8PbcdkXiLniF3mPfL1K+1apK5d/GVGVP8M47vMT56+dAx49UAK1Cn9gqINeFLRntDqL+O6eRkh5k27RDEGg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Ramalingam C <ramalingam.c@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPgoKRFJNIEFQSSBmb3Ig
Z2VuZXJhdGluZyB1ZXZlbnQgZm9yIGEgc3RhdHVzIGNoYW5nZXMgb2YgY29ubmVjdG9yJ3MKcHJv
cGVydHkuCgpUaGlzIHVldmVudCB3aWxsIGhhdmUgZm9sbG93aW5nIGRldGFpbHMgcmVsYXRlZCB0
byB0aGUgc3RhdHVzIGNoYW5nZToKCiAgSE9UUExVRz0xLCBDT05ORUNUT1I9PGNvbm5lY3Rvcl9p
ZD4gYW5kIFBST1BFUlRZPTxwcm9wZXJ0eV9pZD4KClBla2thIGhhdmUgY29tcGxldGVkIHRoZSBX
ZXN0b24gRFJNLWJhY2tlbmQgcmV2aWV3IGluCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy93YXlsYW5kL3dlc3Rvbi9tZXJnZV9yZXF1ZXN0cy80OAphbmQgdGhlIFVBUEkgZm9yIEhEQ1Ag
Mi4yIGxvb2tzIGdvb2QuCgpUaGUgdXNlcnNwYWNlIGlzIGFjY2VwdGVkIGluIFdlc3Rvbi4KCnYy
OgogIE1pbm9yIGZpeGVzIGF0IEtEb2MgY29tbWVudHMgW0RhbmllbF0KdjM6CiAgQ2hlY2sgdGhl
IHByb3BlcnR5IGlzIHJlYWxseSBhdHRhY2hlZCB3aXRoIGNvbm5lY3RvciBbRGFuaWVsXQp2NDoK
ICBUeXBvcyBhbmQgc3RyaW5nIGxlbmd0aCBzdWdnZXN0aW9ucyBhcmUgYWRkcmVzc2VkIFtTZWFu
XQoKU2lnbmVkLW9mZi1ieTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPgpS
ZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KUmV2aWV3
ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpBY2tlZC1ieTogUGVra2EgUGFhbGFu
ZW4gPHBla2thLnBhYWxhbmVuQGNvbGxhYm9yYS5jb20+CkFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8
amFuaS5uaWt1bGFAaW50ZWwuY29tPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvcGF0Y2gvMzIwOTYxLz9zZXJpZXM9NTcyMzImcmV2PTE0Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9zeXNmcy5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IGluY2x1ZGUvZHJtL2RybV9zeXNmcy5oICAgICB8ICA1ICsrKystCiAyIGZpbGVzIGNoYW5nZWQs
IDM5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3N5c2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKaW5kZXggMThi
MWFjNDQyOTk3Li45ZjBjY2VjNDRhMDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
c3lzZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKQEAgLTIxLDYgKzIxLDcg
QEAKICNpbmNsdWRlIDxkcm0vZHJtX3N5c2ZzLmg+CiAjaW5jbHVkZSA8ZHJtL2RybVAuaD4KICNp
bmNsdWRlICJkcm1faW50ZXJuYWwuaCIKKyNpbmNsdWRlICJkcm1fY3J0Y19pbnRlcm5hbC5oIgog
CiAjZGVmaW5lIHRvX2RybV9taW5vcihkKSBkZXZfZ2V0X2RydmRhdGEoZCkKICNkZWZpbmUgdG9f
ZHJtX2Nvbm5lY3RvcihkKSBkZXZfZ2V0X2RydmRhdGEoZCkKQEAgLTMyMCw2ICszMjEsOSBAQCB2
b2lkIGRybV9zeXNmc19sZWFzZV9ldmVudChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogICogU2Vu
ZCBhIHVldmVudCBmb3IgdGhlIERSTSBkZXZpY2Ugc3BlY2lmaWVkIGJ5IEBkZXYuICBDdXJyZW50
bHkgd2Ugb25seQogICogc2V0IEhPVFBMVUc9MSBpbiB0aGUgdWV2ZW50IGVudmlyb25tZW50LCBi
dXQgdGhpcyBjb3VsZCBiZSBleHBhbmRlZCB0bwogICogZGVhbCB3aXRoIG90aGVyIHR5cGVzIG9m
IGV2ZW50cy4KKyAqCisgKiBBbnkgbmV3IHVhcGkgc2hvdWxkIGJlIHVzaW5nIHRoZSBkcm1fc3lz
ZnNfY29ubmVjdG9yX3N0YXR1c19ldmVudCgpCisgKiBmb3IgdWV2ZW50cyBvbiBjb25uZWN0b3Ig
c3RhdHVzIGNoYW5nZS4KICAqLwogdm9pZCBkcm1fc3lzZnNfaG90cGx1Z19ldmVudChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KQogewpAQCAtMzMyLDYgKzMzNiwzNyBAQCB2b2lkIGRybV9zeXNmc19o
b3RwbHVnX2V2ZW50KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB9CiBFWFBPUlRfU1lNQk9MKGRy
bV9zeXNmc19ob3RwbHVnX2V2ZW50KTsKIAorLyoqCisgKiBkcm1fc3lzZnNfY29ubmVjdG9yX3N0
YXR1c19ldmVudCAtIGdlbmVyYXRlIGEgRFJNIHVldmVudCBmb3IgY29ubmVjdG9yCisgKiBwcm9w
ZXJ0eSBzdGF0dXMgY2hhbmdlCisgKiBAY29ubmVjdG9yOiBjb25uZWN0b3Igb24gd2hpY2ggcHJv
cGVydHkgc3RhdHVzIGNoYW5nZWQKKyAqIEBwcm9wZXJ0eTogY29ubmVjdG9yIHByb3BlcnR5IHdo
b3NlIHN0YXR1cyBjaGFuZ2VkLgorICoKKyAqIFNlbmQgYSB1ZXZlbnQgZm9yIHRoZSBEUk0gZGV2
aWNlIHNwZWNpZmllZCBieSBAZGV2LiAgQ3VycmVudGx5IHdlCisgKiBzZXQgSE9UUExVRz0xIGFu
ZCBjb25uZWN0b3IgaWQgYWxvbmcgd2l0aCB0aGUgYXR0YWNoZWQgcHJvcGVydHkgaWQKKyAqIHJl
bGF0ZWQgdG8gdGhlIHN0YXR1cyBjaGFuZ2UuCisgKi8KK3ZvaWQgZHJtX3N5c2ZzX2Nvbm5lY3Rv
cl9zdGF0dXNfZXZlbnQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKKwkJCQkgICAg
ICBzdHJ1Y3QgZHJtX3Byb3BlcnR5ICpwcm9wZXJ0eSkKK3sKKwlzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2ID0gY29ubmVjdG9yLT5kZXY7CisJY2hhciBob3RwbHVnX3N0cltdID0gIkhPVFBMVUc9MSIs
IGNvbm5faWRbMjFdLCBwcm9wX2lkWzIxXTsKKwljaGFyICplbnZwWzRdID0geyBob3RwbHVnX3N0
ciwgY29ubl9pZCwgcHJvcF9pZCwgTlVMTCB9OworCisJV0FSTl9PTighZHJtX21vZGVfb2JqX2Zp
bmRfcHJvcF9pZCgmY29ubmVjdG9yLT5iYXNlLAorCQkJCQkgICBwcm9wZXJ0eS0+YmFzZS5pZCkp
OworCisJc25wcmludGYoY29ubl9pZCwgQVJSQVlfU0laRShjb25uX2lkKSwKKwkJICJDT05ORUNU
T1I9JXUiLCBjb25uZWN0b3ItPmJhc2UuaWQpOworCXNucHJpbnRmKHByb3BfaWQsIEFSUkFZX1NJ
WkUocHJvcF9pZCksCisJCSAiUFJPUEVSVFk9JXUiLCBwcm9wZXJ0eS0+YmFzZS5pZCk7CisKKwlE
Uk1fREVCVUcoImdlbmVyYXRpbmcgY29ubmVjdG9yIHN0YXR1cyBldmVudFxuIik7CisKKwlrb2Jq
ZWN0X3VldmVudF9lbnYoJmRldi0+cHJpbWFyeS0+a2Rldi0+a29iaiwgS09CSl9DSEFOR0UsIGVu
dnApOworfQorRVhQT1JUX1NZTUJPTChkcm1fc3lzZnNfY29ubmVjdG9yX3N0YXR1c19ldmVudCk7
CisKIHN0YXRpYyB2b2lkIGRybV9zeXNmc19yZWxlYXNlKHN0cnVjdCBkZXZpY2UgKmRldikKIHsK
IAlrZnJlZShkZXYpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3N5c2ZzLmggYi9pbmNs
dWRlL2RybS9kcm1fc3lzZnMuaAppbmRleCA0ZjMxMWU4MzZjZGMuLmQ0NTRlZjYxN2IyYyAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3N5c2ZzLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX3N5
c2ZzLmgKQEAgLTQsMTAgKzQsMTMgQEAKIAogc3RydWN0IGRybV9kZXZpY2U7CiBzdHJ1Y3QgZGV2
aWNlOworc3RydWN0IGRybV9jb25uZWN0b3I7CitzdHJ1Y3QgZHJtX3Byb3BlcnR5OwogCiBpbnQg
ZHJtX2NsYXNzX2RldmljZV9yZWdpc3RlcihzdHJ1Y3QgZGV2aWNlICpkZXYpOwogdm9pZCBkcm1f
Y2xhc3NfZGV2aWNlX3VucmVnaXN0ZXIoc3RydWN0IGRldmljZSAqZGV2KTsKIAogdm9pZCBkcm1f
c3lzZnNfaG90cGx1Z19ldmVudChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKLQordm9pZCBkcm1f
c3lzZnNfY29ubmVjdG9yX3N0YXR1c19ldmVudChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLAorCQkJCSAgICAgIHN0cnVjdCBkcm1fcHJvcGVydHkgKnByb3BlcnR5KTsKICNlbmRpZgot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
