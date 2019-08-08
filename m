Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E2B859FE
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 07:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463906E77F;
	Thu,  8 Aug 2019 05:49:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680069.outbound.protection.outlook.com [40.107.68.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7119C6E77F
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 05:49:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEzpM2TodSD98EqSFX5SlAGLXIWNiDl2mV0biLpeA2Gbx9eWt4Z09awZb+Ge6PDQn6LpOjIvqyKBxQ87HIds98ntJyv8ZNhCsfKN44MK47tBSsHpSINIAYyn/I+ws89bJYu5YtthBl9SeXFrdQD0/x8SY10DxiD48raYfxX188MKw8+6xwAHWpzfm/rqyUY86ae63NEz7UvZSQAYrGoC1WCBpkqLdYX/SuroVloyCIcj+HhsfRssbj1OkMkmSH2JjMe07S77w5eRalZ+gPu0u4W7DvDfnQ/VJTI4UKfQAEW9T4kQFUVWh+Mg//Scfo49sdnh8VdNRtRDh/QBmO9PFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnEgUeRFXWhKiU4NgMBjTrZLBWgizlet8Eulz07dyaQ=;
 b=GuP7rvBIshVPzxpYcmLCjXT+EMpeqs/l9WRxzD6JM2x4a6ftiIBk5qnOrMpRLe3rCHP7DRHvyYhRuSGv65JVjIvK5SgRE650/jiC2tYbD/FPwGyNcPCtjUwFjnxGAV4vau74d3HK6CAgrIRm8qORUMD9a/GG6LukHW32tBuj9yMtOge8w89Q9AZ24HJB08mv15U2gFe7EjlPjl7Ay+9D+El61Yx6bKJYPSmLlwpftQiokc2W0sCOzpEBG8KtKyg5yUfFjCTeEGSIVTqCTvMm/POK9LQzQcSVrIipLuNXnRWQWlbvSdDDda3jHR9FKGvuXLgVrWw8vJc2aLPU3SlQpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0045.namprd12.prod.outlook.com (2603:10b6:301:2::31)
 by BN6PR12MB1268.namprd12.prod.outlook.com (2603:10b6:404:1a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15; Thu, 8 Aug
 2019 05:49:14 +0000
Received: from BY2NAM03FT050.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by MWHPR12CA0045.outlook.office365.com
 (2603:10b6:301:2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16 via Frontend
 Transport; Thu, 8 Aug 2019 05:49:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT050.mail.protection.outlook.com (10.152.85.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 05:49:13 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 8 Aug 2019
 00:49:11 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: re-define smu interface version for
 smu v11
Date: Thu, 8 Aug 2019 13:49:02 +0800
Message-ID: <1565243343-7561-1-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(2980300002)(428003)(189003)(199004)(8936002)(86362001)(186003)(336012)(2906002)(2351001)(50226002)(16586007)(478600001)(54906003)(44832011)(426003)(7696005)(316002)(50466002)(48376002)(51416003)(53416004)(6916009)(26005)(476003)(2616005)(126002)(486006)(70586007)(81166006)(81156014)(4326008)(47776003)(70206006)(305945005)(8676002)(356004)(14444005)(36756003)(5660300002)(6666004)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1268; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8388fc0c-904f-48d4-cb52-08d71bc4245f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1268; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1268:
X-Microsoft-Antispam-PRVS: <BN6PR12MB12688D08644140F7EEA0240695D70@BN6PR12MB1268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: a7OrvVE1dWeHMn/r2XHoRjF934cJxUOemyOcQqzeBtYIMOG0gV5eJBK6fu/9vrDgTSxOXyi7vwv7hmBQrJmD1HC90spA8y04SREEyCeK+e3aAN+YPW1v3/rSLCVF/9Qns1+Me3ZnXj5kzF1+qCRF39XQ89Gd5TJnMdSqI3NVhsQrzDj3AsSIFZy8rfVMPYHLYqUPqVnRBSbkDcSUvTVc8fNhXb9ffSC3Lpe34fKpL4aQB3oBWgxySH6+E6u9rfG4WR0X7T8/GRHO8Lj/h72HQb+kmg4EB+dVikvGM9vqzJdGrTHFXyxsiBQyrf3xbL1RytkQGGbnezyWl8iFNEwb8aONorcd/lIhyi05F8d7tZ0FjN2ZjUyBHGKHAoxCy038t7E/LEgwy4GCZo+ufm+WWKZfAnHtit7jyrmsgOpv1+M=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 05:49:13.1627 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8388fc0c-904f-48d4-cb52-08d71bc4245f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnEgUeRFXWhKiU4NgMBjTrZLBWgizlet8Eulz07dyaQ=;
 b=JZJY1gwnKYEc0EenPYm3M/0Pm5/GV6DVqon7QTYbGiIDuGs47sC1kJl27kLAF6T2pekSmzCAbvPsAzR1M4KOqUbl9B4eGHD2AMHGu/IKXGap8X3L99W/7m+CGKD7+/DE0+zIER8CFzhqCxMFNI85pJ+kIrblUgP8yg2kVe30xyI=
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Kevin Wang <Kevin1.Wang@amd.com>,
 Tianci Yin <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Evan Quan <evan.quan@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KClt3aHldCm5hdmkxNCBzaGFyZSBz
YW1lIGRlZmluYXRpb24gb2Ygc211IGludGVyZmFjZSB2ZXJzaW9uIHdpdGggbmF2aTEwLAphbnlv
bmUgb2YgdGhlbSB1cGRhdGUgdGhlIHZlcnNpb24gbWF5IGJyZWFrIHRoZSBvdGhlciBvbmUncwp2
ZXJzaW9uIGNoZWNraW5nLgoKW2hvd10KY3JlYXRlIGRpZmZlcmVudCB2ZXJzaW9uIGRlZmluYXRp
b24sIHNvIHRoYXQgdGhleSBjYW4KdXBkYXRlIHRoZWlyIHZlcnNpb24gc2VwYXJhdGVseS4KClNp
Z25lZC1vZmYtYnk6IHRpYW5jeWluIDx0aWFuY2kueWluQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZi5oICAgICAgfCAgNCArKyst
CiAuLi4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfbmF2aTEwLmgg
ICB8ICA0ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXVfdjExXzAu
aCAgICAgICAgICAgIHwgIDUgKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25h
dmkxMF9wcHQuYyAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvc211X3YxMV8wLmMgICAgICAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKysrCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgICAgICAgICAgICAgICB8
ICAxIC0KIDYgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJp
dmVyX2lmLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVy
X2lmLmgKaW5kZXggNzU1ZDUxZi4uZmRjNmI3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZi5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWYuaApAQCAtMjcsNyArMjcsOSBAQAog
Ly8gKioqIElNUE9SVEFOVCAqKioKIC8vIFNNVSBURUFNOiBBbHdheXMgaW5jcmVtZW50IHRoZSBp
bnRlcmZhY2UgdmVyc2lvbiBpZgogLy8gYW55IHN0cnVjdHVyZSBpcyBjaGFuZ2VkIGluIHRoaXMg
ZmlsZQotI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTiAweDEzCisvLyBCZSBhd2FyZSBv
ZiB0aGF0IHRoZSB2ZXJzaW9uIHNob3VsZCBiZSB1cGRhdGVkIGluCisvLyBzbXVfdjExXzAuaCwg
cmVuYW1lIGlzIGFsc28gbmVlZGVkLgorLy8gI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lP
TiAweDEzCiAKICNkZWZpbmUgUFBUQUJMRV9WMjBfU01VX1ZFUlNJT04gMwogCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmX25hdmkx
MC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9u
YXZpMTAuaAppbmRleCBhZGJiZmViLi42ZDllNzllIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmX25hdmkxMC5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfbmF2aTEwLmgKQEAg
LTI2LDcgKzI2LDkgQEAKIC8vICoqKiBJTVBPUlRBTlQgKioqCiAvLyBTTVUgVEVBTTogQWx3YXlz
IGluY3JlbWVudCB0aGUgaW50ZXJmYWNlIHZlcnNpb24gaWYgCiAvLyBhbnkgc3RydWN0dXJlIGlz
IGNoYW5nZWQgaW4gdGhpcyBmaWxlCi0jZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OIDB4
MzMKKy8vIEJlIGF3YXJlIG9mIHRoYXQgdGhlIHZlcnNpb24gc2hvdWxkIGJlIHVwZGF0ZWQgaW4K
Ky8vIHNtdV92MTFfMC5oLCBtYXliZSByZW5hbWUgaXMgYWxzbyBuZWVkZWQuCisvLyAjZGVmaW5l
IFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OIDB4MzMKIAogI2RlZmluZSBQUFRBQkxFX05WMTBfU01V
X1ZFUlNJT04gOAogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9p
bmMvc211X3YxMV8wLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3Yx
MV8wLmgKaW5kZXggZmNiNTgwMS4uOTc2MDVlOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2luYy9zbXVfdjExXzAuaApAQCAtMjUsNiArMjUsMTEgQEAKIAogI2luY2x1ZGUg
ImFtZGdwdV9zbXUuaCIKIAorI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9JTlYgMHhG
RkZGRkZGRgorI2RlZmluZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9WRzIwIDB4MTMKKyNkZWZp
bmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fTlYxMCAweDMzCisjZGVmaW5lIFNNVTExX0RSSVZF
Ul9JRl9WRVJTSU9OX05WMTQgMHgzMworCiAvKiBNUCBBcGVydHVyZXMgKi8KICNkZWZpbmUgTVAw
X1B1YmxpYwkJCTB4MDM4MDAwMDAKICNkZWZpbmUgTVAwX1NSQU0JCQkweDAzOTAwMDAwCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggYmU4OGM1ZC4uZmRj
N2RiMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAt
MTYzMCw2ICsxNjMwLDUgQEAgdm9pZCBuYXZpMTBfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSkKIAlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnNtdV90YWJsZSA9ICZzbXUt
PnNtdV90YWJsZTsKIAogCXNtdS0+cHB0X2Z1bmNzID0gJm5hdmkxMF9wcHRfZnVuY3M7Ci0Jc211
LT5zbWNfaWZfdmVyc2lvbiA9IFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OOwogCXNtdV90YWJsZS0+
dGFibGVfY291bnQgPSBUQUJMRV9DT1VOVDsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvc211X3YxMV8wLmMKaW5kZXggYzA3OGJmNC4uOTFkZmFlMSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKQEAgLTI3MSw2ICsyNzEsMjIgQEAgc3RhdGljIGlu
dCBzbXVfdjExXzBfY2hlY2tfZndfdmVyc2lvbihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAlz
bXVfbWlub3IgPSAoc211X3ZlcnNpb24gPj4gOCkgJiAweGZmOwogCXNtdV9kZWJ1ZyA9IChzbXVf
dmVyc2lvbiA+PiAwKSAmIDB4ZmY7CiAKKwlzd2l0Y2ggKHNtdS0+YWRldi0+YXNpY190eXBlKSB7
CisJY2FzZSBDSElQX1ZFR0EyMDoKKwkJc211LT5zbWNfaWZfdmVyc2lvbiA9IFNNVTExX0RSSVZF
Ul9JRl9WRVJTSU9OX1ZHMjA7CisJCWJyZWFrOworCWNhc2UgQ0hJUF9OQVZJMTA6CisJCXNtdS0+
c21jX2lmX3ZlcnNpb24gPSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9OVjEwOworCQlicmVhazsK
KwljYXNlIENISVBfTkFWSTE0OgorCQlzbXUtPnNtY19pZl92ZXJzaW9uID0gU01VMTFfRFJJVkVS
X0lGX1ZFUlNJT05fTlYxNDsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJcHJfZXJyKCJzbXUgdW5z
dXBvcnRlZCBhc2ljIHR5cGU6JWQuXG4iLHNtdS0+YWRldi0+YXNpY190eXBlKTsKKwkJc211LT5z
bWNfaWZfdmVyc2lvbiA9IFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX0lOVjsKKwkJYnJlYWs7CisJ
fQorCiAJLyoKIAkgKiAxLiBpZl92ZXJzaW9uIG1pc21hdGNoIGlzIG5vdCBjcml0aWNhbCBhcyBv
dXIgZncgaXMgZGVzaWduZWQKIAkgKiB0byBiZSBiYWNrd2FyZCBjb21wYXRpYmxlLgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCmluZGV4IDUyYzhmYzkuLmUyOGMw
MDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKQEAgLTMx
NzMsNiArMzE3Myw1IEBAIHZvaWQgdmVnYTIwX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUpCiAJc3RydWN0IHNtdV90YWJsZV9jb250ZXh0ICpzbXVfdGFibGUgPSAmc211LT5z
bXVfdGFibGU7CiAKIAlzbXUtPnBwdF9mdW5jcyA9ICZ2ZWdhMjBfcHB0X2Z1bmNzOwotCXNtdS0+
c21jX2lmX3ZlcnNpb24gPSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTjsKIAlzbXVfdGFibGUtPnRh
YmxlX2NvdW50ID0gVEFCTEVfQ09VTlQ7CiB9Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
