Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A3419AF9
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 12:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DE489518;
	Fri, 10 May 2019 10:01:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700061.outbound.protection.outlook.com [40.107.70.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C1C89518
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 10:01:20 +0000 (UTC)
Received: from DM6PR12MB3305.namprd12.prod.outlook.com (20.179.106.93) by
 DM6PR12MB2665.namprd12.prod.outlook.com (20.176.116.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Fri, 10 May 2019 10:01:18 +0000
Received: from DM6PR12MB3305.namprd12.prod.outlook.com
 ([fe80::6425:a766:7a85:436c]) by DM6PR12MB3305.namprd12.prod.outlook.com
 ([fe80::6425:a766:7a85:436c%3]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 10:01:18 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: avoid duplicated tmo report on same job
Thread-Topic: [PATCH] drm/amdgpu: avoid duplicated tmo report on same job
Thread-Index: AQHVBwCBOnzmYyYee0WGkzqcROAC1aZj8yGAgAAbpoCAABFFgA==
Date: Fri, 10 May 2019 10:01:17 +0000
Message-ID: <DM6PR12MB3305BCB914F1A80B99AFC6CD840C0@DM6PR12MB3305.namprd12.prod.outlook.com>
References: <1557472668-12462-1-git-send-email-Monk.Liu@amd.com>
 <DM6PR12MB3305DCE921FE18B7C909C3C5840C0@DM6PR12MB3305.namprd12.prod.outlook.com>
 <c1c9ec0a-6d11-849b-80a3-5d0d35b06dcd@amd.com>
In-Reply-To: <c1c9ec0a-6d11-849b-80a3-5d0d35b06dcd@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49b66f95-336e-4837-9d09-08d6d52e725e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2665; 
x-ms-traffictypediagnostic: DM6PR12MB2665:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB266516ABD43A8163198C1E2B840C0@DM6PR12MB2665.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:655;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(396003)(39860400002)(136003)(346002)(189003)(13464003)(199004)(3846002)(66066001)(6116002)(71200400001)(110136005)(256004)(14444005)(71190400001)(316002)(446003)(2501003)(74316002)(25786009)(6246003)(486006)(476003)(11346002)(186003)(305945005)(26005)(68736007)(8936002)(81156014)(6506007)(66946007)(73956011)(76116006)(7736002)(8676002)(66476007)(66556008)(64756008)(66446008)(53936002)(6436002)(52536014)(7696005)(81166006)(99286004)(966005)(72206003)(33656002)(86362001)(5660300002)(6306002)(102836004)(9686003)(14454004)(2906002)(55016002)(53546011)(478600001)(76176011)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2665;
 H:DM6PR12MB3305.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VPy4GvexZZKqq5j3Wq/3GNHALjLCKfegzvnQuhOFjpA6MTi3y+KxE+aeN9qPmpA9Xmu7XYwltD55aHTqL2xEbG7EnRfZGFrL128dGfCmD4Kl+9eJgwN6+d20t7cn2AEXbjmkW/ifTm4/BR90xLjTbuh2ZN+jarE8ASPyEWucSnkGNNiegNYj4JtT3qcXFDMjwTdBQOGX1W5n2dWW4O2vpOxrhzkfPlaSfJiqYAr4TGoPQqz/nA2r0bbppDqMGdUlcVALIPi4J21+/5LX2AdGGsObgm7RGbzl/ngH/Qs6Y+l8yss6HOaPhsWO6zDBiF/Z1wi6VWIdJLMdad1PrpowGLpNsil2e1Y84OEpAH81+OM2fEhQrOlxCxDm5bCi1Co4aW/SPhVyhVWfSD2Hs0aEq0EkEWdApOB3SbKStoKdKNo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b66f95-336e-4837-9d09-08d6d52e725e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 10:01:18.2398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2665
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUdPH6kFpUm9f6kNrBxioZwbZL0aXj9zSJPmfAkedi0=;
 b=MX7vcdS/mfo1v9g2x0EFEFS+ko5iElkU7/JRIUP60/ESu+7fCIlMHgXhA/boOcFm1jByCida8Og7iHZjsQ2u7uT435+aIVMUs877s2iMjo1LlB62CBpcsl3Lp7fc7JPB72k0eOIdPITvxfTBe731Mvg5qeMxjcY2r8rIzXPMOak=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
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

Q2hyaXN0aWFuLA0KDQpXb3VsZCB5b3VyIGFwcHJvYWNoIGxlYXZlIHRoZSBnbG9iYWwgcXVldWUg
KHdoaWNoIGhvbGRzIFREUiB3b3JrKSBzdHVjayB0aGVyZSBhbmQgb3RoZXIgd29yayBpdGVtIG5l
dmVyIGdldCBoYW5kbGVkID8NCg0KL01vbmsNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IEtvZW5pZywgQ2hyaXN0aWFuIA0KU2VudDogRnJpZGF5LCBNYXkgMTAsIDIwMTkgNDo1
OCBQTQ0KVG86IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiBhdm9pZCBkdXBs
aWNhdGVkIHRtbyByZXBvcnQgb24gc2FtZSBqb2INCg0KSGkgTW9uaywNCg0KeWVhaCwgdGhhdCdz
IG11Y2ggY2xvc2VyIHRvIHdoYXQgSSBoYWQgaW4gbWluZC4gQnV0IHlvdXIgY29tbWVudHMgZ290
IG1lIHRoaW5raW5nIG1vcmUgYWJvdXQgdGhpcy4NCg0KV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQg
Y2hhbmdpbmcgYW1kZ3B1X2pvYl90aW1lZG91dCgpIGxpa2UgdGhpczoNCiDCoMKgwqDCoMKgwqDC
oCBpZiAoYW1kZ3B1X2RldmljZV9zaG91bGRfcmVjb3Zlcl9ncHUocmluZy0+YWRldikpDQogwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIocmlu
Zy0+YWRldiwgam9iKTsNCivCoMKgwqDCoCBlbHNlDQorwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAg
ZG1hX2ZlbmNlX3dhaXQoc19qb2ItPnNfZmVuY2UtPnBhcmVudCk7DQoNCg0KVGhpcyB3YXkgd2Ug
d291bGQgYmxvY2sgdGhlIHRpbWVvdXQgd29ya2VyIHVudGlsIHdlIGFyZSBlaXRoZXIgbWFudWFs
bHkgcmVzZXR0aW5nIHVzaW5nIGRlYnVnZnMgb3IgdW5sb2FkaW5nIHRoZSBkcml2ZXIuDQoNClJl
Z2FyZHMsDQpDaHJpc3RpYW4uDQoNCkFtIDEwLjA1LjE5IHVtIDA5OjE5IHNjaHJpZWIgTGl1LCBN
b25rOg0KPiBIaSBDaHJpc3RpYW4sDQo+DQo+IFdoYXQgYWJvdXQgdGhpcyBvbmUsIG5vIHRpbWVy
IGxvZ2ljIGNoYW5nZSBvbiBzY2hlZHVsZXIgcGFydCwgb25seSB0aGUgDQo+IGR1cGxpY2F0ZWQg
dG1vIHJlcG9ydCBpcyBtdXRlZA0KPg0KPiAvTW9uaw0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnPiBPbiBCZWhhbGYgT2YgDQo+IE1vbmsgTGl1DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDEw
LCAyMDE5IDM6MTggUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2Ft
ZGdwdTogYXZvaWQgZHVwbGljYXRlZCB0bW8gcmVwb3J0IG9uIHNhbWUgam9iDQo+DQo+IFtDQVVU
SU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4NCj4gU2lnbmVkLW9mZi1ieTogTW9uayBMaXUgPE1vbmsu
TGl1QGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYyB8ICAzICstLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9qb2IuYyAgICB8IDEyICsrKysrKysrKysrLQ0KPiAgIGluY2x1ZGUvZHJtL2dwdV9zY2hlZHVs
ZXIuaCAgICAgICAgICAgICAgICB8ICAxICsNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IGluZGV4IGQ2Mjg2ZWQuLmYxZGMwYmEgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gQEAgLTMzNTYs
OCArMzM1Niw3IEBAIGJvb2wgYW1kZ3B1X2RldmljZV9zaG91bGRfcmVjb3Zlcl9ncHUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgICAgICAgIHJldHVybiB0cnVlOw0KPg0KPiAgIGRp
c2FibGVkOg0KPiAtICAgICAgICAgICAgICAgRFJNX0lORk8oIkdQVSByZWNvdmVyeSBkaXNhYmxl
ZC5cbiIpOw0KPiAtICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiArICAgICAgIHJldHVy
biBmYWxzZTsNCj4gICB9DQo+DQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfam9iLmMgDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2pvYi5jDQo+IGluZGV4IDEzOTc5NDIuLmNhNjIyNTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMNCj4gQEAgLTMzLDYgKzMzLDcgQEAgc3RhdGljIHZv
aWQgYW1kZ3B1X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2IpDQo+ICAg
ICAgICAgIHN0cnVjdCBhbWRncHVfcmluZyAqcmluZyA9IHRvX2FtZGdwdV9yaW5nKHNfam9iLT5z
Y2hlZCk7DQo+ICAgICAgICAgIHN0cnVjdCBhbWRncHVfam9iICpqb2IgPSB0b19hbWRncHVfam9i
KHNfam9iKTsNCj4gICAgICAgICAgc3RydWN0IGFtZGdwdV90YXNrX2luZm8gdGk7DQo+ICsgICAg
ICAgYm9vbCByZWNvdmVyOw0KPg0KPiAgICAgICAgICBtZW1zZXQoJnRpLCAwLCBzaXplb2Yoc3Ry
dWN0IGFtZGdwdV90YXNrX2luZm8pKTsNCj4NCj4gQEAgLTQyLDYgKzQzLDExIEBAIHN0YXRpYyB2
b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iKQ0KPiAg
ICAgICAgICAgICAgICAgIHJldHVybjsNCj4gICAgICAgICAgfQ0KPg0KPiArICAgICAgIHJlY292
ZXIgPSBhbWRncHVfZGV2aWNlX3Nob3VsZF9yZWNvdmVyX2dwdShyaW5nLT5hZGV2KTsNCj4gKyAg
ICAgICBpZiAoc19qb2ItPnNjaGVkLT5sYXN0X3Rtb19pZCA9PSBzX2pvYi0+aWQpDQo+ICsgICAg
ICAgICAgICAgICBnb3RvIHNraXBfcmVwb3J0Ow0KPiArDQo+ICsgICAgICAgc19qb2ItPnNjaGVk
LT5sYXN0X3Rtb19pZCA9IHNfam9iLT5pZDsNCj4gICAgICAgICAgYW1kZ3B1X3ZtX2dldF90YXNr
X2luZm8ocmluZy0+YWRldiwgam9iLT5wYXNpZCwgJnRpKTsNCj4gICAgICAgICAgRFJNX0VSUk9S
KCJyaW5nICVzIHRpbWVvdXQsIHNpZ25hbGVkIHNlcT0ldSwgZW1pdHRlZCBzZXE9JXVcbiIsDQo+
ICAgICAgICAgICAgICAgICAgICBqb2ItPmJhc2Uuc2NoZWQtPm5hbWUsIA0KPiBhdG9taWNfcmVh
ZCgmcmluZy0+ZmVuY2VfZHJ2Lmxhc3Rfc2VxKSwNCj4gQEAgLTQ5LDcgKzU1LDExIEBAIHN0YXRp
YyB2b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iKQ0K
PiAgICAgICAgICBEUk1fRVJST1IoIlByb2Nlc3MgaW5mb3JtYXRpb246IHByb2Nlc3MgJXMgcGlk
ICVkIHRocmVhZCAlcyBwaWQgJWRcbiIsDQo+ICAgICAgICAgICAgICAgICAgICB0aS5wcm9jZXNz
X25hbWUsIHRpLnRnaWQsIHRpLnRhc2tfbmFtZSwgdGkucGlkKTsNCj4NCj4gLSAgICAgICBpZiAo
YW1kZ3B1X2RldmljZV9zaG91bGRfcmVjb3Zlcl9ncHUocmluZy0+YWRldikpDQo+ICsgICAgICAg
aWYgKCFyZWNvdmVyKQ0KPiArICAgICAgICAgICAgICAgRFJNX0lORk8oIkdQVSByZWNvdmVyeSBk
aXNhYmxlZC5cbiIpOw0KPiArDQo+ICtza2lwX3JlcG9ydDoNCj4gKyAgICAgICBpZiAocmVjb3Zl
cikNCj4gICAgICAgICAgICAgICAgICBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKHJpbmctPmFk
ZXYsIGpvYik7ICB9DQo+DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVy
LmggYi9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmggDQo+IGluZGV4IDljMmE5NTcuLjE5NDRk
MjcgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaA0KPiArKysgYi9p
bmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgNCj4gQEAgLTI4Miw2ICsyODIsNyBAQCBzdHJ1Y3Qg
ZHJtX2dwdV9zY2hlZHVsZXIgew0KPiAgICAgICAgICBpbnQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGhhbmdfbGltaXQ7DQo+ICAgICAgICAgIGF0b21pY190ICAgICAgICAgICAgICAgICAg
ICAgICAgbnVtX2pvYnM7DQo+ICAgICAgICAgIGJvb2wgICAgICAgICAgICAgICAgICAgIHJlYWR5
Ow0KPiArICAgICAgIHVpbnQ2NF90IGxhc3RfdG1vX2lkOw0KPiAgIH07DQo+DQo+ICAgaW50IGRy
bV9zY2hlZF9pbml0KHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQsDQo+IC0tDQo+IDIu
Ny40DQo+DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
