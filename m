Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12418A83EB
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 15:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCE489873;
	Wed,  4 Sep 2019 13:46:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730054.outbound.protection.outlook.com [40.107.73.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E440489873
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 13:46:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PT9AZMQimbSBP12yDnFZH4vyRGECaC3YrMc3KbUaphbCSjqZbTXvQ7lGJr5lg9eAm/427nZ+7ORFeNLvHPYs5/VY1/mXfaeQGaUnPAxdbRYvxSPZuC3VbHbF1rtCc+vPNOQNDDFvSUc8R8c6owvH/ag3Rl4jLHblevucOoSKcriUf4V+R1ADEP1stiKj9ofrKbk2GebxF/ZGX8OufpsbaEuWH1N593X69ii8x+MLZraZDP1KP0y2Odphw63FLxTalgwFB7bHsRxe6ttvRHZ6FHGc+nJICwWSHpKuiXmJAaQUPA8hEsEP1eJbYjHQRZ4Qk1qpHTsgt8PtFqeREIeuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+O9g68gZ8G2CmugvXsTu4XR2a3IH5RGKzXa++PBFO7w=;
 b=cfvuIS+X/CCJ/su0hYLTEiPZ9mrXw5Wz1gleHZPHj9CJdcgGqUsf+2wUIoePgE92qyAheQ72l20f5MAObzcV9EbQ74EgIs12qaiBnA5l0XQcwOGea/tJkMuON6tth3EhAn+takRbCo3Ysy7Lrd/bHwDhl+H/+pDaADfGgLPqUXRRbr/GI4nfcdO/ABagMvXUWp+Q0Pp/QnMhG0F2DQy9qCwtNkLlNnrIIz2Cx61qLxOixVWdlHo8nB2dznkeQiQn2N56Qq7dViOcEvjrvimeuGr675ULAp8IbhnFnf/LvbB1AkeGcp/syqEVhX37/tMJckEGW1JIOlks8Oic0ntchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3037.namprd12.prod.outlook.com (20.178.240.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Wed, 4 Sep 2019 13:46:21 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 13:46:21 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: implement sysfs for getting dpm
 clock
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: implement sysfs for getting dpm
 clock
Thread-Index: AQHVYuY2FSBBNJmbLkqF75nKz8IVPKcbiGFg
Date: Wed, 4 Sep 2019 13:46:21 +0000
Message-ID: <MN2PR12MB3309E77A566ECB7B1E0BED58ECB80@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1567576882-13685-1-git-send-email-Prike.Liang@amd.com>
 <1567576882-13685-2-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1567576882-13685-2-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1de80345-7c98-4d14-e606-08d7313e4502
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3037; 
x-ms-traffictypediagnostic: MN2PR12MB3037:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB303742EF61EE5A0E99D687A0ECB80@MN2PR12MB3037.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:119;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(189003)(199004)(13464003)(14454004)(102836004)(53546011)(6506007)(186003)(476003)(486006)(2501003)(4326008)(86362001)(33656002)(7696005)(14444005)(26005)(2906002)(11346002)(446003)(76176011)(966005)(71190400001)(6246003)(66446008)(71200400001)(66946007)(66556008)(64756008)(76116006)(5660300002)(66476007)(8936002)(478600001)(66066001)(55016002)(6116002)(316002)(81156014)(110136005)(6306002)(99286004)(6436002)(54906003)(53936002)(9686003)(8676002)(25786009)(305945005)(74316002)(7736002)(81166006)(229853002)(3846002)(256004)(52536014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3037;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CMSUD7mdrj+fBb6lyt0rsNjBObFn5alSTRyynqWfYvpGD9g42CcyItpKd4CPANLQnE34eqtpLLx+pLmlVWX2W0waknpZJUZ6mFJO+HsgqOfKvbab7VTSrYYDxrFJOXvCQ9qDPDHeG4BK95Fse6W5lpOVTLwQ6WOyww0Yt3ihGpmYOnnKkfQJgNQno46u8oj6OiPwkrTy4Wjy3NC0BSQyLhUe/JD0IJRzHji2wfb8OYGqztUQfbvPW0GLJ/t8DOv7ejOoa558jCi0dIYK0TiIT+QBy3oKa7WemsacpbyzfY8I4fuDoahXe1udkXUcfrU5qzkY1ma+RxNv+TPinQh+cJX27785bc6q8vmJ0JUeG95hAreofhHNh6iJ7PwIleWeVd+1WBL+Hp0z3XuZcyn2fPz+o3YqbrDDscDLby+dlwc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de80345-7c98-4d14-e606-08d7313e4502
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 13:46:21.0416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xL/Qv5Iu2T6lIb42h5ENAEPnzCqwq3OUkxcQEBBC25bARcIvK2fItgRd8jrqgjtTqEAtY6JllOsCQTCclpiszQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3037
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+O9g68gZ8G2CmugvXsTu4XR2a3IH5RGKzXa++PBFO7w=;
 b=bsVaRcxH8+Q/x5eZ6CsLfcfJptwrysUqLS1PW8ErerVf+bUSwkB2zAdkL6LAaTpGgVE1Gg8PeQTOactwzpQKhWp13XbDgQRA60+fD2THmCIcQPVZ/WKJAVDVgxcGkEB0+Lf874YlcumzMdz6E6z7mVtMgfpwl6H/hwD3YTGlJsw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Liang,
 Prike" <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTGlhbmcsIFByaWtlDQpTZW50OiBXZWRuZXNkYXks
IFNlcHRlbWJlciA0LCAyMDE5IDI6MDIgQU0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47
IExpYW5nLCBQcmlrZSA8UHJpa2UuTGlhbmdAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAyLzJd
IGRybS9hbWQvcG93ZXJwbGF5OiBpbXBsZW1lbnQgc3lzZnMgZm9yIGdldHRpbmcgZHBtIGNsb2Nr
DQoNCldpdGggdGhlIGNvbW1vbiBpbnRlcmZhY2UgcHJpbnRfY2xrX2xldmVscyBjYW4gZ2V0IHRo
ZSBmb2xsb3dpbmcgZHBtIGNsb2NrOg0KDQotcHBfZHBtX2RjZWZjbGsNCi1wcF9kcG1fZmNsaw0K
LXBwX2RwbV9tY2xrDQotcHBfZHBtX3NjbGsNCi1wcF9kcG1fc29jY2xrDQoNClNpZ25lZC1vZmYt
Ynk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPg0KUmV2aWV3ZWQtYnk6IEV2YW4g
UXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9yZW5vaXJfcHB0LmMgfCA3MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuaCB8IDIyICsrKysrKysrKy0N
CiAyIGZpbGVzIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYw0KaW5kZXggODcyNTk4Yy4u
NzRlODU4OSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9p
cl9wcHQuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5j
DQpAQCAtMTc3LDEyICsxNzcsODIgQEAgc3RhdGljIGludCByZW5vaXJfZ2V0X2RwbV91Y2xrX2xp
bWl0ZWQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90ICpjbG9jaywNCiANCiB9DQog
DQorc3RhdGljIGludCByZW5vaXJfcHJpbnRfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwNCisJCQllbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwgY2hhciAqYnVmKSB7DQorCWlu
dCBpLCBzaXplID0gMCwgcmV0ID0gMDsNCisJdWludDMyX3QgY3VyX3ZhbHVlID0gMCwgdmFsdWUg
PSAwLCBjb3VudCA9IDAsIG1pbiA9IDAsIG1heCA9IDA7DQorCURwbUNsb2Nrc190ICpjbGtfdGFi
bGUgPSBzbXUtPnNtdV90YWJsZS5jbG9ja3NfdGFibGU7DQorCVNtdU1ldHJpY3NfdCBtZXRyaWNz
ID0gezB9Ow0KKw0KKwlpZiAoIWNsa190YWJsZSB8fCBjbGtfdHlwZSA+PSBTTVVfQ0xLX0NPVU5U
KQ0KKwkJcmV0dXJuIC1FSU5WQUw7DQorDQorCXJldCA9IHNtdV91cGRhdGVfdGFibGUoc211LCBT
TVVfVEFCTEVfU01VX01FVFJJQ1MsDQorCQkJICAgICAgICh2b2lkICopJm1ldHJpY3MsIGZhbHNl
KTsNCisJaWYgKHJldCkNCisJCXJldHVybiByZXQ7DQorDQorCXN3aXRjaCAoY2xrX3R5cGUpIHsN
CisJY2FzZSBTTVVfR0ZYQ0xLOg0KKwljYXNlIFNNVV9TQ0xLOg0KKwkJLyogcmV0aXJ2ZSB0YWJs
ZSByZXR1cm5lZCBwYXJhbXRlcnMgdW5pdCBpcyBNSHogKi8NCisJCWN1cl92YWx1ZSA9IG1ldHJp
Y3MuQ2xvY2tGcmVxdWVuY3lbQ0xPQ0tfR0ZYQ0xLXTsNCisJCXJldCA9IHNtdV9nZXRfZHBtX2Zy
ZXFfcmFuZ2Uoc211LCBTTVVfR0ZYQ0xLLCAmbWluLCAmbWF4KTsNCisJCWlmICghcmV0KSB7DQor
CQkJLyogZHJpdmVyIG9ubHkga25vdyBtaW4vbWF4IGdmeF9jbGssIEFkZCBsZXZlbCAxIGZvciBh
bGwgb3RoZXIgZ2Z4IGNsa3MgKi8NCisJCQlpZiAoY3VyX3ZhbHVlICA9PSBtYXgpDQorCQkJCWkg
PSAyOw0KKwkJCWVsc2UgaWYgKGN1cl92YWx1ZSA9PSBtaW4pDQorCQkJCWkgPSAwOw0KKwkJCWVs
c2UNCisJCQkJaSA9IDE7DQorDQorCQkJc2l6ZSArPSBzcHJpbnRmKGJ1ZiArIHNpemUsICIwOiAl
dU1oeiAlc1xuIiwgbWluLA0KKwkJCQkJaSA9PSAwID8gIioiIDogIiIpOw0KKwkJCXNpemUgKz0g
c3ByaW50ZihidWYgKyBzaXplLCAiMTogJXVNaHogJXNcbiIsDQorCQkJCQlpID09IDEgPyBjdXJf
dmFsdWUgOiBSRU5PSVJfVU1EX1BTVEFURV9HRlhDTEssDQorCQkJCQlpID09IDEgPyAiKiIgOiAi
Iik7DQorCQkJc2l6ZSArPSBzcHJpbnRmKGJ1ZiArIHNpemUsICIyOiAldU1oeiAlc1xuIiwgbWF4
LA0KKwkJCQkJaSA9PSAyID8gIioiIDogIiIpOw0KKwkJfQ0KKwkJcmV0dXJuIHNpemU7DQorCWNh
c2UgU01VX1NPQ0NMSzoNCisJCWNvdW50ID0gTlVNX1NPQ0NMS19EUE1fTEVWRUxTOw0KKwkJY3Vy
X3ZhbHVlID0gbWV0cmljcy5DbG9ja0ZyZXF1ZW5jeVtDTE9DS19TT0NDTEtdOw0KKwkJYnJlYWs7
DQorCWNhc2UgU01VX01DTEs6DQorCQljb3VudCA9IE5VTV9NRU1DTEtfRFBNX0xFVkVMUzsNCisJ
CWN1cl92YWx1ZSA9IG1ldHJpY3MuQ2xvY2tGcmVxdWVuY3lbQ0xPQ0tfVU1DQ0xLXTsNCisJCWJy
ZWFrOw0KKwljYXNlIFNNVV9EQ0VGQ0xLOg0KKwkJY291bnQgPSBOVU1fRENGQ0xLX0RQTV9MRVZF
TFM7DQorCQljdXJfdmFsdWUgPSBtZXRyaWNzLkNsb2NrRnJlcXVlbmN5W0NMT0NLX0RDRkNMS107
DQorCQlicmVhazsNCisJY2FzZSBTTVVfRkNMSzoNCisJCWNvdW50ID0gTlVNX0ZDTEtfRFBNX0xF
VkVMUzsNCisJCWN1cl92YWx1ZSA9IG1ldHJpY3MuQ2xvY2tGcmVxdWVuY3lbQ0xPQ0tfRkNMS107
DQorCQlicmVhazsNCisJZGVmYXVsdDoNCisJCXJldHVybiAtRUlOVkFMOw0KKwl9DQorDQorCWZv
ciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7DQorCQlHRVRfRFBNX0NVUl9GUkVRKGNsa190YWJs
ZSwgY2xrX3R5cGUsIGksIHZhbHVlKTsNCisJCXNpemUgKz0gc3ByaW50ZihidWYgKyBzaXplLCAi
JWQ6ICV1TWh6ICVzXG4iLCBpLCB2YWx1ZSwNCisJCQkJY3VyX3ZhbHVlID09IHZhbHVlID8gIioi
IDogIiIpOw0KKwl9DQorDQorCXJldHVybiBzaXplOw0KK30NCisNCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHBwdGFibGVfZnVuY3MgcmVub2lyX3BwdF9mdW5jcyA9IHsNCiAJLmdldF9zbXVfbXNnX2lu
ZGV4ID0gcmVub2lyX2dldF9zbXVfbXNnX2luZGV4LA0KIAkuZ2V0X3NtdV90YWJsZV9pbmRleCA9
IHJlbm9pcl9nZXRfc211X3RhYmxlX2luZGV4LA0KIAkudGFibGVzX2luaXQgPSByZW5vaXJfdGFi
bGVzX2luaXQsDQogCS5zZXRfcG93ZXJfc3RhdGUgPSBOVUxMLA0KIAkuZ2V0X2RwbV91Y2xrX2xp
bWl0ZWQgPSByZW5vaXJfZ2V0X2RwbV91Y2xrX2xpbWl0ZWQsDQorCS5wcmludF9jbGtfbGV2ZWxz
ID0gcmVub2lyX3ByaW50X2Nsa19sZXZlbHMsDQogfTsNCiANCiB2b2lkIHJlbm9pcl9zZXRfcHB0
X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KSBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvcmVub2lyX3BwdC5oDQppbmRleCBhMDE3YTQ3Li4yYTM5MGRkIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5oDQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmgNCkBAIC0yNSw5ICsyNSwyOSBAQA0K
IA0KIGV4dGVybiB2b2lkIHJlbm9pcl9zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAq
c211KTsNCiANCi0vL1VNRCBQU3RhdGUgUmVub2lyIE1zZyBQYXJhbWV0ZXJzIGluIE1Ieg0KKy8q
IFVNRCBQU3RhdGUgUmVub2lyIE1zZyBQYXJhbWV0ZXJzIGluIE1IeiAqLw0KICNkZWZpbmUgUkVO
T0lSX1VNRF9QU1RBVEVfR0ZYQ0xLICAgICAgIDcwMA0KICNkZWZpbmUgUkVOT0lSX1VNRF9QU1RB
VEVfU09DQ0xLICAgICAgIDY3OA0KICNkZWZpbmUgUkVOT0lSX1VNRF9QU1RBVEVfRkNMSyAgICAg
ICAgIDgwMA0KIA0KKyNkZWZpbmUgR0VUX0RQTV9DVVJfRlJFUSh0YWJsZSwgY2xrX3R5cGUsIGRw
bV9sZXZlbCwgZnJlcSkJCVwNCisJZG8gewkJCQkJCQkJXA0KKwkJc3dpdGNoIChjbGtfdHlwZSkg
ewkJCQkJXA0KKwkJY2FzZSBTTVVfU09DQ0xLOgkJCQkJXA0KKwkJCWZyZXEgPSB0YWJsZS0+U29j
Q2xvY2tzW2RwbV9sZXZlbF0uRnJlcTsJXA0KKwkJCWJyZWFrOwkJCQkJCVwNCisJCWNhc2UgU01V
X01DTEs6CQkJCQkJXA0KKwkJCWZyZXEgPSB0YWJsZS0+TWVtQ2xvY2tzW2RwbV9sZXZlbF0uRnJl
cTsJXA0KKwkJCWJyZWFrOwkJCQkJCVwNCisJCWNhc2UgU01VX0RDRUZDTEs6CQkJCQlcDQorCQkJ
ZnJlcSA9IHRhYmxlLT5EY2ZDbG9ja3NbZHBtX2xldmVsXS5GcmVxOwlcDQorCQkJYnJlYWs7CQkJ
CQkJXA0KKwkJY2FzZSBTTVVfRkNMSzoJCQkJCQlcDQorCQkJZnJlcSA9IHRhYmxlLT5GQ2xvY2tz
W2RwbV9sZXZlbF0uRnJlcTsJCVwNCisJCQlicmVhazsJCQkJCQlcDQorCQlkZWZhdWx0OgkJCQkJ
CVwNCisJCQlicmVhazsJCQkJCQlcDQorCQl9CQkJCQkJCVwNCisJfSB3aGlsZSAoMCkNCisNCiAj
ZW5kaWYNCi0tDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
