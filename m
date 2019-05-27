Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C022AF81
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 09:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5447F898EA;
	Mon, 27 May 2019 07:43:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720051.outbound.protection.outlook.com [40.107.72.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87E7898EA
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 07:43:35 +0000 (UTC)
Received: from DM3PR12CA0109.namprd12.prod.outlook.com (2603:10b6:0:55::29) by
 DM6PR12MB2668.namprd12.prod.outlook.com (2603:10b6:5:4a::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Mon, 27 May 2019 07:43:32 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM3PR12CA0109.outlook.office365.com
 (2603:10b6:0:55::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.17 via Frontend
 Transport; Mon, 27 May 2019 07:43:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 07:43:32 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 02:43:31 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Need to set the baco cap before baco reset
Date: Mon, 27 May 2019 15:43:25 +0800
Message-ID: <1558943005-16557-1-git-send-email-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(396003)(346002)(136003)(2980300002)(428003)(189003)(199004)(336012)(47776003)(5660300002)(6916009)(426003)(77096007)(2351001)(36756003)(476003)(486006)(305945005)(2616005)(126002)(48376002)(316002)(14444005)(50466002)(81156014)(356004)(51416003)(70206006)(68736007)(26005)(16586007)(6666004)(8676002)(4326008)(53416004)(2906002)(50226002)(86362001)(7696005)(53936002)(8936002)(478600001)(70586007)(72206003)(81166006)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2668; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c366bf2-e51c-45d0-23e7-08d6e2770493
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM6PR12MB2668; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2668:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2668AE56F95937108D03C7B68F1D0@DM6PR12MB2668.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: IaNwI7JuaYFyMJnS1e/9lcG72o5qn+72IsU3kIOCGRh8cPeGwCBcpKj4nDDhn9T+OHHUAgBTJfJyHcK0rrbdtbw4GaEnqfHB3ckpwaY2LUvQcC4EREj5PjtdizihGZD+ZSTU4sfbP3/vVmYv0oiNPP9kIxxc9Y383tDp0RIBGidoPzmSqtLY7wC/7d1OfrjxOj4OZLRs0NXl2EUCW9oQ3YjZo+7AXVu+BsqFCdl6s6iNsfii4MuQXkLjGTadENpNRPopEZ8BnAnQ85f9O8hQPbNvS0480HX/p1PWODfpqNJnIxGtRpoZTRHT2ihuF5wjGDpzGpB4S2v1sLXKRgjd07duqApqRSR4umGwlqMf7nxj0+kwyDYHX7DdSIGTG1ae8g0OdhA20kY8OxV3EiC9vh67l8zdLhQra30SAJVXh/w=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 07:43:32.2369 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c366bf2-e51c-45d0-23e7-08d6e2770493
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2668
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9Il0ncjBkxnIQfmqWe6ejR36ln5tfBvRK6pqS2RtLY=;
 b=mI9ntsBSoqQf8MeTCpTXzjkLEuWqpgnBy6ZnVgLHy8E8llo/44NA7DgwsNwxG4wzpMRlVnmsV9dx5aUMchfEKpOw16yqj3JQIS6oAK0TdVAg4dUR/aUAnM0YbFZTxLgTC9wJ6Tf3KvGcIoEJuayRUQzKHiNe++8dDXPggYCWZ/g=
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIHBhc3N0aHJvdWdoLCBhZnRlciByZWJvb3RlZCB0aGUgVk0sIGRyaXZlciB3aWxsIGRvCmEg
YmFjbyByZXNldCBiZWZvcmUgZG9pbmcgb3RoZXIgZHJpdmVyIGluaXRpYWxpemF0aW9uIGR1cmlu
ZyBsb2FkaW5nCiBkcml2ZXIuIEZvciBkb2luZyB0aGUgYmFjbyByZXNldCwgaXQgd2lsbCBmaXJz
dApjaGVjayB0aGUgYmFjbyByZXNldCBjYXBhYmlsaXR5LiBTbyBmaXJzdCBuZWVkIHRvIHNldCB0
aGUKY2FwIGZyb20gdGhlIHZiaW9zIGluZm9ybWF0aW9uIG9yIGJhY28gcmVzZXQgd29uJ3QgYmUK
ZW5hYmxlZC4KClNpZ25lZC1vZmYtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgICAgICB8
IDI0ICsrKysrKysrKystLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMgICAgICAgICAgICAgICAgIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyB8ICA0ICsrKysKIC4uLi9hbWQvcG93ZXJwbGF5L2h3
bWdyL3ZlZ2ExMF9wcm9jZXNzcHB0YWJsZXMuYyAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysr
KwogLi4uL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX3Byb2Nlc3NwcHRhYmxlcy5oICAgfCAg
MSArCiA1IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCBiNmRlZDg0
Li43YThjMjIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
CkBAIC0xNTQxLDYgKzE1NDEsMTcgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNlX2lwX2Vhcmx5
X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJaWYgKGFtZGdwdV9zcmlvdl92Zihh
ZGV2KSkKIAkJYWRldi0+cG0ucHBfZmVhdHVyZSAmPSB+UFBfR0ZYT0ZGX01BU0s7CiAKKwkvKiBS
ZWFkIEJJT1MgKi8KKwlpZiAoIWFtZGdwdV9nZXRfYmlvcyhhZGV2KSkKKwkJcmV0dXJuIC1FSU5W
QUw7CisKKwlyID0gYW1kZ3B1X2F0b21iaW9zX2luaXQoYWRldik7CisJaWYgKHIpIHsKKwkJZGV2
X2VycihhZGV2LT5kZXYsICJhbWRncHVfYXRvbWJpb3NfaW5pdCBmYWlsZWRcbiIpOworCQlhbWRn
cHVfdmZfZXJyb3JfcHV0KGFkZXYsIEFNREdJTV9FUlJPUl9WRl9BVE9NQklPU19JTklUX0ZBSUws
IDAsIDApOworCQlyZXR1cm4gcjsKKwl9CisKIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+bnVtX2lw
X2Jsb2NrczsgaSsrKSB7CiAJCWlmICgoYW1kZ3B1X2lwX2Jsb2NrX21hc2sgJiAoMSA8PCBpKSkg
PT0gMCkgewogCQkJRFJNX0VSUk9SKCJkaXNhYmxlZCBpcCBibG9jazogJWQgPCVzPlxuIiwKQEAg
LTI1OTEsMTkgKzI2MDIsNiBAQCBpbnQgYW1kZ3B1X2RldmljZV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LAogCQlnb3RvIGZlbmNlX2RyaXZlcl9pbml0OwogCX0KIAotCS8qIFJlYWQg
QklPUyAqLwotCWlmICghYW1kZ3B1X2dldF9iaW9zKGFkZXYpKSB7Ci0JCXIgPSAtRUlOVkFMOwot
CQlnb3RvIGZhaWxlZDsKLQl9Ci0KLQlyID0gYW1kZ3B1X2F0b21iaW9zX2luaXQoYWRldik7Ci0J
aWYgKHIpIHsKLQkJZGV2X2VycihhZGV2LT5kZXYsICJhbWRncHVfYXRvbWJpb3NfaW5pdCBmYWls
ZWRcbiIpOwotCQlhbWRncHVfdmZfZXJyb3JfcHV0KGFkZXYsIEFNREdJTV9FUlJPUl9WRl9BVE9N
QklPU19JTklUX0ZBSUwsIDAsIDApOwotCQlnb3RvIGZhaWxlZDsKLQl9Ci0KIAkvKiBkZXRlY3Qg
aWYgd2UgYXJlIHdpdGggYW4gU1JJT1YgdmJpb3MgKi8KIAlhbWRncHVfZGV2aWNlX2RldGVjdF9z
cmlvdl9iaW9zKGFkZXYpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwppbmRleCA3OGJk
NGZjLi5kOWZkZDk1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2Mx
NS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTc2NCw3ICs3
NjQsOCBAQCBzdGF0aWMgYm9vbCBzb2MxNV9uZWVkX3Jlc2V0X29uX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiAJLyogSnVzdCByZXR1cm4gZmFsc2UgZm9yIHNvYzE1IEdQVXMuICBS
ZXNldCBkb2VzIG5vdCBzZWVtIHRvCiAJICogYmUgbmVjZXNzYXJ5LgogCSAqLwotCXJldHVybiBm
YWxzZTsKKwlpZiAoIWFtZGdwdV9wYXNzdGhyb3VnaChhZGV2KSkKKwkJcmV0dXJuIGZhbHNlOwog
CiAJaWYgKGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSkKIAkJcmV0dXJuIGZhbHNlOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYwppbmRl
eCBjZTZhZWI1Li4xZDliYjI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMTBfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMTBfaHdtZ3IuYwpAQCAtNTMxMSw4ICs1MzExLDEyIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcHBfaHdtZ3JfZnVuYyB2ZWdhMTBfaHdtZ3JfZnVuY3MgPSB7CiAKIGludCB2
ZWdhMTBfaHdtZ3JfaW5pdChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogeworCXN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2ID0gaHdtZ3ItPmFkZXY7CisKIAlod21nci0+aHdtZ3JfZnVuYyA9ICZ2
ZWdhMTBfaHdtZ3JfZnVuY3M7CiAJaHdtZ3ItPnBwdGFibGVfZnVuYyA9ICZ2ZWdhMTBfcHB0YWJs
ZV9mdW5jczsKKwlpZiAoYW1kZ3B1X3Bhc3N0aHJvdWdoKGFkZXYpKQorCQlyZXR1cm4gdmVnYTEw
X2JhY29fc2V0X2NhcChod21ncik7CiAKIAlyZXR1cm4gMDsKIH0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9wcm9jZXNzcHB0YWJsZXMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9wcm9jZXNzcHB0YWJs
ZXMuYwppbmRleCBiNjc2N2Q3Li44M2QyMmNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfcHJvY2Vzc3BwdGFibGVzLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX3Byb2Nlc3NwcHRhYmxlcy5jCkBA
IC0xMzcxLDMgKzEzNzEsMjcgQEAgaW50IHZlZ2ExMF9nZXRfcG93ZXJwbGF5X3RhYmxlX2VudHJ5
KHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAKIAlyZXR1cm4gcmVzdWx0OwogfQorCitpbnQgdmVn
YTEwX2JhY29fc2V0X2NhcChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQoreworCWludCByZXN1bHQg
PSAwOworCisJY29uc3QgQVRPTV9WZWdhMTBfUE9XRVJQTEFZVEFCTEUgKnBvd2VycGxheV90YWJs
ZTsKKworCXBvd2VycGxheV90YWJsZSA9IGdldF9wb3dlcnBsYXlfdGFibGUoaHdtZ3IpOworCisJ
UFBfQVNTRVJUX1dJVEhfQ09ERSgocG93ZXJwbGF5X3RhYmxlICE9IE5VTEwpLAorCQkiTWlzc2lu
ZyBQb3dlclBsYXkgVGFibGUhIiwgcmV0dXJuIC0xKTsKKworCXJlc3VsdCA9IGNoZWNrX3Bvd2Vy
cGxheV90YWJsZXMoaHdtZ3IsIHBvd2VycGxheV90YWJsZSk7CisKKwlQUF9BU1NFUlRfV0lUSF9D
T0RFKChyZXN1bHQgPT0gMCksCisJCQkgICAgImNoZWNrX3Bvd2VycGxheV90YWJsZXMgZmFpbGVk
IiwgcmV0dXJuIHJlc3VsdCk7CisKKwlzZXRfaHdfY2FwKAorCQkJaHdtZ3IsCisJCQkwICE9IChs
ZTMyX3RvX2NwdShwb3dlcnBsYXlfdGFibGUtPnVsUGxhdGZvcm1DYXBzKSAmIEFUT01fVkVHQTEw
X1BQX1BMQVRGT1JNX0NBUF9CQUNPKSwKKwkJCVBITV9QbGF0Zm9ybUNhcHNfQkFDTyk7CisJcmV0
dXJuIHJlc3VsdDsKK30KKwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaHdtZ3IvdmVnYTEwX3Byb2Nlc3NwcHRhYmxlcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaHdtZ3IvdmVnYTEwX3Byb2Nlc3NwcHRhYmxlcy5oCmluZGV4IGQ4M2VkMmEuLmRh
NWZiZWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Zl
Z2ExMF9wcm9jZXNzcHB0YWJsZXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9od21nci92ZWdhMTBfcHJvY2Vzc3BwdGFibGVzLmgKQEAgLTU5LDQgKzU5LDUgQEAgZXh0ZXJu
IGludCB2ZWdhMTBfZ2V0X251bWJlcl9vZl9wb3dlcnBsYXlfdGFibGVfZW50cmllcyhzdHJ1Y3Qg
cHBfaHdtZ3IgKmh3bWdyKTsKIGV4dGVybiBpbnQgdmVnYTEwX2dldF9wb3dlcnBsYXlfdGFibGVf
ZW50cnkoc3RydWN0IHBwX2h3bWdyICpod21nciwgdWludDMyX3QgZW50cnlfaW5kZXgsCiAJCXN0
cnVjdCBwcF9wb3dlcl9zdGF0ZSAqcG93ZXJfc3RhdGUsIGludCAoKmNhbGxfYmFja19mdW5jKShz
dHJ1Y3QgcHBfaHdtZ3IgKiwgdm9pZCAqLAogCQkJCXN0cnVjdCBwcF9wb3dlcl9zdGF0ZSAqLCB2
b2lkICosIHVpbnQzMl90KSk7CitleHRlcm4gaW50IHZlZ2ExMF9iYWNvX3NldF9jYXAoc3RydWN0
IHBwX2h3bWdyICpod21ncik7CiAjZW5kaWYKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
