Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD86BB5E11
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 09:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EBC6EE1E;
	Wed, 18 Sep 2019 07:32:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780081.outbound.protection.outlook.com [40.107.78.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDFF6EE1E
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 07:32:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZZRQp+cBNearWa5q374pGoEWaAqe9kSGIiRcxzyAZ+zBR8LYAekqRhYmVkQVCO7JsFRy6yGteGThatko3BAFCebLVZJdDKvUr4Tw0DHhqIHa1kkW6wDH/9kENVTrOZPO4vIZB11mQvRs3qJPIMisdy31C4Y7Ofe4yn7373JXpoA5tDiqBgpV93vgypZf2O23GwRo9qkk5Z+yG+MqBPRb8wdRIKNwgPuHXz9tNApZwbf/fBYK5+nfdctHvcm2unNCQBiRUVaPP8hzvKdrAk8UUaRDBgtXZRJb+Xoh+yh41Oo7nuAZaBnASVsep53mm7efSjmH+JVwn5n9pjepgbzIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPxkxrXCHryRRVKi3URormJ5pFkgG73QsaOyM71rWi8=;
 b=nYEzWdFAZojVEZehVwx9jwDTOFH6a0PH1bT/kmmiLKwioHdOpGD/HLSOjU/3uyUzKXM4tJnSiVJgK5i8DOWgM9KpGJu2YVUiFNyB2F+We+mL30nyzPXEulw0Mp96RuY9HQsqfZctXnudlv1CEHnrnLZPOUOWqxyFnuBtCVUqYvJkOcDoNLMEMWTY5uvyktL9rxlaux7BJ4Q1EuzHjIkuCqWeu//wd6eLeLaeyg9lB68WRc4/G8KN0DA0IhgeYO5A5YKIiQ4Cw0UJcg6XpY3lbPdPnFxFP1T3V1oPNJWqAOmjS4k0FmwXF1CgQTniIWbz5dlZcXZwkr3CNHWQuqD4Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3675.namprd12.prod.outlook.com (10.255.76.80) by
 DM6PR12MB3722.namprd12.prod.outlook.com (10.255.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Wed, 18 Sep 2019 07:32:08 +0000
Received: from DM6PR12MB3675.namprd12.prod.outlook.com
 ([fe80::79ff:58ff:d106:e77]) by DM6PR12MB3675.namprd12.prod.outlook.com
 ([fe80::79ff:58ff:d106:e77%3]) with mapi id 15.20.2241.026; Wed, 18 Sep 2019
 07:32:08 +0000
From: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, "Teng, Rui" <Rui.Teng@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>, "Cui, Flora" <Flora.Cui@amd.com>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Topic: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Index: AQHVbfIsKnOwH2bp1EW50Z76zZ7KZacxCM9w
Date: Wed, 18 Sep 2019 07:32:08 +0000
Message-ID: <DM6PR12MB367564A4AAC093F841D88018BB8E0@DM6PR12MB3675.namprd12.prod.outlook.com>
References: <20190918072445.3559-1-Jack.Zhang1@amd.com>
In-Reply-To: <20190918072445.3559-1-Jack.Zhang1@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cf49fc4-5b2f-4b58-f1cc-08d73c0a5019
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3722; 
x-ms-traffictypediagnostic: DM6PR12MB3722:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3722D0F83D9544763EA7C465BB8E0@DM6PR12MB3722.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(199004)(189003)(13464003)(25786009)(8936002)(99286004)(5660300002)(76116006)(7696005)(8676002)(3846002)(2906002)(256004)(76176011)(81156014)(81166006)(6116002)(2501003)(110136005)(33656002)(52536014)(6636002)(316002)(186003)(11346002)(9686003)(55016002)(102836004)(26005)(6436002)(66476007)(86362001)(14454004)(66066001)(7736002)(305945005)(64756008)(446003)(486006)(229853002)(66556008)(4326008)(478600001)(71190400001)(71200400001)(66446008)(74316002)(476003)(6506007)(53546011)(66946007)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3722;
 H:DM6PR12MB3675.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qapADCyiA8cCIP2zLHbhp9MST5l9jP3+x5xR+CcZx2c6eXOMUVInF3wtTcHaBCwcpL4BzkqbnXxJ8043FjnHfS5hVkOdZd5K/A2WwOY8x2wm0+5boJ9tdkutypew++gdNIHWcpA2tj9JK/4t0z3ZJlhuVZi5ViZ+IvLVSpwPecuh7SoCwTA6xOUPXXuY2VWe3VW/ZMcXOSIPlivCBEBxZJy3SWUv3fFkQqMYlRyekVDa7Fk0D1QVv6BAFPr1axG57CQhab8DaXzZ/TuDU0cke4Gz2eGTMJ86r9nK/BSn1OGZkZB/5qCFho8R+NTtu7RgPfcWHCW+cdX/f3zVz8yfPCnHtN304vkLE5k6fJ9LFkHj+b4WSBl59pgfCnWJqP/4KgDT7STmOUIVogiz1Nn+KQuFlbK9TZhRhRL7kAh2iNA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf49fc4-5b2f-4b58-f1cc-08d73c0a5019
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 07:32:08.5942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t8w+z2TMMAcLPodgC8gLlBE5hvs27LGNmYsotO2NnwDFoUUXhRaYi+wMykaqmTPr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3722
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPxkxrXCHryRRVKi3URormJ5pFkgG73QsaOyM71rWi8=;
 b=z+mXZZDcNOSafIUvzgBpcL7oz6Z2WRraudUPcU1qhlrHd2J9An1/kGxJuE2RZrHGQ1tZtN+6yZIf/BgvrXt0FUFvW5tTlH4OG/QAONYLUHp31FxyRjQ4S5y8rq0rGfdpRrt6eoIMWgYK8rD5CzmpZRASA8PLzU8Xn7A09TIEUHE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Zhang1@amd.com; 
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

SGksIENocmlzdGlhbiBhbmQgZm9sa3MsDQoNCkluIHZpcnR1YWwgbWFjaGluZXMoc3VjaCB2aXJ0
LW1hbmFnZXIpLCB0aGVyZSdzIGFsd2F5cyBhIHZpcnR1YWwgZ3JhcGhpY3MgZGV2aWNlIGV4aXN0
ZWQgbGlrZSAicXhsIiBhcyB0aGUgZGVmYXVsdCBnZnggZGV2aWNlLg0KU28gdW5kZXIgc3VjaCBj
b25kaXRpb24sIHdlIGJlbGlldmUgaXQncyByZWFzb25hYmxlIHRvIHVubG9hZCBhbWRncHUgZHJp
dmVyIGFzIGl0IGlzIG5vdCB0cmVhdGVkIGFzIHRoZSBkZWZhdWx0IGZiY29uIGRldmljZS4NCg0K
V291bGQgeW91IHBsZWFzZSBoZWxwIHRvIHJldmlldyB0aGlzIHBhdGNoPw0KDQpCZXN0IHdpc2hl
cywNCkphY2sNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEphY2sgWmhhbmcg
PEphY2suWmhhbmcxQGFtZC5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTgsIDIw
MTkgMzoyNSBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogWmhhbmcs
IEphY2sgKEppYW4pIDxKYWNrLlpoYW5nMUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0v
YW1kZ3B1L3NyaW92OiBvbWl0IGZiY29uIGVycm9yIHVuZGVyIHNyaW92IG9yIHBhc3N0aHJvdWdo
DQoNCkluIHZpcnR1YWwgbWFjaGluZSwgdGhlcmUgd291bGQgYmUgYSBxeGwgb3IgY2lycnVzIGdy
YXBoaWNzIGRldmljZSBhcyB0aGUgZGVmYXVsdCBtYXN0ZXIgZmJjb24gZGV2aWNlLg0KDQpTbyBm
b3IgUEYocGFzc3Rocm91Z2ggbW9kZSkgb3IgU1JJT1YgVkYsIGl0IGlzIHJlYXNvbmFibGUgdG8g
dW5sb2FkIGFtZGdwdSBkcml2ZXIuIEFtZGdwdSBkb2Vzbid0IGhhdmUgdG8gYmUgdGhlIG9ubHkg
ZmJjb24gZGV2aWNlIHVuZGVyIHRoaXMgY29uZGl0aW9uLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYWNr
IFpoYW5nIDxKYWNrLlpoYW5nMUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jIHwgNSArKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMNCmluZGV4IDQyMDg4OGUuLmFkYTJiMjUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kcnYuYw0KQEAgLTExMDMsOCArMTEwMyw5IEBAIHN0YXRpYyB2b2lkDQogYW1k
Z3B1X3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpICB7DQogCXN0cnVjdCBkcm1fZGV2
aWNlICpkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7DQotDQotCURSTV9FUlJPUigiRGV2aWNl
IHJlbW92YWwgaXMgY3VycmVudGx5IG5vdCBzdXBwb3J0ZWQgb3V0c2lkZSBvZiBmYmNvblxuIik7
DQorCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZGV2LT5kZXZfcHJpdmF0ZTsNCisJaWYg
KCFhbWRncHVfc3Jpb3ZfdmYoYWRldikgJiYgIWFtZGdwdV9wYXNzdGhyb3VnaChhZGV2KSkNCisJ
CURSTV9FUlJPUigiRGV2aWNlIHJlbW92YWwgaXMgY3VycmVudGx5IG5vdCBzdXBwb3J0ZWQgb3V0
c2lkZSBvZiANCitmYmNvblxuIik7DQogCWRybV9kZXZfdW5wbHVnKGRldik7DQogCWRybV9kZXZf
cHV0KGRldik7DQogCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsNCi0tDQoyLjcuNA0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
