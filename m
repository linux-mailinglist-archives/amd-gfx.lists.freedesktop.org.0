Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 678A8BEE4B
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 11:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F186ECA7;
	Thu, 26 Sep 2019 09:19:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780089.outbound.protection.outlook.com [40.107.78.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63B76ECA7
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 09:19:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDdK3p/ld7bOgdXlGF1Ydhf29UeXa0qhwu459i6iggLiwXAICiFmukr5D8Mj9cUAy+qg2w0NmcWuNA+OdIK4kkJwRLHPMECh1gOhoD6gv0trgf7KyyY+6moJqSUjN5ZoWO3qLFLxy+3lVY+YXvuIrZEW1yro8IWDey9UhWCXn7eCqj/M6phDzdZOyyZDQsnj1KyocSNPL57V2lVgqHlc7q6ISCUfjkhtCuGCf/KZCE++zeljVjM7tgHgbFqKaiN/h9CQrdV9VHZCDft0W95tLL+aMKebDOQ8UXU7JkzhNU+q1izeSe5NPlTinTwcs74lDPhyMt+HtAY7ve4HvYE5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+oqH5LtDS4erhjHB/g3O8Pdls5MlGEfZuUx2cbuCVo=;
 b=VuOkrUcGzfsWwV8y7xE0afgjOMOSCGJkzqvkewpj3ts/E9uvLgtnbHUWL/zw6BzgLMHxBIcvfZSmr4zQEut6xh2Ye9z9LbFoL3qq42/n9pZ6U0mCTVqMFEloAZb7PdU9NQ8pXlfVf43dluCEPMnwUi8AqBtLvbih16s529yxu1IRIuZWe15Z0GhpCINnyjE4gQmhcCQXzICp1TMKjLYyaCQgficTnZNhrX43a1Cx3LeHkxI0dRxEcV6HCiuTT6GQwc54hrISyBGdhkd3V8gYVCkgzvtbAMNX2HFUUAlfOW/Ygvyro60/fYz/LTnA7G1muK6OC72yKFd/Ttomh9w9Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3486.namprd12.prod.outlook.com (20.178.241.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Thu, 26 Sep 2019 09:19:27 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::19b5:2b97:5b3c:8b2a]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::19b5:2b97:5b3c:8b2a%7]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 09:19:27 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/amd/powerplay: change metrics update period from
 1ms to 100ms
Thread-Topic: [PATCH v2] drm/amd/powerplay: change metrics update period from
 1ms to 100ms
