Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59BC896AF
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 07:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEDF6E480;
	Mon, 12 Aug 2019 05:22:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750050.outbound.protection.outlook.com [40.107.75.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18136E480
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 05:22:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6DrgagQQuY/X40fUeYkFd/q2ou8IRGY6KGO7G1RTQ0aXOpF0tPHuY9PpjhA+9FhE5IbWFKrqBSqzMZw+tdgu4pAuYL808jnFBsrT9KwjMSUsUCkHZtBUTBL9T20DCLPy3ZtYGzSNkKCWhZIWWBYyjA0jrHUSJTBWRk936jD66VOL4DvpbK9gcf7NMPwDozSfwSlcKfWI3/u5oOsLoDBDkshSmBuSltv9xCGfjR9ab4QZqBwMWjfypor/4K4rTww9clUmgWukB1DN4184T/oR1p3AttqtnCtT40w61lOJyN/+6dF8qCdsH2DJyZZe9jHoqDGAkKlYQbkSpYH3uEoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tq1LIvUorlx92olev3/q3+1WKmiafH0vwh6Kfn4lfb0=;
 b=lwCV0nhev66dmibOlTHW8b7dzSiJhce1ZID7rN+sB0bxCrOydUBgnnvZW4mqAhjZPpkI9osiRPTNQ79GhdqhQIOl0Vyd9qet8CSyq9I1JN93uL5GifiRWtdGo9WB95N6n1H/rYjpExb5EpN1fqeTM1PpsSNu+zYB+5dyPc6TYSxBpWp2smJFlbmsWQE9iIV2vour8jeilNIIBjdZFwrybFA9oUoepJy4BBEDkX9HjFnzbxTjz5benlDptDkrhdeJR+U1xxfSE5gTLiPh9DN2v1l2tqMM/ui/oxsUAdOK9bZmo4IxE2OlsYY+7Y83AgoQuy53j/TADVX8++vP0vxrjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3888.namprd12.prod.outlook.com (10.255.237.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Mon, 12 Aug 2019 05:22:47 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037%7]) with mapi id 15.20.2157.020; Mon, 12 Aug 2019
 05:22:47 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/4] drm/amdgpu: add GFX_CP_LS flag to Arcturus
