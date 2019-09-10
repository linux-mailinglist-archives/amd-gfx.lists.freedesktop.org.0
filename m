Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB79AF193
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7EA6E96A;
	Tue, 10 Sep 2019 19:06:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760082.outbound.protection.outlook.com [40.107.76.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609716E96E
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:06:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbatJKIq3l/3dxAZv/ArRPSMwMwgdDjPj0nHI0MSPwjIoutpUoiQ0NkHWnjp/jCHpwGQ7nhSU9UWEBed9yfj9sbNyP0dPiPYnIoxrCychRG1QfeoOV9lWCTKtXkfoWFSpKK237H859C13JgLZtfuRr2u63qpVAtqk6qM4cyfRdJkGShRPQjBFUwzU9agde/UpV3SKzsoNX+/Hh3lL5rgxlbLSdLJ7GAOTqijIlYEMf+nhIlSm3krfPqsL7V8PGpuKd9oDgYXESSp0wGTykRD2czGabcNyx4ZiH0/0CgUmJYZkjNf7oPX5Fau6XN2evH4r2sifQk5F737pYaUdYVcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/QW3N2rVYYUgpbmB88DdhNDcGFs7lIsyeQE3z+1C+4=;
 b=RRZ8EeIuiJp2vRme9ullPP7TUS7rrB0ha5f/eynfKwMxURX0nLQUIg5Gxc7BbROnuuV/+wsXMhW235UbO6TYL53sDvU0tOLkif5EoXQBT0SpdljfdGYw9bTJwMwgE5BSJtx2rKBilgALgeu/bW9nprr//pX39qGFP4LMddFiCtaPbC1tZLMhCAdhQaV+bU6EgpX7jhDqeXPPZidxychH+udeNIRC0n+KYeF1KDu8gvwHKjPpy0WtoNRzeF6nR8BfuYh/jGFicb0aRt6joKA0IX8XLhMAJf3QjAoD2/a8R8IXS5ziQwEk1UX9PKM2/tX5x9J+PJTS5s67wTm4OrwDnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0015.namprd12.prod.outlook.com
 (2603:10b6:301:4a::25) by DM5PR12MB1210.namprd12.prod.outlook.com
 (2603:10b6:3:75::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.17; Tue, 10 Sep
 2019 19:06:20 +0000
Received: from DM3NAM03FT020.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by MWHPR1201CA0015.outlook.office365.com
 (2603:10b6:301:4a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.13 via Frontend
 Transport; Tue, 10 Sep 2019 19:06:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT020.mail.protection.outlook.com (10.152.82.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:06:19 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:06:16 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/20] drm: uevent for connector status change
Date: Tue, 10 Sep 2019 15:05:40 -0400
Message-ID: <20190910190554.1539-7-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-10-Bhawanpreet.Lakha@amd.com>
 <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(136003)(2980300002)(428003)(199004)(189003)(966005)(26005)(53936002)(6306002)(7696005)(316002)(16586007)(53416004)(186003)(6666004)(4326008)(47776003)(356004)(70206006)(86362001)(70586007)(426003)(81166006)(8936002)(50226002)(81156014)(8676002)(305945005)(5660300002)(6916009)(36756003)(5024004)(1076003)(14444005)(76176011)(51416003)(50466002)(48376002)(446003)(11346002)(2906002)(478600001)(486006)(336012)(126002)(2616005)(476003)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1210; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e23b703f-77a5-4d06-c8c5-08d73621f6a3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1210; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1210:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <DM5PR12MB1210DE55F35B65F970F981F2F9B60@DM5PR12MB1210.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: j6jon2wMiKbGWiActTq1KXrzhZYRuFbw0fZtC0axucUBd4SoeOaFCCmDOyYThR60FvSvCNVigSuRdSXnPp7s+FW6BaV1Kmu7mK/lOWNaZ/NN1ob15/chTZSt8sNvQsIW8MEIwXCemV2B6qfyYHhYzxeESo5KFvXEE1mty4rUYJ7Y2o7GgLj2G2Ex0lSb7B0eehWq/ZaJPRqAZrH6Q3GJTOFrtqAVmDv9Lsupa4SIklsVanmvQzPpXMWmPWmZB6qILpt8DWcyyhq8y5U5pePjuNai/fYGjAihsJh2VRgxpw8iDbonPtai91LSG0JMeWdF5eKfE/S58c/Ro/Na5vp36tWfWfjsVdsEZTD2ripHAQ19f6uCqryzeHKgZ+7+FsXopWRRJEvN15ZHG13bBjiMkODquNyI2K0ewESdhSyIEGk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:06:19.4743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e23b703f-77a5-4d06-c8c5-08d73621f6a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1210
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/QW3N2rVYYUgpbmB88DdhNDcGFs7lIsyeQE3z+1C+4=;
 b=GZVnoHUEN4pMIhltp3WC0/CgldEuTn9lXvAy41zGQcAJktRs6AcoYVxxqx5a+FyiREA1y5F2bt/NHebmG1dzj3wODjVC8EvlHiTy3udG+GMkrJz/3vMTAuYMXLqXK615dxIKobEQrmEJZs+HszJOU1S7FIZvxkjCp3/VEebbirE=
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
