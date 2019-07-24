Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E81732B7
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 17:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6FC6E5CE;
	Wed, 24 Jul 2019 15:28:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790041.outbound.protection.outlook.com [40.107.79.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C5B6E5CE
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 15:28:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JB9YvSIH3nkUxJI1VyfMwnwo1p2wVPhhWfjJOXlRtQxBJPQ4kZKwUTiNDE2/OoNtZAvxjATwgkCtRaq4zwDygLMtK3OgjGvx96LFLtJK/34JRB0NsvZeW22CPhxmQOWCEBQaA5Ok+fKfB++SlRu+BO+1sib8/praoy36i3f0iJQLHsmaXYw/2m979gS6tsLSMo/+aR0igl2uycGGuqhPHMpuS0kOSjHAZMaLU/oqTc4xNMAc2OxW5J/LFinJpon0Z30FWHEarEzi04L94RArJE3tXkLXuSFHBmNKWpcDU4jEGSd49xdd2aSOtyLTJVWx3KkC7HkyOvHUcXSLAEeIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81CJpnBH6fxzQMeQpQVSRuNCD9FDM2XLmyMjOtabq8E=;
 b=irMXwsjx9tQOK/A0RVRwxrP2m8z7W7ocs6q8WbMZeWUKbCf24PH0RwJ5zOThWEYGzdAFKYWBFngYftXZGNJdvQ9O0FPXBFsbiSrvaut4ujLCSMs/zL6pYm7dqgVpNIBRvNqt9LzGZVi390w7EK448629Y/Ky5CFj9fGGMNbAEmKFlPe+8kKvPZvRyodKXp2l+Wcz3G7BNQ8g+0nAeQYm8bXebADzDZmcxr7Gk1lBdRfhn2DmiP3t2XIldnAPCSPJwzBIiJxTnxbl+SvuAKRPkox1mNcr8ERlmToJeIlus1xpFh5VQ2UfQ5NX9gW2RICiQFgxR6VWYJTbK7zYKgS93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN6PR1201CA0001.namprd12.prod.outlook.com
 (2603:10b6:405:4c::11) by DM5PR12MB1578.namprd12.prod.outlook.com
 (2603:10b6:4:e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.15; Wed, 24 Jul
 2019 15:28:24 +0000
Received: from DM3NAM03FT056.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by BN6PR1201CA0001.outlook.office365.com
 (2603:10b6:405:4c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Wed, 24 Jul 2019 15:28:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT056.mail.protection.outlook.com (10.152.83.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 24 Jul 2019 15:28:23 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 24 Jul 2019 10:28:21 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 2/4] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
Date: Wed, 24 Jul 2019 11:27:44 -0400
Message-ID: <1563982066-21793-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563982066-21793-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1563982066-21793-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(2906002)(6666004)(356004)(86362001)(8936002)(26005)(7696005)(51416003)(6916009)(68736007)(76176011)(70206006)(70586007)(50226002)(48376002)(81156014)(81166006)(305945005)(8676002)(54906003)(486006)(44832011)(16586007)(2351001)(316002)(6306002)(53416004)(186003)(2616005)(476003)(36756003)(53936002)(47776003)(126002)(4326008)(11346002)(50466002)(5660300002)(446003)(478600001)(14444005)(966005)(336012)(426003)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1578; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf819586-d483-43cc-ed89-08d7104b9102
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1578; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1578:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <DM5PR12MB157897D0FA210C73D4A40F4EEAC60@DM5PR12MB1578.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0108A997B2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: W9/dHzzJThuY2qmwLxSb7e2+oeTBeswPlAErLJDE5Hw2MXB7L+OhlwxsJi+D2yYqdydqEP582KeoxpmZlChEXdLMAnJdlkeV3ixR2BdLbkOdQ+g81NbNX5liRo+nCNxy3pFgGbdQ+TsBSKG9nBDGdIPNafcOutoZCestJfJ0HNgdUkxF3i/ZADMsen2vAI0GKqU3VZrRb7sPgq+uBToBH3CtsrjUiceL8EFDQTHnVXh37yJppObLyDxMXICxGl7CSu3uB6RHxc4Qx1iVT5iyv6Y+7mgzMTZ2wbsd3VxC3u+owoXXjV4tnZ73Vnk3gnZ1Bw+2MRM+070fIrqVFi70ZcEiGxEq0DA2RxKkhdvXhfsedGU5z5Dy+LS+vBEeWkmLE6LXh50Hix+1CKe4WPorHKzteXw0FHN9osyY/vOMdTk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2019 15:28:23.5742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf819586-d483-43cc-ed89-08d7104b9102
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81CJpnBH6fxzQMeQpQVSRuNCD9FDM2XLmyMjOtabq8E=;
 b=wgfKjYyeCg4lLLE1doedxUt1AfiR2/b7rhpmLZjjL1Zzq9q3/VzBihCEltJKT4eD32RE34S8DG5odDaMV1SS85GOei7eS+crLyXznT6ys4fRJOmPXiBab6k2pZeRr8YP2BLJi/qxeaZzDUL0uI5HuOA03FA4/l/XYD351fclldk=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 hersenxs.wu@amd.com, Christian.Koenig@amd.com, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TW92ZSB0aGUgbG9naWMgdG8gY2xlYXIgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIGlu
CmFtZGdwdV9ib19kb19jcmVhdGUgaW50byBzdGFuZGFsb25lIGhlbHBlciBzbyBpdCBjYW4gYmUg
cmV1c2VkCmluIG90aGVyIGZ1bmN0aW9ucy4KCnY0OgpTd2l0Y2ggdG8gcmV0dXJuIGJvb2wuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgfCA2MSAr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuaCB8ICAyICsKIDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygr
KSwgMjYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29i
amVjdC5jCmluZGV4IDk4OWI3YjUuLmRhZmRiNjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfb2JqZWN0LmMKQEAgLTQxMyw2ICs0MTMsNDAgQEAgc3RhdGljIGJvb2wgYW1k
Z3B1X2JvX3ZhbGlkYXRlX3NpemUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJcmV0dXJu
IGZhbHNlOwogfQogCitib29sIGFtZGdwdV9ib19zdXBwb3J0X3Vzd2ModTY0IGJvX2ZsYWdzKQor
eworCisjaWZkZWYgQ09ORklHX1g4Nl8zMgorCS8qIFhYWDogV3JpdGUtY29tYmluZWQgQ1BVIG1h
cHBpbmdzIG9mIEdUVCBzZWVtIGJyb2tlbiBvbiAzMi1iaXQKKwkgKiBTZWUgaHR0cHM6Ly9idWdz
LmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9ODQ2MjcKKwkgKi8KKwlyZXR1cm4gZmFs
c2UKKyNlbGlmIGRlZmluZWQoQ09ORklHX1g4NikgJiYgIWRlZmluZWQoQ09ORklHX1g4Nl9QQVQp
CisJLyogRG9uJ3QgdHJ5IHRvIGVuYWJsZSB3cml0ZS1jb21iaW5pbmcgd2hlbiBpdCBjYW4ndCB3
b3JrLCBvciB0aGluZ3MKKwkgKiBtYXkgYmUgc2xvdworCSAqIFNlZSBodHRwczovL2J1Z3MuZnJl
ZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD04ODc1OAorCSAqLworCisjaWZuZGVmIENPTkZJ
R19DT01QSUxFX1RFU1QKKyN3YXJuaW5nIFBsZWFzZSBlbmFibGUgQ09ORklHX01UUlIgYW5kIENP
TkZJR19YODZfUEFUIGZvciBiZXR0ZXIgcGVyZm9ybWFuY2UgXAorCSB0aGFua3MgdG8gd3JpdGUt
Y29tYmluaW5nCisjZW5kaWYKKworCWlmIChib19mbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX0NQ
VV9HVFRfVVNXQykKKwkJRFJNX0lORk9fT05DRSgiUGxlYXNlIGVuYWJsZSBDT05GSUdfTVRSUiBh
bmQgQ09ORklHX1g4Nl9QQVQgZm9yICIKKwkJCSAgICAgICJiZXR0ZXIgcGVyZm9ybWFuY2UgdGhh
bmtzIHRvIHdyaXRlLWNvbWJpbmluZ1xuIik7CisJcmV0dXJuIGZhbHNlOworI2Vsc2UKKwkvKiBG
b3IgYXJjaGl0ZWN0dXJlcyB0aGF0IGRvbid0IHN1cHBvcnQgV0MgbWVtb3J5LAorCSAqIG1hc2sg
b3V0IHRoZSBXQyBmbGFnIGZyb20gdGhlIEJPCisJICovCisJaWYgKCFkcm1fYXJjaF9jYW5fd2Nf
bWVtb3J5KCkpCisJCXJldHVybiBmYWxzZTsKKworCXJldHVybiB0cnVlOworI2VuZGlmCit9CisK
IHN0YXRpYyBpbnQgYW1kZ3B1X2JvX2RvX2NyZWF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKIAkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2JvX3BhcmFtICpicCwKIAkJCSAgICAgICBzdHJ1
Y3QgYW1kZ3B1X2JvICoqYm9fcHRyKQpAQCAtNDY2LDMzICs1MDAsOCBAQCBzdGF0aWMgaW50IGFt
ZGdwdV9ib19kb19jcmVhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAliby0+Zmxh
Z3MgPSBicC0+ZmxhZ3M7CiAKLSNpZmRlZiBDT05GSUdfWDg2XzMyCi0JLyogWFhYOiBXcml0ZS1j
b21iaW5lZCBDUFUgbWFwcGluZ3Mgb2YgR1RUIHNlZW0gYnJva2VuIG9uIDMyLWJpdAotCSAqIFNl
ZSBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD04NDYyNwotCSAq
LwotCWJvLT5mbGFncyAmPSB+QU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDOwotI2VsaWYg
ZGVmaW5lZChDT05GSUdfWDg2KSAmJiAhZGVmaW5lZChDT05GSUdfWDg2X1BBVCkKLQkvKiBEb24n
dCB0cnkgdG8gZW5hYmxlIHdyaXRlLWNvbWJpbmluZyB3aGVuIGl0IGNhbid0IHdvcmssIG9yIHRo
aW5ncwotCSAqIG1heSBiZSBzbG93Ci0JICogU2VlIGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5v
cmcvc2hvd19idWcuY2dpP2lkPTg4NzU4Ci0JICovCi0KLSNpZm5kZWYgQ09ORklHX0NPTVBJTEVf
VEVTVAotI3dhcm5pbmcgUGxlYXNlIGVuYWJsZSBDT05GSUdfTVRSUiBhbmQgQ09ORklHX1g4Nl9Q
QVQgZm9yIGJldHRlciBwZXJmb3JtYW5jZSBcCi0JIHRoYW5rcyB0byB3cml0ZS1jb21iaW5pbmcK
LSNlbmRpZgotCi0JaWYgKGJvLT5mbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNX
QykKLQkJRFJNX0lORk9fT05DRSgiUGxlYXNlIGVuYWJsZSBDT05GSUdfTVRSUiBhbmQgQ09ORklH
X1g4Nl9QQVQgZm9yICIKLQkJCSAgICAgICJiZXR0ZXIgcGVyZm9ybWFuY2UgdGhhbmtzIHRvIHdy
aXRlLWNvbWJpbmluZ1xuIik7Ci0JYm8tPmZsYWdzICY9IH5BTURHUFVfR0VNX0NSRUFURV9DUFVf
R1RUX1VTV0M7Ci0jZWxzZQotCS8qIEZvciBhcmNoaXRlY3R1cmVzIHRoYXQgZG9uJ3Qgc3VwcG9y
dCBXQyBtZW1vcnksCi0JICogbWFzayBvdXQgdGhlIFdDIGZsYWcgZnJvbSB0aGUgQk8KLQkgKi8K
LQlpZiAoIWRybV9hcmNoX2Nhbl93Y19tZW1vcnkoKSkKKwlpZiAoYW1kZ3B1X2JvX3N1cHBvcnRf
dXN3Yyhiby0+ZmxhZ3MpKQogCQliby0+ZmxhZ3MgJj0gfkFNREdQVV9HRU1fQ1JFQVRFX0NQVV9H
VFRfVVNXQzsKLSNlbmRpZgogCiAJYm8tPnRiby5iZGV2ID0gJmFkZXYtPm1tYW4uYmRldjsKIAlp
ZiAoYnAtPmRvbWFpbiAmIChBTURHUFVfR0VNX0RPTUFJTl9HV1MgfCBBTURHUFVfR0VNX0RPTUFJ
Tl9PQSB8CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2Jq
ZWN0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgKaW5kZXgg
ZDYwNTkzYy4uZGM0NGNmMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X29iamVjdC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuaApAQCAtMzA4LDUgKzMwOCw3IEBAIHZvaWQgYW1kZ3B1X3NhX2JvX2R1bXBfZGVidWdf
aW5mbyhzdHJ1Y3QgYW1kZ3B1X3NhX21hbmFnZXIgKnNhX21hbmFnZXIsCiAJCQkJCSBzdHJ1Y3Qg
c2VxX2ZpbGUgKm0pOwogI2VuZGlmCiAKK2Jvb2wgYW1kZ3B1X2JvX3N1cHBvcnRfdXN3Yyh1NjQg
Ym9fZmxhZ3MpOworCiAKICNlbmRpZgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
