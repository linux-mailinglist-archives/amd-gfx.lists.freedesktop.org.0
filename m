Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C13B7A3E0
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 11:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D036E459;
	Tue, 30 Jul 2019 09:19:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720073.outbound.protection.outlook.com [40.107.72.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F296E459
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 09:19:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWUJoTLfTtLhbm/m6Zan9DJK6ymG+4j6tfZT6d3rbK7IRSbGWkVas6LBKCU1csADmk2RoxhaC3AceDM33pi0TlhckHGGGPZO/ljnqfKA8OC6boHyugbb6ozQaRPSJj3hv1VM80hrLM7HozqkjwT7IkulB9N6uVpF5jIUrqglxBD7SOuOWHR9devh5ehghOLnkMkPaX6MLKSVCUtVJ5XFVgFeVdXSMDFrrEkh1Fz3lLD+ldK8ZYzS9Ux2NzfhKbzUQDW16WVyoG0WqXdEt17pr9vv8SeBCzoulWTwnv1pHLn5iXqZskZslXwYOryRfi0indDinBCq7T2yOOOqXoGJrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxIou7paPyLv4GlyriS7ar+Q6GGEv6+gEIdpg3iqBeo=;
 b=eNycdT63FfraYKPdBxxn+7NfCncPjEGQ96huzL1FZ4ZJ7CLaUkf0IxL73wvBU8Mfhz+G32tyF5wrnGy7J+yn2ug3w/63dozGCU+j2KGSnJccQd2Hxf59Q6jWrOHPL8RK0CfyyTwWNrKClUUAH138yAkPiVeh0TdSt/dqNASPIsd1kSBPrr4FqW0Lzv9ScDebBcBKcDQ5US/VfceG7+b0QDkVtf9uHDpb+ZK3feZ4VQpe/DAHOaHud6oPSs+gUFG0jfOgcVEx66TUyJhVTFK1r8iPnN25ku3xVlK80fx82VagMIHLBOVWxgAOL8n5O7ivtbzHYqCeMHaEINivjC/VTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1884.namprd12.prod.outlook.com (10.175.88.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Tue, 30 Jul 2019 09:19:08 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff%2]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 09:19:08 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, =?utf-8?B?5Lq/5LiA?=
 <teroincn@gmail.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
Subject: Re: amdgpf: BUG: NULL pointer dereference and memory leak
Thread-Topic: amdgpf: BUG: NULL pointer dereference and memory leak
Thread-Index: AQHVRrNsOaonLXCKuUScirS/V581eKbi3geAgAAC3QCAAAFcAA==
Date: Tue, 30 Jul 2019 09:19:08 +0000
Message-ID: <4fbad018-6326-ced9-3dab-065c0f3ccef0@amd.com>
References: <CANTwqXBS5RohKsRWmfPDVxSEwri=XhuZVAmPAwdJibJODxcobA@mail.gmail.com>
 <e929562a-96fd-88c8-1b60-f1c863872db8@amd.com>
 <0952fbf6-e877-957c-f560-8ebf8d8f75ca@amd.com>
In-Reply-To: <0952fbf6-e877-957c-f560-8ebf8d8f75ca@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0233.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::29) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 077a4e90-b653-4aa9-c9c3-08d714cef997
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1884; 
x-ms-traffictypediagnostic: DM5PR12MB1884:
x-microsoft-antispam-prvs: <DM5PR12MB188434E53E32E2A94EACC7B083DC0@DM5PR12MB1884.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(51914003)(53754006)(199004)(189003)(6436002)(316002)(64126003)(110136005)(58126008)(81166006)(81156014)(36756003)(8676002)(31696002)(53936002)(14454004)(7736002)(305945005)(86362001)(6512007)(478600001)(8936002)(65806001)(65956001)(46003)(186003)(11346002)(2616005)(6116002)(446003)(476003)(486006)(4326008)(52116002)(65826007)(25786009)(66946007)(2906002)(76176011)(99286004)(102836004)(256004)(6636002)(64756008)(14444005)(66446008)(66556008)(386003)(6506007)(229853002)(31686004)(71190400001)(71200400001)(5660300002)(68736007)(6486002)(6246003)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1884;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8+lWFgpQ8p2akS+Y8UpBntHgF6VWlJBuviQXfBwbCXfptaJr4mU9DybMNoSmu7otiXuQQVUmE+1fQ+jskRESsnH36zQyTIsIRvTNpxKOGxwDBenP3VTlITOr50d8rShNKqtx/65KHjYn5iMFaUqw2fWDkQH6MsQZpa2V9Y4I/Vh+rATlW3PfWFFc/4q3WOb6r/dM13ESegY4aHCM3x2fccobxi9zUhaS6aPpjFg0Y+5CPwb3CKt7D6Q7bFRLAQPKQMwcq7n8TbX+XrR4x8nNEcVJxU2Hdfc0P0UsNCfyvfX9defTyLeAO9WdvULp0YLi70VN91amc/rCJscFRG+kw1FboD5gVe42WkRRVNGJoIisNzny6+65g2+JzyGxYWOuheywWKuk/NmI/CGqwCweXR7pBMjjqpWSPtYDgpI17eQ=
Content-ID: <DE7BCB012B4F48428F8A844A2353716D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077a4e90-b653-4aa9-c9c3-08d714cef997
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 09:19:08.3450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1884
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxIou7paPyLv4GlyriS7ar+Q6GGEv6+gEIdpg3iqBeo=;
 b=yN/TZEUFWBHH4wZaYHMR/PQziHAViio5L9vqfqc7WlXFRKdhdCZMAlsT40IPDdZ6Z47f7HdGpN5WMHmUFNE9sFQavPuvRjqFBEyNPvNzPYMb6ek4o/Pzfe5PhHki/G7hGj4Xv6vhilNcRQUdee8BZry7iiOi/z+wFaKKlStu+b4=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMzAuMDcuMTkgdW0gMTE6MTQgc2NocmllYiB6aG91Y20xOg0KPg0KPg0KPiBPbiAyMDE55bm0
