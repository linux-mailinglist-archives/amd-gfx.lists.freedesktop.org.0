Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF0AF17E
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF6F6E962;
	Tue, 10 Sep 2019 19:04:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820057.outbound.protection.outlook.com [40.107.82.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48496E962
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:04:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nG9ZuSzwJJv76h8ZT/iQsQB0Ka5xQKrl8OaBtSn/JnV5Mu/WHHoji+R+4ABq7kuu/Gd6+ouYf2W6875Md4pYBZV3oIgO/eRqiJNy0TGJ63Pa7imPu3p9jRpWwRA9dHHQICd2Fa9lFP7pBEAFMJivRq2InAA+VSTMSkyymoaand5l9OutfEqPZeK/FjDJHr+FEuLWcE4ZRG2UkPbPS89bmxPj5vYUFbRwGzNTKW0f9EYdi31QPgj/E9E86TApEgXEMm9GpJ72Iar9R+QIpPLHyZRpOWapiKd2lT/m3KsDrIGt52qld4hW9pNCPpnWT3hrhub+JmeKQIKJXON8v0n+2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/QW3N2rVYYUgpbmB88DdhNDcGFs7lIsyeQE3z+1C+4=;
 b=fd4oJZk3NoJ9hJypf33MW15HWW2kNbsGS4QY+M/kBDp948kTlb/eqmG7G8eUvosEXqipM6BJC7T1VVV5fEOL3igYyLvQVHhl0qKn8RfEsg4Xf4Tfz5s8B5CQ4ecC0sJf3zjh8wSnO2uV1Dg4YtQtFgFPRn4TXc6p0a6Hi7KrHYIaUIbFQrG9qxtmP1p2O3pgpZ4USiR7hlME9nIANNM+P98XtSpku0a2ZtLC0yyC95dp1rJCVT25nQsBdI/TOaMjUQeVNNtk5JsjDnhg9XlTRSjsE1ZEIQnjyfDXxX/xDMwPWLwq9KFvin7qEzEHEEbuoBt4Gbd5SOIpFBnOxay0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0017.namprd12.prod.outlook.com (2603:10b6:403:2::27)
 by DM6PR12MB3498.namprd12.prod.outlook.com (2603:10b6:5:3c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13; Tue, 10 Sep
 2019 19:04:34 +0000
Received: from DM3NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by BN4PR12CA0017.outlook.office365.com
 (2603:10b6:403:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.13 via Frontend
 Transport; Tue, 10 Sep 2019 19:04:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT011.mail.protection.outlook.com (10.152.82.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:04:33 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:04:30 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/20] drm: uevent for connector status change
Date: Tue, 10 Sep 2019 15:04:08 -0400
Message-ID: <20190910190422.794-7-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
References: <eb83ae25-7635-45de-72dc-db24571066d2@amd.com>
 <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(47776003)(51416003)(336012)(76176011)(86362001)(7696005)(316002)(6916009)(476003)(2616005)(11346002)(446003)(486006)(16586007)(426003)(6306002)(126002)(186003)(305945005)(2906002)(14444005)(8676002)(81156014)(81166006)(26005)(8936002)(356004)(6666004)(5024004)(1076003)(53936002)(48376002)(5660300002)(2351001)(4326008)(53416004)(966005)(50226002)(36756003)(478600001)(70586007)(70206006)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3498; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff215332-2ca0-47d5-fd9e-08d73621b793
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB3498; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3498:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <DM6PR12MB34980F13C930B75DA66EC6E7F9B60@DM6PR12MB3498.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: C/0X9+3o6LmaRrS1OiV6zQNJM54UblKtkNROQIqmL9TiWcTP0PTKaZKvn3BMo5wbjqBpBYSRQYhodQLw3YHUi+GomE0b4wAHJkLMFKLSpgufkCrxlkbQs57/2LsVgJV71c62iAA843sjRsY9UE4pN55301QXEpgMDn1J2WWoSqGwT0WWOAuk6DnO9gLRUtvZI+rbfgPGEelPl1hXaoTuXY/w/aAFs01qqf7Id0szjpaeijUbtbI8hoPsbYtcagfABWc2KaYJB9hoDMu+zbwk4W3qsXRBdYp4rEO5wdCKEjxNAElTcZ7a8uNNknR7xPCHE8aWiBNZY4KwTxiPdJZydoIxdJ3gsPu/dr7z2BIKOcG2zs//xtXoVxAci4qkC6KQd/M2XGwlZINvuAmDEMeTZEpI4xZsI6j7Y3FnVvIMC2A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:04:33.6623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff215332-2ca0-47d5-fd9e-08d73621b793
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3498
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/QW3N2rVYYUgpbmB88DdhNDcGFs7lIsyeQE3z+1C+4=;
 b=mIx9jwT3ddsLa+R7pDw+LBbgRqnCqEuRKh7tSw9BPZ6SrYBR6AFofeWwovr9r5fvXQWLtP8y4FvMjQ5XjxrXn97OR5rsH/ZGQfbeioZiTyVVxImcAYTTGRhG6sy4TYyMZALUFk2lAwtzkMUNz+dtdva5ZrSw35Air8GqtgYGyyc=
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
