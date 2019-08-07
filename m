Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAB28431F
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 06:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4506E5ED;
	Wed,  7 Aug 2019 04:10:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690A16E5ED
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 04:10:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aH1AwXNNokICw/3ZlvveorNsQUDi/0b7kbhVleDJL6LH0TyxgskO0Bz8sGbMGGtfINqVgd7iwTw/k6QYHg59xp5Dc6HsI9nYQaero9oUIgmgPGfzmBtvg1PeC6QKYhcclJ4TAtFIqAXLtsfiAcrg1rZ9YDGWn9ViXllbW8vO96Tw+g3TTtT1aJQa8Sb1Ov/qNJoQiigUpd3EZog6CnaARNBEElVBEptiKnq5j+GQmA+s3Zc2LMACHMmC0OkQuFaraXSn6D3ehSY7fNw7QkMhWCy2YpFMuRySLt0e9sTMDZUeQR2wkRQmP40gXgV3hwYmV9IfhRHV3QiDytQJxO1ibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNnF1mmITHGN8enV6Na59sD3bqjviGeYyw+wNY+91tA=;
 b=EnhCHiOpj8Z7KpPmC5l6jG8ZDutbkDDYxol2Y5Nm9ohA+m9VVmnCpJqHx6F+tWctUJxe1VA9/hzjVdMKYEcRXXx7xNzZRiqGLUbb8dAhJEWHN0z/5d6mrFPeRyi9267PQlQ84cDtefPYpmSRgyWtgRCZHQLZ4bQjWTlLSeSDjHzyH4RuQbDZv3n48GwviRT8FKzjDAUS9zV/u3a7w4kyUXGTcBSZREIt1CYskCu6qER6+JIJJpHv+UFvaGaWF9vlV+zW0zbBBWmw20F2lSxtlsvu4GE6yhS4Dzg8/3nd4tvBiz1HHf69FhnosohIgozzyGb6GLSRs/SChIaA1vzdIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4009.namprd12.prod.outlook.com (10.255.175.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Wed, 7 Aug 2019 04:10:17 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2157.011; Wed, 7 Aug 2019
 04:10:17 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] amd/amdgpu: Introduce new page mapping scheme for
 arcturus
Thread-Topic: [PATCH 5/5] amd/amdgpu: Introduce new page mapping scheme for
 arcturus
Thread-Index: AQHVTMgv9yCnUqWL40+UjXfPX4lE46bvEneA
Date: Wed, 7 Aug 2019 04:10:17 +0000
Message-ID: <57686a22-18b0-503d-dadb-142a49ccdca3@amd.com>
References: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
 <1565145062-16674-5-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1565145062-16674-5-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::46) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9384790-1396-4d9d-4b3c-08d71aed27c1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4009; 
