Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7187D7C0
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 10:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFD36E3D6;
	Thu,  1 Aug 2019 08:34:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184516E3D6
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 08:34:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4Ed/1ksfUCxdJ0LEiy0fpSnmwlFutSdTW1t19onLipHdtqUKlhdKuRUxx8WZK8lyvY9Wi+P/Syyw61Pyuj9YnNVkfYsPTpP39ETbMF+3ZWdzfLU5dX+wAjO+iX+bZsve4b8HnfI1k+GyDHdvJp2Ec8FB8G/8fRu6yIWftIEJLh6SADHCh2pmMd8gAdDukSgT+LPFW+76f77BRJtJGR/NV+sOhGwkbY5pZFrnyCQSHQr6eG8mRkUzRlguyxJVe1lPwNjihjYDcxu4k8KQkinWVfFydVM2xel5TXYcwkFwCh3UrXOG71xj64Oth4lNttB5fTkn76pRCtHMV4xrIlnAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWiCAttTXi5BeGXBtAlNhZLQSDJBknzAiZK3uz+3CCE=;
 b=GflyCJopZ6orYJFIndiNOeBo16rTLoQXwnbJ6sB5m1bKcqcdcdxU/27GjiXZWM31Mrd6oug0LkzJXdGkjkRr1sdb+XPLlyfmqfAjPLrlR9bmzaZIW7gyKlbNvXLgGtHaXS6gYwjcRfUDNd5zSPlcJ9gm8LbjL3TtAzF9MzM+5sGsnT+7LCv5FG34e8jdP65ctXTtmNke4Rmaxfxsi9oBioAuef3kdqwwbMgfvb8xK736XnUCgmjpe32KrLaZfyqgBGBPPmlg1B2PpIQ16eMKnn6LdHidV2xWZspPU01sGh+1jct4i0YYtE0sC7ek9XHxARONw3v8CEdlFZhjd2nyZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3071.namprd12.prod.outlook.com (20.178.243.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 1 Aug 2019 08:34:41 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7%5]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 08:34:41 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Li, Dennis" <Dennis.Li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH 0/4] enable umc ras ce interrupt
Thread-Topic: [PATCH 0/4] enable umc ras ce interrupt
Thread-Index: AQHVSDXydkhwrzGT30ayNXLI+OvQNKbl67IAgAAIOICAAAB0QA==
Date: Thu, 1 Aug 2019 08:34:40 +0000
Message-ID: <MN2PR12MB3054ABBDDFB144A6D1E63EFCB0DE0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190801065342.8450-1-tao.zhou1@amd.com>
 <DM5PR12MB14182B9F7AFD2BB48D479C8EFCDE0@DM5PR12MB1418.namprd12.prod.outlook.com>
 <BN7PR12MB2707651008335A0DA8DB692CF1DE0@BN7PR12MB2707.namprd12.prod.outlook.com>
