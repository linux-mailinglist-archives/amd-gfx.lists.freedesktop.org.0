Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1C832911
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 09:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B6E898AF;
	Mon,  3 Jun 2019 07:04:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820051.outbound.protection.outlook.com [40.107.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD46898AF
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 07:04:26 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB3885.namprd12.prod.outlook.com (10.255.237.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.20; Mon, 3 Jun 2019 07:04:25 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5%6]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 07:04:25 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: add smu message mutex
Thread-Topic: [PATCH] drm/amd/powerplay: add smu message mutex
Thread-Index: AQHVGdNJNisJyazoOUO4oIVoS5cQvaaJgQtA
Date: Mon, 3 Jun 2019 07:04:24 +0000
Message-ID: <MN2PR12MB3437D430941ADB99E95CD6BCEF140@MN2PR12MB3437.namprd12.prod.outlook.com>
References: <1559542302-17573-1-git-send-email-Jack.Xiao@amd.com>
In-Reply-To: <1559542302-17573-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad0c6d89-b5ec-4417-c61b-08d6e7f1b653
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3885; 
x-ms-traffictypediagnostic: MN2PR12MB3885:
x-microsoft-antispam-prvs: <MN2PR12MB38852470D160CC1865A7CBE0EF140@MN2PR12MB3885.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(366004)(39860400002)(376002)(136003)(199004)(189003)(13464003)(305945005)(7736002)(2906002)(81166006)(72206003)(55016002)(6246003)(8936002)(86362001)(25786009)(53936002)(14454004)(229853002)(6436002)(81156014)(9686003)(8676002)(478600001)(66066001)(6116002)(2501003)(3846002)(33656002)(486006)(52536014)(476003)(6636002)(446003)(15650500001)(11346002)(26005)(71200400001)(99286004)(7696005)(53546011)(68736007)(76176011)(6506007)(66946007)(66446008)(66476007)(66556008)(64756008)(71190400001)(102836004)(316002)(5660300002)(76116006)(73956011)(74316002)(110136005)(256004)(14444005)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3885;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2kTYDqlI5sVfttUSwUUYYMoYQXI+t/fQT+0phMYysZVo5J/RzTkDcBvAwbHToZE2PcSPa2O4XztSj9ltYaRNatvycd96qZzRfcP1nLpCTa39Hx/m1xDjCCWpypp3pwGI5mc+g16nx0E0XvDd2+UBcpKLoo5v8TpSKn4gNmYQsZEzu7M6iu+25v2o/IVe0WmrMph2w2UopqJByS68Ft3+l3ZjK3sBzHlFUoDSqpyIe2s4BLQadC2jrZehs6JzPE71a3IQE4Bu0GeEOJHL7aeyXeL5rjr9G/ewTTWEdizAatGgVQZ3VVNFb/X8s6tA+RfPCTswrt/1pLpntGI9uQhIZ40lTc6EZMJHWM3JMjfajjpstBFMxWWQ5fP44sPcIe0UzFwz1AhCwTKfYWwnxiSEoQzjAUKAHC0w3HZJrZc3ng8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0c6d89-b5ec-4417-c61b-08d6e7f1b653
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 07:04:24.9743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacxiao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3885
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCAHCaUixx39Y8UjXD3lwSMP7G4gTVFDYV6g/TnA2D4=;
 b=f3kjVMItpoeCY9v33tN9FE/DaUxPDZOWxVooMgZhwDj4/9f0J8rzsMPTvx8meU0YhPW2m2vklwkeN+GukG8zEr1c4unMmHyGOUYlDQg66FBVryAycttP2AIPdWAZpE0I5tV3c9GJbcpvJ37iqMPRfS268AYoetaXTwwdNxv9Yag=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Xiao@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RHJvcCBpdCBkdWUgdG8gYSBtb2RpZmljYXRpb24gd2FzIG1pc3NpbmcuDQpBIG5ldyBwYXRjaCB3
YXMgc2VudCBvdXQuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBYaWFvLCBK
YWNrIDxKYWNrLlhpYW9AYW1kLmNvbT4gDQpTZW50OiBNb25kYXksIEp1bmUgMDMsIDIwMTkgMjox
MiBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEZXVjaGVyLCBBbGV4YW5k
ZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5a
aGFuZ0BhbWQuY29tPg0KQ2M6IFhpYW8sIEphY2sgPEphY2suWGlhb0BhbWQuY29tPg0KU3ViamVj
dDogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTogYWRkIHNtdSBtZXNzYWdlIG11dGV4DQoNCkFk
ZCBzbXUgbWVzc2FnZSBtdXRleCBwcmV2ZW50aW5nIGFnYWluc3QgcmFjZSBjb25kaXRpb24gaXNz
dWUuDQoNClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+DQotLS0N
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIHwgMSArDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgICAgICB8IDcgKysrKysr
LQ0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaA0KaW5kZXgg
M2ViMWRlOS4uNzM1MjMzZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2luYy9hbWRncHVfc211LmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9hbWRncHVfc211LmgNCkBAIC0zNzQsNiArMzc0LDcgQEAgc3RydWN0IHNtdV9jb250ZXh0
DQogCWNvbnN0IHN0cnVjdCBzbXVfZnVuY3MJCSpmdW5jczsNCiAJY29uc3Qgc3RydWN0IHBwdGFi
bGVfZnVuY3MJKnBwdF9mdW5jczsNCiAJc3RydWN0IG11dGV4CQkJbXV0ZXg7DQorCXN0cnVjdCBt
dXRleAkJCW1zZ19tdXRleDsNCiAJdWludDY0X3QgcG9vbF9zaXplOw0KIA0KIAlzdHJ1Y3Qgc211
X3RhYmxlX2NvbnRleHQJc211X3RhYmxlOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
c211X3YxMV8wLmMNCmluZGV4IGQyZWViNjIuLmRlNzM3YTAgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCkBAIC0xMDQsNiArMTA0LDggQEAgc3RhdGljIGlu
dCBzbXVfdjExXzBfc2VuZF9tc2coc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQxNl90IG1z
ZykNCiAJaWYgKGluZGV4IDwgMCkNCiAJCXJldHVybiBpbmRleDsNCiANCisJbXV0ZXhfbG9jaygm
c211LT5tc2dfbXV0ZXgpOw0KKw0KIAlzbXVfdjExXzBfd2FpdF9mb3JfcmVzcG9uc2Uoc211KTsN
CiANCiAJV1JFRzMyX1NPQzE1KE1QMSwgMCwgbW1NUDFfU01OX0MyUE1TR185MCwgMCk7IEBAIC0x
MTEsMTEgKzExMywxMSBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zZW5kX21zZyhzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwgdWludDE2X3QgbXNnKQ0KIAlzbXVfdjExXzBfc2VuZF9tc2dfd2l0aG91
dF93YWl0aW5nKHNtdSwgKHVpbnQxNl90KWluZGV4KTsNCiANCiAJcmV0ID0gc211X3YxMV8wX3dh
aXRfZm9yX3Jlc3BvbnNlKHNtdSk7DQotDQogCWlmIChyZXQpDQogCQlwcl9lcnIoIkZhaWxlZCB0
byBzZW5kIG1lc3NhZ2UgMHgleCwgcmVzcG9uc2UgMHgleFxuIiwgaW5kZXgsDQogCQkgICAgICAg
cmV0KTsNCiANCisJbXV0ZXhfdW5sb2NrKCZzbXUtPm1zZ19tdXRleCk7DQogCXJldHVybiByZXQ7
DQogDQogfQ0KQEAgLTEzMiw2ICsxMzQsOCBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zZW5kX21z
ZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDE2X3QgbXNnKQ0KIAlpZiAoaW5kZXggPCAw
KQ0KIAkJcmV0dXJuIGluZGV4Ow0KIA0KKwltdXRleF9sb2NrKCZzbXUtPm1zZ19tdXRleCk7DQor
DQogCXJldCA9IHNtdV92MTFfMF93YWl0X2Zvcl9yZXNwb25zZShzbXUpOw0KIAlpZiAocmV0KQ0K
IAkJcHJfZXJyKCJGYWlsZWQgdG8gc2VuZCBtZXNzYWdlIDB4JXgsIHJlc3BvbnNlIDB4JXgsIHBh
cmFtIDB4JXhcbiIsIEBAIC0xNDgsNiArMTUyLDcgQEAgc3RhdGljIGludCBzbXVfdjExXzBfc2Vu
ZF9tc2coc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQxNl90IG1zZykNCiAJCXByX2Vycigi
RmFpbGVkIHRvIHNlbmQgbWVzc2FnZSAweCV4LCByZXNwb25zZSAweCV4IHBhcmFtIDB4JXhcbiIs
DQogCQkgICAgICAgaW5kZXgsIHJldCwgcGFyYW0pOw0KIA0KKwltdXRleF91bmxvY2soJnNtdS0+
bXNnX211dGV4KTsNCiAJcmV0dXJuIHJldDsNCiB9DQogDQotLQ0KMS45LjENCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
