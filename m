Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4083363B8F
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 21:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24006E094;
	Tue,  9 Jul 2019 19:00:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720083.outbound.protection.outlook.com [40.107.72.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D056E094
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 19:00:48 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3498.namprd12.prod.outlook.com (20.178.199.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 19:00:46 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 19:00:46 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Subject: Re: [PATCH 1/3] drm/amdgpu: Add flag for allocating memory for
 sensitive data
Thread-Topic: [PATCH 1/3] drm/amdgpu: Add flag for allocating memory for
 sensitive data
Thread-Index: AQHVNhfAtkAJMzNa0UazWeKukI/fz6bCF7WAgACNVIA=
Date: Tue, 9 Jul 2019 19:00:46 +0000
Message-ID: <da90e4c0-067b-2ffe-01df-f59c2b7ec556@amd.com>
References: <20190709053222.22588-1-Felix.Kuehling@amd.com>
 <b1a0638a-4be3-0a7b-7d29-309942f24263@daenzer.net>
In-Reply-To: <b1a0638a-4be3-0a7b-7d29-309942f24263@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTXPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::42) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 749680ed-8291-4019-15c7-08d7049fc00d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3498; 
x-ms-traffictypediagnostic: DM6PR12MB3498:
x-microsoft-antispam-prvs: <DM6PR12MB34983751C54BC67124CF960892F10@DM6PR12MB3498.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(189003)(199004)(186003)(58126008)(31686004)(446003)(81156014)(81166006)(316002)(476003)(76176011)(65956001)(65806001)(386003)(6506007)(11346002)(99286004)(2616005)(6116002)(68736007)(53936002)(8936002)(72206003)(86362001)(102836004)(7736002)(53546011)(6916009)(26005)(305945005)(6486002)(486006)(6246003)(8676002)(3846002)(31696002)(14454004)(6436002)(66066001)(73956011)(256004)(36756003)(4326008)(66574012)(5660300002)(25786009)(478600001)(6512007)(66946007)(71200400001)(66476007)(66556008)(64756008)(66446008)(71190400001)(2906002)(65826007)(229853002)(64126003)(52116002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3498;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fjTOZT555iphPcEoRfNAFhCC0nJfolNFuEZhigfsMKm8FmqcxvpaRQ4dC4Y4VzOfwSvdr1l3ODN1gFev49FBd0XLz6dBoBIY33gGO/jPEN3WtjJY7g7nR3t/XrWM7S0qsLDWcyRfJOUBBGu6tIfGEBLNt6uYc3ig1dZXR+zL3tRhTPORZk4QOwd1hoEi45DCuBBzOdFSS4Z++SO3gNsy/KFKbFxqbnvQaZXh6w1z5nwzvQg7wlATJUTLz0Izkn74oeffdBZ+44+JuhtLfqAAHOz5uUwqMK1+DVDyL7ceXfrjCHxVvnGW1uKZU35jYT1C3HwElctP2xuEQ3PgKwhTE4cRY0xf0TMW8gwob2sj7wNEBfayTQYZMPbdVfQOcOOLDsr4LOQz8889WXasa16rpaNpgBUC/d9lzY2eRo6BHHs=
Content-ID: <2C58B76A383BA243BB5B61B2585CAC4F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 749680ed-8291-4019-15c7-08d7049fc00d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 19:00:46.6867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3498
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deKGtJZ+vlOl2R+7EnyPfrvSQPW65Q5bbdmxHXoRtNA=;
 b=zLBlp5g3m9movCfrdVF1VTAe/aE7w4x2w2uB637qtHVL4wHTWksOGTwd8s+mF8j6Hr+/y6u6y60jN3SytVt1vmYE5AyBg6fnZMT4YO5SRNVrwdOS9EPpaaj3k6DFtaB9uBJp+vuG1+5xZ35mMaDq+aXSvCkuyIHG0eYfm13dh00=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wOSA2OjM0IGEubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOg0KPiBPbiAyMDE5
LTA3LTA5IDc6MzIgYS5tLiwgS3VlaGxpbmcsIEZlbGl4IHdyb3RlOg0KPj4gVGhpcyBtZW1vcnkg
YWxsb2NhdGlvbiBmbGFnIHdpbGwgYmUgdXNlZCB0byBpbmRpY2F0ZSBCT3MgY29udGFpbmluZw0K
Pj4gc2Vuc2l0aXZlIGRhdGEgdGhhdCBzaG91bGQgbm90IGJlIGxlYWtlZCB0byBvdGhlciBwcm9j
ZXNzZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhs
aW5nQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgg
fCA0ICsrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9k
cm0vYW1kZ3B1X2RybS5oDQo+PiBpbmRleCA2MTg3MDQ3OGJjOWMuLjU4NjU5YzI4YzI2ZSAxMDA2
NDQNCj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oDQo+PiArKysgYi9pbmNs
dWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaA0KPj4gQEAgLTEzMSw2ICsxMzEsMTAgQEAgZXh0ZXJu
ICJDIiB7DQo+PiAgICAqIGZvciB0aGUgc2Vjb25kIHBhZ2Ugb253YXJkIHNob3VsZCBiZSBzZXQg
dG8gTkMuDQo+PiAgICAqLw0KPj4gICAjZGVmaW5lIEFNREdQVV9HRU1fQ1JFQVRFX01RRF9HRlg5
CQkoMSA8PCA4KQ0KPj4gKy8qIEZsYWcgdGhhdCBCTyBtYXkgY29udGFpbiBzZW5zaXRpdmUgZGF0
YSB0aGF0IG11c3QgYmUgY2xlYXJlZCBiZWZvcmUNCj4+ICsgKiByZWxlYXNpbmcgdGhlIG1lbW9y
eQ0KPj4gKyAqLw0KPj4gKyNkZWZpbmUgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9TRU5TSVRJVkUJ
KDEgPDwgOSkNCj4+ICAgDQo+PiAgIHN0cnVjdCBkcm1fYW1kZ3B1X2dlbV9jcmVhdGVfaW4gIHsN
Cj4+ICAgCS8qKiB0aGUgcmVxdWVzdGVkIG1lbW9yeSBzaXplICovDQo+Pg0KPiBUaGlzIGZsYWcg
ZXNzZW50aWFsbHkgbWVhbnMgIlBsZWFzZSBkb24ndCBsZWFrIG15IEJPIGNvbnRlbnRzIi4NCj4g
U2ltaWxhcmx5LCBBTURHUFVfR0VNX0NSRUFURV9WUkFNX0NMRUFSRUQgZXNzZW50aWFsbHkgbWVh
bnMgIlBsZWFzZQ0KPiBkb24ndCBsZXQgbWUgc2VlIHByZXZpb3VzIG1lbW9yeSBjb250ZW50cyIu
DQo+DQo+IEknZCBhcmd1ZSB0aGF0IG5laXRoZXIgZmxhZyBzaG91bGQgcmVhbGx5IGJlIG5lZWRl
ZDsgQk8gY29udGVudHMNCj4gc2hvdWxkbid0IGJlIGxlYWtlZCBieSBkZWZhdWx0Lg0KDQpNeSBj
b25jbHVzaW9uIGZyb20gcHJldmlvdXMgZGlzY3Vzc2lvbnMgd2FzIHRoYXQgQ1JFQVRFX1ZSQU1f
Q0xFQVJFRCBoYXMgDQpubyBzZWN1cml0eSBpbXBsaWNhdGlvbnMuIEl0J3MgYmFzaWNhbGx5IGNv
bXBsZXRlbHkgaW5lZmZlY3RpdmUgYXMgYSANCnNlY3VyaXR5IG1lYXN1cmUuIEl0J3MgbW9yZSBh
IGNvbnZlbmllbmNlIGZlYXR1cmUuIFRoZXJlZm9yZSBJIHRoaW5rIGl0IA0Kc3RpbGwgaGFzIGEg
cGxhY2UgYXMgdGhhdC4NCg0KSSdkIGFncmVlIG9uIHByaW5jaXBsZSB0aGF0IGRhdGEgc2hvdWxk
bid0IGJlIGxlYWtlZCBieSBkZWZhdWx0LCBidXQgaXQgDQpoYXMgYmVlbiB0aGUgZGVmYXVsdCBm
b3IgYSBsb25nIHRpbWUuIE15IGltcHJlc3Npb24gd2FzIHRoYXQgZ3JhcGhpY3MgDQpndXlzIGNh
cmVkIG1vcmUgYWJvdXQgcGVyZm9ybWFuY2UgdGhhbiBzZWN1cml0eS4gU28gY2hhbmdpbmcgdGhl
IGRlZmF1bHQgDQptYXkgYmUgYSBoYXJkIHNlbGwuIE9uIHRoZSBjb21wdXRlIHNpZGUgd2UgYWxy
ZWFkeSB0b29rIGEgYmlnIA0KcGVyZm9ybWFuY2UgaGl0IGJ5IGNsZWFyaW5nIGFsbCBvdXIgVlJB
TSwgc28gdGhpcyBjaGFuZ2Ugd291bGQgYmUgYW4gDQppbXByb3ZlbWVudCBmb3IgdXMuIFRoZXJl
Zm9yZSBJIHRoaW5rIGl0IHN0aWxsIG1ha2VzIHNlbnNlIHRvIGxldCB0aGUgDQphcHBsaWNhdGlv
biBjaG9vc2UuDQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KDQo+DQo+DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
