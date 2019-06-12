Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1D842E61
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 20:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17C98980C;
	Wed, 12 Jun 2019 18:11:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820043.outbound.protection.outlook.com [40.107.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895608980C
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 18:11:18 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3835.namprd12.prod.outlook.com (10.255.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Wed, 12 Jun 2019 18:11:17 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 18:11:17 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Reserve space for shared fence
Thread-Topic: [PATCH] drm/amdgpu: Reserve space for shared fence
Thread-Index: AQHVIHGVDF0QWw0aYE6HvPgIR4imPaaYU4+A
Date: Wed, 12 Jun 2019 18:11:16 +0000
Message-ID: <3c280181-c684-bbd4-3116-71c6f6860b31@amd.com>
References: <1560270022-4934-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1560270022-4934-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.53.123]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: BYAPR07CA0067.namprd07.prod.outlook.com
 (2603:10b6:a03:60::44) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c39b31e-3055-407e-8985-08d6ef615cd4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3835; 
x-ms-traffictypediagnostic: DM6PR12MB3835:
x-microsoft-antispam-prvs: <DM6PR12MB3835AAAEEC6E8332CA1347CE92EC0@DM6PR12MB3835.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(136003)(366004)(346002)(39860400002)(199004)(189003)(6486002)(14454004)(478600001)(72206003)(71200400001)(71190400001)(5660300002)(36756003)(14444005)(256004)(6436002)(58126008)(76176011)(2501003)(305945005)(6512007)(6506007)(7736002)(52116002)(110136005)(386003)(229853002)(31686004)(65806001)(86362001)(11346002)(65956001)(99286004)(64126003)(66066001)(53936002)(486006)(53546011)(446003)(316002)(6246003)(6116002)(73956011)(66946007)(31696002)(81166006)(66446008)(26005)(8936002)(25786009)(65826007)(66476007)(81156014)(186003)(8676002)(66556008)(2616005)(3846002)(102836004)(68736007)(476003)(2906002)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3835;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 10xuEtmukXx/HwUh2GaAGTENFBbO/SXaUrJr1F+ashHOKzaYCJQAbWQhwWE3M+XADSqMjgEZUvoeEiwuAPO30A/wsfhecm+EycdLtueFDV+mZFfrMH1SS0kYM+2F7X5/221Lg7dxpL+3mqhtVOo5jesU/nOM5GYYyXDUyXHLOtP+PlF9wbJWXS3ZriZGgfTGhQfr38Ih2pUWa9l0oGeSShroYtWV8P676l/k1hcBA2WYo4GPKDcPYR/+zjZmP2aTHzzvMyQVM0KdG5fgg97iW0VzL25pSTvxFCr7VSMK7ot9tcEBgmSV9CpelU+ip1kh6D7slliWNlO9N6tN80wt+hVDUbq4K9yoNOLvtSO3p1tLqHTX9+HsecxqpaWiw+2l5O171pJMhJL5AhpFWxmE3JfxHy60mDpA1uUUdzbjheY=
Content-ID: <262E9DD43B224B48930E59581499D51B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c39b31e-3055-407e-8985-08d6ef615cd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 18:11:16.9971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3835
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rkBV2LzYVfPbyVnJq2RyPHFnGPHPUu8HIZa0fywglQ=;
 b=rMD2bQPkoAPjNd5AxDP9HjPBomDL1lF/juhG/SvhJRFf2ghjJXH8UdbAygptwc6mKpfoZDhlkdvJ1irhbWyrcUDfCaAMM8sTZxdsSAebEAapWMEEMlsMm6vCqGTjbe/fbKva0JKlGS8aazBvyLkTrN0F767+ANe5ysj3XjuYC6c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

T24gMjAxOS0wNi0xMSA5OjIwLCBaZW5nLCBPYWsgd3JvdGU6DQo+IENhbGwgcmVzZXJ2YXRpb25f
b2JqZWN0X3Jlc2VydmVfc2hhcmVkIHRvIHJlc2VydmUNCj4gc3BhY2UgZm9yIHNoYXJlZCBmZW5j
ZS4gT3RoZXJ3aXNlIGl0IHdpbGwgdHJpZ2dlcg0KPiBCVUdfT04gY29uZGl0aW9uIGluIHJlc2Vy
dmF0aW9uX29iamVjdF9hZGRfc2hhcmVkX2ZlbmNlLg0KPg0KPiBDaGFuZ2UtSWQ6IEliMGZhZTE2
MjQ3ZTMzZWU2OGY5NWJmZmE3MjM0NTFjMGNkNjE5MzQ0DQo+IFNpZ25lZC1vZmYtYnk6IE9hayBa
ZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxp
eC5LdWVobGluZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgfCA0ICsrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkX2dwdXZtLmMNCj4gaW5kZXggODFlMGU3NS4uNzRlODY5NSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiBA
QCAtMjE1MiwxMiArMjE1MiwxNiBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9hZGRfZ3dzX3RvX3Byb2Nl
c3Modm9pZCAqaW5mbywgdm9pZCAqZ3dzLCBzdHJ1Y3Qga2dkX21lbSAqKm1lbQ0KPiAgIAkgKiBB
ZGQgcHJvY2VzcyBldmljdGlvbiBmZW5jZSB0byBibyBzbyB0aGV5IGNhbg0KPiAgIAkgKiBldmlj
dCBlYWNoIG90aGVyLg0KPiAgIAkgKi8NCj4gKwlyZXQgPSByZXNlcnZhdGlvbl9vYmplY3RfcmVz
ZXJ2ZV9zaGFyZWQoZ3dzX2JvLT50Ym8ucmVzdiwgMSk7DQo+ICsJaWYgKHJldCkNCj4gKwkJZ290
byByZXNlcnZlX3NoYXJlZF9mYWlsOw0KPiAgIAlhbWRncHVfYm9fZmVuY2UoZ3dzX2JvLCAmcHJv
Y2Vzc19pbmZvLT5ldmljdGlvbl9mZW5jZS0+YmFzZSwgdHJ1ZSk7DQo+ICAgCWFtZGdwdV9ib191
bnJlc2VydmUoZ3dzX2JvKTsNCj4gICAJbXV0ZXhfdW5sb2NrKCYoKm1lbSktPnByb2Nlc3NfaW5m
by0+bG9jayk7DQo+ICAgDQo+ICAgCXJldHVybiByZXQ7DQo+ICAgDQo+ICtyZXNlcnZlX3NoYXJl
ZF9mYWlsOg0KPiAgIGJvX3ZhbGlkYXRpb25fZmFpbHVyZToNCj4gICAJYW1kZ3B1X2JvX3VucmVz
ZXJ2ZShnd3NfYm8pOw0KPiAgIGJvX3Jlc2VydmF0aW9uX2ZhaWx1cmU6DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
