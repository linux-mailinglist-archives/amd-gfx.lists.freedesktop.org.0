Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F8868765
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 12:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF8389381;
	Mon, 15 Jul 2019 10:54:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730049.outbound.protection.outlook.com [40.107.73.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDEC89381
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 10:54:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZZPbPXV51feQzLLK/z1MGtekEbOzOsaM8kZ7xlY8IIrA/9omfCNwGg1ovVerTG+cMe3Grb1vAXicU7+erb2SbvY7VqOura93sAFhm1U055OEFnitbCz/Z3RVk0xtEObjhiYD27LlHJeVoJ4gJ0K72T59knqEN0gNdTwqdomyoE8rtIw5sxl8rgUg5SPp8q/7GCfSt2Toof7YdhMFnaVTOwyS/wd/YGix8G1C39k/zvwi4ocAD6rGyh4wCwwHAgmOJEALIoyirSO7VKuWG96O6AqB8N6uM4Nh2n0pTV5xY5iWSmvr2BW+oM2Gw0N7+aHaLWyAts/g1XS2AYFUW3uPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQMchlzQB+HTfzLyNDCk5QFwhj35TNMLOQv++KYdBFA=;
 b=CxRStzh6RJzrCO6VDT3FPtYCOs3us6qq9apOJDBgWFTlisDmJTwQ0ScTMdhAS4qVxzgSf5nYiz4lIlxYqZ966Ft30lTdQLPSHYbsrwXjPI1wdfYleJAqWrzRY8ikhgPJVjP3UARVntT8qzOnAhFoi68yZqUooZVX7/P15qshjhW4K9brTxewGtMKzPyc5yPHFlO3oM8Qpv2wItylOQASYDNKDQzvxjlllPlZ6jVhQ6mECqgzuzU23JjtA7HPVBxLKsPKjNJ6CsnUb9OQIA2afdcL8NOY9/DxWjUm6EW9RVoH5cveLXBHgJXqWuJjfeYCRXf44g0enBLbtOiFj5TNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1884.namprd12.prod.outlook.com (10.175.88.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 10:54:23 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2073.012; Mon, 15 Jul
 2019 10:54:23 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>
Subject: Re: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Topic: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Index: AQHVNwIC8YI0Xjw0H02CS/7Sp4MSRKbD2JCAgAdrA7CAAC5ngIAAAL4AgAACEQCAABKScIAAAeyA
Date: Mon, 15 Jul 2019 10:54:22 +0000
Message-ID: <33bcb0a6-13fa-b3b2-f1c6-2c9e5639828e@amd.com>
References: <1562750971-1628-1-git-send-email-Emily.Deng@amd.com>
 <a9974a9a-37b2-2310-4073-94eef570f37c@amd.com>
 <MN2PR12MB297593776F81FE032B2145218FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <550628f4-eb76-23aa-bc33-e9841e6d017b@amd.com>
 <MN2PR12MB2975EA6482B987399797B0328FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <a9deb404-6041-299e-60fc-d2356b729664@amd.com>
 <MN2PR12MB29758D1F45E8A8FEA883C4ED8FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB29758D1F45E8A8FEA883C4ED8FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR02CA0015.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::28) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5275ffcd-aa49-4560-14e5-08d70912cb9c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1884; 
x-ms-traffictypediagnostic: DM5PR12MB1884:
x-microsoft-antispam-prvs: <DM5PR12MB1884D293295106F9171C48DE83CF0@DM5PR12MB1884.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(189003)(199004)(13464003)(7736002)(5660300002)(229853002)(68736007)(4326008)(66556008)(99286004)(6636002)(305945005)(64756008)(66446008)(2906002)(64126003)(316002)(53936002)(53546011)(6506007)(386003)(6246003)(52116002)(76176011)(6116002)(86362001)(8936002)(8676002)(71190400001)(71200400001)(478600001)(25786009)(66476007)(65826007)(66946007)(6512007)(14454004)(81166006)(81156014)(110136005)(46003)(186003)(11346002)(446003)(2616005)(58126008)(6486002)(31686004)(6436002)(65806001)(256004)(476003)(14444005)(31696002)(102836004)(36756003)(65956001)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1884;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sT8jRN2hXRHh18cGw/3hJz42a1DizPOmjM5e/UBKD1mjPO+G/HArWC28YPzsnfQ3cN4jcAF+SwszcUQUnatr0emA34MNl9TLxOFLS+W7+zsnKP4UgPfdKNileU0Dt/wuYLiD+AH8akS+0ru061pJwqSsGtLEtAwnSpMgJ9brJgJuopcCutJbCKhBLejypJaLom7FP46d0ImmYJrvLtRdsZf/VFxGgqbuewukD3XpFcv9847bu7wZKi4wyrIrgTrPzE4Umjo+fP9at9Y+R/SVyMTyMTL1xjPEExyvxkBt4nB7LNiCjIljXpWGcGzlqQwdp1xHk6ukYTnXuOsx1TKHWcH6w2HWyQvoS9VzXz6kCfQdH21i+4Wq5cr6qJIrwS0saYKwnw9VpTqp50Lh6/X64sk/C86e3iCiafvBTCsshJk=
Content-ID: <73DDBB457D7A874FAE08663EC5E8F076@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5275ffcd-aa49-4560-14e5-08d70912cb9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 10:54:22.9512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1884
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQMchlzQB+HTfzLyNDCk5QFwhj35TNMLOQv++KYdBFA=;
 b=Ac/EaokLDiFvMyaW7LkAsNBlSAzMyF9mdLCW3NUUBkHMHv7E6FT0VIJMxb4xxNfNjkvNUYdkVEvpNB8SWaUYSRaPuk8XHB8nd/Q5/d1zqmJhz4mXXj3ei9X3A1EP5fRaJH2dkFHlsiCAGCTfgz1v0TVNSwapEQy3kepXJJzfI/E=
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

SGkgRW1pbHksDQoNCm5vLCB3ZSBjYW4gb25seSBjbGVhbnVwIHRoZSBjdXJyZW50IG9uZSBiZWNh
dXNlIHdlIGRvbid0IGhhdmUgYSANCnJlZmVyZW5jZSB0byB0aGUgb3RoZXIgb25lcy4NCg0KQXQg
bGVhc3QgdGhhdCdzIGhvdyBJIHVuZGVyc3RhbmQgeW91IHF1ZXN0aW9uLA0KQ2hyaXN0aWFuLg0K
DQpBbSAxNS4wNy4xOSB1bSAxMjo0NyBzY2hyaWViIERlbmcsIEVtaWx5Og0KPiBIaSBDaHJpc3Rp
YW4sDQo+ICAgICAgIERvIHlvdSB0aGluayB3ZSBjb3VsZCBmcmVlIGFsbCB0aG9zZSBib3MgdGhv
c2UgYXJlIGluIGN1cnJlbnQgZGVzdHJveSBsaXN0IHdoZW4gdGhlIGN1cnJlbnQgcmVzdiBpcyBz
aWduYWwgaW4gdHRtX2JvX2NsZWFudXBfcmVmcz8NCj4NCj4gQmVzdCB3aXNoZXMNCj4gRW1pbHkg
RGVuZw0KPg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEtvZW5pZywg
Q2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQo+PiBTZW50OiBNb25kYXksIEp1
bHkgMTUsIDIwMTkgNTo0MSBQTQ0KPj4gVG86IERlbmcsIEVtaWx5IDxFbWlseS5EZW5nQGFtZC5j
b20+OyBaaG91LCBEYXZpZChDaHVuTWluZykNCj4+IDxEYXZpZDEuWmhvdUBhbWQuY29tPg0KPj4g
Q2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBTdWJqZWN0OiBSZTogW1BBVENI
XSBkcm0vdHRtOiBGaXggdGhlIG1lbW9yeSBkZWxheSBmcmVlIGlzc3VlDQo+Pg0KPj4+IERvIHlv
dSB0aGluayB3ZSBkb24ndCBuZWVkIHRvIGZpeCBpdD8NCj4+IE5vLCB3aGVuIHRoZSBhcHBsaWNh
dGlvbiBpcyBleGhhdXN0aW5nIG1lbW9yeSB0aGVuIHdlIGNhbid0IGV4cGVjdCBhbnl0aGluZw0K
Pj4gZWxzZSBoZXJlLg0KPj4NCj4+IFNlZSBtZW1vcnkgZnJlZWluZyBpcyBhbHdheXMgZGVsYXll
ZCB1bnRpbCBpdCBpc24ndCB1c2VkIGFueSBtb3JlIG9yIHdoZW4gdGhlDQo+PiBwcm9jZXNzIGlz
IGtpbGxlZCBhZnRlciBhY2Nlc3MgaXMgcHJldmVudGVkIChieSBjbGVhcmluZyBwYWdlIHRhYmxl
cyBmb3IgZXhhbXBsZSkuDQo+Pg0KPj4gV2hhdCB3ZSBjb3VsZCBkbyBpcyBtYXliZSBsb29rIGlu
dG8gd2h5IHdlIGRvbid0IGJsb2NrIHVudGlsIHRoZSBtZW1vcnkgaXMNCj4+IGZyZWVkIGR1cmlu
ZyBjb21tYW5kIHN1Ym1pc3Npb24sIGJ1dCBhcGFydCBmcm9tIHRoYXQgdGhpcyBzb3VuZHMgbGlr
ZQ0KPj4gcGVyZmVjdGx5IGV4cGVjdGVkIGJlaGF2aW9yLg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBD
aHJpc3RpYW4uDQo+Pg0KPj4gQW0gMTUuMDcuMTkgdW0gMTE6MzQgc2NocmllYiBEZW5nLCBFbWls
eToNCj4+PiBIaSBDaHJpc3RpYW4sDQo+Pj4gICAgICAgQXMgaGFzIHRoaXMgYmVoYXZpb3IsIHdo
ZW4gdGVzdCB2dWxrYW4gY3RzIGFsbG9jYXRpb24gdGVzdCwgaXQgd2lsbA0KPj4gZXhoYXVzdGlu
ZyB0aGUgbWVtb3J5LCBhbmQgY2F1c2Ugb3V0IG9mIG1lbW9yeS4gRG8geW91IHRoaW5rIHdlIGRv
bid0DQo+PiBuZWVkIHRvIGZpeCBpdD8NCj4+PiBCZXN0IHdpc2hlcw0KPj4+IEVtaWx5IERlbmcN
Cj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+Pj4gRnJvbTogS29lbmlnLCBDaHJp
c3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4+Pj4gU2VudDogTW9uZGF5LCBKdWx5
IDE1LCAyMDE5IDU6MzEgUE0NCj4+Pj4gVG86IERlbmcsIEVtaWx5IDxFbWlseS5EZW5nQGFtZC5j
b20+OyBaaG91LCBEYXZpZChDaHVuTWluZykNCj4+Pj4gPERhdmlkMS5aaG91QGFtZC5jb20+DQo+
Pj4+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+PiBTdWJqZWN0OiBSZTog
W1BBVENIXSBkcm0vdHRtOiBGaXggdGhlIG1lbW9yeSBkZWxheSBmcmVlIGlzc3VlDQo+Pj4+DQo+
Pj4+IEhpIGd1eXMsDQo+Pj4+DQo+Pj4+PiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbiBhYm91
dCB0aGlzPyBGb3IgcGVyIHZtIGJvLCBpdCBzZWVtcw0KPj4+Pj4gYWx3YXlzDQo+Pj4+IGRlbGF5
IHRvIGZyZWUgdGhlIHR0bSBiby4NCj4+Pj4gWWVhaCwgYW5kIHRoYXQgaXMgY29ycmVjdCBiZWhh
dmlvci4NCj4+Pj4NCj4+Pj4gU2luY2Ugd2UgZG9uJ3Qga25vdyB3aG8gaXMgdXNpbmcgYSBwZXIt
dm0gQk8gd2UgbmVlZCB0byB3YWl0IGZvciBhbGwNCj4+Pj4gY29tbWFuZCBzdWJtaXNzaW9ucyBp
biBmbGlnaHQgd2hlbiBpdCBpcyBmcmVlZC4NCj4+Pj4NCj4+Pj4gRm9yIHRoaXMgd2UgY29weSB0
aGUgY3VycmVudCBzdGF0ZSBvZiB0aGUgc2hhcmVkIHJlc2VydmF0aW9uIG9iamVjdA0KPj4+PiBp
bnRvIHRoZSBwcml2YXRlIG9uZSBpbiB0dG1fYm9faW5kaXZpZHVhbGl6ZV9yZXN2Lg0KPj4+Pg0K
Pj4+PiBSZWdhcmRzLA0KPj4+PiBDaHJpc3RpYW4uDQo+Pj4+DQo+Pj4+IEFtIDE1LjA3LjE5IHVt
IDA4OjQ5IHNjaHJpZWIgRGVuZywgRW1pbHk6DQo+Pj4+PiBIaSBEYXZpZCwNCj4+Pj4+ICAgICAg
ICAgWW91IGFyZSByaWdodCwgaXQgd2lsbCBjb3B5IHBlci12bSByZXN2Lg0KPj4+Pj4gICAgICAg
ICBCdXQgY3VycmVudGx5LCBpdCBzdGlsbCBoYXMgdGhlIGRlbGF5IGZyZWUgaXNzdWUgd2hpY2gg
bm9uDQo+Pj4+PiBwZXIgdm0gYm8gZG9lc24ndA0KPj4+PiBoYXMuIE1heWJlIGl0IGFscmVhZHkg
aGFzIG5ldyBmZW5jZXMgYXBwZW5kIHRvIHRoaXMgcmVzdiBvYmplY3QgYmVmb3JlDQo+PiBjb3B5
Lg0KPj4+Pj4gSGkgQ2hyaXN0aWFuLA0KPj4+Pj4gICAgICAgIERvIHlvdSBoYXZlIGFueSBzdWdn
ZXN0aW9uIGFib3V0IHRoaXM/IEZvciBwZXIgdm0gYm8sIGl0IHNlZW1zDQo+Pj4+PiBhbHdheXMN
Cj4+Pj4gZGVsYXkgdG8gZnJlZSB0aGUgdHRtIGJvLg0KPj4+Pj4gQmVzdCB3aXNoZXMNCj4+Pj4+
IEVtaWx5IERlbmcNCj4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+Pj4+IEZy
b206IFpob3UsIERhdmlkKENodW5NaW5nKSA8RGF2aWQxLlpob3VAYW1kLmNvbT4NCj4+Pj4+PiBT
ZW50OiBXZWRuZXNkYXksIEp1bHkgMTAsIDIwMTkgOToyOCBQTQ0KPj4+Pj4+IFRvOiBEZW5nLCBF
bWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPjsgYW1kLQ0KPj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPj4+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS90dG06IEZpeCB0aGUgbWVtb3J5
IGRlbGF5IGZyZWUgaXNzdWUNCj4+Pj4+Pg0KPj4+Pj4+IEl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0
aGF0IGZyZWVpbmcgQk8gc3RpbGwgdXNlcyBwZXItdm0gcmVzdi4NCj4+Pj4+Pg0KPj4+Pj4+IEkg
cmVtZW1iZXIgd2hlbiBCTyBpcyBpbiByZWxlYXNlIGxpc3QsIGl0cyByZXN2IHdpbGwgYmUgZnJv
bSBwZXItdm0gcmVzdg0KPj4gY29weS4NCj4+Pj4+PiBDb3VsZCB5b3UgY2hlY2sgaXQ/DQo+Pj4+
Pj4NCj4+Pj4+PiAtRGF2aWQNCj4+Pj4+Pg0KPj4+Pj4+IOWcqCAyMDE5LzcvMTAgMTc6MjksIEVt
aWx5IERlbmcg5YaZ6YGTOg0KPj4+Pj4+PiBGb3IgdnVsa2FuIGN0cyBhbGxvY2F0aW9uIHRlc3Qg
Y2FzZXMsIHRoZXkgd2lsbCBjcmVhdGUgYSBzZXJpZXMgb2YNCj4+Pj4+Pj4gYm9zLCBhbmQgdGhl
biBmcmVlIHRoZW0uIEFzIGl0IGhhcyBsb3RzIG9mIGFsbG9jdGlvbiB0ZXN0IGNhc2VzDQo+Pj4+
Pj4+IHdpdGggdGhlIHNhbWUgdm0sIGFzIHBlciB2bSBibyBmZWF0dXJlIGVuYWJsZSwgYWxsIG9m
IHRob3NlIGJvcycNCj4+Pj4+Pj4gcmVzdiBhcmUgdGhlIHNhbWUuIEJ1dCB0aGUgYm8gZnJlZSBp
cyBxdWl0ZSBzbG93LCBhcyB0aGV5IHVzZSB0aGUNCj4+Pj4+Pj4gc2FtZSByZXN2IG9iamVjdCwg
Zm9yIGV2ZXJ5IHRpbWUsIGZyZWUgYSBibywgaXQgd2lsbCBjaGVjayB0aGUNCj4+Pj4+Pj4gcmVz
diB3aGV0aGVyIHNpZ25hbCwgaWYgaXQgc2lnbmFsLCB0aGVuIHdpbGwgZnJlZSBpdC4gQnV0IGFz
IHRoZQ0KPj4+Pj4+PiB0ZXN0IGNhc2VzIHdpbGwgY29udGludWUgdG8gY3JlYXRlIGJvLCBhbmQg
dGhlIHJlc3YgZmVuY2UgaXMNCj4+Pj4+Pj4gaW5jcmVhc2luZy4gU28gdGhlIGZyZWUgaXMgbW9y
ZQ0KPj4+Pj4+IHNsb3dlciB0aGFuIGNyZWF0aW5nLiBJdCB3aWxsIGNhdXNlIG1lbW9yeSBleGhh
dXN0aW5nLg0KPj4+Pj4+PiBNZXRob2Q6DQo+Pj4+Pj4+IFdoZW4gdGhlIHJlc3Ygc2lnbmFsLCBy
ZWxlYXNlIGFsbCB0aGUgYm9zIHdoaWNoIGFyZSB1c2UgdGhlIHNhbWUNCj4+Pj4+Pj4gcmVzdiBv
YmplY3QuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEVtaWx5IERlbmcgPEVtaWx5
LkRlbmdAYW1kLmNvbT4NCj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+ICAgICAgZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4+IC0NCj4+
Pj4+Pj4gICAgICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkNCj4+Pj4+Pj4NCj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvLmMNCj4+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGluZGV4IGY5YTNk
NGMuLjU3ZWM1OWIgMTAwNjQ0DQo+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvLmMNCj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPj4+Pj4+
PiBAQCAtNTQzLDYgKzU0Myw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2NsZWFudXBfcmVmcyhzdHJ1
Y3QNCj4+Pj4+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+Pj4+Pj4+ICAgICAgew0KPj4+Pj4+
PiAgICAgIAlzdHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xvYiA9IGJvLT5iZGV2LT5nbG9iOw0KPj4+
Pj4+PiAgICAgIAlzdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICpyZXN2Ow0KPj4+Pj4+PiArCXN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqcmVzdl9ibywgKnJlc3ZfYm9fbmV4dDsNCj4+Pj4+Pj4g
ICAgICAJaW50IHJldDsNCj4+Pj4+Pj4NCj4+Pj4+Pj4gICAgICAJaWYgKHVubGlrZWx5KGxpc3Rf
ZW1wdHkoJmJvLT5kZGVzdHJveSkpKQ0KPj4+Pj4+PiBAQCAtNTY2LDEwICs1NjcsMTQgQEAgc3Rh
dGljIGludCB0dG1fYm9fY2xlYW51cF9yZWZzKHN0cnVjdA0KPj4+Pj4+IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibywNCj4+Pj4+Pj4gICAgICAJCQkJCQkJICAgaW50ZXJydXB0aWJsZSwNCj4+Pj4+Pj4g
ICAgICAJCQkJCQkJICAgMzAgKiBIWik7DQo+Pj4+Pj4+DQo+Pj4+Pj4+IC0JCWlmIChscmV0IDwg
MCkNCj4+Pj4+Pj4gKwkJaWYgKGxyZXQgPCAwKSB7DQo+Pj4+Pj4+ICsJCQlrcmVmX3B1dCgmYm8t
Pmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7DQo+Pj4+Pj4+ICAgICAgCQkJcmV0dXJu
IGxyZXQ7DQo+Pj4+Pj4+IC0JCWVsc2UgaWYgKGxyZXQgPT0gMCkNCj4+Pj4+Pj4gKwkJfQ0KPj4+
Pj4+PiArCQllbHNlIGlmIChscmV0ID09IDApIHsNCj4+Pj4+Pj4gKwkJCWtyZWZfcHV0KCZiby0+
bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9saXN0KTsNCj4+Pj4+Pj4gICAgICAJCQlyZXR1cm4g
LUVCVVNZOw0KPj4+Pj4+PiArCQl9DQo+Pj4+Pj4+DQo+Pj4+Pj4+ICAgICAgCQlzcGluX2xvY2so
Jmdsb2ItPmxydV9sb2NrKTsNCj4+Pj4+Pj4gICAgICAJCWlmICh1bmxvY2tfcmVzdiAmJg0KPj4+
Pj4+PiAha2NsX3Jlc2VydmF0aW9uX29iamVjdF90cnlsb2NrKGJvLT5yZXN2KSkNCj4+Pj4+PiB7
IEBADQo+Pj4+Pj4+IC01ODIsNiArNTg3LDcgQEAgc3RhdGljIGludCB0dG1fYm9fY2xlYW51cF9y
ZWZzKHN0cnVjdA0KPj4+Pj4+PiB0dG1fYnVmZmVyX29iamVjdA0KPj4+Pj4+ICpibywNCj4+Pj4+
Pj4gICAgICAJCQkgKiBoZXJlLg0KPj4+Pj4+PiAgICAgIAkJCSAqLw0KPj4+Pj4+PiAgICAgIAkJ
CXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9jayk7DQo+Pj4+Pj4+ICsJCQlrcmVmX3B1dCgmYm8t
Pmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7DQo+Pj4+Pj4+ICAgICAgCQkJcmV0dXJu
IDA7DQo+Pj4+Pj4+ICAgICAgCQl9DQo+Pj4+Pj4+ICAgICAgCQlyZXQgPSAwOw0KPj4+Pj4+PiBA
QCAtNTkxLDE1ICs1OTcsMjkgQEAgc3RhdGljIGludCB0dG1fYm9fY2xlYW51cF9yZWZzKHN0cnVj
dA0KPj4+Pj4+IHR0bV9idWZmZXJfb2JqZWN0ICpibywNCj4+Pj4+Pj4gICAgICAJCWlmICh1bmxv
Y2tfcmVzdikNCj4+Pj4+Pj4gICAgICAJCQlrY2xfcmVzZXJ2YXRpb25fb2JqZWN0X3VubG9jayhi
by0+cmVzdik7DQo+Pj4+Pj4+ICAgICAgCQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOw0K
Pj4+Pj4+PiArCQlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7
DQo+Pj4+Pj4+ICAgICAgCQlyZXR1cm4gcmV0Ow0KPj4+Pj4+PiAgICAgIAl9DQo+Pj4+Pj4+DQo+
Pj4+Pj4+ICAgICAgCXR0bV9ib19kZWxfZnJvbV9scnUoYm8pOw0KPj4+Pj4+PiAgICAgIAlsaXN0
X2RlbF9pbml0KCZiby0+ZGRlc3Ryb3kpOw0KPj4+Pj4+PiAgICAgIAlrcmVmX3B1dCgmYm8tPmxp
c3Rfa3JlZiwgdHRtX2JvX3JlZl9idWcpOw0KPj4+Pj4+PiAtDQo+Pj4+Pj4+ICAgICAgCXNwaW5f
dW5sb2NrKCZnbG9iLT5scnVfbG9jayk7DQo+Pj4+Pj4+ICAgICAgCXR0bV9ib19jbGVhbnVwX21l
bXR5cGVfdXNlKGJvKTsNCj4+Pj4+Pj4gKwlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2Jv
X3JlbGVhc2VfbGlzdCk7DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKwlzcGluX2xvY2soJmdsb2ItPmxy
dV9sb2NrKTsNCj4+Pj4+Pj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocmVzdl9ibywgcmVz
dl9ib19uZXh0LCAmYm8tPmJkZXYtDQo+Pj4+Pj4+IGRkZXN0cm95LCBkZGVzdHJveSkgew0KPj4+
Pj4+PiArCQlpZiAocmVzdl9iby0+cmVzdiA9PSBiby0+cmVzdikgew0KPj4+Pj4+PiArCQkJdHRt
X2JvX2RlbF9mcm9tX2xydShyZXN2X2JvKTsNCj4+Pj4+Pj4gKwkJCWxpc3RfZGVsX2luaXQoJnJl
c3ZfYm8tPmRkZXN0cm95KTsNCj4+Pj4+Pj4gKwkJCXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9j
ayk7DQo+Pj4+Pj4+ICsJCQl0dG1fYm9fY2xlYW51cF9tZW10eXBlX3VzZShyZXN2X2JvKTsNCj4+
Pj4+Pj4gKwkJCWtyZWZfcHV0KCZyZXN2X2JvLT5saXN0X2tyZWYsDQo+PiB0dG1fYm9fcmVsZWFz
ZV9saXN0KTsNCj4+Pj4+Pj4gKwkJCXNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOw0KPj4+Pj4+
PiArCQl9DQo+Pj4+Pj4+ICsJfQ0KPj4+Pj4+PiArCXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9j
ayk7DQo+Pj4+Pj4+DQo+Pj4+Pj4+ICAgICAgCWlmICh1bmxvY2tfcmVzdikNCj4+Pj4+Pj4gICAg
ICAJCWtjbF9yZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKGJvLT5yZXN2KTsNCj4+Pj4+Pj4gQEAg
LTYzOSw5ICs2NTksOCBAQCBzdGF0aWMgYm9vbCB0dG1fYm9fZGVsYXllZF9kZWxldGUoc3RydWN0
DQo+Pj4+Pj4gdHRtX2JvX2RldmljZSAqYmRldiwgYm9vbCByZW1vdmVfYWxsKQ0KPj4+Pj4+PiAg
ICAgIAkJCXR0bV9ib19jbGVhbnVwX3JlZnMoYm8sIGZhbHNlLCAhcmVtb3ZlX2FsbCwNCj4+IHRy
dWUpOw0KPj4+Pj4+PiAgICAgIAkJfSBlbHNlIHsNCj4+Pj4+Pj4gICAgICAJCQlzcGluX3VubG9j
aygmZ2xvYi0+bHJ1X2xvY2spOw0KPj4+Pj4+PiArCQkJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYs
IHR0bV9ib19yZWxlYXNlX2xpc3QpOw0KPj4+Pj4+PiAgICAgIAkJfQ0KPj4+Pj4+PiAtDQo+Pj4+
Pj4+IC0JCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9saXN0KTsNCj4+
Pj4+Pj4gICAgICAJCXNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOw0KPj4+Pj4+PiAgICAgIAl9
DQo+Pj4+Pj4+ICAgICAgCWxpc3Rfc3BsaWNlX3RhaWwoJnJlbW92ZWQsICZiZGV2LT5kZGVzdHJv
eSk7DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
