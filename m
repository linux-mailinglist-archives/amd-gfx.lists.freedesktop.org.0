Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143AC19CF9
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 14:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481BD89C55;
	Fri, 10 May 2019 12:07:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780083.outbound.protection.outlook.com [40.107.78.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AA089C55
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 12:07:12 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1578.namprd12.prod.outlook.com (10.172.39.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Fri, 10 May 2019 12:07:09 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 12:07:09 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Liu, Monk" <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: avoid duplicated tmo report on same job
Thread-Topic: [PATCH] drm/amdgpu: avoid duplicated tmo report on same job
Thread-Index: AQHVBwCBOnzmYyYee0WGkzqcROAC1aZj8yGAgAAbpoCAABFFgIAAI64A
Date: Fri, 10 May 2019 12:07:09 +0000
Message-ID: <2b8853fc-23ca-a766-275f-ec1706e86c16@amd.com>
References: <1557472668-12462-1-git-send-email-Monk.Liu@amd.com>
 <DM6PR12MB3305DCE921FE18B7C909C3C5840C0@DM6PR12MB3305.namprd12.prod.outlook.com>
 <c1c9ec0a-6d11-849b-80a3-5d0d35b06dcd@amd.com>
 <DM6PR12MB3305BCB914F1A80B99AFC6CD840C0@DM6PR12MB3305.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB3305BCB914F1A80B99AFC6CD840C0@DM6PR12MB3305.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6P195CA0105.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::46) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed266d68-20ed-4caf-7fad-08d6d54006fb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1578; 
x-ms-traffictypediagnostic: DM5PR12MB1578:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB15784A9D195A7F22F1969B7C830C0@DM5PR12MB1578.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:854;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(396003)(366004)(136003)(13464003)(189003)(199004)(53546011)(386003)(52116002)(65826007)(31696002)(86362001)(6506007)(65956001)(486006)(99286004)(76176011)(25786009)(102836004)(2501003)(46003)(6246003)(36756003)(186003)(66946007)(73956011)(66556008)(64756008)(66446008)(71200400001)(71190400001)(2906002)(14454004)(316002)(8676002)(81166006)(7736002)(305945005)(8936002)(66476007)(966005)(14444005)(256004)(65806001)(81156014)(31686004)(58126008)(11346002)(476003)(446003)(53936002)(2616005)(6116002)(64126003)(6512007)(68736007)(5660300002)(110136005)(478600001)(72206003)(6436002)(6486002)(6306002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1578;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8Bb6eaalg1bnJdncTEIPSendTihThqodhrSc8QZW0PgRFGQtlzrs3hf9A7ksMCFaNBPeN8m1QL+BQ6XkfSM7tWehDgdlTOE61j9HOTLwbJ/FvJo78V3dtw4/rF+yDHAPVNKfGhtgHjPe1rBt7LrGj5/1iFGMzcaKKzreP+7BGXnJ18ylmdcmX6xoxtlKWJA20D3qiOqNdsi5GdlgWPuaOaRnfpghS+pJPkkXacghSxGBsXrTvRlex/L8EOl4xgOcDApn3wLdTeIh3ww7b+nixEK3uuxKFrIDBNEOWRch2SJ2QQvH/4e/2e24DYI3lZnJxJ0HyUBVENRP78vXyzffB0Zou2fnhdBWe0AV8Sgd2I6cjADnWvsJYWllGZqjEQOSBgejxaYE2nQ/s2cl2fgitvLankUezUCKZVZ3kcRJd0I=
Content-ID: <EE46B90EE66D3B40AE63EE1573D812F0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed266d68-20ed-4caf-7fad-08d6d54006fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 12:07:09.3944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0QV1jiKCe4T5DO+vhmwVc60j3MaOLoh/7Jn8T6Uv70=;
 b=w8vSxL4m7nm/v8ipAIGsXg9wBt6YQ06w12gFM7Mw96p0MedCkHQcSX4B7+PXlRZA7SEvSN5rdP8/UISb3dN13dkh6cZXrZCoxV6ntJb2J8hmQtZPWVo9cjyHrFPE3D5brR/5roBFKYQZNWTtmtoXj7oBa3QhAH81V5Hz8Th4Bv0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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

WWVhaCwgdGhhdCdzIGluZGVlZCBhIGJpdCBwcm9ibGVtYXRpYy4gSG93IGFib3V0IGNhbGxpbmcg
DQpkcm1fc2NoZWRfc3VzcGVuZF90aW1lb3V0KCkgdGhlbj8NCg0KT24gdGhlIG90aGVyIGhhbmQg
anVzdCBzdXBwcmVzc2luZyB0aGUgbG9nZ2luZyBpcyBmaW5lIHdpdGggbWUgYXMgd2VsbC4NCg0K
Q2hyaXN0aWFuLg0KDQpBbSAxMC4wNS4xOSB1bSAxMjowMSBzY2hyaWViIExpdSwgTW9uazoNCj4g
Q2hyaXN0aWFuLA0KPg0KPiBXb3VsZCB5b3VyIGFwcHJvYWNoIGxlYXZlIHRoZSBnbG9iYWwgcXVl
dWUgKHdoaWNoIGhvbGRzIFREUiB3b3JrKSBzdHVjayB0aGVyZSBhbmQgb3RoZXIgd29yayBpdGVt
IG5ldmVyIGdldCBoYW5kbGVkID8NCj4NCj4gL01vbmsNCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogS29lbmlnLCBDaHJpc3RpYW4NCj4gU2VudDogRnJpZGF5LCBNYXkg
MTAsIDIwMTkgNDo1OCBQTQ0KPiBUbzogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPjsgYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2Ft
ZGdwdTogYXZvaWQgZHVwbGljYXRlZCB0bW8gcmVwb3J0IG9uIHNhbWUgam9iDQo+DQo+IEhpIE1v
bmssDQo+DQo+IHllYWgsIHRoYXQncyBtdWNoIGNsb3NlciB0byB3aGF0IEkgaGFkIGluIG1pbmQu
IEJ1dCB5b3VyIGNvbW1lbnRzIGdvdCBtZSB0aGlua2luZyBtb3JlIGFib3V0IHRoaXMuDQo+DQo+
IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IGNoYW5naW5nIGFtZGdwdV9qb2JfdGltZWRvdXQoKSBs
aWtlIHRoaXM6DQo+ICAgwqDCoMKgwqDCoMKgwqAgaWYgKGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3Jl
Y292ZXJfZ3B1KHJpbmctPmFkZXYpKQ0KPiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKHJpbmctPmFkZXYsIGpvYik7DQo+ICvCoMKgwqDC
oCBlbHNlDQo+ICvCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBkbWFfZmVuY2Vfd2FpdChzX2pvYi0+
c19mZW5jZS0+cGFyZW50KTsNCj4NCj4NCj4gVGhpcyB3YXkgd2Ugd291bGQgYmxvY2sgdGhlIHRp
bWVvdXQgd29ya2VyIHVudGlsIHdlIGFyZSBlaXRoZXIgbWFudWFsbHkgcmVzZXR0aW5nIHVzaW5n
IGRlYnVnZnMgb3IgdW5sb2FkaW5nIHRoZSBkcml2ZXIuDQo+DQo+IFJlZ2FyZHMsDQo+IENocmlz
dGlhbi4NCj4NCj4gQW0gMTAuMDUuMTkgdW0gMDk6MTkgc2NocmllYiBMaXUsIE1vbms6DQo+PiBI
aSBDaHJpc3RpYW4sDQo+Pg0KPj4gV2hhdCBhYm91dCB0aGlzIG9uZSwgbm8gdGltZXIgbG9naWMg
Y2hhbmdlIG9uIHNjaGVkdWxlciBwYXJ0LCBvbmx5IHRoZQ0KPj4gZHVwbGljYXRlZCB0bW8gcmVw
b3J0IGlzIG11dGVkDQo+Pg0KPj4gL01vbmsNCj4+DQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz4gT24gQmVoYWxmIE9mDQo+PiBNb25rIExpdQ0KPj4gU2VudDogRnJpZGF5LCBNYXkgMTAs
IDIwMTkgMzoxOCBQTQ0KPj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBD
YzogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPg0KPj4gU3ViamVjdDogW1BBVENIXSBkcm0v
YW1kZ3B1OiBhdm9pZCBkdXBsaWNhdGVkIHRtbyByZXBvcnQgb24gc2FtZSBqb2INCj4+DQo+PiBb
Q0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTW9uayBMaXUg
PE1vbmsuTGl1QGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYyB8ICAzICstLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2pvYi5jICAgIHwgMTIgKysrKysrKysrKystDQo+PiAgICBpbmNsdWRlL2Ry
bS9ncHVfc2NoZWR1bGVyLmggICAgICAgICAgICAgICAgfCAgMSArDQo+PiAgICAzIGZpbGVzIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4+IGluZGV4IGQ2Mjg2ZWQu
LmYxZGMwYmEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYw0KPj4gQEAgLTMzNTYsOCArMzM1Niw3IEBAIGJvb2wgYW1kZ3B1X2RldmljZV9zaG91
bGRfcmVjb3Zlcl9ncHUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+PiAgICAgICAgICAg
cmV0dXJuIHRydWU7DQo+Pg0KPj4gICAgZGlzYWJsZWQ6DQo+PiAtICAgICAgICAgICAgICAgRFJN
X0lORk8oIkdQVSByZWNvdmVyeSBkaXNhYmxlZC5cbiIpOw0KPj4gLSAgICAgICAgICAgICAgIHJl
dHVybiBmYWxzZTsNCj4+ICsgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gICAgfQ0KPj4NCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jDQo+
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYw0KPj4gaW5kZXggMTM5
Nzk0Mi4uY2E2MjI1MyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9qb2IuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2pvYi5jDQo+PiBAQCAtMzMsNiArMzMsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfam9iX3RpbWVk
b3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzX2pvYikNCj4+ICAgICAgICAgICBzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcgPSB0b19hbWRncHVfcmluZyhzX2pvYi0+c2NoZWQpOw0KPj4gICAgICAg
ICAgIHN0cnVjdCBhbWRncHVfam9iICpqb2IgPSB0b19hbWRncHVfam9iKHNfam9iKTsNCj4+ICAg
ICAgICAgICBzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5mbyB0aTsNCj4+ICsgICAgICAgYm9vbCByZWNv
dmVyOw0KPj4NCj4+ICAgICAgICAgICBtZW1zZXQoJnRpLCAwLCBzaXplb2Yoc3RydWN0IGFtZGdw
dV90YXNrX2luZm8pKTsNCj4+DQo+PiBAQCAtNDIsNiArNDMsMTEgQEAgc3RhdGljIHZvaWQgYW1k
Z3B1X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2IpDQo+PiAgICAgICAg
ICAgICAgICAgICByZXR1cm47DQo+PiAgICAgICAgICAgfQ0KPj4NCj4+ICsgICAgICAgcmVjb3Zl
ciA9IGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3JlY292ZXJfZ3B1KHJpbmctPmFkZXYpOw0KPj4gKyAg
ICAgICBpZiAoc19qb2ItPnNjaGVkLT5sYXN0X3Rtb19pZCA9PSBzX2pvYi0+aWQpDQo+PiArICAg
ICAgICAgICAgICAgZ290byBza2lwX3JlcG9ydDsNCj4+ICsNCj4+ICsgICAgICAgc19qb2ItPnNj
aGVkLT5sYXN0X3Rtb19pZCA9IHNfam9iLT5pZDsNCj4+ICAgICAgICAgICBhbWRncHVfdm1fZ2V0
X3Rhc2tfaW5mbyhyaW5nLT5hZGV2LCBqb2ItPnBhc2lkLCAmdGkpOw0KPj4gICAgICAgICAgIERS
TV9FUlJPUigicmluZyAlcyB0aW1lb3V0LCBzaWduYWxlZCBzZXE9JXUsIGVtaXR0ZWQgc2VxPSV1
XG4iLA0KPj4gICAgICAgICAgICAgICAgICAgICBqb2ItPmJhc2Uuc2NoZWQtPm5hbWUsDQo+PiBh
dG9taWNfcmVhZCgmcmluZy0+ZmVuY2VfZHJ2Lmxhc3Rfc2VxKSwNCj4+IEBAIC00OSw3ICs1NSwx
MSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9i
ICpzX2pvYikNCj4+ICAgICAgICAgICBEUk1fRVJST1IoIlByb2Nlc3MgaW5mb3JtYXRpb246IHBy
b2Nlc3MgJXMgcGlkICVkIHRocmVhZCAlcyBwaWQgJWRcbiIsDQo+PiAgICAgICAgICAgICAgICAg
ICAgIHRpLnByb2Nlc3NfbmFtZSwgdGkudGdpZCwgdGkudGFza19uYW1lLCB0aS5waWQpOw0KPj4N
Cj4+IC0gICAgICAgaWYgKGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3JlY292ZXJfZ3B1KHJpbmctPmFk
ZXYpKQ0KPj4gKyAgICAgICBpZiAoIXJlY292ZXIpDQo+PiArICAgICAgICAgICAgICAgRFJNX0lO
Rk8oIkdQVSByZWNvdmVyeSBkaXNhYmxlZC5cbiIpOw0KPj4gKw0KPj4gK3NraXBfcmVwb3J0Og0K
Pj4gKyAgICAgICBpZiAocmVjb3ZlcikNCj4+ICAgICAgICAgICAgICAgICAgIGFtZGdwdV9kZXZp
Y2VfZ3B1X3JlY292ZXIocmluZy0+YWRldiwgam9iKTsgIH0NCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oIGIvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5o
DQo+PiBpbmRleCA5YzJhOTU3Li4xOTQ0ZDI3IDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9kcm0v
Z3B1X3NjaGVkdWxlci5oDQo+PiArKysgYi9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgNCj4+
IEBAIC0yODIsNiArMjgyLDcgQEAgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyIHsNCj4+ICAgICAg
ICAgICBpbnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhhbmdfbGltaXQ7DQo+PiAgICAg
ICAgICAgYXRvbWljX3QgICAgICAgICAgICAgICAgICAgICAgICBudW1fam9iczsNCj4+ICAgICAg
ICAgICBib29sICAgICAgICAgICAgICAgICAgICByZWFkeTsNCj4+ICsgICAgICAgdWludDY0X3Qg
bGFzdF90bW9faWQ7DQo+PiAgICB9Ow0KPj4NCj4+ICAgIGludCBkcm1fc2NoZWRfaW5pdChzdHJ1
Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkLA0KPj4gLS0NCj4+IDIuNy40DQo+Pg0KPj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGFtZC1nZngg
bWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
