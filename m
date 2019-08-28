Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93236A00D7
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 13:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3143899D4;
	Wed, 28 Aug 2019 11:40:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690049.outbound.protection.outlook.com [40.107.69.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77365899D4
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 11:40:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfBtu8Yv4Mvn25cmW5L+Br+4fNN8mniANk0PvzlbHvGdXflf04q9UEkcZNXGbUULW3PBjb/aWi0OA+v3/PYNAQV8WjsRXT/VhwyZbHN0vEzt+OkCAazvl7i//BqxQr0XTaFz092p9tK8rD+gRtU6iBKvw312UOx09kHx37N+4YgFhQpqvOHNc92a9wX3TEh84bEPv6OvKvKKG56Uy6k4eE4iWZVXepnvkv0hA99NDiFeOOdLHeHAEOYUMe4VmpO/xSZP/JUEdjd96Goxev3JVknVky35jlSkiE6+1+znNYWVRaO+31eo2r1iCoLEE7Ayr8CG+Y8WzYApYqBZBg2VwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jrzw63IPyuzicWGUBNEtMOP/ll/0zkiTFirJ/BCKqSw=;
 b=Od5u+y1lZyRxmE6ypzmPJNEc3ZvAv6r6iLgMZTlfXFI0Rbf6nMoCL19GUKS97lLeGKTkJzy9vStTTO4pFoazBgF4zQulctCNL2EAbATHTSGoogX6FVLmnx3TRq4iBuWuAG6MrMl38a7zQKXoF4lX4kk0B4EbyMbIjzyvtMdE81GqEuct8i1jv//nTekROHAEJARlatSZJk7AJn2CAtD8iYaNpHL5fA+Ck5MQmcztSASe4vzCTyqwVEe45vUMAXVBM67bcLEpJynt9p42McoQt5mO8RjEEaBoyc2QN68T4G+tsgTXFy+VA4oTFp/XTDn711TlrPLD+iB3aJxFvYrzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0006.namprd12.prod.outlook.com
 (2603:10b6:405:4c::16) by BN7PR12MB2706.namprd12.prod.outlook.com
 (2603:10b6:408:2a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Wed, 28 Aug
 2019 11:40:28 +0000
Received: from DM3NAM03FT057.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by BN6PR1201CA0006.outlook.office365.com
 (2603:10b6:405:4c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.17 via Frontend
 Transport; Wed, 28 Aug 2019 11:40:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT057.mail.protection.outlook.com (10.152.83.45) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 28 Aug 2019 11:40:27 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 06:40:26 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Date: Wed, 28 Aug 2019 19:40:20 +0800
Message-ID: <1566992421-30581-1-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(2980300002)(428003)(189003)(199004)(81166006)(26005)(14444005)(186003)(356004)(6666004)(70586007)(44832011)(53936002)(81156014)(6916009)(70206006)(126002)(476003)(2616005)(486006)(426003)(336012)(2906002)(8676002)(5660300002)(50226002)(51416003)(47776003)(7696005)(53416004)(478600001)(8936002)(2351001)(48376002)(54906003)(86362001)(305945005)(16586007)(316002)(50466002)(4326008)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2706; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2624ce12-31bb-4435-0fc4-08d72bac85e9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN7PR12MB2706; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2706:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2706B40685A4BBFF18FEA10E95A30@BN7PR12MB2706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0vbEfKnZfpwDZ47cACOh6nIKk1rrVui0ZafsR7Xs+hwRJNQ3P6mNYjkN+8wezuo93UsvM4pXkYeCvGO5ncz4On+5foVwJVFmQSa/8K6kJwa/Le23mIuAyJe6pfU87vWkqjRenBXwsL7e7bSKCz6ZujA0XIACmzHTrbl6YGHF1ZGwhw4z94jHVXEZwPrqgFO4b+WPs/HAbKyYtEvakNtNMMzld8QbStNiPXOHKhO028FB/2LRL2X7mWz8PkCwenDDNoGk9TvLwr5UsFwETP7x11jsC8EgiZcKgaSgfoNZhVfYyU7M9/dMIPYFNoqki64PnTU7qXGSHdBo0r+YD634ile/4UyAMgmC8iF/1+zRTHAzbtZuA+/9g9ay+FqA/pPXdQFG/8luYSJ2vcunGvsXAF97QIO4odpTXaJXWR26kc8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 11:40:27.6196 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2624ce12-31bb-4435-0fc4-08d72bac85e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2706
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jrzw63IPyuzicWGUBNEtMOP/ll/0zkiTFirJ/BCKqSw=;
 b=zogNHkKU3bcYAtb6oLXo/A9TC062P0P5A7KzYhizwD42QJKRCq1I6mk6giZZoRYrsB65459xoq0N1cujt+Ke3YI41R/HXgt57TRe95UlL86346nKsyxzxsBf0HLrzQKWPfe4QbuAqeRqKyHomWjb09aLE6mJEvN1RQQcU9qHRfo=
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, "Le
 . Ma" <Le.Ma@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Tianci Yin <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgpGaXggY29tcHV0ZSByaW5n
IHRlc3QgZmFpbHVyZSBpbiBzcmlvdiBzY2VuYXJpby4KCkNoYW5nZS1JZDogSTE0MWQzZDA5NGUy
Y2JhOWJjZjJmNmM5NmY0ZDhjNGVmNDNjNDIxYzMKU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8
dGlhbmNpLnlpbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wc3AuYyB8IDE1ICsrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bz
cC5jCmluZGV4IDlmN2NjNWIuLjQzZmE4YjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wc3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcHNwLmMKQEAgLTIzOSw2ICsyMzksNyBAQCBzdGF0aWMgaW50IHBzcF90bXJfaW5pdChz
dHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIHsKIAlpbnQgcmV0OwogCWludCB0bXJfc2l6ZTsKKwl2
b2lkICp0bXJfYnVmOwogCiAJLyoKIAkgKiBBY2NvcmRpbmcgdG8gSFcgZW5naW5lZXIsIHRoZXkg
cHJlZmVyIHRoZSBUTVIgYWRkcmVzcyBiZSAibmF0dXJhbGx5CkBAIC0yNjEsOSArMjYyLDE0IEBA
IHN0YXRpYyBpbnQgcHNwX3Rtcl9pbml0KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQogCQl9CiAJ
fQogCi0JcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwocHNwLT5hZGV2LCB0bXJfc2l6ZSwg
UFNQX1RNUl9TSVpFLAotCQkJCSAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCi0JCQkJICAg
ICAgJnBzcC0+dG1yX2JvLCAmcHNwLT50bXJfbWNfYWRkciwgTlVMTCk7CisJaWYgKCFhbWRncHVf
c3Jpb3ZfdmYocHNwLT5hZGV2KSkKKwkJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwocHNw
LT5hZGV2LCB0bXJfc2l6ZSwgUFNQX1RNUl9TSVpFLAorCQkJCQkgICAgICBBTURHUFVfR0VNX0RP
TUFJTl9WUkFNLAorCQkJCQkgICAgICAmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCBO
VUxMKTsKKwllbHNlCisJCXJldCA9IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsKHBzcC0+YWRldiwg
dG1yX3NpemUsIFBTUF9UTVJfU0laRSwKKwkJCQkJICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJB
TSwKKwkJCQkJICAgICAgJnBzcC0+dG1yX2JvLCAmcHNwLT50bXJfbWNfYWRkciwgJnRtcl9idWYp
OwogCiAJcmV0dXJuIHJldDsKIH0KQEAgLTEyMDYsNiArMTIxMiw3IEBAIHN0YXRpYyBpbnQgcHNw
X2h3X2Zpbmkodm9pZCAqaGFuZGxlKQogewogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
KHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwogCXN0cnVjdCBwc3BfY29udGV4dCAqcHNw
ID0gJmFkZXYtPnBzcDsKKwl2b2lkICp0bXJfYnVmOwogCiAJaWYgKGFkZXYtPmdtYy54Z21pLm51
bV9waHlzaWNhbF9ub2RlcyA+IDEgJiYKIAkgICAgcHNwLT54Z21pX2NvbnRleHQuaW5pdGlhbGl6
ZWQgPT0gMSkKQEAgLTEyMTYsNyArMTIyMyw3IEBAIHN0YXRpYyBpbnQgcHNwX2h3X2Zpbmkodm9p
ZCAqaGFuZGxlKQogCiAJcHNwX3JpbmdfZGVzdHJveShwc3AsIFBTUF9SSU5HX1RZUEVfX0tNKTsK
IAotCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRy
LCBOVUxMKTsKKwlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+dG1yX2JvLCAmcHNwLT50bXJf
bWNfYWRkciwgJnRtcl9idWYpOwogCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNwLT5md19wcmlf
Ym8sCiAJCQkgICAgICAmcHNwLT5md19wcmlfbWNfYWRkciwgJnBzcC0+ZndfcHJpX2J1Zik7CiAJ
YW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3AtPmZlbmNlX2J1Zl9ibywKLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
