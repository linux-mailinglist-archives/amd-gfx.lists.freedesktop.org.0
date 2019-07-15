Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C779A6867B
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 11:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7A4898F0;
	Mon, 15 Jul 2019 09:41:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690068.outbound.protection.outlook.com [40.107.69.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EF0898F0
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 09:41:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egnRwoFjxLI0BdG5lvkCL+GDEVYyX0zeTEGEmByhhCqXQ5Z8fBN805WwP/R8kNLX4yKsOFH6ACp9SZhpZtuJyKMuIkE3phnVoKpgkWEzVXtQri2livy1GxPlIWCwrgYBdZP63S4pZd8iNULhw/icbTsE6VjHhdG0roFkZMAZ71hyuhibJblE1yxq7btShdXuC0PKCcqg43KeKKze9ik2viiJCCgDn1gzjd3XYOpUt9DsFpi6LzMocrtAHUp3btLDVPzDfzupV3UFC/fQtN3XUwf54Tu4pG+WCpte+iedzHdc9hs08dZJy3I1YPqcIiKOrtDPlXWAuEEQXobksVBi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=080OnO0GqSw3s4NWFVoPS+xtwqgBZiDKncKkGcEzeWI=;
 b=N3CXq29AVVY0rl4QrekK6T5elFZ3Ks4vrHPE6uFTQbuZR23KvHhbAvwBCklbC5Cd/w+cWwdOd3Ag5WkqLm1TY/66siODuEoIfk+NiP1iRdMMgulbhThC/hWHlLhq6aQNGVvoC35yk5yNQHSPHR6Lou2WJtTviT8pj/0UFEPN5yUYDRdTKGpAnzN0XFO6+zz5DxYirDb2GnysN2xX1UzDAw6QdxKDPeeNCTVo2OtwbqZB+KaPqIsbr4rxGxOdcFocjEm82hBFQCsEIIobn4wNdR0uplqxvwTO+gFxZ52XROaOwDAZM8HUg3ywiDX6e4mBszBGILhiDOY1sN/sI9YS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2440.namprd12.prod.outlook.com (52.132.141.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 09:41:02 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2073.012; Mon, 15 Jul
 2019 09:41:02 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>
Subject: Re: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Topic: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Index: AQHVNwIC8YI0Xjw0H02CS/7Sp4MSRKbD2JCAgAdrA7CAAC5ngIAAAL4AgAACEQA=
Date: Mon, 15 Jul 2019 09:41:02 +0000
Message-ID: <a9deb404-6041-299e-60fc-d2356b729664@amd.com>
References: <1562750971-1628-1-git-send-email-Emily.Deng@amd.com>
 <a9974a9a-37b2-2310-4073-94eef570f37c@amd.com>
 <MN2PR12MB297593776F81FE032B2145218FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <550628f4-eb76-23aa-bc33-e9841e6d017b@amd.com>
 <MN2PR12MB2975EA6482B987399797B0328FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB2975EA6482B987399797B0328FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6P192CA0018.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::31) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02742981-3c60-4ce7-655c-08d709088ccd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2440; 
x-ms-traffictypediagnostic: DM5PR12MB2440:
x-microsoft-antispam-prvs: <DM5PR12MB2440EDA200FBAB114692972B83CF0@DM5PR12MB2440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(189003)(199004)(13464003)(5660300002)(36756003)(8676002)(110136005)(4326008)(305945005)(58126008)(316002)(25786009)(7736002)(64126003)(71200400001)(31686004)(478600001)(476003)(65806001)(71190400001)(446003)(6636002)(65826007)(486006)(11346002)(81166006)(81156014)(14444005)(229853002)(256004)(53936002)(6246003)(6486002)(2906002)(76176011)(386003)(186003)(46003)(102836004)(53546011)(6506007)(6116002)(52116002)(2616005)(14454004)(65956001)(99286004)(31696002)(66946007)(86362001)(66556008)(64756008)(66476007)(66446008)(8936002)(6436002)(6512007)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2440;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: o6bQc3E8rWMEZ4f0agsnrO/jYg1aLkhgnkx/i/yHn1VcGVbpOcxuZ7F35RohOuNqo2TY4qHSEyW2xPI6VgVPCcC2Y4gYUB3P1lZ0ZMJaNHfFo7oyOpxVKR9Ij4X2k8Ymf6vIFQuSyERrM4Ks/dSV3J4NVMdl1H0K9532cmV2AFFf2wayii7NXydj9QrgY7AkRbZFbOv6g2YzIgO5TPKHTA1uomriO5w8o3PaKme5vzNNvd7EVO9rIholH145fiiGW5Jv31RUNlD789C4OLCEea8OxQ0EHbCnC5rpV1VsNycBukch7xuJaAvi8sCuvZfJmM5uBpd4yOVvdQ2SG8r5+nKJM2DWglMloIvFzdtVWj0dFCiXLh1PYV3p3qOK2PikoIqQuS54FmuHw8JSlNxLgFs/uMMYdoGspI5/i4OhNM0=
Content-ID: <17D88B5C1B5CAE4E9FDC5EB482DD9274@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02742981-3c60-4ce7-655c-08d709088ccd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 09:41:02.4725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=080OnO0GqSw3s4NWFVoPS+xtwqgBZiDKncKkGcEzeWI=;
 b=By1ZrXrgRwyQSqF0wLev8Pxw5Ygr3jztuxj18LUC1SlmmORR3J3zEJPz6WkurquFesYkGWDNiLtuUGLW/lJynOk1RwfC3xoRU6n3bUxtw2R3KsMsqQxQSLBZFff2zwuoNE6KtZESNi0S/kZxZgMouj4dCJSZHOLqNTxil/+uucg=
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

PiBEbyB5b3UgdGhpbmsgd2UgZG9uJ3QgbmVlZCB0byBmaXggaXQ/DQpObywgd2hlbiB0aGUgYXBw
bGljYXRpb24gaXMgZXhoYXVzdGluZyBtZW1vcnkgdGhlbiB3ZSBjYW4ndCBleHBlY3QgDQphbnl0
aGluZyBlbHNlIGhlcmUuDQoNClNlZSBtZW1vcnkgZnJlZWluZyBpcyBhbHdheXMgZGVsYXllZCB1
bnRpbCBpdCBpc24ndCB1c2VkIGFueSBtb3JlIG9yIA0Kd2hlbiB0aGUgcHJvY2VzcyBpcyBraWxs
ZWQgYWZ0ZXIgYWNjZXNzIGlzIHByZXZlbnRlZCAoYnkgY2xlYXJpbmcgcGFnZSANCnRhYmxlcyBm
b3IgZXhhbXBsZSkuDQoNCldoYXQgd2UgY291bGQgZG8gaXMgbWF5YmUgbG9vayBpbnRvIHdoeSB3
ZSBkb24ndCBibG9jayB1bnRpbCB0aGUgbWVtb3J5IA0KaXMgZnJlZWQgZHVyaW5nIGNvbW1hbmQg
c3VibWlzc2lvbiwgYnV0IGFwYXJ0IGZyb20gdGhhdCB0aGlzIHNvdW5kcyBsaWtlIA0KcGVyZmVj
dGx5IGV4cGVjdGVkIGJlaGF2aW9yLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQpBbSAxNS4w
Ny4xOSB1bSAxMTozNCBzY2hyaWViIERlbmcsIEVtaWx5Og0KPiBIaSBDaHJpc3RpYW4sDQo+ICAg
ICAgQXMgaGFzIHRoaXMgYmVoYXZpb3IsIHdoZW4gdGVzdCB2dWxrYW4gY3RzIGFsbG9jYXRpb24g
dGVzdCwgaXQgd2lsbCBleGhhdXN0aW5nIHRoZSBtZW1vcnksIGFuZCBjYXVzZSBvdXQgb2YgbWVt
b3J5LiBEbyB5b3UgdGhpbmsgd2UgZG9uJ3QgbmVlZCB0byBmaXggaXQ/DQo+DQo+IEJlc3Qgd2lz
aGVzDQo+IEVtaWx5IERlbmcNCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9t
OiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPj4gU2VudDog
TW9uZGF5LCBKdWx5IDE1LCAyMDE5IDU6MzEgUE0NCj4+IFRvOiBEZW5nLCBFbWlseSA8RW1pbHku
RGVuZ0BhbWQuY29tPjsgWmhvdSwgRGF2aWQoQ2h1bk1pbmcpDQo+PiA8RGF2aWQxLlpob3VAYW1k
LmNvbT4NCj4+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gZHJtL3R0bTogRml4IHRoZSBtZW1vcnkgZGVsYXkgZnJlZSBpc3N1ZQ0KPj4N
Cj4+IEhpIGd1eXMsDQo+Pg0KPj4+IERvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uIGFib3V0IHRo
aXM/IEZvciBwZXIgdm0gYm8sIGl0IHNlZW1zIGFsd2F5cw0KPj4gZGVsYXkgdG8gZnJlZSB0aGUg
dHRtIGJvLg0KPj4gWWVhaCwgYW5kIHRoYXQgaXMgY29ycmVjdCBiZWhhdmlvci4NCj4+DQo+PiBT
aW5jZSB3ZSBkb24ndCBrbm93IHdobyBpcyB1c2luZyBhIHBlci12bSBCTyB3ZSBuZWVkIHRvIHdh
aXQgZm9yIGFsbA0KPj4gY29tbWFuZCBzdWJtaXNzaW9ucyBpbiBmbGlnaHQgd2hlbiBpdCBpcyBm
cmVlZC4NCj4+DQo+PiBGb3IgdGhpcyB3ZSBjb3B5IHRoZSBjdXJyZW50IHN0YXRlIG9mIHRoZSBz
aGFyZWQgcmVzZXJ2YXRpb24gb2JqZWN0IGludG8gdGhlDQo+PiBwcml2YXRlIG9uZSBpbiB0dG1f
Ym9faW5kaXZpZHVhbGl6ZV9yZXN2Lg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBDaHJpc3RpYW4uDQo+
Pg0KPj4gQW0gMTUuMDcuMTkgdW0gMDg6NDkgc2NocmllYiBEZW5nLCBFbWlseToNCj4+PiBIaSBE
YXZpZCwNCj4+PiAgICAgICAgWW91IGFyZSByaWdodCwgaXQgd2lsbCBjb3B5IHBlci12bSByZXN2
Lg0KPj4+ICAgICAgICBCdXQgY3VycmVudGx5LCBpdCBzdGlsbCBoYXMgdGhlIGRlbGF5IGZyZWUg
aXNzdWUgd2hpY2ggbm9uIHBlciB2bSBibyBkb2Vzbid0DQo+PiBoYXMuIE1heWJlIGl0IGFscmVh
ZHkgaGFzIG5ldyBmZW5jZXMgYXBwZW5kIHRvIHRoaXMgcmVzdiBvYmplY3QgYmVmb3JlIGNvcHku
DQo+Pj4gSGkgQ2hyaXN0aWFuLA0KPj4+ICAgICAgIERvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9u
IGFib3V0IHRoaXM/IEZvciBwZXIgdm0gYm8sIGl0IHNlZW1zIGFsd2F5cw0KPj4gZGVsYXkgdG8g
ZnJlZSB0aGUgdHRtIGJvLg0KPj4+IEJlc3Qgd2lzaGVzDQo+Pj4gRW1pbHkgRGVuZw0KPj4+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+PiBGcm9tOiBaaG91LCBEYXZpZChDaHVuTWlu
ZykgPERhdmlkMS5aaG91QGFtZC5jb20+DQo+Pj4+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAxMCwg
MjAxOSA5OjI4IFBNDQo+Pj4+IFRvOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPjsg
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
ZHJtL3R0bTogRml4IHRoZSBtZW1vcnkgZGVsYXkgZnJlZSBpc3N1ZQ0KPj4+Pg0KPj4+PiBJdCBk
b2Vzbid0IG1ha2Ugc2Vuc2UgdGhhdCBmcmVlaW5nIEJPIHN0aWxsIHVzZXMgcGVyLXZtIHJlc3Yu
DQo+Pj4+DQo+Pj4+IEkgcmVtZW1iZXIgd2hlbiBCTyBpcyBpbiByZWxlYXNlIGxpc3QsIGl0cyBy
ZXN2IHdpbGwgYmUgZnJvbSBwZXItdm0gcmVzdiBjb3B5Lg0KPj4+PiBDb3VsZCB5b3UgY2hlY2sg
aXQ/DQo+Pj4+DQo+Pj4+IC1EYXZpZA0KPj4+Pg0KPj4+PiDlnKggMjAxOS83LzEwIDE3OjI5LCBF
bWlseSBEZW5nIOWGmemBkzoNCj4+Pj4+IEZvciB2dWxrYW4gY3RzIGFsbG9jYXRpb24gdGVzdCBj
YXNlcywgdGhleSB3aWxsIGNyZWF0ZSBhIHNlcmllcyBvZg0KPj4+Pj4gYm9zLCBhbmQgdGhlbiBm
cmVlIHRoZW0uIEFzIGl0IGhhcyBsb3RzIG9mIGFsbG9jdGlvbiB0ZXN0IGNhc2VzIHdpdGgNCj4+
Pj4+IHRoZSBzYW1lIHZtLCBhcyBwZXIgdm0gYm8gZmVhdHVyZSBlbmFibGUsIGFsbCBvZiB0aG9z
ZSBib3MnIHJlc3YgYXJlDQo+Pj4+PiB0aGUgc2FtZS4gQnV0IHRoZSBibyBmcmVlIGlzIHF1aXRl
IHNsb3csIGFzIHRoZXkgdXNlIHRoZSBzYW1lIHJlc3YNCj4+Pj4+IG9iamVjdCwgZm9yIGV2ZXJ5
IHRpbWUsIGZyZWUgYSBibywgaXQgd2lsbCBjaGVjayB0aGUgcmVzdiB3aGV0aGVyDQo+Pj4+PiBz
aWduYWwsIGlmIGl0IHNpZ25hbCwgdGhlbiB3aWxsIGZyZWUgaXQuIEJ1dCBhcyB0aGUgdGVzdCBj
YXNlcyB3aWxsDQo+Pj4+PiBjb250aW51ZSB0byBjcmVhdGUgYm8sIGFuZCB0aGUgcmVzdiBmZW5j
ZSBpcyBpbmNyZWFzaW5nLiBTbyB0aGUgZnJlZQ0KPj4+Pj4gaXMgbW9yZQ0KPj4+PiBzbG93ZXIg
dGhhbiBjcmVhdGluZy4gSXQgd2lsbCBjYXVzZSBtZW1vcnkgZXhoYXVzdGluZy4NCj4+Pj4+IE1l
dGhvZDoNCj4+Pj4+IFdoZW4gdGhlIHJlc3Ygc2lnbmFsLCByZWxlYXNlIGFsbCB0aGUgYm9zIHdo
aWNoIGFyZSB1c2UgdGhlIHNhbWUNCj4+Pj4+IHJlc3Ygb2JqZWN0Lg0KPj4+Pj4NCj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCj4+Pj4+IC0tLQ0K
Pj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAyOSArKysrKysrKysrKysr
KysrKysrKysrKystLS0tLQ0KPj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jDQo+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMg
aW5kZXggZjlhM2Q0Yy4uNTdlYzU5YiAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMNCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMN
Cj4+Pj4+IEBAIC01NDMsNiArNTQzLDcgQEAgc3RhdGljIGludCB0dG1fYm9fY2xlYW51cF9yZWZz
KHN0cnVjdA0KPj4+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+Pj4+PiAgICAgew0KPj4+Pj4g
ICAgIAlzdHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xvYiA9IGJvLT5iZGV2LT5nbG9iOw0KPj4+Pj4g
ICAgIAlzdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICpyZXN2Ow0KPj4+Pj4gKwlzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKnJlc3ZfYm8sICpyZXN2X2JvX25leHQ7DQo+Pj4+PiAgICAgCWludCBy
ZXQ7DQo+Pj4+Pg0KPj4+Pj4gICAgIAlpZiAodW5saWtlbHkobGlzdF9lbXB0eSgmYm8tPmRkZXN0
cm95KSkpDQo+Pj4+PiBAQCAtNTY2LDEwICs1NjcsMTQgQEAgc3RhdGljIGludCB0dG1fYm9fY2xl
YW51cF9yZWZzKHN0cnVjdA0KPj4+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+Pj4+PiAgICAg
CQkJCQkJCSAgIGludGVycnVwdGlibGUsDQo+Pj4+PiAgICAgCQkJCQkJCSAgIDMwICogSFopOw0K
Pj4+Pj4NCj4+Pj4+IC0JCWlmIChscmV0IDwgMCkNCj4+Pj4+ICsJCWlmIChscmV0IDwgMCkgew0K
Pj4+Pj4gKwkJCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9saXN0KTsN
Cj4+Pj4+ICAgICAJCQlyZXR1cm4gbHJldDsNCj4+Pj4+IC0JCWVsc2UgaWYgKGxyZXQgPT0gMCkN
Cj4+Pj4+ICsJCX0NCj4+Pj4+ICsJCWVsc2UgaWYgKGxyZXQgPT0gMCkgew0KPj4+Pj4gKwkJCWty
ZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9saXN0KTsNCj4+Pj4+ICAgICAJ
CQlyZXR1cm4gLUVCVVNZOw0KPj4+Pj4gKwkJfQ0KPj4+Pj4NCj4+Pj4+ICAgICAJCXNwaW5fbG9j
aygmZ2xvYi0+bHJ1X2xvY2spOw0KPj4+Pj4gICAgIAkJaWYgKHVubG9ja19yZXN2ICYmICFrY2xf
cmVzZXJ2YXRpb25fb2JqZWN0X3RyeWxvY2soYm8tPnJlc3YpKQ0KPj4+PiB7IEBADQo+Pj4+PiAt
NTgyLDYgKzU4Nyw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2NsZWFudXBfcmVmcyhzdHJ1Y3QNCj4+
Pj4+IHR0bV9idWZmZXJfb2JqZWN0DQo+Pj4+ICpibywNCj4+Pj4+ICAgICAJCQkgKiBoZXJlLg0K
Pj4+Pj4gICAgIAkJCSAqLw0KPj4+Pj4gICAgIAkJCXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9j
ayk7DQo+Pj4+PiArCQkJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xp
c3QpOw0KPj4+Pj4gICAgIAkJCXJldHVybiAwOw0KPj4+Pj4gICAgIAkJfQ0KPj4+Pj4gICAgIAkJ
cmV0ID0gMDsNCj4+Pj4+IEBAIC01OTEsMTUgKzU5NywyOSBAQCBzdGF0aWMgaW50IHR0bV9ib19j
bGVhbnVwX3JlZnMoc3RydWN0DQo+Pj4+IHR0bV9idWZmZXJfb2JqZWN0ICpibywNCj4+Pj4+ICAg
ICAJCWlmICh1bmxvY2tfcmVzdikNCj4+Pj4+ICAgICAJCQlrY2xfcmVzZXJ2YXRpb25fb2JqZWN0
X3VubG9jayhiby0+cmVzdik7DQo+Pj4+PiAgICAgCQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xv
Y2spOw0KPj4+Pj4gKwkJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xp
c3QpOw0KPj4+Pj4gICAgIAkJcmV0dXJuIHJldDsNCj4+Pj4+ICAgICAJfQ0KPj4+Pj4NCj4+Pj4+
ICAgICAJdHRtX2JvX2RlbF9mcm9tX2xydShibyk7DQo+Pj4+PiAgICAgCWxpc3RfZGVsX2luaXQo
JmJvLT5kZGVzdHJveSk7DQo+Pj4+PiAgICAgCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1f
Ym9fcmVmX2J1Zyk7DQo+Pj4+PiAtDQo+Pj4+PiAgICAgCXNwaW5fdW5sb2NrKCZnbG9iLT5scnVf
bG9jayk7DQo+Pj4+PiAgICAgCXR0bV9ib19jbGVhbnVwX21lbXR5cGVfdXNlKGJvKTsNCj4+Pj4+
ICsJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOw0KPj4+Pj4g
Kw0KPj4+Pj4gKwlzcGluX2xvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+Pj4+ICsJbGlzdF9mb3Jf
ZWFjaF9lbnRyeV9zYWZlKHJlc3ZfYm8sIHJlc3ZfYm9fbmV4dCwgJmJvLT5iZGV2LQ0KPj4+Pj4g
ZGRlc3Ryb3ksIGRkZXN0cm95KSB7DQo+Pj4+PiArCQlpZiAocmVzdl9iby0+cmVzdiA9PSBiby0+
cmVzdikgew0KPj4+Pj4gKwkJCXR0bV9ib19kZWxfZnJvbV9scnUocmVzdl9ibyk7DQo+Pj4+PiAr
CQkJbGlzdF9kZWxfaW5pdCgmcmVzdl9iby0+ZGRlc3Ryb3kpOw0KPj4+Pj4gKwkJCXNwaW5fdW5s
b2NrKCZnbG9iLT5scnVfbG9jayk7DQo+Pj4+PiArCQkJdHRtX2JvX2NsZWFudXBfbWVtdHlwZV91
c2UocmVzdl9ibyk7DQo+Pj4+PiArCQkJa3JlZl9wdXQoJnJlc3ZfYm8tPmxpc3Rfa3JlZiwgdHRt
X2JvX3JlbGVhc2VfbGlzdCk7DQo+Pj4+PiArCQkJc3Bpbl9sb2NrKCZnbG9iLT5scnVfbG9jayk7
DQo+Pj4+PiArCQl9DQo+Pj4+PiArCX0NCj4+Pj4+ICsJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9s
b2NrKTsNCj4+Pj4+DQo+Pj4+PiAgICAgCWlmICh1bmxvY2tfcmVzdikNCj4+Pj4+ICAgICAJCWtj
bF9yZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKGJvLT5yZXN2KTsNCj4+Pj4+IEBAIC02MzksOSAr
NjU5LDggQEAgc3RhdGljIGJvb2wgdHRtX2JvX2RlbGF5ZWRfZGVsZXRlKHN0cnVjdA0KPj4+PiB0
dG1fYm9fZGV2aWNlICpiZGV2LCBib29sIHJlbW92ZV9hbGwpDQo+Pj4+PiAgICAgCQkJdHRtX2Jv
X2NsZWFudXBfcmVmcyhibywgZmFsc2UsICFyZW1vdmVfYWxsLCB0cnVlKTsNCj4+Pj4+ICAgICAJ
CX0gZWxzZSB7DQo+Pj4+PiAgICAgCQkJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+
Pj4+ICsJCQlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7DQo+
Pj4+PiAgICAgCQl9DQo+Pj4+PiAtDQo+Pj4+PiAtCQlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwg
dHRtX2JvX3JlbGVhc2VfbGlzdCk7DQo+Pj4+PiAgICAgCQlzcGluX2xvY2soJmdsb2ItPmxydV9s
b2NrKTsNCj4+Pj4+ICAgICAJfQ0KPj4+Pj4gICAgIAlsaXN0X3NwbGljZV90YWlsKCZyZW1vdmVk
LCAmYmRldi0+ZGRlc3Ryb3kpOw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