Thread-Index: AQHVdErDTYC4cxsAwEi6651LgmXZ/qc9rSIw
Date: Thu, 26 Sep 2019 09:19:27 +0000
Message-ID: <MN2PR12MB3598598C2A9576E8C8FC780E8E860@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190926091359.5467-1-kevin1.wang@amd.com>
In-Reply-To: <20190926091359.5467-1-kevin1.wang@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76cc20e5-1405-48e0-91d1-08d74262a113
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3486; 
x-ms-traffictypediagnostic: MN2PR12MB3486:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34867236301E263F11258BD88E860@MN2PR12MB3486.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(189003)(199004)(13464003)(76176011)(4326008)(6436002)(9686003)(14444005)(6246003)(55016002)(66066001)(256004)(71200400001)(2906002)(14454004)(15650500001)(110136005)(316002)(3846002)(6116002)(6506007)(64756008)(478600001)(66446008)(52536014)(66946007)(2501003)(76116006)(25786009)(66556008)(66476007)(53546011)(81156014)(81166006)(71190400001)(8676002)(33656002)(186003)(26005)(102836004)(8936002)(99286004)(5660300002)(7736002)(86362001)(229853002)(7696005)(74316002)(486006)(476003)(305945005)(11346002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3486;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xPTOWfVgQ4HFrUpZlDRqH+45x+jv4w5CtF7ItMHdSWTK/mXOXbMVwHSrsOrNgaJENnMpYcO1ozkFQRcmru3S9OMEb9RJm/qcHlTLLsX3ghYKnjegBJHhuGIc7i3XQ/pgJa5qSambPfRGJ4ZlwaaQrxSu9lE2fhqn+a1qZNKeN/mJ50WtxIVx/qHsljRrHM0++aAwIRoQkbn609s77vCNyMlrh2ZU7eFN6yIP+gGj3ZSYC5N8MJNUjLghePM1LuNfhlODZUaAClbIoVAHGQ2pJgVujTkJ2Tcd/AOYdZU/mZhcYbLRUM+dob/Sg6z0fBr0C1feQRf31Zzj/bBABKvx1Ri/N1GhpqZxZs1iWvy5Mz2Usu/qFmO9hwvhn8/D5+ztmxiw8tPnosM+DvIWFDfk/ubL2owGwhs49+um4ZSD6Xc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cc20e5-1405-48e0-91d1-08d74262a113
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 09:19:27.1467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TtJ/+I4h133+2dnGOreUd6G2GqrAU0BcqN02wuajKAMbpoJ6L3nzrFgGD4gpRlhC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3486
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+oqH5LtDS4erhjHB/g3O8Pdls5MlGEfZuUx2cbuCVo=;
 b=lfCVpOsu+5foC2g2xFcJDPFhPsabQJuK3m3b2oy8BmA5TkIqiD0VBHcf2SErAX2Ou3qk1NQkmS+V8clVwa29+IYRXAqsK/a9CidsHhUAFkQfXR3HcwSZdSdmuzEsgcRTxU+FsVFz3FQToGYYdINa/1d61uJFKV9oDMdq6ZY41aE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Tm90ZTogMW1zIHdvcmtzIGZvciBuYXZpMTAgYnV0IDEwMG1zIHdvcmtzIGZvciBuYXZpMTQuClJl
dmlld2VkLWJ5OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGguZmVuZ0BhbWQuY29tPgoKCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCkZyb206IFdhbmcsIEtldmluKFlhbmcpIApTZW50OiBUaHVyc2Rh
eSwgU2VwdGVtYmVyIDI2LCAyMDE5IDU6MTQgUE0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEZlbmcsIEtlbm5ldGgg
PEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgV2FuZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFt
ZC5jb20+ClN1YmplY3Q6IFtQQVRDSCB2Ml0gZHJtL2FtZC9wb3dlcnBsYXk6IGNoYW5nZSBtZXRy
aWNzIHVwZGF0ZSBwZXJpb2QgZnJvbSAxbXMgdG8gMTAwbXMKCnYyOgpjaGFuZ2UgcGVyaW9kIGZy
b20gMTBtcyB0byAxMDBtcyAodHlwbyBlcnJvcikKCnRvbyBoaWdoIGZyZXF1ZW5jZSB0byB1cGRh
dGUgbWVydHJpY3MgdGFibGUgd2lsbCBjYXVzZSBzbXUgZmlybXdhcmUgZXJyb3Isc28gY2hhbmdl
IG1lcnRyaWNzIHRhYmxlIHVwZGF0ZSBwZXJpb2QgZnJvbSAxbXMgdG8gMTAwbXMgKG5hdmkxMCwg
MTIsIDE0KQoKU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggNGMyOGFhZGVmNTA0Li4wYTQ0
YWE4MWQ0MzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMK
QEAgLTU0OCw3ICs1NDgsNyBAQCBzdGF0aWMgaW50IG5hdmkxMF9nZXRfbWV0cmljc190YWJsZShz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnNtdV90
YWJsZT0gJnNtdS0+c211X3RhYmxlOwogCWludCByZXQgPSAwOwogCi0JaWYgKCFzbXVfdGFibGUt
Pm1ldHJpY3NfdGltZSB8fCB0aW1lX2FmdGVyKGppZmZpZXMsIHNtdV90YWJsZS0+bWV0cmljc190
aW1lICsgSFogLyAxMDAwKSkgeworCWlmICghc211X3RhYmxlLT5tZXRyaWNzX3RpbWUgfHwgdGlt
ZV9hZnRlcihqaWZmaWVzLCAKK3NtdV90YWJsZS0+bWV0cmljc190aW1lICsgbXNlY3NfdG9famlm
ZmllcygxMDApKSkgewogCQlyZXQgPSBzbXVfdXBkYXRlX3RhYmxlKHNtdSwgU01VX1RBQkxFX1NN
VV9NRVRSSUNTLCAwLAogCQkJCSh2b2lkICopc211X3RhYmxlLT5tZXRyaWNzX3RhYmxlLCBmYWxz
ZSk7CiAJCWlmIChyZXQpIHsKLS0KMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
