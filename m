Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA2C69DCE
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422E189CDE;
	Mon, 15 Jul 2019 21:21:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720048.outbound.protection.outlook.com [40.107.72.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15EE89CB2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRfP8EfD9mRKlFMlyh1pAWUKDfAgbD+zQtMCYtCcwqGf1udcB2AaF/a4/bHcwjQvCNy399rO2oxmr9BIKzFUWU75/qFOgEqM37236d7bjAb6cOwbpnvn88sCDQC8ERP1ZxGc9U9Ql7rVeRTTtPaVsOkCY7KHqxZ976R2+e+91Km/5UFLG+2kPWisR2i66lxfmhL4m+o8EaCOmc9N0h8KxqlhAP7VA8i0VaXjfufw8KSA3Lqx3Fjh5wGdyQ3LtXex/ylEBrndXU0a0olBs47+byMzk2Fj5mihucH6uXVEi18rjU5iPh8o9byz+H6/yZG3wytfLZ4Vpyfifel3vsu2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cF4WS53+6xTyGpKRVgx1lITpmYRMfyhwZ/6xIrEswI=;
 b=cCqQT6IuslO/e1jMOA8TkTtJWDudKnfENhgVDYaT007n+AVsZvum+DhQ8KpFQMaqFjhaPMWQmXvSSWsyqtnq70wCX3FyeQgyjsfDctU9StqebDfsSfnfCz6OzPphNrGkY+WIYaDWsVCOH+w+0SkCXIzrWoPQB/5/y/QRii3qoazz2sCLDRLJkE+DaKjbkmxE4UBVPOdB3IjibsnfJ8HccWAMk2UaDjcuhP8sIGXMzygmZbn953uU4l7RT6m4vmdWx/hjEYZ3OLt98peE6gt0EyM1vKWDSbHyGlEIBYYXztq84imQVgyOS4TBBa00xPnnygEUXHoEKsxtzO6VU0BPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0029.namprd12.prod.outlook.com (2603:10b6:208:a8::42)
 by BY5PR12MB3923.namprd12.prod.outlook.com (2603:10b6:a03:194::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:49 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by MN2PR12CA0029.outlook.office365.com
 (2603:10b6:208:a8::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:48 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:31 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 56/87] drm/amd/display: Add CM_BYPASS via debug option
Date: Mon, 15 Jul 2019 17:20:18 -0400
Message-ID: <20190715212049.4584-57-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(81156014)(81166006)(1076003)(50226002)(14444005)(478600001)(8936002)(6916009)(486006)(86362001)(70206006)(49486002)(2616005)(476003)(53936002)(426003)(336012)(356004)(6666004)(126002)(68736007)(316002)(305945005)(76176011)(36756003)(2906002)(47776003)(50466002)(4326008)(2351001)(51416003)(48376002)(11346002)(5660300002)(446003)(26005)(8676002)(54906003)(70586007)(2876002)(186003)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3923; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7743e0aa-2d37-4d47-7eaf-08d7096a7257
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BY5PR12MB3923; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB3923:
X-Microsoft-Antispam-PRVS: <BY5PR12MB39233469CF17A22776509B8282CF0@BY5PR12MB3923.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: guCAiLZEQvnUv5v9Qe1MDLBFPHxSm7yz/9JCNa1pJfi5ICv/AqE2WQFQqmcyFw7RtU3BShF154h1ye/jMEx/CEZRJ3yL7X2frVfXz/5D1EUuuRMECihj8vyEjcVFJR9WIK4uEx95oVfxqfbbFaKs/3LnVbpVRWjZ3B5qEEBl24wyQp8t2Tne+oaDMa0lKX4O78MDKhPT1/gRFYpPJkluwKwrmvhd7aNjGn1ckrpNoyz4nf4t2DQ2MDmWY1jhxDD94ng/Wr71/Dv/LIYbjFa4Lsv9zDaxt5W4RmaP88aSyhGFACxmAfYmeNBEZHxa+7yZP+Q+ITyraka+ZxeRy2CjPX6D4gBL4OzVgfW0qX7lk45dn8RfvcCfR/ujhQbcQx0Ih9Yi7RvAM7LXKFCLOzx5EusseMvd4sipCVqZUxTbC2o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:48.3963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7743e0aa-2d37-4d47-7eaf-08d7096a7257
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3923
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cF4WS53+6xTyGpKRVgx1lITpmYRMfyhwZ/6xIrEswI=;
 b=XG1q2v0wJ2RXwrh5QqMW/dfgDX96gaUtKcvgzbO5Q6eXYT+nb9ardSwckXYwoDffF4UEccC/+re50P6NzXa4ruv+Zx0bOjWqrcT07AqaeJJ9NZ8WpVFKI8MFd5bRoOvx4czn43NmkguUGbQ/iylrydFP8sty9xELu+0zbcmyPMI=
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUWluZ3FpbmcgWmh1byA8cWluZ3Fpbmcuemh1b0BhbWQuY29tPgoKW1doeV0KYnlwYXNz
IENNIGJsb2NrIGFuZCBNUEMgb2dhbSBmb3IgZGVidWcgb3IgdHJpYWdlIHVzZS4KCltIb3ddCmNy
ZWF0ZSBhIG5ldyBmbGFnIGNtX2J5cGFzc19tb2RlLCB3aGljaCB3aWxsIHNldCBib3RoIENNX0NP
TlRST0wKYW5kIE1QQ0NfT0dBTV9NT0RFIHRvIGJ5cGFzcyB3aGVuIHNldCB0byAxLgoKU2lnbmVk
LW9mZi1ieTogUWluZ3FpbmcgWmh1byA8cWluZ3Fpbmcuemh1b0BhbWQuY29tPgpSZXZpZXdlZC1i
eTogQ2hhcmxlbmUgTGl1IDxDaGFybGVuZS5MaXVAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8
c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Yy5oICAgICAgICAgICAgICAgICB8ICAzICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX2RwcF9jbS5jIHwgIDcgKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX21wYy5jICAgIHwgMTEgKysrKysrKysrKysKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvZHBwLmggICAgICAgICB8ICAxICsKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvbXBjLmggICAgICAgICB8ICAxICsK
IDUgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKaW5kZXggNDIxOTMyYWMzYjI2Li4yNzkwMDI5N2JkY2Yg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC0zNzksNiArMzc5LDkgQEAgc3Ry
dWN0IGRjX2RlYnVnX29wdGlvbnMgewogCSAqLwogCXVuc2lnbmVkIGludCBmb3JjZV9taW5fZGNm
Y2xrX21oejsKIAlib29sIGRpc2FibGVfdGltaW5nX3N5bmM7CisjaWYgZGVmaW5lZChDT05GSUdf
RFJNX0FNRF9EQ19EQ04yXzApCisJYm9vbCBjbV9pbl9ieXBhc3M7CisjZW5kaWYKIH07CiAKIHN0
cnVjdCBkY19kZWJ1Z19kYXRhIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9kcHBfY20uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9kcHBfY20uYwppbmRleCBlMjhiOGU3YmVkZjUuLjJkMTEyYzMxNjQy
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X2RwcF9jbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9kcHBfY20uYwpAQCAtNTIsNyArNTIsMTIgQEAgc3RhdGljIHZvaWQgZHBwMl9lbmFibGVfY21f
YmxvY2soCiB7CiAJc3RydWN0IGRjbjIwX2RwcCAqZHBwID0gVE9fRENOMjBfRFBQKGRwcF9iYXNl
KTsKIAotCVJFR19VUERBVEUoQ01fQ09OVFJPTCwgQ01fQllQQVNTLCAwKTsKKwl1bnNpZ25lZCBp
bnQgY21fYnlwYXNzX21vZGUgPSAwOworCS8vVGVtcCwgcHV0IENNIGluIGJ5cGFzcyBtb2RlCisJ
aWYgKGRwcF9iYXNlLT5jdHgtPmRjLT5kZWJ1Zy5jbV9pbl9ieXBhc3MpCisJCWNtX2J5cGFzc19t
b2RlID0gMTsKKworCVJFR19VUERBVEUoQ01fQ09OVFJPTCwgQ01fQllQQVNTLCBjbV9ieXBhc3Nf
bW9kZSk7CiB9CiAKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX21wYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX21wYy5jCmluZGV4IDI0MDc0OWU0Y2Y4My4uZjRkMzAwOGU1ZWZhIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfbXBjLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX21wYy5jCkBAIC0zNjgs
NiArMzY4LDExIEBAIHZvaWQgYXBwbHlfREVEQ04yMF8zMDVfd2EoCiB7CiAJc3RydWN0IGRjbjIw
X21wYyAqbXBjMjAgPSBUT19EQ04yMF9NUEMobXBjKTsKIAorCWlmIChtcGMtPmN0eC0+ZGMtPmRl
YnVnLmNtX2luX2J5cGFzcykgeworCQlSRUdfU0VUKE1QQ0NfT0dBTV9NT0RFW21wY2NfaWRdLCAw
LCBNUENDX09HQU1fTU9ERSwgMCk7CisJCXJldHVybjsKKwl9CisKIAlpZiAobXBjLT5jdHgtPmRj
LT53b3JrX2Fyb3VuZHMuZGVkY24yMF8zMDVfd2EgPT0gZmFsc2UpIHsKIAkJLypodyBmaXhlZCBp
biBuZXcgcmV2aWV3Ki8KIAkJcmV0dXJuOwpAQCAtMzkwLDEwICszOTUsMTYgQEAgdm9pZCBtcGMy
X3NldF9vdXRwdXRfZ2FtbWEoCiAJZW51bSBkY19sdXRfbW9kZSBuZXh0X21vZGU7CiAJc3RydWN0
IGRjbjIwX21wYyAqbXBjMjAgPSBUT19EQ04yMF9NUEMobXBjKTsKIAorCWlmIChtcGMtPmN0eC0+
ZGMtPmRlYnVnLmNtX2luX2J5cGFzcykgeworCQlSRUdfU0VUKE1QQ0NfT0dBTV9NT0RFW21wY2Nf
aWRdLCAwLCBNUENDX09HQU1fTU9ERSwgMCk7CisJCXJldHVybjsKKwl9CisKIAlpZiAocGFyYW1z
ID09IE5VTEwpIHsKIAkJUkVHX1NFVChNUENDX09HQU1fTU9ERVttcGNjX2lkXSwgMCwgTVBDQ19P
R0FNX01PREUsIDApOwogCQlyZXR1cm47CiAJfQorCiAJY3VycmVudF9tb2RlID0gbXBjMjBfZ2V0
X29nYW1fY3VycmVudChtcGMsIG1wY2NfaWQpOwogCWlmIChjdXJyZW50X21vZGUgPT0gTFVUX0JZ
UEFTUyB8fCBjdXJyZW50X21vZGUgPT0gTFVUX1JBTV9BKQogCQluZXh0X21vZGUgPSBMVVRfUkFN
X0I7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2Rw
cC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9kcHAuaAppbmRleCA2
MGM2NzFmY2YxODYuLjliNjlhMDZhYjQ2ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2luYy9ody9kcHAuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvaW5jL2h3L2RwcC5oCkBAIC00Miw2ICs0Miw3IEBAIHN0cnVjdCBkcHAgewogCiAjaWYg
ZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzApCiAJc3RydWN0IHB3bF9wYXJhbXMgc2hh
cGVyX3BhcmFtczsKKwlib29sIGNtX2J5cGFzc19tb2RlOwogI2VuZGlmCiB9OwogCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L21wYy5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9tcGMuaAppbmRleCA0NWI5NGUzMTljZDQu
LjlmMDAyODliZGE3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2luYy9ody9tcGMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3
L21wYy5oCkBAIC0xMjgsNiArMTI4LDcgQEAgc3RydWN0IG1wYyB7CiAJc3RydWN0IG1wY2MgbXBj
Y19hcnJheVtNQVhfTVBDQ107CiAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzAp
CiAJc3RydWN0IHB3bF9wYXJhbXMgYmxlbmRlcl9wYXJhbXM7CisJYm9vbCBjbV9ieXBhc3NfbW9k
ZTsKICNlbmRpZgogfTsKIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
