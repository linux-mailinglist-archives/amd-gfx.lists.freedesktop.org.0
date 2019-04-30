Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C25FD1017A
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9D989221;
	Tue, 30 Apr 2019 21:09:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690058.outbound.protection.outlook.com [40.107.69.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0FF89225
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:55 +0000 (UTC)
Received: from SN1PR12CA0063.namprd12.prod.outlook.com (2603:10b6:802:20::34)
 by CH2PR12MB3750.namprd12.prod.outlook.com (2603:10b6:610:25::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.15; Tue, 30 Apr
 2019 21:09:54 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by SN1PR12CA0063.outlook.office365.com
 (2603:10b6:802:20::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:54 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:46 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/20] drm/amd/display: define HUBP_MASK_SH_LIST_DCN for Raven
Date: Tue, 30 Apr 2019 17:09:08 -0400
Message-ID: <20190430210938.32335-11-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(1076003)(8936002)(186003)(316002)(478600001)(26005)(5660300002)(16586007)(36756003)(7696005)(2351001)(51416003)(77096007)(72206003)(53416004)(86362001)(76176011)(2616005)(2906002)(81166006)(81156014)(11346002)(446003)(47776003)(476003)(426003)(48376002)(336012)(53936002)(8676002)(305945005)(70206006)(68736007)(70586007)(6666004)(356004)(50226002)(486006)(50466002)(4326008)(126002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3750; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0003b3f5-5b33-433e-4239-08d6cdb03131
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CH2PR12MB3750; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3750:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3750D5DA6F4CF8412C43529AF93A0@CH2PR12MB3750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: N8IfwBQyNEpMhIZYdLod7OlTEElbl7+kLaQtC1Q8t/p9fPtNEvjZAS5UXtkcTFVS2GMh+qktL6yR7M6h2oB1RAQDO+bkb/Tkan65cW5PGlYUE0KldwPw18S5VcWtBzryMODcxxQSAy7SPnp+yWBfjamAxwgPkAKvnD29J4Ar/qMMdUHGYn2uFWoK0VHvQRQ9VZLL16dbSyapjcfQQWy7Qx2icUDEgNwM6hvVsrvDU61OXe/emdfzkx+PJ6EBA5Iy4RQ0DWwH2tXpvqXq7Wy1cY0WIP2Afp5upmqccoJLmwfcrPh7F1A+YNshnp+BDJNmDvdwPDhgChzFpt6zHYd8r0VPJH/jvSD9snuZ8OjihaHvlco22dO3DIY1zIDIkHSLObBQsDWF32OiDs0IsfWFe7au5ldPZr3Q463+0doerD8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:54.0922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0003b3f5-5b33-433e-4239-08d6cdb03131
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3750
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL5F63QoF6zxGulGXUKxaBvT+NBwj6VcSgdLVbTO8wQ=;
 b=lsAE0cao2rikQdMSqpt/WIv6snfTDdQZEl3msLzqTchxqI7+xwofKWRvCqYIC5LbGgVJUUAEKyFmoC2klAnDkAzVdp0pCrlEvYVeGQPyyN91MTFi7VgXXXuFS0nKurtw3uzR5DGrOX4v5+sChwRW1HE+dEYNealYneolbHIQ3qE=
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
Cc: Yongqiang Sun <yongqiang.sun@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgoKQ2hhbmdlLUlkOiBJ
YmU2MDc0NWVhYWVhNzJkNjk0Y2ViOWQyMjkzNmVhZTBhYmFlNTY3NApTaWduZWQtb2ZmLWJ5OiBZ
b25ncWlhbmcgU3VuIDx5b25ncWlhbmcuc3VuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBUb255IENo
ZW5nIDxUb255LkNoZW5nQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhh
d2FucHJlZXQgTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMTAvZGNuMTBfaHVicC5oIHwgOSArKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h1YnAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmgKaW5kZXggMzI2OGFiMDg5MzYzLi5kYjk4YmEz
NjE2ODYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9k
Y24xMF9odWJwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2Rj
bjEwX2h1YnAuaApAQCAtMjQ3LDcgKzI0Nyw3IEBACiAJLmZpZWxkX25hbWUgPSByZWdfbmFtZSAj
IyBfXyAjIyBmaWVsZF9uYW1lICMjIHBvc3RfZml4CiAKIC8qIE1hc2svc2hpZnQgc3RydWN0IGdl
bmVyYXRpb24gbWFjcm8gZm9yIGFsbCBBU0lDcyAoaW5jbHVkaW5nIHRob3NlIHdpdGggcmVkdWNl
ZCBmdW5jdGlvbmFsaXR5KSAqLwotI2RlZmluZSBIVUJQX01BU0tfU0hfTElTVF9EQ04obWFza19z
aClcCisjZGVmaW5lIEhVQlBfTUFTS19TSF9MSVNUX0RDTl9DT01NT04obWFza19zaClcCiAJSFVC
UF9TRihIVUJQMF9EQ0hVQlBfQ05UTCwgSFVCUF9CTEFOS19FTiwgbWFza19zaCksXAogCUhVQlBf
U0YoSFVCUDBfRENIVUJQX0NOVEwsIEhVQlBfVFRVX0RJU0FCTEUsIG1hc2tfc2gpLFwKIAlIVUJQ
X1NGKEhVQlAwX0RDSFVCUF9DTlRMLCBIVUJQX1VOREVSRkxPV19TVEFUVVMsIG1hc2tfc2gpLFwK
QEAgLTMzMSw3ICszMzEsNiBAQAogCUhVQlBfU0YoSFVCUDBfRENIVUJQX1JFUV9TSVpFX0NPTkZJ
RywgTUVUQV9DSFVOS19TSVpFLCBtYXNrX3NoKSxcCiAJSFVCUF9TRihIVUJQMF9EQ0hVQlBfUkVR
X1NJWkVfQ09ORklHLCBNSU5fTUVUQV9DSFVOS19TSVpFLCBtYXNrX3NoKSxcCiAJSFVCUF9TRihI
VUJQMF9EQ0hVQlBfUkVRX1NJWkVfQ09ORklHLCBEUFRFX0dST1VQX1NJWkUsIG1hc2tfc2gpLFwK
LQlIVUJQX1NGKEhVQlAwX0RDSFVCUF9SRVFfU0laRV9DT05GSUcsIE1QVEVfR1JPVVBfU0laRSwg
bWFza19zaCksXAogCUhVQlBfU0YoSFVCUDBfRENIVUJQX1JFUV9TSVpFX0NPTkZJRywgU1dBVEhf
SEVJR0hULCBtYXNrX3NoKSxcCiAJSFVCUF9TRihIVUJQMF9EQ0hVQlBfUkVRX1NJWkVfQ09ORklH
LCBQVEVfUk9XX0hFSUdIVF9MSU5FQVIsIG1hc2tfc2gpLFwKIAlIVUJQX1NGKEhVQlAwX0RDSFVC
UF9SRVFfU0laRV9DT05GSUdfQywgQ0hVTktfU0laRV9DLCBtYXNrX3NoKSxcCkBAIC0zMzksNyAr
MzM4LDYgQEAKIAlIVUJQX1NGKEhVQlAwX0RDSFVCUF9SRVFfU0laRV9DT05GSUdfQywgTUVUQV9D
SFVOS19TSVpFX0MsIG1hc2tfc2gpLFwKIAlIVUJQX1NGKEhVQlAwX0RDSFVCUF9SRVFfU0laRV9D
T05GSUdfQywgTUlOX01FVEFfQ0hVTktfU0laRV9DLCBtYXNrX3NoKSxcCiAJSFVCUF9TRihIVUJQ
MF9EQ0hVQlBfUkVRX1NJWkVfQ09ORklHX0MsIERQVEVfR1JPVVBfU0laRV9DLCBtYXNrX3NoKSxc
Ci0JSFVCUF9TRihIVUJQMF9EQ0hVQlBfUkVRX1NJWkVfQ09ORklHX0MsIE1QVEVfR1JPVVBfU0la
RV9DLCBtYXNrX3NoKSxcCiAJSFVCUF9TRihIVUJQMF9EQ0hVQlBfUkVRX1NJWkVfQ09ORklHX0Ms
IFNXQVRIX0hFSUdIVF9DLCBtYXNrX3NoKSxcCiAJSFVCUF9TRihIVUJQMF9EQ0hVQlBfUkVRX1NJ
WkVfQ09ORklHX0MsIFBURV9ST1dfSEVJR0hUX0xJTkVBUl9DLCBtYXNrX3NoKSxcCiAJSFVCUF9T
RihIVUJQUkVRMF9CTEFOS19PRkZTRVRfMCwgUkVGQ1lDX0hfQkxBTktfRU5ELCBtYXNrX3NoKSxc
CkBAIC0zNzMsNiArMzcxLDExIEBACiAJSFVCUF9TRihIVUJQUkVRMF9EQ05fU1VSRjBfVFRVX0NO
VEwxLCBSRUZDWUNfUEVSX1JFUV9ERUxJVkVSWV9QUkUsIG1hc2tfc2gpLFwKIAlIVUJQX1NGKEhV
QlAwX0hVQlBfQ0xLX0NOVEwsIEhVQlBfQ0xPQ0tfRU5BQkxFLCBtYXNrX3NoKQogCisjZGVmaW5l
IEhVQlBfTUFTS19TSF9MSVNUX0RDTihtYXNrX3NoKVwKKwlIVUJQX01BU0tfU0hfTElTVF9EQ05f
Q09NTU9OKG1hc2tfc2gpLFwKKwlIVUJQX1NGKEhVQlAwX0RDSFVCUF9SRVFfU0laRV9DT05GSUcs
IE1QVEVfR1JPVVBfU0laRSwgbWFza19zaCksXAorCUhVQlBfU0YoSFVCUDBfRENIVUJQX1JFUV9T
SVpFX0NPTkZJR19DLCBNUFRFX0dST1VQX1NJWkVfQywgbWFza19zaCkKKwogLyogTWFzay9zaGlm
dCBzdHJ1Y3QgZ2VuZXJhdGlvbiBtYWNybyBmb3IgQVNJQ3Mgd2l0aCBWTSAqLwogI2RlZmluZSBI
VUJQX01BU0tfU0hfTElTVF9EQ05fVk0obWFza19zaClcCiAJSFVCUF9TRihIVUJQUkVRMF9OT01f
UEFSQU1FVEVSU18wLCBEU1RfWV9QRVJfUFRFX1JPV19OT01fTCwgbWFza19zaCksXAotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
