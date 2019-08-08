Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16A785B71
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 09:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A476E468;
	Thu,  8 Aug 2019 07:19:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810049.outbound.protection.outlook.com [40.107.81.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2263C6E468
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 07:18:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eE/JU2ieGigI8fk1Srb7uBZwfnaG2v4xyDCTBGymgYeJUin8SOFmmZZaiaMCszOZM9eUlyJ0xYGVnwIohIJ8sdlQrmG1EYpj533nCsTIdEP3q2zuv+cbJUSmRAIW+b3Wg/VKYx+KVyEfd3serBjA0F8qgB/Ch32zeib91ja3QeJObTCsx9QM8xgZ5VMqCwFEnD0gyFCSDBYCL8CkdJaKZG3PQVgv2LLQt6Z8ihewSebNOhNyE4no2AmZz9eCsFn7ZDkSxiqUgQC+GiO2Q/isJwqQzubJprq7Jp/gOPWbaAQyzcDIMTdrVMq0mcwZi8ovzTU5AhRtvxfzqlv6R8f06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c4HN7kDtIbaebrKPwUt3pTNKkUvY+upCJUjZQEIj64=;
 b=SMkPiEEUi9PKIdFKZjw6zQeIj+v/5AF8NAnV6bNxfNbBJ7/Og9MHyWhxtkR3U/0gSA3HvRKqvbSsv5Sg8KWX2zKUY0eBrTZuxBJ78cS02hxpO9mAo4m0kE7prMZBt54uGtZqyrizIR2neZuIXMAgnCqJdEyI9g8jh4IzqNJq8s4fDVEBM9XhkzW9gcdiE66WvpSPONfzTglgxixBpyvNUvF//DlTvcTMclJw5N4XyRML18fSxcis1Tww+Ux4WVOZmI4IqQIolLoyCdkpG7L2CSzfPUsIy8a1BmUeVAdCP3SsLFl+BhHYc4Ijym4yd7Y9OjD/3uFjq/jfh6x/VedCxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB4221.namprd12.prod.outlook.com (52.135.48.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 8 Aug 2019 07:18:57 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7%5]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 07:18:57 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH] drm/amdgpu: add check to avoid array bound issue
Thread-Topic: [PATCH] drm/amdgpu: add check to avoid array bound issue
Thread-Index: AQHVTbbSM7wXAcVaPkWzDCUS7M+tl6bw12FQ
Date: Thu, 8 Aug 2019 07:18:57 +0000
Message-ID: <MN2PR12MB305431A96EAA441EDD094AC5B0D70@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190808065904.22438-1-guchun.chen@amd.com>
In-Reply-To: <20190808065904.22438-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2444c7d-d6ce-483c-8fb3-08d71bd0ad5b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4221; 
x-ms-traffictypediagnostic: MN2PR12MB4221:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB42216402A805007784EFBB89B0D70@MN2PR12MB4221.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:785;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(189003)(199004)(13464003)(66556008)(64756008)(76116006)(6436002)(305945005)(14454004)(99286004)(26005)(7736002)(102836004)(476003)(33656002)(446003)(81166006)(81156014)(2501003)(66946007)(66476007)(256004)(316002)(5660300002)(86362001)(110136005)(6116002)(3846002)(71200400001)(71190400001)(2906002)(66066001)(6636002)(74316002)(229853002)(25786009)(55016002)(53546011)(486006)(9686003)(7696005)(6306002)(8936002)(6246003)(11346002)(186003)(8676002)(6506007)(478600001)(4326008)(66446008)(52536014)(966005)(76176011)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4221;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z1QBaHn8o4RRVhLlT2S/dYSzm7l/JUJdAgk2HPJFsUc6JL0XptLPlyRdVfxp7EoV9Yfw+AM2tMsVLXe9BF3Q8Cbd/sw73+NgmCT8+x/LhdrTILCVpA+HVcRvI1q5sNtH99T+XBrUxUPUH1+UY80Qb6e4jTuMvSMjJ7vnfUrhkOtCOOGiTyxernUWtwT98CH2WbB97Ux4UZ88AwsZJ5eEEeVXAU1Luvt7yNNdlvi1xjUED2KxSoK00npojyBudvSCe6MSeFJ5iC3HXnXGX3kdP0nBp0n3rRE1STBIyvu7bYkUfbDWRD3CIwLwKkhDosiPqp2i6RREnvj10Qh7FOkIuAsgPFudzaUd8lcpCSYq4vRAKUmfXuRFhAvIGqwUCN+5oI+fKhdyu/khAoOjTJViNhJW2YKnnXBhMR9airoA94E=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2444c7d-d6ce-483c-8fb3-08d71bd0ad5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 07:18:57.0841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dWN2DfUOEPT8Fh2eTrvbQkrdQhOA14dP/8v9F1bSI15dOchZfbHVQO/mEZwaFc2V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c4HN7kDtIbaebrKPwUt3pTNKkUvY+upCJUjZQEIj64=;
 b=TVvfiGyW2lXItEYGe0wK9cYEJQr90l3rK0XEUEtoqaGJYMJ5Gd8fMZ/WNyRi1W3NftC0s2Fc0kt6pN2/B8rNTr7qbILCU5OTbukfwkqFKUr1JVoN97tYdMSkl8fUd+ZxBY5ZTW9eCeOpyK6+kDOY4wUTyplKBclbbdgfLbqcl1o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gR3VjaHVuIENoZW4NCj4gU2VudDogMjAx
OeW5tDjmnIg45pelIDE0OjU5DQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
WmhhbmcsIEhhd2tpbmcNCj4gPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IExpLCBEZW5uaXMgPERl
bm5pcy5MaUBhbWQuY29tPjsgUGFuLCBYaW5odWkNCj4gPFhpbmh1aS5QYW5AYW1kLmNvbT47IFpo
b3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KPiBDYzogQ2hlbiwgR3VjaHVuIDxHdWNodW4u
Q2hlbkBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IGFkZCBjaGVjayB0
byBhdm9pZCBhcnJheSBib3VuZCBpc3N1ZQ0KPiANCj4gU3ViX2Jsb2NrX2luZGV4IGNhbiBiZSBw
YXNzZWQgZnJvbSB1c2VyIGxldmVsLCBzbyBhZGQgb25lIGNoZWNrIGJlZm9yZQ0KPiBhY2Nlc3Np
bmcgdGhlIGFycmF5IGZpcnN0IHRvIHByZXZlbnQgYXJyYXkgaW5kZXggb3V0IG9mIGJvdW5kIHBy
b2JsZW0uDQo+IA0KPiBDaGFuZ2UtSWQ6IEk1NTZmYzU2MGI0NDIxNTg0OGJhM2E5NWY3NTdmZWJk
ZjNkMGFmNDIyDQo+IFNpZ25lZC1vZmYtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAz
ICsrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+IGluZGV4IDNlNDZjY2U2MDU1My4uNTljNzdi
MDFjODhhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4gQEAg
LTU5NjAsNiArNTk2MCw5IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfcmFzX2Vycm9yX2luamVjdChz
dHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gIAlpZiAoYWRldi0+YXNpY190eXBlICE9
IENISVBfVkVHQTIwKQ0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gDQo+ICsJaWYgKGluZm8tPmhl
YWQuc3ViX2Jsb2NrX2luZGV4ID49IEFSUkFZX1NJWkUocmFzX2dmeF9zdWJibG9ja3MpKQ0KPiAr
CQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiAgCWlmICghcmFzX2dmeF9zdWJibG9ja3NbaW5mby0+
aGVhZC5zdWJfYmxvY2tfaW5kZXhdLm5hbWUpDQo+ICAJCXJldHVybiAtRVBFUk07DQo+IA0KPiAt
LQ0KPiAyLjE3LjENCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
