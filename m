Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8BC49C0D
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 10:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308DE89048;
	Tue, 18 Jun 2019 08:32:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710073.outbound.protection.outlook.com [40.107.71.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3916489048
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 08:32:43 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB3520.namprd12.prod.outlook.com (20.179.82.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Tue, 18 Jun 2019 08:32:42 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5%6]) with mapi id 15.20.1965.019; Tue, 18 Jun 2019
 08:32:42 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 092/459] drm/amdgpu: add ib preemption status in amdgpu_job
Thread-Topic: [PATCH 092/459] drm/amdgpu: add ib preemption status in
 amdgpu_job
Thread-Index: AQHVJUFzPBBFkQV00k+5GFYlqP/cQqahDigAgAAG5rA=
Date: Tue, 18 Jun 2019 08:32:41 +0000
Message-ID: <MN2PR12MB3437D15684332D5E9DFA1715EFEA0@MN2PR12MB3437.namprd12.prod.outlook.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
 <20190617191700.17899-81-alexander.deucher@amd.com>
 <8429fbeb-fbb2-b71d-e146-c8f4c0959063@gmail.com>
In-Reply-To: <8429fbeb-fbb2-b71d-e146-c8f4c0959063@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6fa1e59-8b6d-4ebe-65dc-08d6f3c787b8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3520; 
x-ms-traffictypediagnostic: MN2PR12MB3520:
x-microsoft-antispam-prvs: <MN2PR12MB352099FEC017F1E8AD0E3A91EFEA0@MN2PR12MB3520.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(39860400002)(136003)(346002)(376002)(13464003)(189003)(199004)(66446008)(14454004)(76116006)(66556008)(73956011)(64756008)(68736007)(4326008)(7736002)(6246003)(26005)(53936002)(8676002)(186003)(66946007)(66066001)(5660300002)(81156014)(86362001)(81166006)(74316002)(8936002)(305945005)(102836004)(33656002)(54906003)(476003)(7696005)(478600001)(99286004)(76176011)(11346002)(71200400001)(71190400001)(14444005)(66574012)(316002)(66476007)(6506007)(25786009)(2501003)(52536014)(229853002)(3846002)(6116002)(446003)(256004)(486006)(6436002)(53546011)(72206003)(55016002)(9686003)(2906002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3520;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5Ss4Uziq/yQtQe7kv/5YrXu3yZoYgUdYYV+DtR0inZL75crIHwq4bxourQ3FKatbjM2yg5966FbQH1dPz+qAkzHQXP14MbPVt5yJVgMuxmVzoq4hE0DI9dHJuzFgAoSBVvvf8xA1h7FKw90Cpo5T1BNhByW2jzTW5QiVFO5rGVmFpA1JgfPagxPoPOSt8mniACq9dRKeEkLIBT/fox7ap75zLNZnlsF+1p2gH/yVeO6uOpqKffjr1q5hvvsh/VBd8ZdbYYaZBDPQKiQPN6fbC8wAivz7JeoyjGdHkGJ4gZp4/k3CBLh0macxkPyecQ98YzB/1eTrakQDYP6m8mhwyKQ8dACeaqQre9OHmY4nznZCTS/jWPXkWl7l6hCfwFjbRBrQG5RAmYw1rzB4+bYa+QihRuqsIoVG1hzxFmuaG8k=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fa1e59-8b6d-4ebe-65dc-08d6f3c787b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 08:32:41.8955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacxiao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3520
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yxphm1k+HXv5w9nxceNtswZXrbfKh4WVz+d+C6bp5c=;
 b=Z3jj754s1a5iBi+ajdftC3ADukqgMDLQEd71mQ5bTTyEqOVyUXyKocB4df2rxyU/k6WJViae8jE1VABwb+DazMaP7DePlItfHBR5eSzgRJxlnbpiOLNDWcuhwGioWDa2WKhFTKecvEPojdWjAjLoUd39QRGxNodbkPIbTFNCbjQ=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gb3JpZ2luYWwgcGF0Y2gsIHRoZXJlIGlzIG5vIGRlbGV0aW9uIG9uIGpvYi0+cHJlYW1ibGVf
c3RhdHVzLiANCg0KUmVnYXJkcywNCkphY2sNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29t
PiANClNlbnQ6IFR1ZXNkYXksIEp1bmUgMTgsIDIwMTkgNDowNCBQTQ0KVG86IEFsZXggRGV1Y2hl
ciA8YWxleGRldWNoZXJAZ21haWwuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
CkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBYaWFv
LCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT47IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5n
QGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIDA5Mi80NTldIGRybS9hbWRncHU6IGFkZCBp
YiBwcmVlbXB0aW9uIHN0YXR1cyBpbiBhbWRncHVfam9iDQoNCkFtIDE3LjA2LjE5IHVtIDIxOjEw
IHNjaHJpZWIgQWxleCBEZXVjaGVyOg0KPiBGcm9tOiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQu
Y29tPg0KPg0KPiBBZGQgaWIgcHJlZW1wdGlvbiBzdGF0dXMgaW4gYW1kZ3B1X2pvYiwgc28gdGhh
dCByaW5nIGxldmVsIGZ1bmN0aW9uIA0KPiBjYW4gZGV0ZWN0IHByZWVtcHRpb24gYW5kIHByb2dy
YW0gZm9yIHJlc3VtaW5nIGl0Lg0KPg0KPiBBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPg0KPiBSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2lu
Zy5aaGFuZ0BhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0Bh
bWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9p
Yi5jICB8IDIgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmgg
fCAzICsrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
aWIuYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYw0KPiBpbmRl
eCBlMTU1MzFiZmNkNDcuLjkwY2MwODQxYjU2NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2liLmMNCj4gQEAgLTIwOCw3ICsyMDgsNyBAQCBpbnQgYW1kZ3B1X2liX3Nj
aGVkdWxlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgDQo+IHVuc2lnbmVkIG51bV9pYnMsDQo+
ICAgDQo+ICAgCXNraXBfcHJlYW1ibGUgPSByaW5nLT5jdXJyZW50X2N0eCA9PSBmZW5jZV9jdHg7
DQo+ICAgCWlmIChqb2IgJiYgcmluZy0+ZnVuY3MtPmVtaXRfY250eGNudGwpIHsNCj4gLQkJc3Rh
dHVzIHw9IGpvYi0+cHJlYW1ibGVfc3RhdHVzOw0KPiArCQlzdGF0dXMgfD0gam9iLT5wcmVlbXB0
aW9uX3N0YXR1czsNCg0KVGhhdCBhY3R1YWxseSBsb29rcyBjb21wbGV0ZWx5IGluY29ycmVjdCB0
byBtZSBzaW5jZSBpdCBicmVha3MgdGhlIG9sZCBzdGF0dXMgaGFuZGxpbmcuDQoNCkNocmlzdGlh
bi4NCg0KPiAgIAkJYW1kZ3B1X3JpbmdfZW1pdF9jbnR4Y250bChyaW5nLCBzdGF0dXMpOw0KPiAg
IAl9DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfam9iLmggDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5oDQo+
IGluZGV4IGUxYjQ2YTY3MDNkZS4uNTFlNjI1MDRjMjc5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5oDQo+IEBAIC0yOSw2ICsyOSw4IEBADQo+ICAgI2RlZmlu
ZSBBTURHUFVfUFJFQU1CTEVfSUJfUFJFU0VOVF9GSVJTVCAgICAoMSA8PCAxKQ0KPiAgIC8qIGJp
dCBzZXQgbWVhbnMgY29udGV4dCBzd2l0Y2ggb2NjdXJlZCAqLw0KPiAgICNkZWZpbmUgQU1ER1BV
X0hBVkVfQ1RYX1NXSVRDSCAgICAgICAgICAgICAgKDEgPDwgMikNCj4gKy8qIGJpdCBzZXQgbWVh
bnMgSUIgaXMgcHJlZW1wdGVkICovDQo+ICsjZGVmaW5lIEFNREdQVV9JQl9QUkVFTVBURUQgICAg
ICAgICAgICAgICAgICgxIDw8IDMpDQo+ICAgDQo+ICAgI2RlZmluZSB0b19hbWRncHVfam9iKHNj
aGVkX2pvYikJCVwNCj4gICAJCWNvbnRhaW5lcl9vZigoc2NoZWRfam9iKSwgc3RydWN0IGFtZGdw
dV9qb2IsIGJhc2UpIEBAIC00NSw2ICs0Nyw3IA0KPiBAQCBzdHJ1Y3QgYW1kZ3B1X2pvYiB7DQo+
ICAgCXN0cnVjdCBhbWRncHVfaWIJKmliczsNCj4gICAJc3RydWN0IGRtYV9mZW5jZQkqZmVuY2U7
IC8qIHRoZSBodyBmZW5jZSAqLw0KPiAgIAl1aW50MzJfdAkJcHJlYW1ibGVfc3RhdHVzOw0KPiAr
CXVpbnQzMl90ICAgICAgICAgICAgICAgIHByZWVtcHRpb25fc3RhdHVzOw0KPiAgIAl1aW50MzJf
dAkJbnVtX2liczsNCj4gICAJdm9pZAkJCSpvd25lcjsNCj4gICAJYm9vbCAgICAgICAgICAgICAg
ICAgICAgdm1fbmVlZHNfZmx1c2g7DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
