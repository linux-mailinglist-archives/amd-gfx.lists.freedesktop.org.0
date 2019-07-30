Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2647A39D
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 11:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74006E2E1;
	Tue, 30 Jul 2019 09:04:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730075.outbound.protection.outlook.com [40.107.73.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383CA6E2E1
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 09:04:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxGIK8/sipiU/6erUN8rUILxaS5f1lmDTmuspLc8ksPpz/lxDVW0NDDq6l01n16awdRSgsmfOC+zSG3WtBbpO0+3HGfOP056BMYow4ah91zK1pf5flFPf2rNo80iOaEWOk6ucWYbewLArO2daqLE/stp/VEYze9EwmORfNM6H+1Zd4N9InDfclP5PRWnqhMORpa3SoH2j21vs36JiqelAz6Cjd8HrgREljklMSh1hP7Hh9zBZeQ5cUoRsB929amAMyO4qFW4vqAfZ7yjBuNO+uBr+vIfFENVLDZi11KiCMB5arypCZ5gv9t/EdozCuYWxoRyASzes+2tMYLMFIuboA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoY2rxDpDFoXnkAOiAhzk4cRRFyfbYatHSMgIRDRhVs=;
 b=JRj9bpgC2haAASkQ5t8Tt4uElB1ERSOlL5RIlV7RQEAogr6E4wf+AIs6cnoMrrgVIMZ/rGvVMjeQXlPjrFXkMlr6BPYQwZKkPKongCrAO1wZid2HbuE8zcAioy92cbQJCz9uubIBItwlmzDye4mwg9mLTJGEDkn9fnYasqkYAsRpxxNqrZhknqCO61z8tzQnBZLo9KYXthWKXM/6uDvyUo6a0nLGHYnpw7W2xlq8hLnJArwvdWu3c5jsCmB0ergscfy3NzwPQMW3I0toiuBRfjvQ5kW9RqqAbec73d1/Q3NfqnpY/AxY2ko7BW15R7s45uExDt92y1ApPjXQNSjfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1754.namprd12.prod.outlook.com (10.175.89.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 09:04:00 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff%2]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 09:04:00 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?utf-8?B?5Lq/5LiA?= <teroincn@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
Subject: Re: amdgpf: BUG: NULL pointer dereference and memory leak
Thread-Topic: amdgpf: BUG: NULL pointer dereference and memory leak
Thread-Index: AQHVRrNsOaonLXCKuUScirS/V581eKbi3geA
Date: Tue, 30 Jul 2019 09:04:00 +0000
Message-ID: <e929562a-96fd-88c8-1b60-f1c863872db8@amd.com>
References: <CANTwqXBS5RohKsRWmfPDVxSEwri=XhuZVAmPAwdJibJODxcobA@mail.gmail.com>
In-Reply-To: <CANTwqXBS5RohKsRWmfPDVxSEwri=XhuZVAmPAwdJibJODxcobA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0148.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::16) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b0264eb-5938-4e40-d679-08d714ccdc9c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1754; 
x-ms-traffictypediagnostic: DM5PR12MB1754:
x-microsoft-antispam-prvs: <DM5PR12MB1754347709627E6F8BD9D53083DC0@DM5PR12MB1754.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(51914003)(189003)(53754006)(199004)(36756003)(71200400001)(76176011)(81156014)(81166006)(65826007)(31686004)(7736002)(66476007)(52116002)(6512007)(66946007)(110136005)(66446008)(64756008)(66556008)(316002)(6116002)(102836004)(8676002)(99286004)(305945005)(58126008)(6246003)(478600001)(68736007)(71190400001)(386003)(6486002)(86362001)(14454004)(25786009)(6506007)(229853002)(8936002)(446003)(46003)(65806001)(31696002)(2906002)(14444005)(6436002)(476003)(2616005)(4326008)(5660300002)(64126003)(486006)(6636002)(53936002)(256004)(186003)(11346002)(65956001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1754;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: voSUHDt3X3GCDFUcx70vE1HeO7L2RowJt3Ku7gMW4TMginCGe6abi1R4sqBuTit4UrpgNDciEzYYGKa5sdVMr1cupmOFlgbtLQ13DDCIH4cg5SsNeySNNFGT1O29afHeytFZBjDR60sDjzDzMoUyWimKupe+xUCoQ5X8ZqlWCjHnDeYK4IqJjJKSzfpDqI2r/j333LhgxkMxcZGQ8vz7dHZZdO+yce9foY6N69dU0L8yYt75J2s3wxBAmFbKPRY0SAlJkLTbMELKMoW4QRxH+MLiwl4Cw5Y2PXYdvw4vmERkL3O8QcZ9WmknNplZ3bsbZNxf9sMRdxiOpeWrPrkjI1TSFlixRqftBqHYtfz23/gKYoyX9mvbqZwZsdnJvPLfntVNhmMuNAZkQmbP9io9AVe8HpQ+ZEwzixHlCT1jGDQ=
Content-ID: <99CC149695744440AFCF7BA83840EFD7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0264eb-5938-4e40-d679-08d714ccdc9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 09:04:00.5896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1754
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoY2rxDpDFoXnkAOiAhzk4cRRFyfbYatHSMgIRDRhVs=;
 b=V+X6LDCRSzbOr1Ouru/xurC+KQmaklpW+N9pGk64HoJQKNplAsds2ISaXzST9HJxk03EkM3N3g0mi/3pn7CQnUo+U0yprtvj6+srXWXVD/jCAuTDUniEgCd8IyvlL1W4T6N8q/VNEM4mosihV+Bfd/Fe04Hw5Rl+hFUQHfDjgLw=
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

QW0gMzAuMDcuMTkgdW0gMTA6NDcgc2NocmllYiDkur/kuIA6DQo+IEhpICBhbGxsLA0KPiAgICAg
ICAgICAgV2hpbGUgYW5hbHl6aW5nIHRoZSBzb3VyY2UgY29kZSwgSSBub3RpY2UgdGhhdCBmdW5j
dGlvbg0KPiBhbWRncHVfY3NfcHJvY2Vzc19mZW5jZV9kZXAoKSBtYXkgZXhpc3QgTlVMTCBwb2lu
dGVyIGRlcmVmZXJlbmNlIGFuZA0KPiBtZW1vcnkgbGVhayBpbiB0aGUgZm9sbG93aW5nIGNvZGUg
ZnJhZ21lbnRzOg0KPg0KPg0KPiBmZW5jZSA9IGFtZGdwdV9jdHhfZ2V0X2ZlbmNlKGN0eCwgZW50
aXR5LA0KPiAgICAgIGRlcHNbaV0uaGFuZGxlKTsNCj4NCj4gaWYgKGNodW5rLT5jaHVua19pZCA9
PSBBTURHUFVfQ0hVTktfSURfU0NIRURVTEVEX0RFUEVOREVOQ0lFUykgew0KPiAgICAgICAgICBz
dHJ1Y3QgZHJtX3NjaGVkX2ZlbmNlICpzX2ZlbmNlID0gdG9fZHJtX3NjaGVkX2ZlbmNlKGZlbmNl
KTsNCj4gICAgICAgICAgc3RydWN0IGRtYV9mZW5jZSAqb2xkID0gZmVuY2U7DQo+DQo+ICAgICAg
ICAgIGZlbmNlID0gZG1hX2ZlbmNlX2dldCgmc19mZW5jZS0+c2NoZWR1bGVkKTsNCj4gICAgICAg
ICAgZG1hX2ZlbmNlX3B1dChvbGQpOw0KPiB9DQo+DQo+IGlmIChJU19FUlIoZmVuY2UpKSB7DQo+
ICAgICAgICAgICByID0gUFRSX0VSUihmZW5jZSk7DQo+ICAgICAgICAgICBhbWRncHVfY3R4X3B1
dChjdHgpOw0KPiAgICAgICAgICAgcmV0dXJuIHI7DQo+ICAgIH0gZWxzZSBpZiAoZmVuY2UpIHsN
Cj4gICAgICAgICAgICByID0gYW1kZ3B1X3N5bmNfZmVuY2UocC0+YWRldiwgJnAtPmpvYi0+c3lu
YywgZmVuY2UsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdHJ1ZSk7DQo+ICAgICAgICAgICAgZG1hX2ZlbmNlX3B1dChmZW5jZSk7DQo+ICAgICAg
ICAgICAgIGFtZGdwdV9jdHhfcHV0KGN0eCk7DQo+ICAgICAgICAgICAgIGlmIChyKQ0KPiAgICAg
ICAgICAgICByZXR1cm4gcjsNCj4gICAgICAgICAgICAgfQ0KPg0KPiBmdW5jdGlvbiBhbWRncHVf
Y3R4X2dldF9mZW5jZSBtYXkgcmV0dXJuIE5VTEwgcG9pbnRlciwgIHdoaWNoIHdpbGwNCj4gY2F1
c2UgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLiBXaGF0J3MgbW9yZSwgIElTX0VSUigpIHdvdWxk
IG5vdA0KPiByZXR1cm4gdHJ1ZSB3aGVuIHBvaW50ZXIgaXMgTlVMTCwgIHdoaWNoIHdpbGwgY2F1
c2UgdGhlIGN0eCByZWZlcmVuY2UNCj4gbGVha2VkLg0KDQpUaGF0IGhhbmRsaW5nIGlzIGFjdHVh
bGx5IGNvcnJlY3QuDQoNClRoZSBwcm9ibGVtIGlzIHRoZSAiaWYgKGNodW5rLT5jaHVua19pZCA9
PSANCkFNREdQVV9DSFVOS19JRF9TQ0hFRFVMRURfREVQRU5ERU5DSUVTKSIgc3R1ZmYgYWJvdmUu
DQoNClRoYXQgY29tZXMgdG8gZWFybHkgYW5kIG5lZWRzIHRvIGJlIG1vdmVkIGJlbG93IGNoZWNr
aW5nIHRoZSBmZW5jZSBmb3IgDQplcnJvcnMuIEdvaW5nIHRvIHNlbmQgYSBmaXggZm9yIHRoaXMg
dG8gdGhlIG1haWxpbmcgbGlzdCBpbiBhIG1pbnV0ZS4NCg0KVGhhbmtzIGZvciB0aGUgbm90aWNl
LA0KQ2hyaXN0aWFuLg0KDQo+IEJ1dCBJIGRvbid0IGtub3cgaG93IHRvIGZpeCBpdCwgc28gcmVw
b3J0IGl0IHRvIHlvdSBhbGwuDQo+DQo+IEJlc3QgUmVnYXJkcy4NCj4gTGluIFlpLg0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
