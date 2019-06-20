Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 722E34C76D
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 08:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173B76E422;
	Thu, 20 Jun 2019 06:23:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740045.outbound.protection.outlook.com [40.107.74.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6186E422
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 06:23:04 +0000 (UTC)
Received: from MN2PR12MB3408.namprd12.prod.outlook.com (20.178.243.85) by
 MN2PR12MB3213.namprd12.prod.outlook.com (20.179.81.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Thu, 20 Jun 2019 06:23:02 +0000
Received: from MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::748a:3b89:f005:2e8f]) by MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::748a:3b89:f005:2e8f%5]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 06:23:02 +0000
From: "Huang, Trigger" <Trigger.Huang@amd.com>
To: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/sriov: fix Tonga load driver failed
Thread-Topic: [PATCH] drm/amdgpu/sriov: fix Tonga load driver failed
Thread-Index: AQHVJy4j+t/zO14gjkaUkiNAQQdzbKakErjQ
Date: Thu, 20 Jun 2019 06:23:02 +0000
Message-ID: <MN2PR12MB3408354EEA8FD39A7A78EFEAFEE40@MN2PR12MB3408.namprd12.prod.outlook.com>
References: <1561010688-5943-1-git-send-email-Jack.Zhang1@amd.com>
In-Reply-To: <1561010688-5943-1-git-send-email-Jack.Zhang1@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ea9288f-b873-4ebb-dc40-08d6f547bfb0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3213; 
x-ms-traffictypediagnostic: MN2PR12MB3213:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB32139295FA8848FF7D694895FEE40@MN2PR12MB3213.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(376002)(396003)(366004)(136003)(13464003)(199004)(189003)(316002)(66446008)(71200400001)(73956011)(2906002)(66946007)(76116006)(66066001)(66476007)(5660300002)(110136005)(102836004)(476003)(2501003)(486006)(11346002)(53546011)(71190400001)(26005)(6506007)(66556008)(7696005)(186003)(99286004)(76176011)(64756008)(33656002)(6246003)(86362001)(81156014)(68736007)(25786009)(7736002)(53936002)(74316002)(9686003)(446003)(305945005)(6306002)(256004)(4326008)(81166006)(6116002)(3846002)(52536014)(72206003)(14454004)(966005)(478600001)(229853002)(55016002)(6436002)(8936002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3213;
 H:MN2PR12MB3408.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /pgyYPmBY8F6oiebjzFADxMtKPL8GTn6nqdM2hdrGcJbx1LHtgEG85uxdKvI2fN887Avni1/abPdLBFuFirvNdCQo2ZXXdky/qnrBtpW65zN/wJ+fEPJ7pnj1471QZUCLpOJNeCa6z/JxBjGRyQa5wa5c7ichfiMsLZz9nGiZlZH6v6sYzaZ3r/zTN9aFTLqU9fQlFZrg8iMp/Q+GgqWCQ5HMo0LGeLtdHuBsfVjbt7dlG3ZdrtiXtHkjZifeJSShOWhVIE9J6xoJWw3N6/repKEK98uLKnLzwIhmUQ+55XkP27ERvGy2NMOfA+JIIDxJcS+H3c4H6HuUDcuIwe2AZDovLPgYV5z+yTMeHgTDMCHS7CaYj1v/HkYtBa8nZUCVfiUQiGAQK2PagihHdpvq1W7Ut35jyJxqaz3iZjneAw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea9288f-b873-4ebb-dc40-08d6f547bfb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 06:23:02.6036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: triggerh@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3213
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQE/VPIugfgbBkJgEQPdfL7k/AyRqj8sFhe1VbtjNCw=;
 b=F+2UgKgO1kazY8qD9zcp74/xUH574vQ10wLqLYzKAhBwJeWC/cScI6vbPyEVVxhJnEUk4f8gH10TUUknTaY/3EZa2NDNoihJqQTsgK8v7Djf/7PfvdtFF71znMENFgFejL7VoOo1fKvywNzHJi6e97YaIxqx9G6y+nBegom2TMU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Trigger.Huang@amd.com; 
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
Cc: "Zhang, Jack \(Jian\)" <Jack.Zhang1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFRyaWdnZXIgSHVhbmcgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4NCg0KVGhh
bmtzICYgQmVzdCBXaXNoZXMsDQpUcmlnZ2VyIEh1YW5nDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YgSmFjayBaaGFuZw0KU2VudDogVGh1cnNkYXksIEp1bmUgMjAsIDIw
MTkgMjowNSBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogWmhhbmcs
IEphY2sgKEppYW4pIDxKYWNrLlpoYW5nMUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0v
YW1kZ3B1L3NyaW92OiBmaXggVG9uZ2EgbG9hZCBkcml2ZXIgZmFpbGVkDQoNClRvbmdhIHNyaW92
IG5lZWQgdG8gdXNlIHNtdSB0byBsb2FkIGZpcm13YXJlLg0KUmVtb3ZlIHNyaW92IGZsYWcgYmVj
YXVzZSB0aGUgZGVmYXVsdCByZXR1cm4gdmFsdWUgaXMgemVyby4NCg0KU2lnbmVkLW9mZi1ieTog
SmFjayBaaGFuZyA8SmFjay5aaGFuZzFAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wbS5jIHwgMiAtLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYw0KaW5kZXggMDkzY2Vm
ZC4uNDY5Y2RhOSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wbS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYw0KQEAg
LTI3NTUsOCArMjc1NSw2IEBAIGludCBhbWRncHVfcG1fbG9hZF9zbXVfZmlybXdhcmUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90ICpzbXVfdmVyc2lvICB7DQogCWludCByOw0K
IA0KLQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQ0KLQkJcmV0dXJuIDA7DQogDQogCWlmIChh
ZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MgJiYgYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5sb2Fk
X2Zpcm13YXJlKSB7DQogCQlyID0gYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5sb2FkX2Zpcm13
YXJlKGFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGUpOw0KLS0NCjIuNy40DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlz
dA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