x-ms-traffictypediagnostic: DM6PR12MB4009:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB400915B26B5B3F1EE8CE0B1292D40@DM6PR12MB4009.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(189003)(199004)(102836004)(386003)(6506007)(53546011)(256004)(14444005)(486006)(25786009)(2616005)(476003)(52116002)(76176011)(26005)(4326008)(99286004)(229853002)(36756003)(6436002)(6486002)(31686004)(65806001)(65956001)(65826007)(66066001)(2906002)(71190400001)(71200400001)(186003)(6246003)(6512007)(53936002)(54906003)(305945005)(7736002)(31696002)(478600001)(5660300002)(86362001)(64126003)(316002)(2501003)(110136005)(58126008)(3846002)(6116002)(8676002)(446003)(8936002)(66446008)(66946007)(66476007)(66556008)(64756008)(68736007)(81166006)(81156014)(14454004)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4009;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1LuFRSRyGCR4U6tX+xTS9+7dlxxVzYnssUtEcZxjK+9Ttf9fBVNEpZl4M8CVZ0v6EWazEC2yE3i8m/ps3uMO/Uv9pqdhIa8GPpw/wIhlIe7V/9g5KSI1ZOhIzWRtyyWfnM7Ua+hxRi3SMk6ksUirCyFsb3kqlx47Qjv2CXMBqkcAoyddeirhEI5pXyjjuyT5qLhofCGEY6Bgz9i9SCF/L5o5b9h7HOx59rCF47ogBTLFnDFILtvO8xrHO6VpjlarQibjiH4J9xpra63ONaSu2odK0BhDfN3irteOIQj8fpDQM5ilelGbPvxQ691qZYcJv75jGBL4maVyM06/UWi+EbFput5KlLCV64jNnIs2hMTf2L11L/KKfy5wPEopXPXEygmkgmGyHUYgW7sjFHeJ/UPnRfcFi/kt0eTcM3zXxSg=
Content-ID: <07E2F9582EABE74284F82347B4FCEE09@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9384790-1396-4d9d-4b3c-08d71aed27c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 04:10:17.4503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X5jaMyF17HHHYLLabaHqQeYbUv/Dd8TNUlbCRfm8WQDbA29To1THNZgRzpuIpA/HwZdr3WmnGimd8yitSie/Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4009
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNnF1mmITHGN8enV6Na59sD3bqjviGeYyw+wNY+91tA=;
 b=UWA8EoQM7VrlU8wBuG4BZB8UWGRN2Ld/oLUOOP/AO8xSkDiuZ/bcM3t26TI9hNp1VXp7xahsAifbS0gFlmPyBNLDMkYOgtKbDEcitgCDbo5uuBWj9ZuyPzcic9ODk9SyrTZ3vaTjLnkGHtA1ALLRRzIJmevWweTpWeqRlnHVVdM=
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
Cc: "Keely, Sean" <Sean.Keely@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTA4LTA2IDIyOjMxLCBaZW5nLCBPYWsgd3JvdGU6DQo+IFRoZSBuZXcgbWVtb3J5
IG1hcHBpbmcgc2NoZW1lIGlzOg0KPiBGaW5lLWdyYWluIGNvaGVyZW5jeTogbG9jYWwgQ0MgYW5k
IHJlbW90ZSBVQywgd2l0aCBzbm9vcC4NCj4gQ29hcnNlLWdyYWluIGNvaGVyZW5jeTogbG9jYWwg
UlcgYW5kIHJlbW90ZSBVQywgd2l0aCBzbm9vcC4NCj4NCj4gQ2hhbmdlLUlkOiBJNmEwNzEyNDlm
OTUzY2JlZDgxM2JmZDk1M2I2YTJlMDgyNmY1NGY4Ng0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVu
ZyA8T2FrLlplbmdAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y2XzAuYyB8ICAxICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKy0NCj4gICAyIGZpbGVzIGNoYW5nZWQs
IDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192Nl8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjZfMC5jDQo+IGluZGV4IDJiMmFmNmEuLjUxZGFlN2YgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192Nl8wLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYw0KPiBAQCAtNDIwLDYgKzQyMCw3IEBAIHN0YXRp
YyB1aW50MzJfdCBnbWNfdjZfMF9nZXRfdm1fbWFwcGluZ19mbGFncyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwNCj4gICANCj4gICAJcmV0dXJuIG1hcHBpbmdfZmxhZ3M7DQo+ICAgfQ0KPiAr
DQo+ICAgc3RhdGljIHZvaWQgZ21jX3Y2XzBfc2V0X2ZhdWx0X2VuYWJsZV9kZWZhdWx0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAkJCQkJICAgICAgYm9vbCB2YWx1ZSkNCj4gICB7
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiBpbmRleCA4YmVlZmFmLi43
MThiMzg4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gQEAg
LTY4Nyw2ICs2ODcsMjcgQEAgc3RhdGljIHVpbnQzMl90IGdtY192OV8wX2dldF92bV9tYXBwaW5n
X2ZsYWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAlyZXR1cm4gbWFwcGluZ19m
bGFnczsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgdWludDMyX3QgZ21jX3Y5XzBfYXJjdHVydXNf
Z2V0X3ZtX21hcHBpbmdfZmxhZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICsJCQkJ
dWludDMyX3QgYWxsb2NfZmxhZ3MsIGJvb2wgcmVtb3RlX21hcHBpbmcpDQo+ICt7DQo+ICsJdWlu
dDMyX3QgbWFwcGluZ19mbGFncyA9IEFNREdQVV9WTV9QQUdFX1JFQURBQkxFOw0KPiArDQo+ICsJ
aWYgKGFsbG9jX2ZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX1dSSVRBQkxFKQ0KPiArCQltYXBwaW5n
X2ZsYWdzIHw9IEFNREdQVV9WTV9QQUdFX1dSSVRFQUJMRTsNCj4gKwlpZiAoYWxsb2NfZmxhZ3Mg
JiBBTExPQ19NRU1fRkxBR1NfRVhFQ1VUQUJMRSkNCj4gKwkJbWFwcGluZ19mbGFncyB8PSBBTURH
UFVfVk1fUEFHRV9FWEVDVVRBQkxFOw0KPiArCWlmICgoYWxsb2NfZmxhZ3MgJiBBTExPQ19NRU1f
RkxBR1NfVlJBTSkgJiYgIXJlbW90ZV9tYXBwaW5nKSB7DQo+ICsJCWlmIChhbGxvY19mbGFncyAm
IEFMTE9DX01FTV9GTEFHU19DT0hFUkVOVCkNCj4gKwkJCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BV
X1ZNX01UWVBFX0NDOw0KPiArCQllbHNlDQo+ICsJCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9W
TV9NVFlQRV9SVzsNCj4gKwl9IGVsc2Ugew0KPiArCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9W
TV9NVFlQRV9VQzsNCj4gKwkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fUEFHRV9TTk9PUEVE
Ow0KDQpUaGlzIHNlZW1zIGluY29ycmVjdC4gSXQgdHJlYXRzIGFsbCBzeXN0ZW0gbWVtb3J5IHRo
ZSBzYW1lIGFzIHJlbW90ZSANClZSQU0gYXMgdW5jYWNoZWQgb24gdGhlIEdQVS4NCg0KUmVnYXJk
cywNCiDCoCBGZWxpeA0KDQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIG1hcHBpbmdfZmxhZ3M7DQo+
ICt9DQo+ICAgDQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIGdtY192
OV8wX2dtY19mdW5jcyA9IHsNCj4gICAJLmZsdXNoX2dwdV90bGIgPSBnbWNfdjlfMF9mbHVzaF9n
cHVfdGxiLA0KPiBAQCAtNzAzLDcgKzcyNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X2dtY19mdW5jcyBnbWNfdjlfMF9hcmN0dXJ1c19nbWNfZnVuY3MgPSB7DQo+ICAgCS5lbWl0X3Bh
c2lkX21hcHBpbmcgPSBnbWNfdjlfMF9lbWl0X3Bhc2lkX21hcHBpbmcsDQo+ICAgCS5nZXRfdm1f
cHRlX2ZsYWdzID0gZ21jX3Y5XzBfYXJjdHVydXNfZ2V0X3ZtX3B0ZV9mbGFncywNCj4gICAJLmdl
dF92bV9wZGUgPSBnbWNfdjlfMF9nZXRfdm1fcGRlLA0KPiAtCS5nZXRfdm1fbWFwcGluZ19mbGFn
cyA9IGdtY192OV8wX2dldF92bV9tYXBwaW5nX2ZsYWdzDQo+ICsJLmdldF92bV9tYXBwaW5nX2Zs
YWdzID0gZ21jX3Y5XzBfYXJjdHVydXNfZ2V0X3ZtX21hcHBpbmdfZmxhZ3MNCj4gICB9Ow0KPiAg
IA0KPiAgIHN0YXRpYyB2b2lkIGdtY192OV8wX3NldF9nbWNfZnVuY3Moc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
