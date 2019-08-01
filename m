Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7807D5A7
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 08:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6BC6E384;
	Thu,  1 Aug 2019 06:44:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730082.outbound.protection.outlook.com [40.107.73.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275296E386
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 06:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ac/CeP/FeO1T3dVmAvIKo2SuKa/HSU8iphmgrNnKVj+UEdo/uo4oUgAp8Fn6e+kJqA6LrflEn2vy+mvsOhipWQ+yTrP3sP+dPspi333r01ic/9F32Mbx/2iZBPCiMqRu4glAcYoanIOoot3am3phfjRfMuQUsjpcLHsjZsuXzz0ale2DyF1JnwYBMxbxKjqH4qrALizzRgWH6EHbW/XpUB7tuCQTq9vtOp/5cOWljRXERVJoN+JINDK+XMKgC2oKxstZzxuR6nX8L3Vj55r3Q0ugguLSEuzfypMFGX3Dv13ZavI8KlA3vG5VOTUpqwBxMzGrzQzu228HLHSLA3CphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78/JJes5SPKZrLJh2HKFOCXR0vLBTprI+YTalBMGzdM=;
 b=ifQXrKBetDX8dAZTKlbR7pe2i+9uQHe4ENyvnThKS8T5sBfNAlwqwMhsWVVVegHmkS+wANNN3Ri+q9hq1LPgYaDjKw+560awUDTKGr5hzh9MqYf0Bs4e9b1bU6JPkkscmtdl9fZoxb/YXKjwClMbCkS2chEFxE7Z1j7pvfzTupmoqeoT/RqdETqZfY1CbU8CvqvhOO0zACuy3ty6pE/w2Dplmid59FR0XtU7nT+AcXP3yvnwyBAWGkudPFuDs1Om3yBMQ7DP4rF2mwWoxUlb9YebPlvsNpMILGy37hiV2YXsIWkVGhWhbkfDOX2rR2+Vi+sZajsBdMvrORcRlG+8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN6PR12CA0031.namprd12.prod.outlook.com (2603:10b6:405:70::17)
 by BN8PR12MB3508.namprd12.prod.outlook.com (2603:10b6:408:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Thu, 1 Aug
 2019 06:43:57 +0000
Received: from DM3NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by BN6PR12CA0031.outlook.office365.com
 (2603:10b6:405:70::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14 via Frontend
 Transport; Thu, 1 Aug 2019 06:43:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT036.mail.protection.outlook.com (10.152.82.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 06:43:56 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 01:43:55 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 2/6] drm/amdgpu: add more parameters and functions to
 amdgpu_umc structure
Date: Thu, 1 Aug 2019 14:43:07 +0800
Message-ID: <20190801064311.7307-3-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801064311.7307-1-tao.zhou1@amd.com>
References: <20190801064311.7307-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(70206006)(2906002)(486006)(446003)(70586007)(186003)(53416004)(476003)(126002)(2616005)(8936002)(11346002)(48376002)(6636002)(53936002)(336012)(5660300002)(8676002)(36756003)(26005)(2201001)(50226002)(478600001)(426003)(305945005)(4326008)(316002)(16586007)(6666004)(81156014)(68736007)(47776003)(7696005)(50466002)(110136005)(51416003)(356004)(14444005)(76176011)(86362001)(81166006)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3508; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 513dcee9-c9ce-4201-ba74-08d7164ba082
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3508; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3508:
X-Microsoft-Antispam-PRVS: <BN8PR12MB35084455792D5A4D550CBC88B0DE0@BN8PR12MB3508.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /ZOg5MhH4rD6a2K6KigSLxNDDVmMj8u2eluZdLr5IpTw2oV7AqJyZRO/SOaV7U8mPeXR3pekQYK3m+3PlEKrblJF/FgQeJq3+KiYX2720ih677KSvbl+g/H5iz54Qxk1SPTnzysU/+oub/QgWS554vqGYENeDU279zvxFQPC2PSsDDToZft2QBuoQOQE8dNk3ItX5h7NWyE799ODi118a0eRbj6IQEZIDZZUDKYR9f09sL+EASKyPTumLWcglxi/BOahuRb72HLWzCs2NjP5xh4dhL0kuietB8iAWi6tt+pdQDjfZma0LxxYInPp5M9m/sreXxvcGIbwDWiF3ngz+KUYKFh5zcoe+1kLV4Xn7+GRkXChumXqRk2ucEp7DJCom9kVDv+r4WcrTr5Vp+s4UkBiDDPwKgR9x/FL5RUg7uw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:43:56.6473 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 513dcee9-c9ce-4201-ba74-08d7164ba082
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3508
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78/JJes5SPKZrLJh2HKFOCXR0vLBTprI+YTalBMGzdM=;
 b=IXur74jzC+qULIawEMbJq1drJMRzcb0zvziXpRmhHRDKveIewgl6k80d7I6EWwagSkB3hSM4KbQjfnSy8Dzie9G/PlvfQLalZ73P8n2TBGL1Lx2fpfWj7c+jfYc0Gcfo5Jruq7b42eri/VHB7iWpPGEnNItNTDYMYJEfuYKP/TY=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaCB8IDEzICsrKysrKysrKysrKysKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmggICB8ICAyICsrCiAyIGZpbGVzIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdW1jLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1j
LmgKaW5kZXggZGZhMWEzOWU1N2FmLi4yNjA0ZjUwNzY4NjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdW1jLmgKQEAgLTIyLDE1ICsyMiwyOCBAQAogI2RlZmluZSBfX0FNREdQ
VV9VTUNfSF9fCiAKIHN0cnVjdCBhbWRncHVfdW1jX2Z1bmNzIHsKKwl2b2lkICgqcmFzX2luaXQp
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIAl2b2lkICgqcXVlcnlfcmFzX2Vycm9yX2Nv
dW50KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkJdm9pZCAqcmFzX2Vycm9yX3N0
YXR1cyk7CiAJdm9pZCAoKnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzKShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAkJCQkJdm9pZCAqcmFzX2Vycm9yX3N0YXR1cyk7CisJdm9pZCAoKmVuYWJs
ZV91bWNfaW5kZXhfbW9kZSkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCisJCQkJCXVpbnQz
Ml90IHVtY19pbnN0YW5jZSk7CisJdm9pZCAoKmRpc2FibGVfdW1jX2luZGV4X21vZGUpKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KTsKIH07CiAKIHN0cnVjdCBhbWRncHVfdW1jIHsKIAkvKiBt
YXggZXJyb3IgY291bnQgaW4gb25lIHJhcyBxdWVyeSBjYWxsICovCiAJdWludDMyX3QgbWF4X3Jh
c19lcnJfY250X3Blcl9xdWVyeTsKKwkvKiBudW1iZXIgb2YgdW1jIGNoYW5uZWwgaW5zdGFuY2Ug
d2l0aCBtZW1vcnkgbWFwIHJlZ2lzdGVyIGFjY2VzcyAqLworCXVpbnQzMl90IGNoYW5uZWxfaW5z
dF9udW07CisJLyogbnVtYmVyIG9mIHVtYyBpbnN0YW5jZSB3aXRoIG1lbW9yeSBtYXAgcmVnaXN0
ZXIgYWNjZXNzICovCisJdWludDMyX3QgdW1jX2luc3RfbnVtOworCS8qIFVNQyByZWdpc2VyIHBl
ciBjaGFubmVsIG9mZnNldCAqLworCXVpbnQzMl90IGNoYW5uZWxfb2ZmczsKKwkvKiBjaGFubmVs
IGluZGV4IHRhYmxlIG9mIGludGVybGVhdmVkIG1lbW9yeSAqLworCWNvbnN0IHVpbnQzMl90ICpj
aGFubmVsX2lkeF90Ymw7CisKIAljb25zdCBzdHJ1Y3QgYW1kZ3B1X3VtY19mdW5jcyAqZnVuY3M7
CiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuaAppbmRleCBkMjVhZTQxNGY0
ZDguLmJkZGFmMTRhNzdmOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dW1jX3Y2XzEuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5oCkBA
IC0zMSw2ICszMSw4IEBACiAjZGVmaW5lIFVNQ19WNl8xX0NIQU5ORUxfSU5TVEFOQ0VfTlVNCQk0
CiAvKiBudW1iZXIgb2YgdW1jIGluc3RhbmNlIHdpdGggbWVtb3J5IG1hcCByZWdpc3RlciBhY2Nl
c3MgKi8KICNkZWZpbmUgVU1DX1Y2XzFfVU1DX0lOU1RBTkNFX05VTQkJOAorLyogdG90YWwgY2hh
bm5lbCBpbnN0YW5jZXMgaW4gb25lIHVtYyBibG9jayAqLworI2RlZmluZSBVTUNfVjZfMV9UT1RB
TF9DSEFOTkVMX05VTQkoVU1DX1Y2XzFfQ0hBTk5FTF9JTlNUQU5DRV9OVU0gKiBVTUNfVjZfMV9V
TUNfSU5TVEFOQ0VfTlVNKQogLyogVU1DIHJlZ2lzZXIgcGVyIGNoYW5uZWwgb2Zmc2V0ICovCiAj
ZGVmaW5lIFVNQ19WNl8xX1BFUl9DSEFOTkVMX09GRlNFVAkJMHg4MDAKIAotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
