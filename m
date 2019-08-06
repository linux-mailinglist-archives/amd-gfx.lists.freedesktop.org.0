Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A104582DC3
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 10:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAB36E336;
	Tue,  6 Aug 2019 08:32:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780070.outbound.protection.outlook.com [40.107.78.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8A66E32C
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 08:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGU8bskmO/P2pzNyzHigDOx0JpDIhzCSO2ScIvMgs5J1HgSox/yGvCeF0aTXUgz81qZcqTe4HZ+DFO/0bkfOqKCvw0h4AlrqPYrBqvoSczfSCYz0vkFjRH1+W4wOHWWAu+LnaPwVKTg21FhIuIR/YV4RulTuCRjMjB6A2dT97Vl02m71M8M7HTrmvxcLoARLpzRGbxnSgZUy3ijSsuA2ZoGQEKMRcxMLKA7v/EJePVfCyTRXh/Z81z1RQsf26T5QqREiUMrUvT94bGze7znDmDFdh8p1zzELOV7om1sUXj6iXlEjJxODdIj3+bOStUdXYmDj/H8SZs/tXqBcKdtzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBPhikEyznNP96gN9bqj7ogN52FTibl/cjBLg/APLzA=;
 b=fhRyFM4J/b20EFFDWYtXJCJTO1aMvpsrMSNDJX/NIaQ4hQdJWhzhaXH07YK9woFMM+ayD6KJT10El7KIWZmDx3V1QRQRmiLD3V/KuzlpASGz7MoRr/s8MWLz2StoMYdKED8UZk7HB8GY129N7bqmeejhrPnklOi93EIl827R8xVZ7IKPgyGBk1ih9nGrEacLNw2URnuXT7lubPpnwANu04jCVeqzRUcX7PbFidYI1uGALgGdmbo6UDsGch/rDctDWPF/93ztEt+WJi2HH01NWJdpvYR09nBTgNEtQBALF160vf6jCtxQxHNeuaInBk3XojKOz5fvWbZI+7BrHHrXzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3734.namprd12.prod.outlook.com (52.132.245.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Tue, 6 Aug 2019 08:32:16 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::503b:f594:5d08:d729]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::503b:f594:5d08:d729%7]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 08:32:15 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: check before issuing messages for max
 sustainable clocks
Thread-Topic: [PATCH] drm/amd/powerplay: check before issuing messages for max
 sustainable clocks
