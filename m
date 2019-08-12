Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73E0895E2
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 05:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638436E453;
	Mon, 12 Aug 2019 03:58:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820045.outbound.protection.outlook.com [40.107.82.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681AB6E453
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 03:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxgmixegDmlDLQI767jsc5tzbTRSmq9dY8EW7DvAI6AxizEY8/tuB1f04n+L1hZr+id0D0UkyHtUN6GT/lYaVSRcwX/i8Nbw1wXJwoOF1r6xVX3rO7JZMxv/oYTLOiZqvH6rd9ncSSU1aGPdGzc8QYMIH1q52Sm4f3s6PaSLKjP8ZA9RD+GH+e86PZ2X50c8/3PuRUCIm4A+Y7oMEjI8OKGb8mNCFAPS7Fivzm2Emd6h/hTaEemSClsFhAaPnb7C53i4oOkxnIQr1B8ziX3SSMIkNHMCxXifNpnh7n8rfaNyo6rHetEPQgfwp1+2kCeTdEk2K6eaggY7d0k+47KZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkI387H9hgzWhSDZdUnlZrxdF4qRUxlLQ7Inqe+2EH0=;
 b=n9GxFGzXJHXUODmKimM07N3aiy8BTTI17kfCmDIpr6oXVwlUFqIwNX2IcmK+XjPgBJsgM2Ft/uqswfowVb9x1TGRSBO7qaMLpcoooa3KfD2qiJzRJVRAF7Gk4/6waPZYQEl3pgPqBs1S+W3g0CrJoeTihOLXOC/X/NkHxBoj/HBhBK3qh07d3wbfIXRPa/D1og/9rrDPF1pcXuzNIrFnk4jrnc3fb3ZdXWk2Xgjp+ZIEDlmVsaGYxMTRd+1szZvyz8AaDagn27l+wRrGsp+WEx6QAAbYGxtiIPvFeP4pdo8KG8dEXZOx1Ca4foEJVLZOZLwGDCyXzNf6fN+wXqVkfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4158.namprd12.prod.outlook.com (10.255.224.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Mon, 12 Aug 2019 03:58:34 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e%7]) with mapi id 15.20.2136.018; Mon, 12 Aug 2019
 03:58:34 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 00/27] Add Renoir APU support
Thread-Topic: [PATCH 00/27] Add Renoir APU support
Thread-Index: AQHVTsqU0h0UTWELM0aIn7p/MpFg56b25p9A
Date: Mon, 12 Aug 2019 03:58:34 +0000
Message-ID: <MN2PR12MB3309FF11B1E6452D48C50080ECD30@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47e1c3fb-b79a-4825-5b5b-08d71ed958e8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4158; 
x-ms-traffictypediagnostic: MN2PR12MB4158:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB415811B8090F4B6E0F67F8B8ECD30@MN2PR12MB4158.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(189003)(13464003)(199004)(25786009)(5660300002)(476003)(110136005)(7736002)(14454004)(14444005)(2501003)(52536014)(86362001)(3846002)(446003)(11346002)(229853002)(316002)(9686003)(6306002)(8936002)(53936002)(26005)(66066001)(6246003)(2906002)(256004)(102836004)(66446008)(66556008)(4326008)(71200400001)(186003)(71190400001)(76116006)(53546011)(8676002)(81156014)(66946007)(64756008)(66476007)(99286004)(81166006)(478600001)(6506007)(76176011)(55016002)(74316002)(6116002)(7696005)(966005)(33656002)(305945005)(486006)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4158;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rz6bAo9P9ZQf9Uah3EP7fdbq9MAJ4OTIgrjAQskJNTrEjwLEZoYQbx66PMC7H5qv6l5J58ReidcUirgyyHIsXErfkVTE6jb2oMK3Ib/laAP6/fpOTuaggsP1jIr6tCruuIehSqUsTu9i5OZI4r966v0vBKWJH0qg+rCFu4tL5r4MVPOBknWDKOAFt0pgbAf4wYrGxQWY59dofBa4VeriTL7RSDXMek9pvgVA4KWu3vMPnO1VgvBEtMmDWJEXFRf4dFvnoxPSWhoIt9Qgh9XlaTL60H1WfSJHiv7+TLNDrMvrpwIsJ7zSn5YLMhU26Fn+z3INvx9YbdA8lhoQ12HZnryQqSfE/kLfW5Kupbfc+7Aq8GJlbJ1YcPVRdaA1Gvj2D/h6SiMsvj2Dbjm/8yuiBnZZ/ixITLchqGckW/+7vTQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e1c3fb-b79a-4825-5b5b-08d71ed958e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 03:58:34.2954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4158
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkI387H9hgzWhSDZdUnlZrxdF4qRUxlLQ7Inqe+2EH0=;
 b=zvJmg/j6oIkFf1VVUmreMi/Oey3ua+6uu+1OTM1OWTLkB/GcnGeKUyddNxsWcXfGnrYcAz8VWeh1h+ZkPNG0YZkH7IW3/imsVZKjnuygYWbRPr/1ofy3zYvn6MBAbmeKDsaUcSJggykSVDMWhc5G1DyuEzuXkdJHdEYd1OeGSRM=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGFyZSBBY2tlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5j
ZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxleA0KPiBEZXVjaGVyDQo+
IFNlbnQ6IEZyaWRheSwgQXVndXN0IDA5LCAyMDE5IDExOjUzIFBNDQo+IFRvOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIu
RGV1Y2hlckBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMDAvMjddIEFkZCBSZW5vaXIgQVBV
IHN1cHBvcnQNCj4gDQo+IFRoaXMgcGF0Y2ggc2V0IHByb3ZpZGVzIGluaXRpYWwgc3VwcG9ydCBm
b3IgYSBuZXcgQVBVLCByZW5vaXIuDQo+IA0KPiBBYXJvbiBMaXUgKDkpOg0KPiAgIGRybS9hbWRn
cHU6IGZpeCBubyBpbnRlcnJ1cHQgaXNzdWUgZm9yIHJlbm9pciBlbXUNCj4gICBkcm0vYW1kZ3B1
OiBlbmFibGUgZGNlIHZpcnR1YWwgaXAgbW9kdWxlIGZvciBSZW5vaXINCj4gICBkcm0vYW1kZ3B1
OiBhZGQgYXNpYyBmdW5jcyBmb3IgcmVub2lyDQo+ICAgZHJtL2FtZGdwdTogc2V0IHJsYyBmdW5j
cyBmb3IgcmVub2lyDQo+ICAgZHJtL2FtZGdwdTogYWRkIHBzcF92MTJfMCBmb3IgcmVub2lyICh2
MikNCj4gICBkcm0vYW1kZ3B1OiBlbmFibGUgY2xvY2sgZ2F0aW5nIGZvciByZW5vaXINCj4gICBk
cm0vYW1kZ3B1OiBlbmFibGUgcG93ZXIgZ2F0aW5nIGZvciByZW5vaXINCj4gICBkcm0vYW1kZ3B1
OiB1cGRhdGUgbGJwdyBmb3IgcmVub2lyDQo+ICAgZHJtL2FtZGdwdTogc2V0IGZ3IGRlZmF1bHQg
bG9hZGluZyBieSBwc3AgZm9yIHJlbm9pcg0KPiANCj4gQWxleCBEZXVjaGVyICgxKToNCj4gICBk
cm0vYW1kZ3B1OiBmbGFnIHJlbm9pciBhcyBleHBlcmltZW50YWwgZm9yIG5vdw0KPiANCj4gSHVh
bmcgUnVpICgxNCk6DQo+ICAgZHJtL2FtZGdwdTogYWRkIHJlbm9pciBoZWFkZXIgZmlsZXMgKHYy
KQ0KPiAgIGRybS9hbWRncHU6IGFkZCByZW5vaXIgYXNpY190eXBlIGVudW0NCj4gICBkcm0vYW1k
Z3B1OiBhZGQgcmVub2lyIHN1cHBvcnQgZm9yIGdwdV9pbmZvIGFuZCBpcCBibG9jayBzZXR0aW5n
DQo+ICAgZHJtL2FtZGdwdTogYWRkIHNvYzE1IGNvbW1vbiBpcCBibG9jayBzdXBwb3J0IGZvciBy
ZW5vaXINCj4gICBkcm0vYW1kZ3B1OiBhZGQgZ21jIHY5IHN1cHBvcnRzIGZvciByZW5vaXINCj4g
ICBkcm0vYW1kZ3B1OiBzZXQgZncgbG9hZCB0eXBlIGZvciByZW5vaXINCj4gICBkcm0vYW1kZ3B1
OiBhZGQgZ2Z4IHN1cHBvcnQgZm9yIHJlbm9pcg0KPiAgIGRybS9hbWRncHU6IGFkZCBzZG1hIHN1
cHBvcnQgZm9yIHJlbm9pcg0KPiAgIGRybS9hbWRncHU6IHNldCBpcCBibG9ja3MgZm9yIHJlbm9p
cg0KPiAgIGRybS9hbWRncHU6IGFkZCByZW5vaXIgcGNpIGlkDQo+ICAgZHJtL2FtZGdwdTogYWRk
IGdmeCBnb2xkZW4gc2V0dGluZ3MgZm9yIHJlbm9pciAodjIpDQo+ICAgZHJtL2FtZGdwdTogYWRk
IHNkbWEgZ29sZGVuIHNldHRpbmdzIGZvciByZW5vaXINCj4gICBkcm0vYW1kZ3B1OiB1c2UgZGly
ZWN0IGxvYWRpbmcgb24gcmVub2lyIHZjbiBmb3IgdGhlIG1vbWVudA0KPiAgIGRybS9hbWRncHU6
IHNraXAgbWVjMiBqdW1wIHRhYmxlIGxvYWRpbmcgZm9yIHJlbm9pcg0KPiANCj4gTGVvIExpdSAo
Myk6DQo+ICAgZHJtL2FtZGdwdTogZW5hYmxlIFJlbm9pciBWQ04gZmlybXdhcmUgbG9hZGluZw0K
PiAgIGRybS9hbWRncHU6IGVuYWJsZSBEb29yYmVsbCBzdXBwb3J0IGZvciBSZW5vaXIgKHYyKQ0K
PiAgIGRybS9hbWRncHU6IGFkZCBWQ04yLjAgdG8gUmVub2lyIElQIGJsb2Nrcw0KPiANCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlICAgICAgICAgICB8ICAgMyArLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jICAgIHwgICA5ICstDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgICAgICAgfCAgIDMgKw0K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jICAgICAgIHwgIDE3ICsN
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaCAgICAgICB8ICAgMSAr
DQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYyAgICAgfCAgIDIg
Kw0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jICAgICAgIHwgIDE3
ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdmlydHVhbC5jICAgICAgfCAg
IDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgICAgICAgIHwg
IDU2ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgICAgICAg
fCAgIDcgKw0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N18wLmMgICAgICAg
IHwgIDIxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTJfMC5jICAgICAg
ICB8IDU2NSArKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92
MTJfMC5oICAgICAgICB8ICAzMCArDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1h
X3Y0XzAuYyAgICAgICAgfCAgMjMgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMgICAgICAgICAgICB8ICAyMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92
Y25fdjJfMC5jICAgICAgICAgfCAgIDkgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3ZlZ2ExMF9paC5jICAgICAgICB8ICAgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmVnYTEwX3JlZ19pbml0LmMgIHwgICA0ICsNCj4gIC4uLi9pbmNsdWRlL2FzaWNfcmVnL21w
L21wXzEyXzBfMF9vZmZzZXQuaCAgICB8IDMzNiArKysrKysrDQo+ICAuLi4vaW5jbHVkZS9hc2lj
X3JlZy9tcC9tcF8xMl8wXzBfc2hfbWFzay5oICAgfCA4NjYNCj4gKysrKysrKysrKysrKysrKysr
DQo+ICBpbmNsdWRlL2RybS9hbWRfYXNpY190eXBlLmggICAgICAgICAgICAgICAgICAgfCAgIDEg
Kw0KPiAgMjEgZmlsZXMgY2hhbmdlZCwgMTk4MiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3Bf
djEyXzAuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3BzcF92MTJfMC5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gZHJpdmVycy9ncHUvZHJtL2Ft
ZC9pbmNsdWRlL2FzaWNfcmVnL21wL21wXzEyXzBfMF9vZmZzZXQuaA0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0DQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9tcC9tcF8xMl8w
XzBfc2hfbWFzay5oDQo+IA0KPiAtLQ0KPiAyLjIwLjENCj4gDQo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