MDfmnIgzMOaXpSAxNzowNCwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+PiBBbSAzMC4wNy4x
OSB1bSAxMDo0NyBzY2hyaWViIOS6v+S4gDoNCj4+PiBIacKgIGFsbGwsDQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqAgV2hpbGUgYW5hbHl6aW5nIHRoZSBzb3VyY2UgY29kZSwgSSBub3RpY2UgdGhh
dCBmdW5jdGlvbg0KPj4+IGFtZGdwdV9jc19wcm9jZXNzX2ZlbmNlX2RlcCgpIG1heSBleGlzdCBO
VUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYW5kDQo+Pj4gbWVtb3J5IGxlYWsgaW4gdGhlIGZvbGxv
d2luZyBjb2RlIGZyYWdtZW50czoNCj4+Pg0KPj4+DQo+Pj4gZmVuY2UgPSBhbWRncHVfY3R4X2dl
dF9mZW5jZShjdHgsIGVudGl0eSwNCj4+PiDCoMKgwqDCoMKgIGRlcHNbaV0uaGFuZGxlKTsNCj4+
Pg0KPj4+IGlmIChjaHVuay0+Y2h1bmtfaWQgPT0gQU1ER1BVX0NIVU5LX0lEX1NDSEVEVUxFRF9E
RVBFTkRFTkNJRVMpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9m
ZW5jZSAqc19mZW5jZSA9IHRvX2RybV9zY2hlZF9mZW5jZShmZW5jZSk7DQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2UgKm9sZCA9IGZlbmNlOw0KPj4+DQo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGZlbmNlID0gZG1hX2ZlbmNlX2dldCgmc19mZW5jZS0+c2NoZWR1bGVkKTsN
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChvbGQpOw0KPj4+IH0NCj4+Pg0K
Pj4+IGlmIChJU19FUlIoZmVuY2UpKSB7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IFBU
Ul9FUlIoZmVuY2UpOw0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFtZGdwdV9jdHhfcHV0KGN0
eCk7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHI7DQo+Pj4gwqDCoMKgIH0gZWxz
ZSBpZiAoZmVuY2UpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHIgPSBhbWRncHVfc3lu
Y19mZW5jZShwLT5hZGV2LCAmcC0+am9iLT5zeW5jLCBmZW5jZSwNCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRydWUpOw0KPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChmZW5jZSk7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGFtZGdwdV9jdHhfcHV0KGN0eCk7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChyKQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcjsNCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4+DQo+Pj4gZnVuY3Rpb24gYW1kZ3B1X2N0eF9nZXRfZmVu
Y2UgbWF5IHJldHVybiBOVUxMIHBvaW50ZXIswqAgd2hpY2ggd2lsbA0KPj4+IGNhdXNlIE5VTEwg
cG9pbnRlciBkZXJlZmVyZW5jZS4gV2hhdCdzIG1vcmUswqAgSVNfRVJSKCkgd291bGQgbm90DQo+
Pj4gcmV0dXJuIHRydWUgd2hlbiBwb2ludGVyIGlzIE5VTEwswqAgd2hpY2ggd2lsbCBjYXVzZSB0
aGUgY3R4IHJlZmVyZW5jZQ0KPj4+IGxlYWtlZC4NCj4+IFRoYXQgaGFuZGxpbmcgaXMgYWN0dWFs
bHkgY29ycmVjdC4NCj4+DQo+PiBUaGUgcHJvYmxlbSBpcyB0aGUgImlmIChjaHVuay0+Y2h1bmtf
aWQgPT0NCj4+IEFNREdQVV9DSFVOS19JRF9TQ0hFRFVMRURfREVQRU5ERU5DSUVTKSIgc3R1ZmYg
YWJvdmUuDQo+Pg0KPj4gVGhhdCBjb21lcyB0byBlYXJseSBhbmQgbmVlZHMgdG8gYmUgbW92ZWQg
YmVsb3cgY2hlY2tpbmcgdGhlIGZlbmNlIGZvcg0KPj4gZXJyb3JzLiBHb2luZyB0byBzZW5kIGEg
Zml4IGZvciB0aGlzIHRvIHRoZSBtYWlsaW5nIGxpc3QgaW4gYSBtaW51dGUuDQo+IExpbiBZaSBp
cyByaWdodCBJIHRoaW5rLCB3ZSBsZWFrZWQgY3R4IHJlZmVyZW5jZSB3aGVuIGZlbmNlIGlzIE5V
TEwuDQoNCkluZGVlZCwgYnV0IHdoYXQgSSBtZWFudCB3YXMgdGhlIGEgTlVMTCBmZW5jZSBoZXJl
IGlzIG5vdCBhbiBlcnJvci4NCg0KSnVzdCBzZW5kIG91dCBhIHBhdGNoIHRvIGZpeCB0aGF0IHN0
dWZmIHVwLCBwbGVhc2UgcmV2aWV3Lg0KDQpDaHJpc3RpYW4uDQoNCj4NCj4gLURhdmlkDQo+Pg0K
Pj4gVGhhbmtzIGZvciB0aGUgbm90aWNlLA0KPj4gQ2hyaXN0aWFuLg0KPj4NCj4+PiBCdXQgSSBk
b24ndCBrbm93IGhvdyB0byBmaXggaXQsIHNvIHJlcG9ydCBpdCB0byB5b3UgYWxsLg0KPj4+DQo+
Pj4gQmVzdCBSZWdhcmRzLg0KPj4+IExpbiBZaS4NCj4NCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
