Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A66D47D761
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 10:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443156E3C4;
	Thu,  1 Aug 2019 08:21:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730065.outbound.protection.outlook.com [40.107.73.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99406E3C4
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 08:21:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jr2xXSAyG4YuNHY6FJ9652CWL66WzT+i5E47PEv9u7UImjsO14eNBgCr8uYgQ9RBD+GHfYEcO4HpwUspmFBR1oUwPSyOSEv4RFuyJ6wrvMR/I5+g0k7UB+r6ZdJHq6EaidiL5ZJgFSCeWo7dY1P6h7c4G8wSYVXUsAZp8mQHo89qaMoqUhjq936FhYDdNiE3r47Pbq4adUZ1fPHAACG9IbpE8TOQbnULfMHjaMQZneho1fIAjQopyrI/ehoC6YrIIwSQIEVnYHthPvdXiyENILBBfn4SOArS5YFWJu/4G1WU2PjuPkpbJrTSrAo/3UnWkZdD/ktYR8LOuDZvTukqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C908JhYHtrnIKvn3z8TZ4cU37ai4bghi7RkXPtakEGc=;
 b=OC38IgMbSaVAParUshhVF3H/+u7bKFCep8KtBl8yWwICluipILgmMA5uEU5dlyF/+vFLMoTPm7IlukxzkqDnyH+amqmjx8HPFhl0PYzaPkl9B/x3wWqZTtubQig5BhbOn+U61PjfOq9NroIfFSZcDnR/coq8+xZpKDP4lYRH5vBKZtcjuzLMYGEXP1P6D0rLwOZkgjf/wEAzpdmGKWb353FkQy4KRjrWoZcKHV7cRMykelPbeuuBDJzTC2s3/9NzJNEMkDGSySGG/P5O5Zcv0LMcyo2qvx7P+vMOjO0JVyIMXQc8EBRhu+9sTI6h3MYMnqjsWSaVTbBtBSN8Gf9R6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN7PR12MB2707.namprd12.prod.outlook.com (20.176.176.141) by
 BN7PR12MB2643.namprd12.prod.outlook.com (20.176.176.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Thu, 1 Aug 2019 08:21:51 +0000
Received: from BN7PR12MB2707.namprd12.prod.outlook.com
 ([fe80::20f2:d545:cce8:7a63]) by BN7PR12MB2707.namprd12.prod.outlook.com
 ([fe80::20f2:d545:cce8:7a63%5]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 08:21:51 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Zhou1, Tao"
 <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Li, Dennis" <Dennis.Li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH 0/4] enable umc ras ce interrupt
Thread-Topic: [PATCH 0/4] enable umc ras ce interrupt
Thread-Index: AQHVSDXydKdL/OXeV0GlepO6cPXfcabl67IAgAAF84A=
Date: Thu, 1 Aug 2019 08:21:51 +0000
Message-ID: <BN7PR12MB2707651008335A0DA8DB692CF1DE0@BN7PR12MB2707.namprd12.prod.outlook.com>
References: <20190801065342.8450-1-tao.zhou1@amd.com>
 <DM5PR12MB14182B9F7AFD2BB48D479C8EFCDE0@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB14182B9F7AFD2BB48D479C8EFCDE0@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6a9271c-be2f-4dc3-5e37-08d716594e30
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN7PR12MB2643; 
x-ms-traffictypediagnostic: BN7PR12MB2643:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN7PR12MB2643BEB1045E4B7454555A6BF1DE0@BN7PR12MB2643.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(13464003)(199004)(189003)(256004)(966005)(25786009)(478600001)(66946007)(486006)(55016002)(14444005)(53546011)(66476007)(66556008)(64756008)(66446008)(76116006)(53936002)(14454004)(66066001)(11346002)(229853002)(4326008)(52536014)(6436002)(6306002)(9686003)(476003)(6246003)(81156014)(81166006)(6636002)(71190400001)(68736007)(71200400001)(33656002)(2906002)(26005)(186003)(8676002)(2501003)(5660300002)(8936002)(99286004)(76176011)(3846002)(6116002)(110136005)(6506007)(316002)(86362001)(446003)(102836004)(7696005)(305945005)(7736002)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2643;
 H:BN7PR12MB2707.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zHEIkbjUnq/WptCbQ6fsEdssz/+ri4WAdUp1Bwrg6J5vhaRmSdcStVGC+NIKEwrP0awrn+S2DBIovFaRpeS4vWbtOexivHEtdlRXK0xeGI5cXAy2WKKF4nTKsaFIdauk9K1UVXBpLCcwf8TVAdNpIzR3PXF5AjW7Sns9QTjvCMtAzrCJ5e0V4Dbf5HQWDtPr3+aBVuMulu+3LaiH+5C9YcqRGFWCW41PkmdM2TLBxfbllYHBhm/TbsU9+nFTV8u6v0TaRGSOnqFGYgTvVTKEuKPKS0Tc92zEtkyD+vBKQny/m55ffsK/UK46ac8c9iBEpCwKP0k1NGL83z0x1o13BxSgDKOz5GumONg7fHxplwMkF/uk15mJMRHtB67YsSKlz0hbSJNyzoHExjXldGcWil5aBMy2yikTQe6On2s1TI0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a9271c-be2f-4dc3-5e37-08d716594e30
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 08:21:51.5068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: guchchen@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2643
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C908JhYHtrnIKvn3z8TZ4cU37ai4bghi7RkXPtakEGc=;
 b=Z5+bBuDDMkVJgmKpGM7Lja0gMQVF9lvxXlwSmic0JEl06R4Zm7aQI6UT1sWed/wOw67fkb00GHIDKpZ1Hh+dyIZE6lZEnu8gWWwlkO4NsUZO8iK9dim5Yu65HI5wgYOl7iV6qnwlSP7JWB+ETp7FtTzIzmuX2igLXOwndhdBl90=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

MSkgUGF0Y2ggMSwgbG9va3MgdGhlIHJldHVybiB2YWx1ZSBvZiBvdXIgY2FsbGJhY2sgYWx3YXlz
IHJldHVybnMgVUUgY2FzZSwgYnV0IEkgYXNzdW1lIENFIGNhc2Ugc2hvdWxkIGFsc28gYmUgY292
ZXJlZC4gTWF5YmUgaXQncyBhbm90aGVyIHRvcGljLg0KCWlmIChyZXQgPT0gQU1ER1BVX1JBU19V
RSkgew0KKwkJLyogdGhlc2UgY291bnRzIGNvdWxkIGJlIGxlZnQgYXMgMCBpZg0KKwkJICogc29t
ZSBibG9ja3MgZG8gbm90IGNvdW50IGVycm9yIG51bWJlcg0KKwkJICovDQogCQlvYmotPmVycl9k
YXRhLnVlX2NvdW50ICs9IGVycl9kYXRhLnVlX2NvdW50Ow0KKwkJb2JqLT5lcnJfZGF0YS5jZV9j
b3VudCArPSBlcnJfZGF0YS5jZV9jb3VudDsNCg0KMikgSW4gUGF0Y2ggMiwgb25lIHVudXNlZCB2
YXJpYWJsZSAicmFzX2Vycm9yX3N0YXR1cyIgaXMgdGhlcmUsIGRvIHdlIG5lZWQgdG8gcmVtb3Zl
IGl0Pw0KDQpzdGF0aWMgdm9pZCB1bWNfdjZfMV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikgIHsNCisJdm9pZCAqcmFzX2Vycm9yX3N0YXR1cyA9IE5VTEw7DQogDQorCWFtZGdw
dV91bWNfZm9yX2VhY2hfY2hhbm5lbCh1bWNfdjZfMV9yYXNfaW5pdF9wZXJfY2hhbm5lbCk7DQog
fQ0KDQpSZWdhcmRzLA0KR3VjaHVuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPiANClNlbnQ6IFRodXJzZGF5
LCBBdWd1c3QgMSwgMjAxOSAzOjUyIFBNDQpUbzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5j
b20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTGksIERlbm5pcyA8RGVubmlzLkxp
QGFtZC5jb20+OyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBQYW4sIFhpbmh1
aSA8WGluaHVpLlBhbkBhbWQuY29tPg0KQ2M6IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29t
Pg0KU3ViamVjdDogUkU6IFtQQVRDSCAwLzRdIGVuYWJsZSB1bWMgcmFzIGNlIGludGVycnVwdA0K
DQoxLikgUGxlYXNlIGZpeCB0aGUgdHlwbyBpbiBwYXRjaCAjMiBkZXNjcmlwdGlvbjogZWMgLS0+
IGNlIDIpLiBQYXRjaCAjMg0KDQorCWVjY19lcnJfY250X3NlbCA9IFJFR19TRVRfRklFTEQoZWNj
X2Vycl9jbnRfc2VsLCBVTUNDSDBfMF9FY2NFcnJDbnRTZWwsDQorCQkJCQlFY2NFcnJJbnQsIDB4
MSk7DQpGb3IgdGhlIEVjY0VyckludCBmaWVsZCwgaXQgc2hvdWxkIGJlIHByb2dyYW1lZCB0byBi
ZSAoTUFYIC0gSU5JVCksIGNvcnJlY3Q/IGJ1dCB0aGUgaGFyZGNvZGVkIHZhbHVlIHNlZW1zIG5v
dCBtYXRjaCB3aXRoIHRoZSB2YWx1ZSBjYWxjdWxhdGVkIGJ5IHRob3NlIG1hY3JvLiANCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGFv
IFpob3UNClNlbnQ6IDIwMTnlubQ45pyIMeaXpSAxNDo1NA0KVG86IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgTGks
IERlbm5pcyA8RGVubmlzLkxpQGFtZC5jb20+OyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFt
ZC5jb20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPg0KQ2M6IFpob3UxLCBUYW8g
PFRhby5aaG91MUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDAvNF0gZW5hYmxlIHVtYyByYXMg
Y2UgaW50ZXJydXB0DQoNClRoZXNlIHBhdGNoZXMgYWRkIHN1cHBvcnQgZm9yIHVtYyBjZSBpbnRl
cnJ1cHQsIHRoZSBpbnRlcnJ1cHQgaXMgY29udHJvbGxlZCBieSBhIGVycm9yIGNvdW50IHRocmVz
aG9sZC4NCg0KVGFvIFpob3UgKDQpOg0KICBkcm0vYW1kZ3B1OiBzdXBwb3J0IGNlIGludGVycnVw
dCBpbiByYXMgbW9kdWxlDQogIGRybS9hbWRncHU6IGltcGxlbWVudCB1bWMgcmFzIGluaXQgZnVu
Y3Rpb24NCiAgZHJtL2FtZGdwdTogdXBkYXRlIHRoZSBjYWxjIGFsZ29yaXRobSBvZiB1bWMgZWNj
IGVycm9yIGNvdW50DQogIGRybS9hbWRncHU6IG9ubHkgdW5jb3JyZWN0YWJsZSBlcnJvciBuZWVk
cyBncHUgcmVzZXQNCg0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8
IDEyICsrKystLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgfCAg
NiArKystDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYyAgIHwgNDIgKysr
KysrKysrKysrKysrKysrKysrKy0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192
Nl8xLmggICB8ICA3ICsrKysrDQogNCBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQ0KDQotLQ0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
