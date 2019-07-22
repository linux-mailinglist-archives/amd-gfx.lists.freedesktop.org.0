Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E206F993
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 08:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4435189915;
	Mon, 22 Jul 2019 06:34:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800087.outbound.protection.outlook.com [40.107.80.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C31989915
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 06:34:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0zo1NCp2UuO5W8rE6icOfqfRswxVrix5mUqFM19XyFtlxYdOeR2mT/I3xseTx8fx4ZZ/naoU9Sue6VX/Z2eY06A0Qqv4jeeYd1pLXMbii69+myLqvohBiRbAZJkaJ+C82DwymNgq4SItw4itM6RL/DO1nCixwjSzGT/kpD48pYtHU6M2wdIKcjL66X8W9yUlZAQnKAArbGRg71mfyukSGQkGx+JRa45CK+NcxnNBQDUjCkSacn5tU7CUp0rApRZlaShIZ1SqxeRQEJBBLhB/pl6hbOf04D0BPeHqQg03wEciYoUQQYb9k4MFIkdMThEfXc55RzpOJOrPh4D/3kWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wr2t8v5GXKq9VAsugHuijlCQoO8u9yBovJBqRBAQkKg=;
 b=Mm9K5n5kH03UnBeYNVvN2Dbt9TzM/xx+llkfbyhT7Ez8445SU/P1LfwG7AS5Jv/w1Fe+kSjUCdmSILD6KbJadV9UmtFdEGc9ER0aQLHCeTNDsSocTVlm+6qRUQfRR53yZ/wQ7vqaWa60lHa79Thz+QQQR+ogYzxQ+6e/om0oQd5H+C/kj6c4V5agaPadyNbb1POgW1+y7g9sO9mAWpIK7qlJpPAljrV+VuH50sBmnJinb6YkTx/B7+uPXTauEu3R4Losv1CZt3q3w3jSVIVN7vKUkMVgXctd91rptqwgpITb7WDFkxk7Ac35qTEoqv67KSbORQTsmtHdxg5xDL6mjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN6PR12CA0033.namprd12.prod.outlook.com (2603:10b6:405:70::19)
 by DM5PR1201MB2491.namprd12.prod.outlook.com (2603:10b6:3:eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Mon, 22 Jul
 2019 06:34:41 +0000
Received: from DM3NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by BN6PR12CA0033.outlook.office365.com
 (2603:10b6:405:70::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.12 via Frontend
 Transport; Mon, 22 Jul 2019 06:34:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT036.mail.protection.outlook.com (10.152.82.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 22 Jul 2019 06:34:40 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 22 Jul 2019
 01:34:38 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: correct confusing naming for
 smu_feature_set_enabled
Date: Mon, 22 Jul 2019 14:34:26 +0800
Message-ID: <20190722063426.19597-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(376002)(346002)(396003)(136003)(2980300002)(428003)(199004)(189003)(1076003)(70206006)(70586007)(47776003)(53936002)(53416004)(48376002)(6666004)(356004)(2870700001)(2906002)(81166006)(86362001)(36756003)(6916009)(44832011)(426003)(26005)(8936002)(305945005)(486006)(81156014)(8676002)(50226002)(186003)(5660300002)(68736007)(4326008)(50466002)(2351001)(14444005)(126002)(336012)(51416003)(478600001)(2616005)(7696005)(476003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2491; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49212271-ea20-4d18-7c0d-08d70e6eacd4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB2491; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2491:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2491806889254E7665577E9FE4C40@DM5PR1201MB2491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: d8gOutVXuwLjzoawC9WTBYYOkpvWLEee0FjdW0rALdoBp1TIXuAIo2mwZi3VcpzVELqrvvZRcgHkitzlAIDgKMul75E9tSTN9huxtApOrZqxG4lovDYvEhZg+t0RlTR9ZRpEfzoAOSpXZZx+w430pWXmimlVg6r0hpvA7wSppsNtlhhbRlbh+LWTjXIWEkmyGKFQ5qTtak9nQIKXTDPqkF43xZgPTIvyi/fT/TZ8kivNHgN0/qNmvNEMusDPJBeRDzK9UZ5GUjPI0pKbhQ9afimhAqy9a6dl7tHGlRBGltQpjK+2dLS6bj9TronBuZqzlTxH92dYCPIRKpCS7VIIrx+wZU4gi9AU3zwfzgAy5Rn1jg26jD2Nk7y7LRjTiLTNjqibVeo4sStK2lstwhajMm/ur8oEuktVhS8tKe7uCIw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 06:34:40.1022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49212271-ea20-4d18-7c0d-08d70e6eacd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2491
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wr2t8v5GXKq9VAsugHuijlCQoO8u9yBovJBqRBAQkKg=;
 b=uMzDdccLYUOHEtJLQyBRL0wIwGELonLZ5Ii4M+0uGnUhdiLMnuSe/yf7G5McCXURCiFIEYqnbiZRH7zOTgnxPCSLX4ih42Yrgo6QP0Y/z3cnp68g6Nn28fuXX6tia2+QGhJeKd+FjPqUH3gq5/OXYjg5/gKDk8Bk5iYdJRFMDDg=
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

SXQgZG9lcyBtb3JlIHRoYW4gdXBkYXRpbmcgdGhlIGJpdG1hc2suIEluIGZhY3QgaXQgZW5hYmxl
cyBhbHNvIHRoZQpmZWF0dXJlLiBUaGF0J3MgY29uZnVzaW5nLiBBcyBmb3IgdGhpcywgYSBuZXcg
QVBJIGlzIGFkZGVkIGZvciB0aGUKZmVhdHVyZSBlbmFibGVtZW50IGpvYi4gQW5kIHNtdV9mZWF0
dXJlX3NldF9lbmFibGVkIGlzIHVwZGF0ZWQgdG8Kc2V0dGluZyB0aGUgYml0bWFzayBvbmx5KGFz
IHNtdV9mZWF0dXJlX3NldF9zdXBwb3J0ZWQpLgoKQ2hhbmdlLUlkOiBJNzU4ZTQ0NjFiZTM0YzBm
Y2JkZjE5NDQ4ZTM0MTgwYTUyNTE5MjZjNApTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4u
cXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYyAgICB8IDI5ICsrKysrKysrKysrKystLS0tLS0KIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL2FtZGdwdV9zbXUuaCAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVfdjExXzAuYyAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvdmVnYTIwX3BwdC5jICAgIHwgIDQgKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlv
bnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYwppbmRleCA0ZTE4ZjMzYTFiYWIuLjkyNjI4ODNkNDAzMSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtNTExLDI4ICs1MTEsMzkgQEAg
aW50IHNtdV9mZWF0dXJlX3NldF9lbmFibGVkKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVt
IHNtdV9mZWF0dXJlX21hc2sgbWFzaywKIHsKIAlzdHJ1Y3Qgc211X2ZlYXR1cmUgKmZlYXR1cmUg
PSAmc211LT5zbXVfZmVhdHVyZTsKIAlpbnQgZmVhdHVyZV9pZDsKLQlpbnQgcmV0ID0gMDsKIAog
CWZlYXR1cmVfaWQgPSBzbXVfZmVhdHVyZV9nZXRfaW5kZXgoc211LCBtYXNrKTsKIAlpZiAoZmVh
dHVyZV9pZCA8IDApCiAJCXJldHVybiAtRUlOVkFMOwogCi0JV0FSTl9PTihmZWF0dXJlX2lkID4g
ZmVhdHVyZS0+ZmVhdHVyZV9udW0pOwotCiAJbXV0ZXhfbG9jaygmZmVhdHVyZS0+bXV0ZXgpOwot
CXJldCA9IHNtdV9mZWF0dXJlX3VwZGF0ZV9lbmFibGVfc3RhdGUoc211LCBmZWF0dXJlX2lkLCBl
bmFibGUpOwotCWlmIChyZXQpCi0JCWdvdG8gZmFpbGVkOwogCiAJaWYgKGVuYWJsZSkKIAkJdGVz
dF9hbmRfc2V0X2JpdChmZWF0dXJlX2lkLCBmZWF0dXJlLT5lbmFibGVkKTsKIAllbHNlCiAJCXRl
c3RfYW5kX2NsZWFyX2JpdChmZWF0dXJlX2lkLCBmZWF0dXJlLT5lbmFibGVkKTsKIAotZmFpbGVk
OgogCW11dGV4X3VubG9jaygmZmVhdHVyZS0+bXV0ZXgpOwogCi0JcmV0dXJuIHJldDsKKwlyZXR1
cm4gMDsKK30KKworaW50IHNtdV9lbmFibGVfc21jX2ZlYXR1cmUoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsCisJCQkgICBlbnVtIHNtdV9mZWF0dXJlX21hc2sgbWFzaywKKwkJCSAgIGJvb2wgZW5h
YmxlKQoreworCWludCBmZWF0dXJlX2lkOworCWludCByZXQgPSAwOworCisJZmVhdHVyZV9pZCA9
IHNtdV9mZWF0dXJlX2dldF9pbmRleChzbXUsIG1hc2spOworCWlmIChmZWF0dXJlX2lkIDwgMCkK
KwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXQgPSBzbXVfZmVhdHVyZV91cGRhdGVfZW5hYmxlX3N0
YXRlKHNtdSwgZmVhdHVyZV9pZCwgZW5hYmxlKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0Owor
CisJcmV0dXJuIHNtdV9mZWF0dXJlX3NldF9lbmFibGVkKHNtdSwgbWFzaywgZW5hYmxlKTsKIH0K
IAogaW50IHNtdV9mZWF0dXJlX2lzX3N1cHBvcnRlZChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwg
ZW51bSBzbXVfZmVhdHVyZV9tYXNrIG1hc2spCkBAIC0xMTg2LDcgKzExOTcsNyBAQCBzdGF0aWMg
aW50IHNtdV9zdXNwZW5kKHZvaWQgKmhhbmRsZSkKIAkJcmV0dXJuIHJldDsKIAogCWlmIChhZGV2
LT5pbl9ncHVfcmVzZXQgJiYgYmFjb19mZWF0dXJlX2lzX2VuYWJsZWQpIHsKLQkJcmV0ID0gc211
X2ZlYXR1cmVfc2V0X2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9CQUNPX0JJVCwgdHJ1ZSk7CisJ
CXJldCA9IHNtdV9lbmFibGVfc21jX2ZlYXR1cmUoc211LCBTTVVfRkVBVFVSRV9CQUNPX0JJVCwg
dHJ1ZSk7CiAJCWlmIChyZXQpIHsKIAkJCXByX3dhcm4oInNldCBCQUNPIGZlYXR1cmUgZW5hYmxl
ZCBmYWlsZWQsIHJldHVybiAlZFxuIiwgcmV0KTsKIAkJCXJldHVybiByZXQ7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAppbmRleCBiNzAyYzllZTk3
NWYuLjI2N2I4Nzk3OTZmOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL2FtZGdwdV9zbXUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9p
bmMvYW1kZ3B1X3NtdS5oCkBAIC05NDYsNiArOTQ2LDggQEAgZXh0ZXJuIGludCBzbXVfZmVhdHVy
ZV9pc19lbmFibGVkKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCSAgZW51bSBzbXVfZmVh
dHVyZV9tYXNrIG1hc2spOwogZXh0ZXJuIGludCBzbXVfZmVhdHVyZV9zZXRfZW5hYmxlZChzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCQkgICBlbnVtIHNtdV9mZWF0dXJlX21hc2sgbWFzaywg
Ym9vbCBlbmFibGUpOworZXh0ZXJuIGludCBzbXVfZW5hYmxlX3NtY19mZWF0dXJlKHN0cnVjdCBz
bXVfY29udGV4dCAqc211LAorCQkJCSAgIGVudW0gc211X2ZlYXR1cmVfbWFzayBtYXNrLCBib29s
IGVuYWJsZSk7CiBleHRlcm4gaW50IHNtdV9mZWF0dXJlX2lzX3N1cHBvcnRlZChzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwKIAkJCQkgICAgZW51bSBzbXVfZmVhdHVyZV9tYXNrIG1hc2spOwogZXh0
ZXJuIGludCBzbXVfZmVhdHVyZV9zZXRfc3VwcG9ydGVkKHN0cnVjdCBzbXVfY29udGV4dCAqc211
LApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwppbmRleCBlM2ExNzg0
MDM1NDYuLjBmNTlkMjE3OGQwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvc211X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211
X3YxMV8wLmMKQEAgLTE0MTksNyArMTQxOSw3IEBAIHNtdV92MTFfMF9zbWNfZmFuX2NvbnRyb2wo
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGJvb2wgc3RhcnQpCiAJaWYgKHNtdV9mZWF0dXJlX2lz
X3N1cHBvcnRlZChzbXUsIFNNVV9GRUFUVVJFX0ZBTl9DT05UUk9MX0JJVCkpCiAJCXJldHVybiAw
OwogCi0JcmV0ID0gc211X2ZlYXR1cmVfc2V0X2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9GQU5f
Q09OVFJPTF9CSVQsIHN0YXJ0KTsKKwlyZXQgPSBzbXVfZW5hYmxlX3NtY19mZWF0dXJlKHNtdSwg
U01VX0ZFQVRVUkVfRkFOX0NPTlRST0xfQklULCBzdGFydCk7CiAJaWYgKHJldCkKIAkJcHJfZXJy
KCJbJXNdJXMgc21jIEZBTiBDT05UUk9MIGZlYXR1cmUgZmFpbGVkISIsCiAJCSAgICAgICBfX2Z1
bmNfXywgKHN0YXJ0ID8gIlN0YXJ0IiA6ICJTdG9wIikpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvdmVnYTIwX3BwdC5jCmluZGV4IDllYWQzNjE5Mjc4Ny4uNTM2ZmY4ODRkZGNhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC0yODQ1LDcg
KzI4NDUsNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF9kcG1fc2V0X3V2ZF9lbmFibGUoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsIGJvb2wgZW5hYmxlKQogCWlmIChlbmFibGUgPT0gc211X2ZlYXR1cmVf
aXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9VVkRfQklUKSkKIAkJcmV0dXJuIDA7CiAK
LQlyZXR1cm4gc211X2ZlYXR1cmVfc2V0X2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9EUE1fVVZE
X0JJVCwgZW5hYmxlKTsKKwlyZXR1cm4gc211X2VuYWJsZV9zbWNfZmVhdHVyZShzbXUsIFNNVV9G
RUFUVVJFX0RQTV9VVkRfQklULCBlbmFibGUpOwogfQogCiBzdGF0aWMgaW50IHZlZ2EyMF9kcG1f
c2V0X3ZjZV9lbmFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGJvb2wgZW5hYmxlKQpAQCAt
Mjg1Niw3ICsyODU2LDcgQEAgc3RhdGljIGludCB2ZWdhMjBfZHBtX3NldF92Y2VfZW5hYmxlKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LCBib29sIGVuYWJsZSkKIAlpZiAoZW5hYmxlID09IHNtdV9m
ZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9EUE1fVkNFX0JJVCkpCiAJCXJldHVy
biAwOwogCi0JcmV0dXJuIHNtdV9mZWF0dXJlX3NldF9lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVf
RFBNX1ZDRV9CSVQsIGVuYWJsZSk7CisJcmV0dXJuIHNtdV9lbmFibGVfc21jX2ZlYXR1cmUoc211
LCBTTVVfRkVBVFVSRV9EUE1fVkNFX0JJVCwgZW5hYmxlKTsKIH0KIAogc3RhdGljIGludCB2ZWdh
MjBfZ2V0X2VuYWJsZWRfc21jX2ZlYXR1cmVzKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAotLSAK
Mi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