Thread-Index: AQHVTC/3wGUeiDPIGU+96CmjJACfeKbtynig
Date: Tue, 6 Aug 2019 08:32:15 +0000
Message-ID: <CH2PR12MB37670D0D4F293AF87B520905FED50@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <20190806082120.3352-1-evan.quan@amd.com>
In-Reply-To: <20190806082120.3352-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e8f0b53-8f60-4633-ec65-08d71a48965b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3734; 
x-ms-traffictypediagnostic: CH2PR12MB3734:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR12MB3734A21BB575A8D6C4BC5935FED50@CH2PR12MB3734.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(13464003)(199004)(189003)(53936002)(6436002)(71200400001)(71190400001)(6116002)(305945005)(74316002)(2906002)(110136005)(3846002)(7736002)(55016002)(476003)(11346002)(81166006)(76116006)(86362001)(486006)(64756008)(66556008)(316002)(8676002)(229853002)(446003)(66446008)(66946007)(8936002)(2501003)(102836004)(6506007)(7696005)(15650500001)(53546011)(9686003)(26005)(33656002)(99286004)(66476007)(52536014)(6306002)(186003)(4326008)(81156014)(966005)(478600001)(25786009)(14454004)(6246003)(66066001)(256004)(5660300002)(68736007)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3734;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IvYpW0DeLOAYFJfHNZXpSvNWbCPPPC9RyFwB20XTjcsNS3JTjCeRQGuXUv6hy+vXwr+Rj5MQBvoKZYnUbuyZm+oU1CWsysX5Faxqjjwyi6OktrzrrL9LM2C+ORJBKkNMcSqWMOxXeyi5mK/vd2mqb2G4LaOmHdok3YXUuXWscOFicc9KYtlw7d8G6TMp1wE1YX5Uz6qr5lpHa8yRFwylkavvXi+LvWmX7nPNNqoZp4lqT6/vbR0u3j+z/1gx6iP8klwZ2kAeGYJ330WHZIhgr8UAqK4ZlWeHCTS7b8TOBf6VpN866R/+aGbjp+wXNx2A7zjcwLoC3NzpweAw2lmEwaONxjJD0YCTmW4CzgkI3dcMK5AKyHfANiNqjSI8fkkXmXqIXER1ZpmaVsyWc6a7/3wLB2sJumWaF1gi2dqpra4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8f0b53-8f60-4633-ec65-08d71a48965b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 08:32:15.7809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feifxu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3734
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBPhikEyznNP96gN9bqj7ogN52FTibl/cjBLg/APLzA=;
 b=mIecGa5WjqhwZi9ckXu4kpBd/aP2EQ6Lb6hywsFUx9zx+H/iTCpZqUHoQkvmf+JX7UWyb37hEKH3EcnZ8Q23xmfoagwa25KOUKde/X5tR8nmVBvA738Aqtcjg8bedrY/EKp7ZK2g5rE12+DR6ZS6haNVk9/Dhl0MTqy9RTRjjSg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4NCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBFdmFuIFF1YW4NClNlbnQ6IFR1ZXNkYXksIEF1
Z3VzdCA2LCAyMDE5IDQ6MjEgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
Q2M6IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0v
YW1kL3Bvd2VycGxheTogY2hlY2sgYmVmb3JlIGlzc3VpbmcgbWVzc2FnZXMgZm9yIG1heCBzdXN0
YWluYWJsZSBjbG9ja3MNCg0KVGhvc2UgbWVzc2FnZXMgYXJlIG5vdCBzdXBwb3J0ZWQgb24gQXJj
dHVydXMgYW5kIHNob3VsZCBub3QgYmUgaXNzdWVkLg0KDQpBZmZlY3RlZCBBU0lDOiBBcmN0dXJ1
cw0KDQpDaGFuZ2UtSWQ6IEkzOTEwOTlmYzI4ZTAwMzU2MjM0ZmQyYWU3YjY4ZjU4NjFmZDRjMTQ3
DQpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KLS0tDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgfCA0ICsrKysNCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3NtdV92MTFfMC5jDQppbmRleCA4NGViMTRhNjY1MGYuLjJkZGI0ZWM3NTMwNSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jDQorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0KQEAgLTkwNSw2ICs5MDUsMTAg
QEAgc211X3YxMV8wX2dldF9tYXhfc3VzdGFpbmFibGVfY2xvY2soc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsIHVpbnQzMl90ICpjbG9jaywNCiAJaWYgKCFzbXUtPnBtX2VuYWJsZWQpDQogCQlyZXR1
cm4gcmV0Ow0KIA0KKwlpZiAoKHNtdV9tc2dfZ2V0X2luZGV4KHNtdSwgU01VX01TR19HZXREY01v
ZGVNYXhEcG1GcmVxKSA8IDApIHx8DQorCSAgICAoc211X21zZ19nZXRfaW5kZXgoc211LCBTTVVf
TVNHX0dldE1heERwbUZyZXEpIDwgMCkpDQorCQlyZXR1cm4gMDsNCisNCiAJY2xrX2lkID0gc211
X2Nsa19nZXRfaW5kZXgoc211LCBjbG9ja19zZWxlY3QpOw0KIAlpZiAoY2xrX2lkIDwgMCkNCiAJ
CXJldHVybiAtRUlOVkFMOw0KLS0NCjIuMjIuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
