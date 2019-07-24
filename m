Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD93073144
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316DC6E5A0;
	Wed, 24 Jul 2019 14:11:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam01on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe42::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897B26E5A0
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:11:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVhymXD0IRKBo7kU3w45cJC01GWq9oF5D702Kp8zmfFXuRUyJAszWVbIqrO6trDsEIJaMXeoTE/Pu9ouzeM3r5faP+512dozcVcO6UoRQt8YEAVxsSffT418nVn/MAY4WTJ4hwnLrhxWn5i3SEEYdIqAJMRC6lj4py79W3GtKDCBlVgNzbndAotFuP0prf89vVNR7vK9WkbsZYMP63Ax+jqLfVRg4ADhYHFom3ifq40KeRPHGX2bnawBRTSQxiubeijz8pN19I4ZsfBY8LZKtEt3cbUTHfT0eZZNGNCpNbcqkvrF3J5hdb/qDb5FrA/ydXRxubq4idYnIEM0gtLTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwzLYnFya+rj9qcIPXGr3O1szZG2ve9Nl/K+wK2f4K0=;
 b=YFgeRflRRm96P/tFYh2HgWKqdB79PoaxWNhivtme3pHhprevO75Cki6er2Wi570qyZME2ewfOcu1Yih51nWBtrAVPLRv9bEQD7HVHeuTV9fESK+oHrRybxl9YLzF4CqYS2hH75Uj4uinvt++FYTpuY8dpGJjFAVp1Y8Eh2fsc+FY8Z0VlbIpXoUI3JWQ0ehgQ1nvSvkSUo+owQCT5FeMkAnIb2QzySiwlYpo7fF9IVRjriIPOqeLHYq/tmFXBuU4nr5hpB3t73XEZXyLq6U2tfrb0GwSYtl1E7R3sCfxwsAXYI1PpGxdxUIngyp1kFAPxkGVSF2o7PNh6ArGid3ICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0038.namprd12.prod.outlook.com (2603:10b6:301:2::24)
 by MWHPR1201MB2493.namprd12.prod.outlook.com (2603:10b6:300:ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Wed, 24 Jul
 2019 14:11:18 +0000
Received: from CO1NAM03FT056.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by MWHPR12CA0038.outlook.office365.com
 (2603:10b6:301:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.16 via Frontend
 Transport; Wed, 24 Jul 2019 14:11:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT056.mail.protection.outlook.com (10.152.81.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 24 Jul 2019 14:11:17 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 24 Jul 2019 09:11:16 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 2/3] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
Date: Wed, 24 Jul 2019 10:10:41 -0400
Message-ID: <1563977442-4809-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(428003)(189003)(199004)(2906002)(6666004)(356004)(86362001)(8936002)(26005)(7696005)(51416003)(6916009)(68736007)(76176011)(70586007)(70206006)(50226002)(48376002)(81156014)(81166006)(305945005)(8676002)(54906003)(53416004)(44832011)(16586007)(2351001)(316002)(486006)(186003)(6306002)(2616005)(476003)(36756003)(53936002)(47776003)(126002)(4326008)(11346002)(50466002)(5660300002)(446003)(478600001)(14444005)(966005)(336012)(426003)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB2493; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1529760b-80d7-444f-8f26-08d71040cbe1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB2493; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2493:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2493F881818936A0AC7D8CEFEAC60@MWHPR1201MB2493.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0108A997B2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: AngJXqCvWeo24ACoe6XOw5S2cw6RWbC7qqsNuDsVCyTBsHNKk+stpGMMsuu3fyp/iyGiTrmW3PgiMuXRVR3EJRyZ2U+Ql/v8vI2TkirbQyWFwLUWJDR69x/s5TGQT8Jq5THzUwrBWGQz/fQPkRegf8Bo+l6BxxKmqGJNFMLZ/yQ+tSv59yFitKOXLeZ+gkLuiDjBVYGF+93Jx8gTHAgf398k7vgxvowZ47H1j3Os+rNyA7UtS5Ax4jG3a3Wb/UG8YpcZ2XMk+Fl/5ZyvIU939bFghF1PCj7u9ESSzre4kWHwmOTc02p+5HrgUBDuPnCZQjxNxW+RDl80LBEUs4+gffZpHdH8WnOjYrdd/vyjC8e2ukjhjc/k+GCwZW6XKh3JVwL4kf7f1haI3goGEBYYR8M/d28S0nbajj0O14biPMY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2019 14:11:17.8681 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1529760b-80d7-444f-8f26-08d71040cbe1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2493
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwzLYnFya+rj9qcIPXGr3O1szZG2ve9Nl/K+wK2f4K0=;
 b=Gw/RrdMjxb5dGgA07YqE+1fx6FlH2kRJ9VNPKYGtjh8t9fpQwvoK53PT2S+2Yl/wzOHWVZH+Ld3exj2Rpq1ttOHnDagEyoeORswvLTVIjySWlRPJmdmLdEJlYjgSHT5PCbJpYfyu+Fjv8OGdkzOlnCsGtIbueaaZmrIZw9wzgtE=
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
cmV1c2VkCmluIG90aGVyIGZ1bmN0aW9ucy4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92
c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9vYmplY3QuYyB8IDYzICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIHwgIDIgKwogMiBm
aWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKaW5kZXggOTg5YjdiNS4uNjRjNDVi
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwpAQCAtNDEz
LDYgKzQxMyw0MSBAQCBzdGF0aWMgYm9vbCBhbWRncHVfYm9fdmFsaWRhdGVfc2l6ZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKIAlyZXR1cm4gZmFsc2U7CiB9CiAKK3ZvaWQgYW1kZ3B1X2Jv
X3ZhbGlkYXRlX3Vzd2ModTY0ICpib19mbGFncykKK3sKKwl1NjQgZmxhZ3MgPSAqYm9fZmxhZ3M7
CisKKyNpZmRlZiBDT05GSUdfWDg2XzMyCisJLyogWFhYOiBXcml0ZS1jb21iaW5lZCBDUFUgbWFw
cGluZ3Mgb2YgR1RUIHNlZW0gYnJva2VuIG9uIDMyLWJpdAorCSAqIFNlZSBodHRwczovL2J1Z3Mu
ZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD04NDYyNworCSAqLworCWZsYWdzICY9IH5B
TURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0M7CisjZWxpZiBkZWZpbmVkKENPTkZJR19YODYp
ICYmICFkZWZpbmVkKENPTkZJR19YODZfUEFUKQorCS8qIERvbid0IHRyeSB0byBlbmFibGUgd3Jp
dGUtY29tYmluaW5nIHdoZW4gaXQgY2FuJ3Qgd29yaywgb3IgdGhpbmdzCisJICogbWF5IGJlIHNs
b3cKKwkgKiBTZWUgaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
ODg3NTgKKwkgKi8KKworI2lmbmRlZiBDT05GSUdfQ09NUElMRV9URVNUCisjd2FybmluZyBQbGVh
c2UgZW5hYmxlIENPTkZJR19NVFJSIGFuZCBDT05GSUdfWDg2X1BBVCBmb3IgYmV0dGVyIHBlcmZv
cm1hbmNlIFwKKwkgdGhhbmtzIHRvIHdyaXRlLWNvbWJpbmluZworI2VuZGlmCisKKwlpZiAoZmxh
Z3MgJiBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MpCisJCURSTV9JTkZPX09OQ0UoIlBs
ZWFzZSBlbmFibGUgQ09ORklHX01UUlIgYW5kIENPTkZJR19YODZfUEFUIGZvciAiCisJCQkgICAg
ICAiYmV0dGVyIHBlcmZvcm1hbmNlIHRoYW5rcyB0byB3cml0ZS1jb21iaW5pbmdcbiIpOworCWZs
YWdzICY9IH5BTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0M7CisjZWxzZQorCS8qIEZvciBh
cmNoaXRlY3R1cmVzIHRoYXQgZG9uJ3Qgc3VwcG9ydCBXQyBtZW1vcnksCisJICogbWFzayBvdXQg
dGhlIFdDIGZsYWcgZnJvbSB0aGUgQk8KKwkgKi8KKwlpZiAoIWRybV9hcmNoX2Nhbl93Y19tZW1v
cnkoKSkKKwkJZmxhZ3MgJj0gfkFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQzsKKyNlbmRp
ZgorCisJKmJvX2ZsYWdzID0gZmxhZ3M7Cit9CisKIHN0YXRpYyBpbnQgYW1kZ3B1X2JvX2RvX2Ny
ZWF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1
X2JvX3BhcmFtICpicCwKIAkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2JvICoqYm9fcHRyKQpAQCAt
NDY2LDMzICs1MDEsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9ib19kb19jcmVhdGUoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAliby0+ZmxhZ3MgPSBicC0+ZmxhZ3M7CiAKLSNpZmRlZiBD
T05GSUdfWDg2XzMyCi0JLyogWFhYOiBXcml0ZS1jb21iaW5lZCBDUFUgbWFwcGluZ3Mgb2YgR1RU
IHNlZW0gYnJva2VuIG9uIDMyLWJpdAotCSAqIFNlZSBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Au
b3JnL3Nob3dfYnVnLmNnaT9pZD04NDYyNwotCSAqLwotCWJvLT5mbGFncyAmPSB+QU1ER1BVX0dF
TV9DUkVBVEVfQ1BVX0dUVF9VU1dDOwotI2VsaWYgZGVmaW5lZChDT05GSUdfWDg2KSAmJiAhZGVm
aW5lZChDT05GSUdfWDg2X1BBVCkKLQkvKiBEb24ndCB0cnkgdG8gZW5hYmxlIHdyaXRlLWNvbWJp
bmluZyB3aGVuIGl0IGNhbid0IHdvcmssIG9yIHRoaW5ncwotCSAqIG1heSBiZSBzbG93Ci0JICog
U2VlIGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTg4NzU4Ci0J
ICovCi0KLSNpZm5kZWYgQ09ORklHX0NPTVBJTEVfVEVTVAotI3dhcm5pbmcgUGxlYXNlIGVuYWJs
ZSBDT05GSUdfTVRSUiBhbmQgQ09ORklHX1g4Nl9QQVQgZm9yIGJldHRlciBwZXJmb3JtYW5jZSBc
Ci0JIHRoYW5rcyB0byB3cml0ZS1jb21iaW5pbmcKLSNlbmRpZgotCi0JaWYgKGJvLT5mbGFncyAm
IEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQykKLQkJRFJNX0lORk9fT05DRSgiUGxlYXNl
IGVuYWJsZSBDT05GSUdfTVRSUiBhbmQgQ09ORklHX1g4Nl9QQVQgZm9yICIKLQkJCSAgICAgICJi
ZXR0ZXIgcGVyZm9ybWFuY2UgdGhhbmtzIHRvIHdyaXRlLWNvbWJpbmluZ1xuIik7Ci0JYm8tPmZs
YWdzICY9IH5BTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0M7Ci0jZWxzZQotCS8qIEZvciBh
cmNoaXRlY3R1cmVzIHRoYXQgZG9uJ3Qgc3VwcG9ydCBXQyBtZW1vcnksCi0JICogbWFzayBvdXQg
dGhlIFdDIGZsYWcgZnJvbSB0aGUgQk8KLQkgKi8KLQlpZiAoIWRybV9hcmNoX2Nhbl93Y19tZW1v
cnkoKSkKLQkJYm8tPmZsYWdzICY9IH5BTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0M7Ci0j
ZW5kaWYKKwlhbWRncHVfYm9fdmFsaWRhdGVfdXN3YygmYm8tPmZsYWdzKTsKIAogCWJvLT50Ym8u
YmRldiA9ICZhZGV2LT5tbWFuLmJkZXY7CiAJaWYgKGJwLT5kb21haW4gJiAoQU1ER1BVX0dFTV9E
T01BSU5fR1dTIHwgQU1ER1BVX0dFTV9ET01BSU5fT0EgfApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X29iamVjdC5oCmluZGV4IGQ2MDU5M2MuLjA3ODMyZTggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgKQEAgLTMwOCw1ICszMDgsNyBAQCB2
b2lkIGFtZGdwdV9zYV9ib19kdW1wX2RlYnVnX2luZm8oc3RydWN0IGFtZGdwdV9zYV9tYW5hZ2Vy
ICpzYV9tYW5hZ2VyLAogCQkJCQkgc3RydWN0IHNlcV9maWxlICptKTsKICNlbmRpZgogCit2b2lk
IGFtZGdwdV9ib192YWxpZGF0ZV91c3djKHU2NCAqYm9fZmxhZ3MpOworCiAKICNlbmRpZgotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