Thread-Topic: [PATCH 1/4] drm/amdgpu: add GFX_CP_LS flag to Arcturus
Thread-Index: AQHVTqVuBuBrA1M3gk2mtxZLhB2E56b2/nWA
Date: Mon, 12 Aug 2019 05:22:47 +0000
Message-ID: <MN2PR12MB3598D3ECCB050A0F37C04B0D8ED30@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <1565350016-7071-1-git-send-email-le.ma@amd.com>
In-Reply-To: <1565350016-7071-1-git-send-email-le.ma@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b460d47e-1add-4fee-080f-08d71ee51cb8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3888; 
x-ms-traffictypediagnostic: MN2PR12MB3888:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB388847C13E564491CE719A3F8ED30@MN2PR12MB3888.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:170;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(189003)(13464003)(199004)(8676002)(305945005)(3846002)(74316002)(316002)(6506007)(966005)(53546011)(7696005)(478600001)(76176011)(6246003)(229853002)(71190400001)(6116002)(7736002)(14454004)(2906002)(99286004)(66066001)(71200400001)(110136005)(256004)(6436002)(33656002)(81156014)(81166006)(11346002)(446003)(186003)(25786009)(66476007)(66946007)(66556008)(66446008)(76116006)(64756008)(4326008)(53936002)(55016002)(102836004)(2501003)(8936002)(486006)(476003)(9686003)(6306002)(26005)(86362001)(52536014)(5660300002)(357404004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3888;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RpRu8V/0M8F49hawYOia8EsSrs6Lfjok++lTx7pWCJMllh/6udfWShXac6a17y10sPHvpV4ntf8rbBkcyW+Cd1/Mvvr5ml+ghT+QuEg6Ha2jzbcO29jIP4VjEP6qIyCCBXf6Oi6uZD9wj14ld5ZdVKJr8nbty9OLsgBrJMyQGjzMwR5NSxkN7/FqKc/8h2xrbYYL0D9W67aX9aew2/yO4SLzUVQwe6jBXN/08SDHbBkiL34Jl49ZNp/2e9LDsN009b1qG7gj2r/gW9a25wKtXyqLjpACivGthH/PyHhzelaSm28pqWohNRl7zslphB/Ae0vtdgaurDEg7v/lZ3rxv5/Sieow5gQugL34yqxUk+JWyDYBJA0aatLTsyGPjonrd7Bzmq2TADr9orWLoa1Mwjo3W4ISOIS449jPS0/RDOo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b460d47e-1add-4fee-080f-08d71ee51cb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 05:22:47.2772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kxDPxWGFNLjF7z2dMm1aO/Geu9UaXQ508Lx6tp+DF0YAzm/k+8atCHgQVK2znLfp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3888
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tq1LIvUorlx92olev3/q3+1WKmiafH0vwh6Kfn4lfb0=;
 b=s1utdPJ7eKfx0LG3P4sWXAgfoF22asMiG8+dmAlxIR9tn/nd9yo9gfT+ji2ijcD1L4lQELRhRNpatT42fOwJUaeViSjVZ+AWdwszHZ7QBLeRLMpmEGCnZmtFeKJMelHCVfgx54H5Wwu4rxPzElD0EjBmkljKPeu4aRvpCELe8e4=
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
Cc: "Ma, Le" <Le.Ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggW21haWx0bzphbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgTGUgTWENClNlbnQ6IEZy
aWRheSwgQXVndXN0IDA5LCAyMDE5IDc6MjcgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KQ2M6IE1hLCBMZSA8TGUuTWFAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAxLzRd
IGRybS9hbWRncHU6IGFkZCBHRlhfQ1BfTFMgZmxhZyB0byBBcmN0dXJ1cw0KDQpbQ0FVVElPTjog
RXh0ZXJuYWwgRW1haWxdDQoNCk1pc3NlZCBBTURfQ0dfU1VQUE9SVF9HRlhfQ1BfTFMgYWNjaWRl
bnRseSB3aGVuIGNvbW1pdCBwYXRjaCBiZWZvcmUNCiAgICBkcm0vYW1kZ3B1OiBlbmFibGUgZ2Z4
IGNsb2NrIGdhdGluZyBmb3IgQXJjdHVydXMNCg0KQ2hhbmdlLUlkOiBJOWQ3MDMxOWRkMDdmN2Q2
NDI0MTZjYjI2MGY5ZjViMzM0MmI2ZjNmMg0KU2lnbmVkLW9mZi1ieTogTGUgTWEgPGxlLm1hQGFt
ZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgMSArDQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29j
MTUuYw0KaW5kZXggMjYxNDkzYS4uYWVjYmExYyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMNCkBAIC0xMTIyLDYgKzExMjIsNyBAQCBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9lYXJs
eV9pbml0KHZvaWQgKmhhbmRsZSkNCiAgICAgICAgICAgICAgICAgICAgICAgIEFNRF9DR19TVVBQ
T1JUX0dGWF9NR0xTIHwNCiAgICAgICAgICAgICAgICAgICAgICAgIEFNRF9DR19TVVBQT1JUX0dG
WF9DR0NHIHwNCiAgICAgICAgICAgICAgICAgICAgICAgIEFNRF9DR19TVVBQT1JUX0dGWF9DR0xT
IHwNCisgICAgICAgICAgICAgICAgICAgICAgIEFNRF9DR19TVVBQT1JUX0dGWF9DUF9MUyB8DQog
ICAgICAgICAgICAgICAgICAgICAgICBBTURfQ0dfU1VQUE9SVF9IRFBfTUdDRyB8DQogICAgICAg
ICAgICAgICAgICAgICAgICBBTURfQ0dfU1VQUE9SVF9IRFBfTFMgfA0KICAgICAgICAgICAgICAg
ICAgICAgICAgQU1EX0NHX1NVUFBPUlRfU0RNQV9NR0NHIHwNCi0tDQoyLjcuNA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5n
IGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
