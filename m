Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB83FA5E58
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 02:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8EB89954;
	Tue,  3 Sep 2019 00:02:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800072.outbound.protection.outlook.com [40.107.80.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3A589954
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 00:02:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqWwsSmSJUeMLZuMLOwkK85E+pkKZHEJRkK/RMtcJhRDeqdQT4VY57T1kbTsIM6P3hR6bi8MgLsm6GNNB8FRbCs5fSWuojjcnWOWbfpRd2KcsTTuXcZ/3BjwsKNqnuZ4nWjLwiWiBA6Z8ZWodRUAE9d9xl8dxWP5n3zm4xLwnpvUxsGF28FonRaSa96c3XyVED6Vxe0kT/YAIeBD49x+xp+RITE+6O6sOdyyYHtPoe5IvdSJ5c8G0/zmRbse8hSyOTl9UABW8+qWNh0+PDcIh9n7OKGqN+4szof/XSHBhfZZKDUyaXawfQ6qfcKotsOhmL0G3oN6NCE/2lvks01gag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjUAx9tf5rrE5HmjYEVZXZxtFQ6WigC+OLHmjlYl+2k=;
 b=ctRHiUrCatngZPIUgNapunbnkXW1K4QgHlMzyK78N8LJ7ShuQS0Pyob6VLWdl0qwAuHrLjm+5AFxouZ5/c5FJIpl4LUUzTf/1/aGkN+hBXANlZx2/dHdAC94OFaqoFCWHjYbmOUWEeCVznDw3pa9os/8CNvdL+reIfvHc95CpcfPyKpv4+Fw+cs8Z3cGliOnmafzuqsumWKAyzuyRf8O+M6l2RHVtj1it+N77pCPAQzNvxuBSX0mOnXwcsdwttPGF47pAf6ZMx1m88mAx1iz4yGIaP3C29aB8FJUcPPgg6ucLzBJwFKAvLQKrjKGFw6lmejIQCF1ngB5fRH3xrFUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1818.namprd12.prod.outlook.com (10.175.92.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 3 Sep 2019 00:02:16 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 00:02:16 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 07/10] drm/amdgpu: init UMC & RSMU register base address
Thread-Topic: [PATCH 07/10] drm/amdgpu: init UMC & RSMU register base address
Thread-Index: AQHVYerYwQtswzQn90+X0bXMnljylw==
Date: Tue, 3 Sep 2019 00:02:16 +0000
Message-ID: <1567468894-11852-7-git-send-email-Hawking.Zhang@amd.com>
References: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::34) To DM5PR12MB1418.namprd12.prod.outlook.com
 (2603:10b6:3:7a::15)
x-originating-ip: [180.167.199.189]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd23d4c3-4743-4614-b676-08d73001fb06
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1818; 
x-ms-traffictypediagnostic: DM5PR12MB1818:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1818E4A210420D9754EE412FFCB90@DM5PR12MB1818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:262;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(99286004)(66446008)(36756003)(2501003)(478600001)(316002)(256004)(66946007)(14444005)(5660300002)(66476007)(53936002)(81166006)(26005)(8676002)(71200400001)(102836004)(81156014)(71190400001)(6486002)(66556008)(50226002)(186003)(8936002)(66066001)(25786009)(3846002)(6116002)(76176011)(6512007)(4744005)(6506007)(386003)(4326008)(86362001)(486006)(446003)(2616005)(305945005)(52116002)(7736002)(11346002)(476003)(110136005)(2906002)(14454004)(6636002)(64756008)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1818;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d/itvQ9BpWhZjMbCnz1x93FWSVuQzmE+ytV7nTFxDLhEJlv5JpiBOdeOsJaeFCh5LByyGy4swS2/APIj1eSjHSRz2HfSMHRCZpxOysEhCTm2y6wXeiuK5KjhzU+z/jUeQuB6TOcNO3MCkwT4vPYZIXjrQBpvuXFZT0I8ff2buvgw8Yhk8WiTviB3ScDV65lySG1ZJ7pDl1aIyoSEoyi5HKRa4Am0IwW2sj8BDjnypWsmfutmcEkVblyd2StyVdKD7k0kYjD2w7RT0rC61VMsPVaRQ5kzkCC/y2aMoH6ukew+kJFUlps0dzdpvwltGimcfRYky8GrnU7fGVs8hogsUr/IdQ8D/ggfqGNTS/RSGeY0TrWR5tQNqm87Vj8zmtCZSRnf8tDMKdDbEM+EK9meryOciHA2AZlJuBfdHDC8HXw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd23d4c3-4743-4614-b676-08d73001fb06
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 00:02:16.5134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k8x9xoVu3YSQfCYpJijFM/ZbcEnWgd6KK1TxmCqnGN+saTvjl0PQP+SQl4WXrlawWrbvdpRcdNMUU0yXvrFfdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjUAx9tf5rrE5HmjYEVZXZxtFQ6WigC+OLHmjlYl+2k=;
 b=s6dt98V942SEBhxIZICDeS8cOZNvpfw+jlPTESLDFa9yo5iwXeuN4CfLpg9HVDrWFv9HWITO4QgCONWbqLQuri3+uBbzuGkqlNTBGG0e1DY2AbIHBiYCR4KC0awQbJFmCq1W9x+8Tem2nyxrlE6/4gYS7raMfmGHZOqrjrlDIQU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VU1DIFJBUyBmZWF0dXJlIHJlcXVpcmVzIGFjY2VzcyB0byBVTUMgJiBSU01VIHJlZ2lzdGVycwoK
U2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FyY3RfcmVnX2luaXQuYyB8IDIgKysKIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hcmN0X3JlZ19pbml0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
cmN0X3JlZ19pbml0LmMKaW5kZXggNDg1Mzg5OS4uZTYyNjA5ZCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYXJjdF9yZWdfaW5pdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FyY3RfcmVnX2luaXQuYwpAQCAtNTIsNiArNTIsOCBAQCBpbnQgYXJjdF9y
ZWdfYmFzZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlhZGV2LT5yZWdfb2Zm
c2V0W1NETUE3X0hXSVBdW2ldID0gKHVpbnQzMl90ICopKCYoU0RNQTdfQkFTRS5pbnN0YW5jZVtp
XSkpOwogCQlhZGV2LT5yZWdfb2Zmc2V0W1NNVUlPX0hXSVBdW2ldID0gKHVpbnQzMl90ICopKCYo
U01VSU9fQkFTRS5pbnN0YW5jZVtpXSkpOwogCQlhZGV2LT5yZWdfb2Zmc2V0W1RITV9IV0lQXVtp
XSA9ICh1aW50MzJfdCAqKSgmKFRITV9CQVNFLmluc3RhbmNlW2ldKSk7CisJCWFkZXYtPnJlZ19v
ZmZzZXRbVU1DX0hXSVBdW2ldID0gKHVpbnQzMl90ICopKCYoVU1DX0JBU0UuaW5zdGFuY2VbaV0p
KTsKKwkJYWRldi0+cmVnX29mZnNldFtSU01VX0hXSVBdW2ldID0gKHVpbnQzMl90ICopKCYoUlNN
VV9CQVNFLmluc3RhbmNlW2ldKSk7CiAJfQogCXJldHVybiAwOwogfQotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
