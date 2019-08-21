Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CD197692
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 12:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9078D6E14B;
	Wed, 21 Aug 2019 10:00:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680058.outbound.protection.outlook.com [40.107.68.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603FB6E143
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 10:00:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9fkm2ADIIGYEeAdByhyctU8uyEBQzX+uGPdxHGciDkVMaslgQnuHTuHyo69c5ZuErNMNY/ZRbMbZZG5sl+M9rjqOkUWhsb0ZQ14O4+pJueWmeLaH1O1wLnYljELHiNsbka+94bi42Uef6edJuBrsPwFLdTUXusSl2JPVKUdR7H/Nx3eeTWUDdES8Mx+LJ5T0pC7rMxYzKKxAx7gz/P6jxGUcFB2u3obHGNO7LQ/6Pw1jv8KBdcpAJ+92gNtDcA8h5sOzXIY/ypXBLFOIYGRGWbKP5HBhtU9XQo9BwdQSoEiZz4Cw3PQ9w9irHZe28obWN725FQX7A9FI1fPL2Aymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHai78mqqWpYkGCUf21WHi+UDxYU0UFDuvV+R7VzuVk=;
 b=ZLKfzk8JwSObP/e0315YvPJS5op4DMYfXFN+1jvEDH3mNJj6fht88/nZirfDZkHgOfMZ2Y668FhCSxmgrlBdgS/OKVvMn1fXRWBk30SwdlHV6QZkuL3eDa7tBRf54aP+il6ciNOGJVfbk9880SCrT4fFNrXj5GQka5av70lop+4OUPtgEjELi1169ErgtqT8LOXBqJXvJAcu3tSwmFLvY8irPdz5lrAtnA2vM39bNcZNBvxbF9TDrI7POpTrjFkGzjORx4fHqsJWZZ2DGtMwNNdY2FjsC2jDTHDgPzEKMABai19MGugEUALTW6lvPqD/Kf6w4Imdv8ewenr2YoaoFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0035.namprd12.prod.outlook.com (2603:10b6:5:1c0::48)
 by BN7PR12MB2706.namprd12.prod.outlook.com (2603:10b6:408:2a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 10:00:45 +0000
Received: from BY2NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by DM6PR12CA0035.outlook.office365.com
 (2603:10b6:5:1c0::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.23 via Frontend
 Transport; Wed, 21 Aug 2019 10:00:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT007.mail.protection.outlook.com (10.152.84.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 10:00:44 +0000
Received: from gigabyte-debug.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 21 Aug 2019
 05:00:42 -0500
From: Frank.Min <Frank.Min@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: disable agp for sriov
Date: Wed, 21 Aug 2019 18:00:35 +0800
Message-ID: <1566381635-6484-2-git-send-email-Frank.Min@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566381635-6484-1-git-send-email-Frank.Min@amd.com>
References: <1566381635-6484-1-git-send-email-Frank.Min@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(2980300002)(428003)(199004)(189003)(26005)(48376002)(50226002)(186003)(476003)(486006)(16586007)(316002)(5660300002)(478600001)(53936002)(126002)(50466002)(2351001)(53416004)(70206006)(6916009)(70586007)(76176011)(7696005)(51416003)(426003)(4326008)(446003)(2906002)(36756003)(47776003)(336012)(8676002)(2616005)(81166006)(356004)(81156014)(6666004)(8936002)(11346002)(86362001)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2706; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7489f873-af96-4a5e-0e9e-08d7261e6ea9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2706; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2706:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2706F825E5E16BC883D8F5FFE9AA0@BN7PR12MB2706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KcgEKTmx8tdzrU0K0HdNZjG06zC/Yhp+o/bYU1C+9wDcs1eVf1P9QUbrsQCSQgAswdlHEATgzVtmRJUkjSDQj1QCfaOOikjGTo3MjSlGYmPnEBr4XA+xITzxKJIiskoADqMOf9Yya9ndH8IA859AxCCPeW2rucvfEHOgjPpMlMyqwDfhBGkaVAqvf+oeQ8r9rks/2ddUCu9bQD36plgmN30T2uyYRM17kfHRxJPSp+xxXwb9srfV8er/hOwwupshO39GtXFnFIH5CW8GaqVjHTjE6fPyHsEpP9qCVFe/bTEnJufywSO08EZsQGlKcfWpUvMRoXI1eEfwXFBDPr3XPCX4euFwnijCZuDSKBr6uNkuMK8mTdm/T3PAQv2fiKKe6O7ynvE+QJ7spm8p51ZOQbR+zlyonNOB/x/Fzq76Byk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 10:00:44.2030 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7489f873-af96-4a5e-0e9e-08d7261e6ea9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2706
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHai78mqqWpYkGCUf21WHi+UDxYU0UFDuvV+R7VzuVk=;
 b=xBIx8wXelvYo4BXByGU4q3aqQVMAb4Ggyf48Hi1CMfhfDR7Ekvcf8cKefXLy3r1oVQf3UBfJaJk8IKLGfaen3R+5bXOzE1bMrl0ZoiCl/2N3pgqNiACKbpiknvRB8I31BEOBUA+r0hV0W6d/uaV2rcTTgQqsyeX/phCnPAc0eBY=
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
Cc: "Frank.Min" <Frank.Min@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2luY2UgYWdwIGlzIG5vdCB1c2VkIGZvciBzcmlvdiwganVzdCBkaXNhYmxlIGl0CgpDaGFuZ2Ut
SWQ6IEkzYWE5NzUzNDk5ZTJlNzRkOTgyYmI2MTEyMTRmOTRiZDU3YmRjZDllCi0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jIHwgOCArKysrKysrKwogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgIHwgMyArLS0KIDIgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9nbWMuYwppbmRleCAyNTBkOTIxLi42MDk0OTkwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dtYy5jCkBAIC0yMTgsNiArMjE4LDE0IEBAIHZvaWQgYW1kZ3B1X2dt
Y19hZ3BfbG9jYXRpb24oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVf
Z21jICptYykKIAljb25zdCB1aW50NjRfdCBzaXh0ZWVuX2diX21hc2sgPSB+KHNpeHRlZW5fZ2Ig
LSAxKTsKIAl1NjQgc2l6ZV9hZiwgc2l6ZV9iZjsKIAorCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRl
dikpIHsKKwkJbWMtPmFncF9zdGFydCA9IDB4ZmZmZmZmZmY7CisJCW1jLT5hZ3BfZW5kID0gMHgw
OworCQltYy0+YWdwX3NpemUgPSAwOworCisJCXJldHVybjsKKwl9CisKIAlpZiAobWMtPmZiX3N0
YXJ0ID4gbWMtPmdhcnRfc3RhcnQpIHsKIAkJc2l6ZV9iZiA9IChtYy0+ZmJfc3RhcnQgJiBzaXh0
ZWVuX2diX21hc2spIC0KIAkJCUFMSUdOKG1jLT5nYXJ0X2VuZCArIDEsIHNpeHRlZW5fZ2IpOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXggNjgzZjQ3ZC4uNmNlMjk3NyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC05MzAsOCArOTMwLDcgQEAg
c3RhdGljIHZvaWQgZ21jX3Y5XzBfdnJhbV9ndHRfbG9jYXRpb24oc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCiAJYmFzZSArPSBhZGV2LT5nbWMueGdtaS5waHlzaWNhbF9ub2RlX2lkICogYWRl
di0+Z21jLnhnbWkubm9kZV9zZWdtZW50X3NpemU7CiAJYW1kZ3B1X2dtY192cmFtX2xvY2F0aW9u
KGFkZXYsIG1jLCBiYXNlKTsKIAlhbWRncHVfZ21jX2dhcnRfbG9jYXRpb24oYWRldiwgbWMpOwot
CWlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQotCQlhbWRncHVfZ21jX2FncF9sb2NhdGlvbihh
ZGV2LCBtYyk7CisJYW1kZ3B1X2dtY19hZ3BfbG9jYXRpb24oYWRldiwgbWMpOwogCS8qIGJhc2Ug
b2Zmc2V0IG9mIHZyYW0gcGFnZXMgKi8KIAlhZGV2LT52bV9tYW5hZ2VyLnZyYW1fYmFzZV9vZmZz
ZXQgPSBnZnhodWJfdjFfMF9nZXRfbWNfZmJfb2Zmc2V0KGFkZXYpOwogCi0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
