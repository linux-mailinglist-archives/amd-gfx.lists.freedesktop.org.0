Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EFC69DED
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF6489D9B;
	Mon, 15 Jul 2019 21:22:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710078.outbound.protection.outlook.com [40.107.71.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A800489D49
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGYf4GRNzTUsyXuMcrndO8WgGTTQDDOwvdpttsw+MkE3oQFLCNg0gRb5LSiXmgwlZs/Dw6otEeSha4a/EpEFg6bPWmj8hkwVZvwFRswKZBTZzMH6LU9AlqDIOkJulFb7N8fBU7bvomeTrvBPMq+NtC3hIir1HYHUXApQDMtumMphe+eVRDdTtA0g+w4V3YqlThD3s07GcEyKmpvhp89VBqekEcY/SI1UBHhz3C4o65LOn7niudFWrudztLAyw85A0E235NtinX6Oa2cMoRJcmp++JyyYYVCSU10sYeQxjAioz/EhNMVtC2N4cd3LTCjSNkL45fhIbQstFfthvcjYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSJ1LWqs9TLnK94gZ8ka5986jzgaNVJ0x298oeqpUZA=;
 b=M/Kwcr3Z7KIDKzqZu7tPeeFOpk2epmdKDwOfeeora1LP77dtxnShnV760oIXUqI0rxTNGGNw7g4Vy3bHfztHGr2DSIK5dYhs500uFJQJYbCjQscKiDZwif+FeyrQNmzwQ+29e7dMVxHPakV8fFw13PBFWuoVbvcUIbbgrcPKfn/pL+CqRFCXnlnPo5x4ZisEPqi+oPsk7YGfpPcIMUcRDB/HTKH+jyvxCnXn0r7coBgPuv0dUpIfNrGDDEHqEl68w88Ch9a9OteZi4lmEEpUSFJsE+U0hHiuqbtxSJDSqzw/uw6IG3OB89wdDn//KxtqXoHBqOIoUNdmpGBqseIuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0103.namprd12.prod.outlook.com (2603:10b6:0:55::23) by
 MN2PR12MB3933.namprd12.prod.outlook.com (2603:10b6:208:16a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:22:05 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by DM3PR12CA0103.outlook.office365.com
 (2603:10b6:0:55::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:22:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:22:04 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:42 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 83/87] drm/amd/display: avoid power gate domains that doesn't
 exist
Date: Mon, 15 Jul 2019 17:20:45 -0400
Message-ID: <20190715212049.4584-84-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(428003)(189003)(199004)(476003)(8676002)(305945005)(446003)(486006)(126002)(1076003)(54906003)(48376002)(11346002)(47776003)(49486002)(186003)(2616005)(356004)(50466002)(6916009)(86362001)(14444005)(76176011)(5660300002)(26005)(70206006)(68736007)(426003)(2351001)(70586007)(478600001)(53936002)(50226002)(8936002)(2876002)(51416003)(316002)(81166006)(81156014)(2906002)(36756003)(4326008)(336012)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3933; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d67b630f-a45a-4a31-52ca-08d7096a7c0e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3933; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3933:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39334B76C7A425EA8AEC7F0182CF0@MN2PR12MB3933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8uBdUKP6pLKRiVlJcL+0TvYej+VZr7lS4rA3flIzgRBLqBwxHJKylzwjMcPNfLz9sVnShOWm8DKUTvS1QvhHEkqCxmmTYf2eQYDAluD2IFJFys4y0gTh5wAudzgGuyf6IryLRTAmn+SSpSowRUT2/jA2x6ZI8KQnFsT8UM704IAeSmNlqPiuudQtAd28LEyMH2bymLnnWeJ2e2ZIERwwHq5UHzu79vEIlXGJ/MATAurD68IpzArP198EgIvRbvub9BaQFyoLdlk4tE8cxLEC20b38iSeSzKBK3mLeGyoov7pYVpcXYbetAsHqYbBg6v7SgqmN45lN6bFdxhwyClauYcj1bJSTDinCQAgp7G+YnGhLlcBov4x7aIrsNmATWGt45/8ikzEY8koiOhAlc4tOgKQDffSB2Ii5nlkM20JT+M=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:22:04.6759 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d67b630f-a45a-4a31-52ca-08d7096a7c0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSJ1LWqs9TLnK94gZ8ka5986jzgaNVJ0x298oeqpUZA=;
 b=HSl9iwfDFAHsYlu/SwvCJueSgBda81m8n/HFSn3MXyI7Ru1PbGF5Ps6ppG9PFVhmOCco8/eX/KJJflwIOKK3MHgc5Q3YBzSTlKVhU4dF2/T7i58ohvxUF6WpBx5EU00aCFFLz95uQFKN0ILqLPnqfYBzd4xdHlgcVYj7IJJkkbM=
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
 Tony Cheng <tony.cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVG9ueSBDaGVuZyA8dG9ueS5jaGVuZ0BhbWQuY29tPgoKQ2hhbmdlLUlkOiBJNzgwMDY4
NWNjZWJiZjhmYWEyYjcxODVjNTAxYWMwYWQ3OGUxM2U0OApTaWduZWQtb2ZmLWJ5OiBUb255IENo
ZW5nIDx0b255LmNoZW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBZb25ncWlhbmcgU3VuIDx5b25n
cWlhbmcuc3VuQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4K
LS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2h3c2VxLmggICAgfCAgNCAr
Ky0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgICAgfCAyNCAr
KysrKysrKysrKystLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEx
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX2h3c2VxLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2Rj
ZV9od3NlcS5oCmluZGV4IDNhNDlmMWZmYjVkZC4uMjQ1YjgwYjkyNjgxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9od3NlcS5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2h3c2VxLmgKQEAgLTIyNyw4ICsyMjcs
OCBAQAogCVNSKERPTUFJTjdfUEdfQ09ORklHKSwgXAogCVNSKERPTUFJTjhfUEdfQ09ORklHKSwg
XAogCVNSKERPTUFJTjlfUEdfQ09ORklHKSwgXAotCVNSKERPTUFJTjEwX1BHX0NPTkZJRyksIFwK
LQlTUihET01BSU4xMV9QR19DT05GSUcpLCBcCisvKglTUihET01BSU4xMF9QR19DT05GSUcpLCBO
YXZpMXggSFVCUDUgbm90IHBvd2VyZ2F0ZS1hYmxlKi9cCisvKglTUihET01BSU4xMV9QR19DT05G
SUcpLCBOYXZpMXggRFBQNSBpcyBub3QgcG93ZXJnYXRlLWFibGUgKi9cCiAJU1IoRE9NQUlOMTZf
UEdfQ09ORklHKSwgXAogCVNSKERPTUFJTjE3X1BHX0NPTkZJRyksIFwKIAlTUihET01BSU4xOF9Q
R19DT05GSUcpLCBcCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfaHdzZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9od3NlcS5jCmluZGV4IGI2MTc3NGQyZThiMi4uNjc2NGFkODQ1Y2Q0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwpA
QCAtOTQsMjUgKzk0LDMxIEBAIHN0YXRpYyB2b2lkIGVuYWJsZV9wb3dlcl9nYXRpbmdfcGxhbmUo
CiAJUkVHX1VQREFURShET01BSU4yX1BHX0NPTkZJRywgRE9NQUlOMl9QT1dFUl9GT1JDRU9OLCBm
b3JjZV9vbik7CiAJUkVHX1VQREFURShET01BSU40X1BHX0NPTkZJRywgRE9NQUlONF9QT1dFUl9G
T1JDRU9OLCBmb3JjZV9vbik7CiAJUkVHX1VQREFURShET01BSU42X1BHX0NPTkZJRywgRE9NQUlO
Nl9QT1dFUl9GT1JDRU9OLCBmb3JjZV9vbik7Ci0JUkVHX1VQREFURShET01BSU44X1BHX0NPTkZJ
RywgRE9NQUlOOF9QT1dFUl9GT1JDRU9OLCBmb3JjZV9vbik7Ci0JLypEbyBub3QgcG93ZXIgZ2F0
ZSBEQ0hVQjUsIHNob3VsZCBiZSBsZWZ0IGF0IEhXIGRlZmF1bHQsIHBvd2VyIG9uIHBlcm1hbmVu
dGx5Ki8KLQkvKlJFR19VUERBVEUoRE9NQUlOMTBfUEdfQ09ORklHLCBET01BSU4xMF9QT1dFUl9G
T1JDRU9OLCBmb3JjZV9vbik7Ki8KKwlpZiAoUkVHKERPTUFJTjhfUEdfQ09ORklHKSkKKwkJUkVH
X1VQREFURShET01BSU44X1BHX0NPTkZJRywgRE9NQUlOOF9QT1dFUl9GT1JDRU9OLCBmb3JjZV9v
bik7CisJaWYgKFJFRyhET01BSU4xMF9QR19DT05GSUcpKQorCQlSRUdfVVBEQVRFKERPTUFJTjEw
X1BHX0NPTkZJRywgRE9NQUlOOF9QT1dFUl9GT1JDRU9OLCBmb3JjZV9vbik7CiAKIAkvKiBEUFAw
LzEvMi8zLzQvNSAqLwogCVJFR19VUERBVEUoRE9NQUlOMV9QR19DT05GSUcsIERPTUFJTjFfUE9X
RVJfRk9SQ0VPTiwgZm9yY2Vfb24pOwogCVJFR19VUERBVEUoRE9NQUlOM19QR19DT05GSUcsIERP
TUFJTjNfUE9XRVJfRk9SQ0VPTiwgZm9yY2Vfb24pOwogCVJFR19VUERBVEUoRE9NQUlONV9QR19D
T05GSUcsIERPTUFJTjVfUE9XRVJfRk9SQ0VPTiwgZm9yY2Vfb24pOwogCVJFR19VUERBVEUoRE9N
QUlON19QR19DT05GSUcsIERPTUFJTjdfUE9XRVJfRk9SQ0VPTiwgZm9yY2Vfb24pOwotCVJFR19V
UERBVEUoRE9NQUlOOV9QR19DT05GSUcsIERPTUFJTjlfUE9XRVJfRk9SQ0VPTiwgZm9yY2Vfb24p
OwotCS8qRG8gbm90IHBvd2VyIGdhdGUgRFBQNSwgc2hvdWxkIGJlIGxlZnQgYXQgSFcgZGVmYXVs
dCwgcG93ZXIgb24gcGVybWFuZW50bHkqLwotCS8qUkVHX1VQREFURShET01BSU4xMV9QR19DT05G
SUcsIERPTUFJTjExX1BPV0VSX0ZPUkNFT04sIGZvcmNlX29uKTsqLworCWlmIChSRUcoRE9NQUlO
OV9QR19DT05GSUcpKQorCQlSRUdfVVBEQVRFKERPTUFJTjlfUEdfQ09ORklHLCBET01BSU45X1BP
V0VSX0ZPUkNFT04sIGZvcmNlX29uKTsKKwlpZiAoUkVHKERPTUFJTjExX1BHX0NPTkZJRykpCisJ
CVJFR19VUERBVEUoRE9NQUlOMTFfUEdfQ09ORklHLCBET01BSU45X1BPV0VSX0ZPUkNFT04sIGZv
cmNlX29uKTsKIAorCS8qIERDUzAvMS8yLzMvNC81ICovCiAJUkVHX1VQREFURShET01BSU4xNl9Q
R19DT05GSUcsIERPTUFJTjE2X1BPV0VSX0ZPUkNFT04sIGZvcmNlX29uKTsKIAlSRUdfVVBEQVRF
KERPTUFJTjE3X1BHX0NPTkZJRywgRE9NQUlOMTdfUE9XRVJfRk9SQ0VPTiwgZm9yY2Vfb24pOwog
CVJFR19VUERBVEUoRE9NQUlOMThfUEdfQ09ORklHLCBET01BSU4xOF9QT1dFUl9GT1JDRU9OLCBm
b3JjZV9vbik7Ci0JUkVHX1VQREFURShET01BSU4xOV9QR19DT05GSUcsIERPTUFJTjE5X1BPV0VS
X0ZPUkNFT04sIGZvcmNlX29uKTsKLQlSRUdfVVBEQVRFKERPTUFJTjIwX1BHX0NPTkZJRywgRE9N
QUlOMjBfUE9XRVJfRk9SQ0VPTiwgZm9yY2Vfb24pOwotCVJFR19VUERBVEUoRE9NQUlOMjFfUEdf
Q09ORklHLCBET01BSU4yMV9QT1dFUl9GT1JDRU9OLCBmb3JjZV9vbik7CisJaWYgKFJFRyhET01B
SU4xOV9QR19DT05GSUcpKQorCQlSRUdfVVBEQVRFKERPTUFJTjE5X1BHX0NPTkZJRywgRE9NQUlO
MTlfUE9XRVJfRk9SQ0VPTiwgZm9yY2Vfb24pOworCWlmIChSRUcoRE9NQUlOMjBfUEdfQ09ORklH
KSkKKwkJUkVHX1VQREFURShET01BSU4yMF9QR19DT05GSUcsIERPTUFJTjIwX1BPV0VSX0ZPUkNF
T04sIGZvcmNlX29uKTsKKwlpZiAoUkVHKERPTUFJTjIxX1BHX0NPTkZJRykpCisJCVJFR19VUERB
VEUoRE9NQUlOMjFfUEdfQ09ORklHLCBET01BSU4yMV9QT1dFUl9GT1JDRU9OLCBmb3JjZV9vbik7
CiB9CiAKIHZvaWQgZGNuMjBfZGNjZ19pbml0KHN0cnVjdCBkY2VfaHdzZXEgKmh3cykKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
