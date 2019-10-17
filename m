Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AC3DB72A
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DED46EA35;
	Thu, 17 Oct 2019 19:15:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720054.outbound.protection.outlook.com [40.107.72.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350306EA2E
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHE4D7L/GEaVsHSbdNDNDIVcnbfyFaRrM1uiLfphyVnBOMFp00rXMXhYlqYGn5QkMESw0+Ih2/I2IdM133Ia8EkHJ/cUGzXh9KpAftV4v8exHeOnpPhpozG/EROonuM0BUGZ3DXFgvw/Q9ZY7e/bvpA1wBBC7nC3vsw9XJ981FGIPI6CgQ8U/nVnZJEEMRAfQNi2OmV/mnQJJbrGoerTGRt/lMLMlolS5+MoEccFzvaY2xI56gkxSweq8EQxwWX64SpexuwGG9Bx20voAYBRtVHbaOZ+YvXQrHWaBfj/UsjE+VPhiuhduHxlH+rzykxm+Rhq2cJe5XFEMnCXuH9xdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdA9yEor/eIkZUHmzXuSEfBzddvK5IgnCBryNzMxkLU=;
 b=Pu472iLXPEK/5MV055fARAd+vmbsWank+sj9kLlb0Dm4ce5UPyxmMBDrZk6kKEiYPXBwpDY+osWhltf6Zh6tgmr+jaxzrcdGP6puAzOshL+SiHtFB/H/tepUetjYK87KDkpHIVUIpdqoX8GL/srO1kmG9YlsI0L26cbQUBuqnvv3GaBdMmKTvh8a/L1k8C9/u/a1ExbhZUOM8rL0O4r+EnfUqwPIkHIvI79/3c6o/vDtdveojfSVu1YMxjwsJb3r7+MFnepEn5xLbUn3FJsgAldJ7EfkxaVlDEIJ4q+75eNP9LEXhx3/ytzGPYGFgYNsTL7YZ+aCUTpaTiguLSJMkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0018.namprd12.prod.outlook.com (2603:10b6:403:2::28)
 by MN2PR12MB3726.namprd12.prod.outlook.com (2603:10b6:208:168::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:31 +0000
Received: from DM3NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by BN4PR12CA0018.outlook.office365.com
 (2603:10b6:403:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.18 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT041.mail.protection.outlook.com (10.152.83.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:30 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:29 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:29 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/37] drm/amd/display: Add unknown clk state.
Date: Thu, 17 Oct 2019 15:12:55 -0400
Message-ID: <20191017191329.11857-4-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(428003)(189003)(199004)(70586007)(50466002)(4326008)(5660300002)(186003)(2870700001)(1076003)(26005)(70206006)(8676002)(81156014)(86362001)(81166006)(51416003)(36756003)(76176011)(50226002)(8936002)(2876002)(316002)(305945005)(486006)(14444005)(6666004)(11346002)(446003)(54906003)(2906002)(2351001)(126002)(2616005)(48376002)(336012)(6916009)(426003)(356004)(47776003)(478600001)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3726; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73d3c611-ac2f-4cec-eced-08d75336607a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3726:
X-Microsoft-Antispam-PRVS: <MN2PR12MB37263277A7B6115EC6A030F5826D0@MN2PR12MB3726.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +R5jBw8OLB2dnorunVIe2VkZf+zP2p5ozqWUd9IzpcJumdjuTgxI7wtFpmdLM4dAFe7we3GvYTd68LDKLA0rMz/dtYBPTA6C1H+73WVq6bIlPMErm951mOoq5oQlCBsL6/D3r3TQmrVzeIgQHgk3o4XMGLkQCUFcDtMZWEQ76gOrq+En6kjb0r11+vaV6rc4d/BKPO53Y92SyfJGtW/l2aRcFEyEhs5WSrOlpeR+limDl3Sx75g9V3BKOLb1Lr41C1CkGTVC3TeCwSlNX1kbvCw8fUDtFX3LgTOMwiwx8Ic0U0U4vriqvoC+5IetzOrkCLEI8JGpcxyZBj2XRi5NlQ6iOR1XRqAem58t5GNf1FUDI94+i9M8jdQ4xo6xPXKgoy0sEORsTolS4pg+RtT7WU5VPHIqMAIY36KuyAXCAwc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:30.7362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d3c611-ac2f-4cec-eced-08d75336607a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3726
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdA9yEor/eIkZUHmzXuSEfBzddvK5IgnCBryNzMxkLU=;
 b=vgm/EMswqo00Oy3h2R3OlohE5T/EGXskC6xVwBl8WfcZJg0KTrGYNiugGjYF6371ghftuPIoFhP3wTRymqAPrJqAsUH9AoB5JbB35naxH2Ze3QLqWjOcNki4zVJlbdNiSWbmDwTG74Zcx94NdMiuyOhflmlcyeteHc2t3cJtAk0=
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
Cc: Leo Li <sunpeng.li@amd.com>, Yongqiang Sun <yongqiang.sun@amd.com>,
 Eric Yang <eric.yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgoKW1doeV0KU3lzdGVt
IGhhbmcgZHVyaW5nIFMwaTMgaWYgRFAgb25seSBjb25uZWN0ZWQgZHVlIHRvIGNsayBpcyBkaXNh
YmxlZCB3aGVuCmRvaW5nIGxpbmsgdHJhaW5pbmcuCkR1cmluZyBTMGkzLCBjbGsgaXMgZGlzYWJs
ZWQgd2hpbGUgdGhlIGNsayBzdGF0ZSBpcyB1cGRhdGVkIHdoZW4gaW5pX2h3CmNhbGxlZCwgYW5k
IGF0IHRoZSBtb21lbnQgY2xrIGlzIHN0aWxsIGRpc2FibGVkIHdoaWNoIGluZGljYXRpbmcgYSB3
cm9uZwpzdGF0ZSBmb3IgbmV4dCB0aW1lIHRyeWluZyB0byBlbmFibGUgY2xrLgoKW0hvd10KQWRk
IGFuIHVua25vd24gc3RhdGUgYW5kIGluaXRpYWxpemUgaXQgZHVyaW5nIGludF9odywgbWFrZSBz
dXJlIGVuYWJsZSBjbGsKY29tbWFuZCBiZSBzZW50IHRvIHNtdS4KClNpZ25lZC1vZmYtYnk6IFlv
bmdxaWFuZyBTdW4gPHlvbmdxaWFuZy5zdW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEVyaWMgWWFu
ZyA8ZXJpYy55YW5nMkBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5j
b20+Ci0tLQogLi4uL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21nci5jICAg
IHwgMTYgKysrKysrKystLS0tLS0tLQogLi4uL2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21ncl92
Ymlvc19zbXUuYyAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Yy5oICAgICAgICAgICAgICB8ICA1ICsrKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYwppbmRleCBiNjQ3ZTAzMjBl
NGIuLjYyMTJiNDA3Y2QwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYwpAQCAtMTE0LDIyICsxMTQsMjIg
QEAgdm9pZCBybl91cGRhdGVfY2xvY2tzKHN0cnVjdCBjbGtfbWdyICpjbGtfbWdyX2Jhc2UsCiAJ
ICovCiAJaWYgKHNhZmVfdG9fbG93ZXIpIHsKIAkJLyogY2hlY2sgdGhhdCB3ZSdyZSBub3QgYWxy
ZWFkeSBpbiBsb3dlciAqLwotCQlpZiAoY2xrX21ncl9iYXNlLT5jbGtzLnB3cl9zdGF0ZSAhPSBE
Q05fUFdSX1NUQVRFX09QVElNSVpFRCkgeworCQlpZiAoY2xrX21ncl9iYXNlLT5jbGtzLnB3cl9z
dGF0ZSAhPSBEQ05fUFdSX1NUQVRFX0xPV19QT1dFUikgewogCiAJCQlkaXNwbGF5X2NvdW50ID0g
cm5fZ2V0X2FjdGl2ZV9kaXNwbGF5X2NudF93YShkYywgY29udGV4dCk7CiAJCQkvKiBpZiB3ZSBj
YW4gZ28gbG93ZXIsIGdvIGxvd2VyICovCiAJCQlpZiAoZGlzcGxheV9jb3VudCA9PSAwKSB7Ci0J
CQkJcm5fdmJpb3Nfc211X3NldF9kY25fbG93X3Bvd2VyX3N0YXRlKGNsa19tZ3IsIERDTl9QV1Jf
U1RBVEVfT1BUSU1JWkVEKTsKKwkJCQlybl92Ymlvc19zbXVfc2V0X2Rjbl9sb3dfcG93ZXJfc3Rh
dGUoY2xrX21nciwgRENOX1BXUl9TVEFURV9MT1dfUE9XRVIpOwogCQkJCS8qIHVwZGF0ZSBwb3dl
ciBzdGF0ZSAqLwotCQkJCWNsa19tZ3JfYmFzZS0+Y2xrcy5wd3Jfc3RhdGUgPSBEQ05fUFdSX1NU
QVRFX09QVElNSVpFRDsKKwkJCQljbGtfbWdyX2Jhc2UtPmNsa3MucHdyX3N0YXRlID0gRENOX1BX
Ul9TVEFURV9MT1dfUE9XRVI7CiAJCQl9CiAJCX0KIAl9IGVsc2UgewotCQkvKiBjaGVjayB0aGF0
IHdlJ3JlIG5vdCBhbHJlYWR5IGluIHRoZSBub3JtYWwgc3RhdGUgKi8KLQkJaWYgKGNsa19tZ3Jf
YmFzZS0+Y2xrcy5wd3Jfc3RhdGUgIT0gRENOX1BXUl9TVEFURV9OT1JNQUwpIHsKLQkJCXJuX3Zi
aW9zX3NtdV9zZXRfZGNuX2xvd19wb3dlcl9zdGF0ZShjbGtfbWdyLCBEQ05fUFdSX1NUQVRFX05P
Uk1BTCk7CisJCS8qIGNoZWNrIHRoYXQgd2UncmUgbm90IGFscmVhZHkgaW4gRDAgKi8KKwkJaWYg
KGNsa19tZ3JfYmFzZS0+Y2xrcy5wd3Jfc3RhdGUgIT0gRENOX1BXUl9TVEFURV9NSVNTSU9OX01P
REUpIHsKKwkJCXJuX3ZiaW9zX3NtdV9zZXRfZGNuX2xvd19wb3dlcl9zdGF0ZShjbGtfbWdyLCBE
Q05fUFdSX1NUQVRFX01JU1NJT05fTU9ERSk7CiAJCQkvKiB1cGRhdGUgcG93ZXIgc3RhdGUgKi8K
LQkJCWNsa19tZ3JfYmFzZS0+Y2xrcy5wd3Jfc3RhdGUgPSBEQ05fUFdSX1NUQVRFX05PUk1BTDsK
KwkJCWNsa19tZ3JfYmFzZS0+Y2xrcy5wd3Jfc3RhdGUgPSBEQ05fUFdSX1NUQVRFX01JU1NJT05f
TU9ERTsKIAkJfQogCX0KIApAQCAtMzkzLDcgKzM5Myw3IEBAIHZvaWQgcm5faW5pdF9jbG9ja3Mo
c3RydWN0IGNsa19tZ3IgKmNsa19tZ3IpCiAJLy8gQXNzdW1wdGlvbiBpcyB0aGF0IGJvb3Qgc3Rh
dGUgYWx3YXlzIHN1cHBvcnRzIHBzdGF0ZQogCWNsa19tZ3ItPmNsa3MucF9zdGF0ZV9jaGFuZ2Vf
c3VwcG9ydCA9IHRydWU7CiAJY2xrX21nci0+Y2xrcy5wcmV2X3Bfc3RhdGVfY2hhbmdlX3N1cHBv
cnQgPSB0cnVlOwotCWNsa19tZ3ItPmNsa3MucHdyX3N0YXRlID0gRENOX1BXUl9TVEFURV9OT1JN
QUw7CisJY2xrX21nci0+Y2xrcy5wd3Jfc3RhdGUgPSBEQ05fUFdSX1NUQVRFX1VOS05PV047CiB9
CiAKIHN0YXRpYyBzdHJ1Y3QgY2xrX21ncl9mdW5jcyBkY24yMV9mdW5jcyA9IHsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19t
Z3JfdmJpb3Nfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9k
Y24yMS9ybl9jbGtfbWdyX3ZiaW9zX3NtdS5jCmluZGV4IDU2NDdmY2YxMDcxNy4uY2I3YzBlOGI3
ZTFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9k
Y24yMS9ybl9jbGtfbWdyX3ZiaW9zX3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMKQEAgLTE3MCw3ICsx
NzAsNyBAQCB2b2lkIHJuX3ZiaW9zX3NtdV9zZXRfZGNuX2xvd19wb3dlcl9zdGF0ZShzdHJ1Y3Qg
Y2xrX21ncl9pbnRlcm5hbCAqY2xrX21nciwgZW51bQogewogCWludCBkaXNwX2NvdW50OwogCi0J
aWYgKHN0YXRlID09IERDTl9QV1JfU1RBVEVfT1BUSU1JWkVEKQorCWlmIChzdGF0ZSA9PSBEQ05f
UFdSX1NUQVRFX0xPV19QT1dFUikKIAkJZGlzcF9jb3VudCA9IDA7CiAJZWxzZQogCQlkaXNwX2Nv
dW50ID0gMTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKaW5kZXggYjdlNzE4MWJhZDc4
Li4yZTFkMzQ4ODI2ODQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC0yNTcs
OCArMjU3LDkgQEAgZW51bSBkdG1fcHN0YXRlewogfTsKIAogZW51bSBkY25fcHdyX3N0YXRlIHsK
LQlEQ05fUFdSX1NUQVRFX09QVElNSVpFRCA9IDAsCi0JRENOX1BXUl9TVEFURV9OT1JNQUwgPSAx
CisJRENOX1BXUl9TVEFURV9VTktOT1dOID0gLTEsCisJRENOX1BXUl9TVEFURV9NSVNTSU9OX01P
REUgPSAwLAorCURDTl9QV1JfU1RBVEVfTE9XX1BPV0VSID0gMywKIH07CiAKIC8qCi0tIAoyLjIz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