In-Reply-To: <BN7PR12MB2707651008335A0DA8DB692CF1DE0@BN7PR12MB2707.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d766143-6937-4304-fa08-08d7165b18dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3071; 
x-ms-traffictypediagnostic: MN2PR12MB3071:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3071DA3F798F2EDE3C38DF38B0DE0@MN2PR12MB3071.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(13464003)(189003)(199004)(316002)(53936002)(7736002)(305945005)(6116002)(81166006)(81156014)(66946007)(3846002)(25786009)(110136005)(256004)(229853002)(8936002)(68736007)(14444005)(2906002)(6436002)(9686003)(6306002)(76176011)(8676002)(33656002)(6246003)(52536014)(2501003)(66066001)(102836004)(478600001)(7696005)(186003)(6636002)(26005)(86362001)(11346002)(486006)(446003)(99286004)(966005)(5660300002)(476003)(64756008)(66556008)(66476007)(14454004)(74316002)(6506007)(53546011)(66446008)(55016002)(76116006)(71190400001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3071;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3w8sUiWPcbA66FcVdd15DdM9RGrBIWN375Oi5/TOIRXDdkdRvo8k4nWxkW/CitQixrrx5aN2vJ+WS47g2OlUACxiB43qalI0ptnWTDITJwouDFDqMemaS/Amh0NIc22W+DG+5xcEiNb5f5TXXORS67AjnKMj6FlVQiDEmX3o5bsf9unwmpYqJKAg0u60AlExvW1fZMPBzHm0LC87+tHgUsb3oCGYFKHyIFGmfUVl2I0DFZF0lVpEzMOEo0Lgw08hpuLD5vZhRsFpP7sWFv9BadyRaeECo2i/I7T+vGcYIjO6k80VClmqGjzF0BvvvP4Wxw6Bzb4Y1MYnVjG3j60njo/WaNcr4bbvMb97AeZXR6GjIbbh6OWofWftfv/hrGN8UmmiF/uBFeb7SK7r+F+J0lM5GK+vedYLtkSxrPYROAA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d766143-6937-4304-fa08-08d7165b18dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 08:34:40.9545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tazhou1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3071
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWiCAttTXi5BeGXBtAlNhZLQSDJBknzAiZK3uz+3CCE=;
 b=ji4uv9l91QbE1U3jHUXD6kFw4dA01MXZQMWay9ChnSfyvsZUlaLOfOsotEP7BSiAifeCpAYWhJUFAi3eSmVN6wVX3kjpyf8YMZL46eaGUQq6Aw+y1zmg8hPB8MPexNMXgUPOfj75YZDvODBzLTpYvtnlRRDkyelXC54q/+/eZFc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hlbiwgR3VjaHVuIDxH
dWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0OOaciDHml6UgMTY6MjINCj4gVG86
IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBaaG91MSwgVGFvDQo+IDxU
YW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBMaSwgRGVu
bmlzDQo+IDxEZW5uaXMuTGlAYW1kLmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5j
b20+DQo+IENjOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4NCj4gU3ViamVjdDogUkU6
IFtQQVRDSCAwLzRdIGVuYWJsZSB1bWMgcmFzIGNlIGludGVycnVwdA0KPiANCj4gMSkgUGF0Y2gg
MSwgbG9va3MgdGhlIHJldHVybiB2YWx1ZSBvZiBvdXIgY2FsbGJhY2sgYWx3YXlzIHJldHVybnMg
VUUgY2FzZSwgYnV0IEkNCj4gYXNzdW1lIENFIGNhc2Ugc2hvdWxkIGFsc28gYmUgY292ZXJlZC4g
TWF5YmUgaXQncyBhbm90aGVyIHRvcGljLg0KPiAJaWYgKHJldCA9PSBBTURHUFVfUkFTX1VFKSB7
DQo+ICsJCS8qIHRoZXNlIGNvdW50cyBjb3VsZCBiZSBsZWZ0IGFzIDAgaWYNCj4gKwkJICogc29t
ZSBibG9ja3MgZG8gbm90IGNvdW50IGVycm9yIG51bWJlcg0KPiArCQkgKi8NCj4gIAkJb2JqLT5l
cnJfZGF0YS51ZV9jb3VudCArPSBlcnJfZGF0YS51ZV9jb3VudDsNCj4gKwkJb2JqLT5lcnJfZGF0
YS5jZV9jb3VudCArPSBlcnJfZGF0YS5jZV9jb3VudDsNCj4gDQpbVGFvXSBZZXMsIGl0J3MgYSBu
ZXcgdG9waWMuIENFIGNhbiBhbHNvIHRyaWdnZXIgaW50ZXJydXB0LCBhbmQgZXZlbiBib3RoIGNl
IGFuZCB1ZSBlcnJvciBjYW4gYmUgZm91bmQgaW4gb25lIHJhcyBxdWVyeS4gSSB0aGluayBBTURH
UFVfUkFTX1NVQ0NFU1MgaXMgbW9yZSBzdWl0YWJsZSBoZXJlLCBJJ2xsIHByb3ZpZGUgYSBuZXcg
cGF0Y2ggdG8gZml4IGl0Lg0KDQo+IDIpIEluIFBhdGNoIDIsIG9uZSB1bnVzZWQgdmFyaWFibGUg
InJhc19lcnJvcl9zdGF0dXMiIGlzIHRoZXJlLCBkbyB3ZSBuZWVkIHRvDQo+IHJlbW92ZSBpdD8N
Cj4gDQo+IHN0YXRpYyB2b2lkIHVtY192Nl8xX3Jhc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KSAgew0KPiArCXZvaWQgKnJhc19lcnJvcl9zdGF0dXMgPSBOVUxMOw0KPiANCj4gKwlh
bWRncHVfdW1jX2Zvcl9lYWNoX2NoYW5uZWwodW1jX3Y2XzFfcmFzX2luaXRfcGVyX2NoYW5uZWwp
Ow0KPiAgfQ0KW1Rhb10gSXQncyBvbiBwdXJwb3NlLiBhbWRncHVfdW1jX2Zvcl9lYWNoX2NoYW5u
ZWwgbWFjcm8gaXMgYSBjb21tb24gZGVmaW5pdGlvbiBmb3IgYWxsIHVtYyBjaGFubmVsIGZ1bmN0
aW9ucywgaXQgd2lsbCB0cmFuc2ZlciByYXNfZXJyb3Jfc3RhdHVzIHRvIGNoYW5uZWwgZnVuY3Rp
b24uDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEd1Y2h1bg0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4N
Cj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAxLCAyMDE5IDM6NTIgUE0NCj4gVG86IFpob3UxLCBU
YW8gPFRhby5aaG91MUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IExp
LA0KPiBEZW5uaXMgPERlbm5pcy5MaUBhbWQuY29tPjsgQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hl
bkBhbWQuY29tPjsNCj4gUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT4NCj4gQ2M6IFpo
b3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIDAvNF0g
ZW5hYmxlIHVtYyByYXMgY2UgaW50ZXJydXB0DQo+IA0KPiAxLikgUGxlYXNlIGZpeCB0aGUgdHlw
byBpbiBwYXRjaCAjMiBkZXNjcmlwdGlvbjogZWMgLS0+IGNlIDIpLiBQYXRjaCAjMg0KPiANCj4g
KwllY2NfZXJyX2NudF9zZWwgPSBSRUdfU0VUX0ZJRUxEKGVjY19lcnJfY250X3NlbCwNCj4gVU1D
Q0gwXzBfRWNjRXJyQ250U2VsLA0KPiArCQkJCQlFY2NFcnJJbnQsIDB4MSk7DQo+IEZvciB0aGUg
RWNjRXJySW50IGZpZWxkLCBpdCBzaG91bGQgYmUgcHJvZ3JhbWVkIHRvIGJlIChNQVggLSBJTklU
KSwgY29ycmVjdD8NCj4gYnV0IHRoZSBoYXJkY29kZWQgdmFsdWUgc2VlbXMgbm90IG1hdGNoIHdp
dGggdGhlIHZhbHVlIGNhbGN1bGF0ZWQgYnkgdGhvc2UNCj4gbWFjcm8uDQo+IA0KPiBSZWdhcmRz
LA0KPiBIYXdraW5nDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1n
ZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBU
YW8NCj4gWmhvdQ0KPiBTZW50OiAyMDE55bm0OOaciDHml6UgMTQ6NTQNCj4gVG86IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZw0KPiA8SGF3a2luZy5aaGFuZ0Bh
bWQuY29tPjsgTGksIERlbm5pcyA8RGVubmlzLkxpQGFtZC5jb20+OyBDaGVuLA0KPiBHdWNodW4g
PEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPg0K
PiBDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAw
LzRdIGVuYWJsZSB1bWMgcmFzIGNlIGludGVycnVwdA0KPiANCj4gVGhlc2UgcGF0Y2hlcyBhZGQg
c3VwcG9ydCBmb3IgdW1jIGNlIGludGVycnVwdCwgdGhlIGludGVycnVwdCBpcyBjb250cm9sbGVk
DQo+IGJ5IGEgZXJyb3IgY291bnQgdGhyZXNob2xkLg0KPiANCj4gVGFvIFpob3UgKDQpOg0KPiAg
IGRybS9hbWRncHU6IHN1cHBvcnQgY2UgaW50ZXJydXB0IGluIHJhcyBtb2R1bGUNCj4gICBkcm0v
YW1kZ3B1OiBpbXBsZW1lbnQgdW1jIHJhcyBpbml0IGZ1bmN0aW9uDQo+ICAgZHJtL2FtZGdwdTog
dXBkYXRlIHRoZSBjYWxjIGFsZ29yaXRobSBvZiB1bWMgZWNjIGVycm9yIGNvdW50DQo+ICAgZHJt
L2FtZGdwdTogb25seSB1bmNvcnJlY3RhYmxlIGVycm9yIG5lZWRzIGdwdSByZXNldA0KPiANCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDEyICsrKystLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICB8ICA2ICsrKy0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgICB8IDQyDQo+ICsrKysrKysrKysr
KysrKysrKysrKystLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmgg
ICB8ICA3ICsrKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiAyLjE3LjENCj4gDQo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
